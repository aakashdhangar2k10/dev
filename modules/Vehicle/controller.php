<?php
// ==========================
// Main Entry Point
// ==========================

include('../../includes/db.php'); // must define $conn = new PDO(...)

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action'])) {
        switch ($_POST['action']) {
            case "getVehicleDetails":
                getVehicleDetails();
                exit;
            case "save_vehicle":
                save_vehicle();
                exit;
            case "upload_vehicle_images":
                upload_vehicle_images();
                exit;
            case "update_vehicle_images":
                update_vehicle_images();
                exit;
            case "listVehicles":
                listVehicles($conn);
                exit;
            case "saveInspection":
                $result = saveInspection($conn, $_POST); // Corrected here
                echo json_encode($result);              // Send response
                exit;
            case "updateInspection":
                $result = updateInspection($conn, $_POST); // Corrected here
                echo json_encode($result);              // Send response
                exit;
        }
    }
}

// ==========================
// Functions
// ==========================

// Get Vehicle Details via API for testing 
/*function getVehicleDetails()
{
    $vrm = trim($_POST['vrm'] ?? '');

    if (empty($vrm)) {
        echo json_encode(["status" => "error", "message" => "VRM is required"]);
        return;
    }

    $apiKey = "86fa92fac0718076c9f1967e18c4bd6c";
    $apiUrl = "https://api.checkcardetails.co.uk/vehicledata/vehicleregistration";
    $url = $apiUrl . "?apikey=" . urlencode($apiKey) . "&vrm=" . urlencode($vrm);

    $ch = curl_init();
    curl_setopt_array($ch, [
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => 15,
    ]);

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
        echo json_encode(["status" => "error", "message" => curl_error($ch)]);
        curl_close($ch);
        return;
    }
    curl_close($ch);

    $result = json_decode($response, true);

    if (!empty($result)) {
        echo json_encode(["status" => "success", "data" => $result]);
    } else {
        echo json_encode(["status" => "error", "message" => "Invalid response from API"]);
    }
}*/

//This Api is used for Live 
function getVehicleDetails()
{
    $vrm = trim($_POST['vrm'] ?? '');

    if (empty($vrm)) {
        echo json_encode(["status" => "error", "message" => "VRM is required"]);
        return;
    }

    $apiKey = "WDnbtCVqtJ39HADKaXcRB37XKDH07OYR4zb5KO5l"; // DVLA API key
    $apiUrl = "https://driver-vehicle-licensing.api.gov.uk/vehicle-enquiry/v1/vehicles";

    $payload = json_encode(["registrationNumber" => $vrm]);

    $ch = curl_init();
    curl_setopt_array($ch, [
        CURLOPT_URL => $apiUrl,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_HTTPHEADER => [
            "x-api-key: $apiKey",
            "Content-Type: application/json"
        ],
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => $payload,
        CURLOPT_TIMEOUT => 15,
    ]);

    $response = curl_exec($ch);
    $err = curl_error($ch);
    curl_close($ch);

    if ($err) {
        echo json_encode(["status" => "error", "message" => $err]);
        return;
    }

    $result = json_decode($response, true);

    if (!empty($result) && isset($result['registrationNumber'])) {
        // Calculate MOT days
        $motDays = '';
        if (!empty($result['motExpiryDate'])) {
            $diff = strtotime($result['motExpiryDate']) - time();
            $motDays = (int)ceil($diff / 86400);
        }

        // Map API response
        $data = [
            "registrationNumber" => $result['registrationNumber'] ?? '',
            "make" => $result['make'] ?? '',
            "model" => $result['model'] ?? '',
            "colour" => $result['colour'] ?? '',
            "fuelType" => $result['fuelType'] ?? '',
            "engineCapacity" => $result['engineCapacity'] ?? '',
            "yearOfManufacture" => $result['yearOfManufacture'] ?? '',
            "vehicleAge" => isset($result['yearOfManufacture']) ? date('Y') - $result['yearOfManufacture'] : '',
            "wheelplan" => $result['wheelplan'] ?? '',
            "dateOfLastV5CIssued" => $result['dateOfLastV5CIssued'] ?? '',
            "typeApproval" => $result['typeApproval'] ?? '',
            "co2Emissions" => $result['co2Emissions'] ?? '',
            "registrationPlace" => $result['monthOfFirstRegistration'] ?? '',
            "tax" => [
                "taxStatus" => $result['taxStatus'] ?? '',
                "taxDueDate" => $result['taxDueDate'] ?? ''
            ],
            "mot" => [
                "motStatus" => $result['motStatus'] ?? '',
                "motDueDate" => $result['motExpiryDate'] ?? '',
                "days" => $motDays
            ]
        ];

        echo json_encode(["status" => "success", "data" => $data]);
    } else {
        echo json_encode(["status" => "error", "message" => "No vehicle data found for this registration"]);
    }
}



//This function is used to save details
function save_vehicle()
{
    include('../../includes/db.php'); // $conn = new PDO(...)

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        echo "Invalid request method!";
        return;
    }

    try {
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $vehicle_no = trim($_POST['vehicle_no'] ?? '');
        $registrationNumber = trim($_POST['registrationNumber'] ?? '');

        //  Check for duplicates (by vehicle_no or registrationNumber)
        $check = $conn->prepare("SELECT COUNT(*) 
                                 FROM vehicle_details_tbl 
                                 WHERE vehicle_no = :vehicle_no OR registrationNumber = :registrationNumber");
        $check->execute([
            ':vehicle_no' => $vehicle_no,
            ':registrationNumber' => $registrationNumber
        ]);

        if ($check->fetchColumn() > 0) {
            echo "<script>alert('This vehicle is already added!'); 
                  window.location='index.php?view=view_van_list';</script>";
            return;
        }

        // Insert new vehicle
        $stmt = $conn->prepare("INSERT INTO vehicle_details_tbl 
            (branch_id, vehicle_no, registrationNumber, make, model, colour, fuelType, engineCapacity,
             yearOfManufacture, vehicleAge, wheelplan, dateOfLastV5CIssued, typeApproval,
             co2Emissions, registrationPlace, taxStatus, taxDueDate, motStatus, motDueDate, days, assigned_staff)
            VALUES
            (:branch_id, :vehicle_no, :registrationNumber, :make, :model, :colour, :fuelType, :engineCapacity,
             :yearOfManufacture, :vehicleAge, :wheelplan, :dateOfLastV5CIssued, :typeApproval,
             :co2Emissions, :registrationPlace, :taxStatus, :taxDueDate, :motStatus, :motDueDate, :days, :assigned_staff)");

        $stmt->execute([
            ':branch_id'          => $_POST['branch_no'] ?? '',
            ':vehicle_no'         => $vehicle_no,
            ':registrationNumber' => $registrationNumber,
            ':make'               => $_POST['make'] ?? '',
            ':model'              => $_POST['model'] ?? '',
            ':colour'             => $_POST['colour'] ?? '',
            ':fuelType'           => $_POST['fuelType'] ?? '',
            ':engineCapacity'     => $_POST['engineCapacity'] ?? '',
            ':yearOfManufacture'  => $_POST['yearOfManufacture'] ?? '',
            ':vehicleAge'         => $_POST['vehicleAge'] ?? '',
            ':wheelplan'          => $_POST['wheelplan'] ?? '',
            ':dateOfLastV5CIssued' => $_POST['dateOfLastV5CIssued'] ?? '',
            ':typeApproval'       => $_POST['typeApproval'] ?? '',
            ':co2Emissions'       => $_POST['co2Emissions'] ?? '',
            ':registrationPlace'  => $_POST['registrationPlace'] ?? '',
            ':taxStatus'          => $_POST['taxStatus'] ?? '',
            ':taxDueDate'         => $_POST['taxDueDate'] ?? '',
            ':motStatus'          => $_POST['motStatus'] ?? '',
            ':motDueDate'         => $_POST['motDueDate'] ?? '',
            ':days'               => $_POST['days'] ?? '',
            ':assigned_staff'     => $_POST['assigned_staff'] ?? ''
        ]);

        // after insert
        $last_id = $conn->lastInsertId();

        // Fetch vehicle ID
        $stmt2 = $conn->prepare("SELECT id FROM vehicle_details_tbl WHERE id = ?");
        $stmt2->execute([$last_id]);
        $row = $stmt2->fetch(PDO::FETCH_ASSOC);
        $vehicle_id = $row['id'] ?? '';

        // Check button clicked
        if (isset($_POST['add_photo'])) {
            echo "<script>alert('Vehicle added successfully!'); 
                  window.location='index.php?view=add_van&vehicle_no={$vehicle_id}';</script>";
        } else {
            echo "<script>alert('Vehicle added successfully!'); 
                  window.location='index.php?view=view_van_list';</script>";
        }
    } catch (PDOException $e) {
        echo "Error inserting vehicle: " . $e->getMessage();
    }
}





//This function is used to Upload Images 
function upload_vehicle_images()
{
    include('../../includes/db.php');

    $vehicle_id = $_POST['vehicle_id'] ?? null;

    if (!$vehicle_id) {
        echo "<script>alert('Vehicle ID is required!'); window.history.back();</script>";
        return;
    }

    try {
        // Check if this vehicle already has images
        $check = $conn->prepare("SELECT COUNT(*) FROM vehicle_images_tbl WHERE vehicle_id = :vehicle_id");
        $check->execute([':vehicle_id' => $vehicle_id]);
        $exists = $check->fetchColumn();

        if ($exists > 0) {
            echo "<script>alert('Photo already added for this vehicle!'); 
                  window.location='index.php?view=view_van_list';</script>";
            return;
        }

        // Continue only if no photo exists
        $uploadDir = "../../uploads/vehicles/";
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0777, true);
        }

        $images  = $_FILES['vehicle_images'] ?? null;
        $labels  = $_POST['image_label'] ?? [];
        $descs   = $_POST['image_description'] ?? [];

        if (!$images || !is_array($images['tmp_name'])) {
            echo "<script>alert('No images uploaded!'); window.history.back();</script>";
            return;
        }

        foreach ($images['tmp_name'] as $index => $tmpName) {
            if ($images['error'][$index] === UPLOAD_ERR_OK && is_uploaded_file($tmpName)) {
                $ext = pathinfo($images['name'][$index], PATHINFO_EXTENSION);
                $fileName = uniqid("veh_{$vehicle_id}_") . "." . strtolower($ext);
                $targetPath = $uploadDir . $fileName;

                if (move_uploaded_file($tmpName, $targetPath)) {
                    $label = $labels[$index] ?? '';
                    $desc  = $descs[$index] ?? '';

                    $stmt = $conn->prepare("
                        INSERT INTO vehicle_images_tbl 
                        (vehicle_id, image_path, image_label, image_description) 
                        VALUES (:vehicle_id, :image_path, :image_label, :image_description)
                    ");
                    $stmt->execute([
                        ':vehicle_id' => $vehicle_id,
                        ':image_path' => $fileName,
                        ':image_label' => $label,
                        ':image_description' => $desc
                    ]);
                }
            }
        }

        // Redirect depending on button clicked
        if (isset($_POST['inspection'])) {
            echo "<script>alert('Vehicle photo added successfully!'); 
                  window.location='index.php?view=inspection&vehicle_no={$vehicle_id}';</script>";
        } else {
            echo "<script>alert('Vehicle images uploaded successfully!'); 
                  window.location='index.php?view=view_van_list';</script>";
        }
    } catch (PDOException $e) {
        echo "Error inserting vehicle images: " . $e->getMessage();
    }
}

// function upload_vehicle_images()
// {
//     include('../../includes/db.php');

//     $vehicle_id = $_POST['vehicle_id'] ?? null;

//     if (!$vehicle_id) {
//         echo "<script>alert('Vehicle ID is required!'); window.history.back();</script>";
//         return;
//     }

//     try {
//         $uploadDir = "../../uploads/vehicles/";
//         if (!is_dir($uploadDir)) {
//             mkdir($uploadDir, 0777, true);
//         }

//         $images  = $_FILES['vehicle_images'] ?? null;
//         $labels  = $_POST['image_label'] ?? [];
//         $descs   = $_POST['image_description'] ?? [];

//         if (!$images || !is_array($images['tmp_name'])) {
//             echo "<script>alert('No images uploaded!'); window.history.back();</script>";
//             return;
//         }

//         foreach ($images['tmp_name'] as $index => $tmpName) {
//             if ($images['error'][$index] === UPLOAD_ERR_OK && is_uploaded_file($tmpName)) {
//                 $ext = pathinfo($images['name'][$index], PATHINFO_EXTENSION);
//                 $fileName = uniqid("veh_{$vehicle_id}_") . "." . strtolower($ext);
//                 $targetPath = $uploadDir . $fileName;

//                 if (move_uploaded_file($tmpName, $targetPath)) {
//                     $label = $labels[$index] ?? '';
//                     $desc  = $descs[$index] ?? '';

//                     $stmt = $conn->prepare("
//                         INSERT INTO vehicle_images_tbl 
//                         (vehicle_id, image_path, image_label, image_description) 
//                         VALUES (:vehicle_id, :image_path, :image_label, :image_description)
//                     ");
//                     $stmt->execute([
//                         ':vehicle_id' => $vehicle_id,
//                         ':image_path' => $fileName,
//                         ':image_label' => $label,
//                         ':image_description' => $desc
//                     ]);
//                 }
//             }
//         }

//         // Redirect depending on button clicked
//         if (isset($_POST['inspection'])) {
//             echo "<script>alert('Vehicle Photo added successfully!'); 
//                   window.location='index.php?view=inspection&vehicle_no={$vehicle_id}';</script>";
//         } else {
//             echo "<script>alert('Vehicle images uploaded successfully!'); 
//                   window.location='index.php?view=view_van_list';</script>";
//         }
//     } catch (PDOException $e) {
//         echo "Error inserting vehicle images: " . $e->getMessage();
//     }
// }

//This function is used to update images 
function update_vehicle_images()
{
    include('../../includes/db.php');

    $vehicle_id = $_POST['vehicle_id'] ?? null;
    if (!$vehicle_id) {
        echo "<script>alert('Vehicle ID is required!'); window.history.back();</script>";
        return;
    }

    try {
        $uploadDir = "../../uploads/vehicles/";
        if (!is_dir($uploadDir)) mkdir($uploadDir, 0777, true);

        // -------------------
        // Update Existing Images
        // -------------------
        $labels = $_POST['image_label'] ?? [];
        $descs  = $_POST['image_description'] ?? [];
        $replaceFiles = $_FILES['replace_image'] ?? [];

        foreach ($labels as $img_id => $label) {
            $desc = $descs[$img_id] ?? '';

            // Check if replacement file uploaded
            $replaceTmp = $replaceFiles['tmp_name'][$img_id] ?? null;
            if ($replaceTmp && $replaceFiles['error'][$img_id] === UPLOAD_ERR_OK) {
                $ext = pathinfo($replaceFiles['name'][$img_id], PATHINFO_EXTENSION);
                $fileName = uniqid("veh_{$vehicle_id}_") . "." . strtolower($ext);
                $targetPath = $uploadDir . $fileName;

                if (move_uploaded_file($replaceTmp, $targetPath)) {
                    // Delete old file
                    $oldStmt = $conn->prepare("SELECT image_path FROM vehicle_images_tbl WHERE id = :id");
                    $oldStmt->execute([':id' => $img_id]);
                    $oldFile = $oldStmt->fetchColumn();
                    if ($oldFile && file_exists($uploadDir . $oldFile)) unlink($uploadDir . $oldFile);

                    // Update DB with new image path, label, description
                    $stmt = $conn->prepare("
                        UPDATE vehicle_images_tbl 
                        SET image_path = :image_path, image_label = :image_label, image_description = :image_description
                        WHERE id = :id
                    ");
                    $stmt->execute([
                        ':image_path' => $fileName,
                        ':image_label' => $label,
                        ':image_description' => $desc,
                        ':id' => $img_id
                    ]);
                }
            } else {
                // Only update label/description if no replacement file
                $stmt = $conn->prepare("
                    UPDATE vehicle_images_tbl 
                    SET image_label = :image_label, image_description = :image_description
                    WHERE id = :id
                ");
                $stmt->execute([
                    ':image_label' => $label,
                    ':image_description' => $desc,
                    ':id' => $img_id
                ]);
            }
        }

        // -------------------
        // Insert New Images
        // -------------------
        $newImages = $_FILES['vehicle_images'] ?? null;
        $newLabels = $_POST['image_label_new'] ?? [];
        $newDescs  = $_POST['image_description_new'] ?? [];

        if ($newImages && is_array($newImages['tmp_name'])) {
            foreach ($newImages['tmp_name'] as $index => $tmpName) {
                if ($newImages['error'][$index] === UPLOAD_ERR_OK && is_uploaded_file($tmpName)) {
                    $ext = pathinfo($newImages['name'][$index], PATHINFO_EXTENSION);
                    $fileName = uniqid("veh_{$vehicle_id}_") . "." . strtolower($ext);
                    $targetPath = $uploadDir . $fileName;

                    if (move_uploaded_file($tmpName, $targetPath)) {
                        $label = $newLabels[$index] ?? '';
                        $desc  = $newDescs[$index] ?? '';

                        $stmt = $conn->prepare("
                            INSERT INTO vehicle_images_tbl
                            (vehicle_id, image_path, image_label, image_description)
                            VALUES (:vehicle_id, :image_path, :image_label, :image_description)
                        ");
                        $stmt->execute([
                            ':vehicle_id' => $vehicle_id,
                            ':image_path' => $fileName,
                            ':image_label' => $label,
                            ':image_description' => $desc
                        ]);
                    }
                }
            }
        }

        echo "<script>alert('Vehicle images updated successfully!'); 
              window.location='index.php?view=view_van_list';</script>";
    } catch (PDOException $e) {
        echo "Error updating vehicle images: " . $e->getMessage();
    }
}



// This function is used to show all vehicle list in table 
function listVehicles($conn)
{
    try {
        // session_start(); // Ensure session is started
        $user_id = $_SESSION['acct_id'] ?? 0;
        $user_type = $_SESSION['type'] ?? '';

        if ($user_type === 'Administrator') {
            // Administrator sees all vehicles
            $stmt = $conn->query("SELECT * FROM vehicle_details_tbl ORDER BY id DESC");
        } else {
            // Non-Administrator sees vehicles for their branch and assigned staff
            $stmt = $conn->prepare("SELECT * FROM vehicle_details_tbl WHERE branch_id = ? AND assigned_staff = ? ORDER BY id DESC");
            $stmt->execute([$assigned_branch_id = getAssignedBranchId($conn, $user_id), $user_id]);
        }

        // $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $list_vehicles = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $list_vehicles;

        // echo json_encode(["data" => $rows]); // return JSON
    } catch (PDOException $e) {
        echo json_encode(["data" => [], "error" => $e->getMessage()]);
    }
}

// Helper function to get assigned branch id for the user
function getAssignedBranchId($conn, $user_id)
{
    $stmt = $conn->prepare("SELECT branch_id FROM accounts WHERE acct_id = ?");
    $stmt->execute([$user_id]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    return $result ? $result['branch_id'] : 0;
}

// Function is used to save inspection
// function saveInspection($conn, $data)
// {
//     // Sanitize inputs
//     $vehicle_id = intval($data['vehicle_id']);
//     $tyres = htmlspecialchars($data['tyres']);
//     $drivers_cabin = htmlspecialchars($data['drivers_cabin']);
//     $loading_area = htmlspecialchars($data['loading_area']);
//     $exterior = htmlspecialchars($data['exterior']);
//     $mechanical = htmlspecialchars($data['mechanical']);
//     $comments = htmlspecialchars($data['comments']);
//     $test_driven = htmlspecialchars($data['test_driven']);
//     $test_drive_comments = htmlspecialchars($data['test_drive_comments']);
//     // $inspection_by = htmlspecialchars($data['inspection_by']);

//     try {
//         //  Check if vehicle already has an inspection
//         $check = $conn->prepare("SELECT COUNT(*) FROM vehicle_inspection_tbl WHERE vehicle_id = :vehicle_id");
//         $check->execute([':vehicle_id' => $vehicle_id]);
//         $exists = $check->fetchColumn();

//         if ($exists > 0) {
//             // Already inspected
//             echo "<script>alert('Inspection already done for this vehicle!'); window.location='index.php?view=view_van_list';</script>";
//             return;
//         }

//         // Insert new inspection
//         $stmt = $conn->prepare("INSERT INTO vehicle_inspection_tbl 
//             (vehicle_id, tyres, drivers_cabin, loading_area, exterior, mechanical, comments, test_driven, test_drive_comments, inspection_by, inspection_date)
//             VALUES (:vehicle_id, :tyres, :drivers_cabin, :loading_area, :exterior, :mechanical, :comments, :test_driven, :test_drive_comments, :inspection_by, NOW())");

//         $stmt->execute([
//             ':vehicle_id' => $vehicle_id,
//             ':tyres' => $tyres,
//             ':drivers_cabin' => $drivers_cabin,
//             ':loading_area' => $loading_area,
//             ':exterior' => $exterior,
//             ':mechanical' => $mechanical,
//             ':comments' => $comments,
//             ':test_driven' => $test_driven,
//             ':test_drive_comments' => $test_drive_comments,
//             // ':inspection_by' => $inspection_by
//         ]);

//         echo "<script>alert('Inspection saved successfully!'); window.location='index.php?view=view_van_list';</script>";
//     } catch (PDOException $e) {
//         return ['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()];
//     }
// }
function saveInspection($conn, $data)
{
    // Sanitize inputs
    $vehicle_id = intval($data['vehicle_id']);
    $tyres = htmlspecialchars($data['tyres']);
    $drivers_cabin = htmlspecialchars($data['drivers_cabin']);
    $loading_area = htmlspecialchars($data['loading_area']);
    $exterior = htmlspecialchars($data['exterior']);
    $mechanical = htmlspecialchars($data['mechanical']);
    $comments = htmlspecialchars($data['comments']);
    $test_driven = htmlspecialchars($data['test_driven']);
    $test_drive_comments = htmlspecialchars($data['test_drive_comments']);
    $inspection_by = $_SESSION['acct_id'] ?? 0; // logged-in staff ID

    try {
        // --- Check if inspection already exists ---
        $check = $conn->prepare("SELECT COUNT(*) FROM vehicle_inspection_tbl WHERE vehicle_id = :vehicle_id");
        $check->execute([':vehicle_id' => $vehicle_id]);
        if ($check->fetchColumn() > 0) {
            echo "<script>alert('Inspection already done for this vehicle!'); window.location='index.php?view=view_van_list';</script>";
            return;
        }

        // --- Upload directory setup ---
        $uploadDir = "../../uploads/inspection_photos/";
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0777, true);
        }

        // --- Helper function for file upload ---
        function uploadPhoto($fieldName, $uploadDir)
        {
            if (!empty($_FILES[$fieldName]['name'])) {
                $filename = time() . '_' . preg_replace("/[^a-zA-Z0-9._-]/", "_", basename($_FILES[$fieldName]['name']));
                $targetPath = $uploadDir . $filename;
                if (move_uploaded_file($_FILES[$fieldName]['tmp_name'], $targetPath)) {
                    return $filename;
                }
            }
            return null;
        }

        // --- Handle each photo upload ---
        $photo_drivers_cabin = uploadPhoto('photo_drivers_cabin', $uploadDir);
        $photo_loading_area  = uploadPhoto('photo_loading_area', $uploadDir);
        $photo_exterior      = uploadPhoto('photo_exterior', $uploadDir);

        // --- Insert into table ---
        $stmt = $conn->prepare("
            INSERT INTO vehicle_inspection_tbl 
            (vehicle_id, tyres, drivers_cabin, loading_area, exterior, mechanical, comments, 
             test_driven, test_drive_comments, photo_drivers_cabin, photo_loading_area, photo_exterior, inspection_by, inspection_date)
            VALUES 
            (:vehicle_id, :tyres, :drivers_cabin, :loading_area, :exterior, :mechanical, :comments, 
             :test_driven, :test_drive_comments, :photo_drivers_cabin, :photo_loading_area, :photo_exterior, :inspection_by, NOW())
        ");

        $stmt->execute([
            ':vehicle_id' => $vehicle_id,
            ':tyres' => $tyres,
            ':drivers_cabin' => $drivers_cabin,
            ':loading_area' => $loading_area,
            ':exterior' => $exterior,
            ':mechanical' => $mechanical,
            ':comments' => $comments,
            ':test_driven' => $test_driven,
            ':test_drive_comments' => $test_drive_comments,
            ':photo_drivers_cabin' => $photo_drivers_cabin,
            ':photo_loading_area' => $photo_loading_area,
            ':photo_exterior' => $photo_exterior,
            ':inspection_by' => $inspection_by
        ]);

        echo "<script>alert('Inspection saved successfully!'); window.location='index.php?view=view_van_list';</script>";
    } catch (PDOException $e) {
        echo "<script>alert('Error: " . addslashes($e->getMessage()) . "'); window.history.back();</script>";
    }
}



// This function is used to update inspection 
// function updateInspection($conn, $data)
// {
//     $vehicle_id = $data['vehicle_id'] ?? 0;

//     if (empty($vehicle_id)) {
//         return ['status' => 'error', 'message' => 'Invalid Vehicle ID'];
//     }

//     $tyres               = $data['tyres'] ?? '';
//     $drivers_cabin       = $data['drivers_cabin'] ?? '';
//     $loading_area        = $data['loading_area'] ?? '';
//     $exterior            = $data['exterior'] ?? '';
//     $mechanical          = $data['mechanical'] ?? '';
//     $comments            = $data['comments'] ?? '';
//     $test_driven         = $data['test_driven'] ?? '';
//     $test_drive_comments = $data['test_drive_comments'] ?? '';
//     $inspection_by       = $data['inspection_by'] ?? null; // optional

//     try {
//         $stmt = $conn->prepare("
//             UPDATE vehicle_inspection_tbl 
//             SET 
//                 tyres               = :tyres,
//                 drivers_cabin       = :drivers_cabin,
//                 loading_area        = :loading_area,
//                 exterior            = :exterior,
//                 mechanical          = :mechanical,
//                 comments            = :comments,
//                 test_driven         = :test_driven,
//                 test_drive_comments = :test_drive_comments,
//                 inspection_by       = :inspection_by
//             WHERE vehicle_id = :vehicle_id
//         ");

//         $stmt->execute([
//             ':vehicle_id'          => $vehicle_id,
//             ':tyres'               => $tyres,
//             ':drivers_cabin'       => $drivers_cabin,
//             ':loading_area'        => $loading_area,
//             ':exterior'            => $exterior,
//             ':mechanical'          => $mechanical,
//             ':comments'            => $comments,
//             ':test_driven'         => $test_driven,
//             ':test_drive_comments' => $test_drive_comments,
//             ':inspection_by'       => $inspection_by
//         ]);

//         echo "<script>alert('Inspection updated successfully!'); window.location='index.php?view=view_van_list';</script>";
//         exit;
//     } catch (PDOException $e) {
//         return ['status' => 'error', 'message' => $e->getMessage()];
//     }
// }
function updateInspection($conn, $data)
{
    $vehicle_id = $data['vehicle_id'] ?? 0;

    if (empty($vehicle_id)) {
        return ['status' => 'error', 'message' => 'Invalid Vehicle ID'];
    }

    $tyres               = htmlspecialchars($data['tyres'] ?? '');
    $drivers_cabin       = htmlspecialchars($data['drivers_cabin'] ?? '');
    $loading_area        = htmlspecialchars($data['loading_area'] ?? '');
    $exterior            = htmlspecialchars($data['exterior'] ?? '');
    $mechanical          = htmlspecialchars($data['mechanical'] ?? '');
    $comments            = htmlspecialchars($data['comments'] ?? '');
    $test_driven         = htmlspecialchars($data['test_driven'] ?? '');
    $test_drive_comments = htmlspecialchars($data['test_drive_comments'] ?? '');
    $inspection_by       = $_SESSION['acct_id'] ?? ($data['inspection_by'] ?? null);

    try {
        // --- Directory for uploads ---
        $uploadDir = "../../uploads/inspection_photos/";
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0777, true);
        }

        // --- Helper: Upload and rename photo safely ---
        function uploadPhotoUpdate($fieldName, $uploadDir, $existingFile = null)
        {
            if (!empty($_FILES[$fieldName]['name'])) {
                $filename = time() . '_' . preg_replace("/[^a-zA-Z0-9._-]/", "_", basename($_FILES[$fieldName]['name']));
                $targetPath = $uploadDir . $filename;
                if (move_uploaded_file($_FILES[$fieldName]['tmp_name'], $targetPath)) {
                    // Delete old file if exists
                    if (!empty($existingFile) && file_exists($uploadDir . $existingFile)) {
                        unlink($uploadDir . $existingFile);
                    }
                    return $filename;
                }
            }
            return $existingFile; // keep old if no new file uploaded
        }

        // --- Fetch existing photo filenames ---
        $stmt = $conn->prepare("SELECT photo_drivers_cabin, photo_loading_area, photo_exterior FROM vehicle_inspection_tbl WHERE vehicle_id = :vehicle_id");
        $stmt->execute([':vehicle_id' => $vehicle_id]);
        $existing = $stmt->fetch(PDO::FETCH_ASSOC);

        // --- Update photo fields if new files uploaded ---
        $photo_drivers_cabin = uploadPhotoUpdate('photo_drivers_cabin', $uploadDir, $existing['photo_drivers_cabin'] ?? null);
        $photo_loading_area  = uploadPhotoUpdate('photo_loading_area', $uploadDir, $existing['photo_loading_area'] ?? null);
        $photo_exterior      = uploadPhotoUpdate('photo_exterior', $uploadDir, $existing['photo_exterior'] ?? null);

        // --- Update inspection record ---
        $stmt = $conn->prepare("
            UPDATE vehicle_inspection_tbl 
            SET 
                tyres               = :tyres,
                drivers_cabin       = :drivers_cabin,
                loading_area        = :loading_area,
                exterior            = :exterior,
                mechanical          = :mechanical,
                comments            = :comments,
                test_driven         = :test_driven,
                test_drive_comments = :test_drive_comments,
                photo_drivers_cabin = :photo_drivers_cabin,
                photo_loading_area  = :photo_loading_area,
                photo_exterior      = :photo_exterior,
                inspection_by       = :inspection_by,
                inspection_date     = NOW()
            WHERE vehicle_id = :vehicle_id
        ");

        $stmt->execute([
            ':vehicle_id'          => $vehicle_id,
            ':tyres'               => $tyres,
            ':drivers_cabin'       => $drivers_cabin,
            ':loading_area'        => $loading_area,
            ':exterior'            => $exterior,
            ':mechanical'          => $mechanical,
            ':comments'            => $comments,
            ':test_driven'         => $test_driven,
            ':test_drive_comments' => $test_drive_comments,
            ':photo_drivers_cabin' => $photo_drivers_cabin,
            ':photo_loading_area'  => $photo_loading_area,
            ':photo_exterior'      => $photo_exterior,
            ':inspection_by'       => $inspection_by
        ]);

        echo "<script>alert('Inspection updated successfully!'); window.location='index.php?view=view_van_list';</script>";
        exit;
    } catch (PDOException $e) {
        return ['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()];
    }
}

// Count Vehicle  
// function listVehiclescount($conn, $start = 0, $limit = 10, $search = '')
// {
//     $sql = "SELECT * FROM vehicle_details_tbl";
//     $params = [];
//     if ($search) {
//         $sql .= " WHERE registrationNumber LIKE :s OR make LIKE :s OR model LIKE :s OR colour LIKE :s";
//         $params[':s'] = "%$search%";
//     }
//     $sql .= " ORDER BY id DESC LIMIT :start, :limit";

//     $stmt = $conn->prepare($sql);
//     foreach ($params as $key => $val) $stmt->bindValue($key, $val);
//     $stmt->bindValue(':start', (int)$start, PDO::PARAM_INT);
//     $stmt->bindValue(':limit', (int)$limit, PDO::PARAM_INT);
//     $stmt->execute();
//     return $stmt->fetchAll(PDO::FETCH_ASSOC);
// }
function listVehiclescount($conn, $start = 0, $limit = 10, $search = '')
{
    try {
        $user_id = $_SESSION['acct_id'] ?? 0;
        $user_type = $_SESSION['type'] ?? '';

        $params = [];
        $sql = "SELECT * FROM vehicle_details_tbl";

        if ($user_type !== 'Administrator') {
            // Non-admin: only vehicles for assigned branch and staff
            $branch_id = getAssignedBranchId($conn, $user_id);
            $sql .= " WHERE branch_id = :branch_id AND assigned_staff = :user_id";
            $params[':branch_id'] = $branch_id;
            $params[':user_id'] = $user_id;

            if ($search) {
                $sql .= " AND (registrationNumber LIKE :s OR make LIKE :s OR model LIKE :s OR colour LIKE :s)";
                $params[':s'] = "%$search%";
            }
        } else {
            // Admin: all vehicles, optional search
            if ($search) {
                $sql .= " WHERE registrationNumber LIKE :s OR make LIKE :s OR model LIKE :s OR colour LIKE :s";
                $params[':s'] = "%$search%";
            }
        }

        $sql .= " ORDER BY id DESC LIMIT :start, :limit";
        $stmt = $conn->prepare($sql);

        // Bind all parameters
        foreach ($params as $key => $val) {
            $stmt->bindValue($key, $val);
        }
        $stmt->bindValue(':start', (int)$start, PDO::PARAM_INT);
        $stmt->bindValue(':limit', (int)$limit, PDO::PARAM_INT);

        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        return [];
    }
}


// Total Vehicles Earch 
// function totalVehicles($conn, $search = '')
// {
//     $sql = "SELECT COUNT(*) as total FROM vehicle_details_tbl";
//     $params = [];
//     if ($search) {
//         $sql .= " WHERE registrationNumber LIKE :s OR make LIKE :s OR model LIKE :s OR colour LIKE :s";
//         $params[':s'] = "%$search%";
//     }
//     $stmt = $conn->prepare($sql);
//     foreach ($params as $key => $val) $stmt->bindValue($key, $val);
//     $stmt->execute();
//     $row = $stmt->fetch(PDO::FETCH_ASSOC);
//     return $row['total'] ?? 0;
// }

function totalVehicles($conn, $search = '')
{
    try {
        $user_id = $_SESSION['acct_id'] ?? 0;
        $user_type = $_SESSION['type'] ?? '';

        if ($user_type === 'Administrator') {
            // Admin: count all vehicles
            if ($search) {
                $stmt = $conn->prepare("SELECT COUNT(*) FROM vehicle_details_tbl 
                    WHERE registrationNumber LIKE ? OR make LIKE ? OR model LIKE ? OR colour LIKE ?");
                $like = "%$search%";
                $stmt->execute([$like, $like, $like, $like]);
            } else {
                $stmt = $conn->query("SELECT COUNT(*) FROM vehicle_details_tbl");
            }
        } else {
            // Non-admin: count only assigned vehicles for their branch
            $branch_id = getAssignedBranchId($conn, $user_id);
            if ($search) {
                $stmt = $conn->prepare("SELECT COUNT(*) FROM vehicle_details_tbl 
                    WHERE branch_id = ? AND assigned_staff = ? AND 
                    (registrationNumber LIKE ? OR make LIKE ? OR model LIKE ? OR colour LIKE ?)");
                $like = "%$search%";
                $stmt->execute([$branch_id, $user_id, $like, $like, $like, $like]);
            } else {
                $stmt = $conn->prepare("SELECT COUNT(*) FROM vehicle_details_tbl WHERE branch_id = ? AND assigned_staff = ?");
                $stmt->execute([$branch_id, $user_id]);
            }
        }

        return (int) $stmt->fetchColumn();
    } catch (PDOException $e) {
        return 0;
    }
}
