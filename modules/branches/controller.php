<?php
// controller.php
if (isset($_GET['action']) && $_GET['action'] == "add_branch") {
    add_branch();
}

// Handle edit action
if (isset($_GET['action']) && $_GET['action'] == "edit_branch") {
    edit_branch();
}
// controller.php
if (isset($_POST['action'])) {
            get_branches();
    }

function add_branch()
{
    include('../../includes/db.php'); // contains DB connection ($conn)

    if (isset($_POST['save'])) {
        $short_name = trim($_POST['short_name']);
        $full_name  = trim($_POST['full_name']);
        $address    = trim($_POST['address']);
        $pincode    = trim($_POST['pincode']);
        $code       = trim($_POST['code']);
        $year       = trim($_POST['year']);

        // File upload
        $logo = "upload/default_branch.png"; // default
        if (!empty($_FILES['branch_logo']['name'])) {
            $targetDir = "upload/branches/";
            if (!is_dir($targetDir)) {
                mkdir($targetDir, 0777, true);
            }

            $fileName = time() . "_" . basename($_FILES["branch_logo"]["name"]);
            $targetFilePath = $targetDir . $fileName;
            $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));

            // Allow only jpg, png
            $allowedTypes = array("jpg", "jpeg", "png");
            if (in_array($fileType, $allowedTypes)) {
                if (move_uploaded_file($_FILES["branch_logo"]["tmp_name"], $targetFilePath)) {
                    $logo = $targetFilePath;
                }
            }
        }

        // Insert into DB
        try {
            $stmt = $conn->prepare("INSERT INTO branches_tbl 
                (short_name, full_name, address, pincode, code, year_established, logo) 
                VALUES (:short_name, :full_name, :address, :pincode, :code, :year_established, :logo)");

            $stmt->bindParam(':short_name', $short_name);
            $stmt->bindParam(':full_name', $full_name);
            $stmt->bindParam(':address', $address);
            $stmt->bindParam(':pincode', $pincode);
            $stmt->bindParam(':code', $code);
            $stmt->bindParam(':year_established', $year);
            $stmt->bindParam(':logo', $logo);

            $stmt->execute();

            echo "<script>alert('Branch added successfully!'); window.location='index.php?view=list';</script>";
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    }
}


function edit_branch()
{
    include('../../includes/db.php');

    if (isset($_POST['save'])) {
        $id         = intval($_POST['id']);
        $short_name = trim($_POST['short_name']);
        $full_name  = trim($_POST['full_name']);
        $address    = trim($_POST['address']);
        $pincode    = trim($_POST['pincode']);
        $code       = trim($_POST['code']);
        $year       = trim($_POST['year']);

        // First, fetch existing logo path
        $stmt = $conn->prepare("SELECT logo FROM branches_tbl WHERE id = :id");
        $stmt->bindParam(':id', $id);
        $stmt->execute();
        $branch = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$branch) {
            echo "<script>alert('Branch not found!'); window.location='index.php?view=list';</script>";
            exit;
        }

        $logo = $branch['logo']; // existing logo

        // Handle file upload if a new file is provided
        if (!empty($_FILES['branch_logo']['name'])) {
            $targetDir = "upload/branches/";
            if (!is_dir($targetDir)) {
                mkdir($targetDir, 0777, true);
            }

            $fileName = time() . "_" . basename($_FILES["branch_logo"]["name"]);
            $targetFilePath = $targetDir . $fileName;
            $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));

            // Allow only jpg, jpeg, png
            $allowedTypes = array("jpg", "jpeg", "png");
            if (in_array($fileType, $allowedTypes)) {
                if (move_uploaded_file($_FILES["branch_logo"]["tmp_name"], $targetFilePath)) {
                    $logo = $targetFilePath;
                    // Optionally, delete old file if it's not default
                    if ($branch['logo'] != "upload/default_branch.png" && file_exists($branch['logo'])) {
                        unlink($branch['logo']);
                    }
                }
            }
        }

        // Update branch record
        try {
            $stmt = $conn->prepare("UPDATE branches_tbl SET 
                short_name = :short_name,
                full_name = :full_name,
                address = :address,
                pincode = :pincode,
                code = :code,
                year_established = :year_established,
                logo = :logo
                WHERE id = :id");

            $stmt->bindParam(':short_name', $short_name);
            $stmt->bindParam(':full_name', $full_name);
            $stmt->bindParam(':address', $address);
            $stmt->bindParam(':pincode', $pincode);
            $stmt->bindParam(':code', $code);
            $stmt->bindParam(':year_established', $year);
            $stmt->bindParam(':logo', $logo);
            $stmt->bindParam(':id', $id);

            $stmt->execute();

            echo "<script>alert('Branch updated successfully!'); window.location='index.php?view=list';</script>";
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    }
}

// This funcation for Get Branches 
function get_branches()
{
    include('../../includes/db.php');

    try {
        $stmt = $conn->prepare("SELECT id, short_name, full_name, address, pincode, code, year_established, logo, created_at FROM branches_tbl ORDER BY id DESC");
        $stmt->execute();
        $branches = $stmt->fetchAll(PDO::FETCH_ASSOC);
          return $branches;
        // Return JSON for DataTables
        // echo json_encode(["data" => $branches]);
    } catch (PDOException $e) {
        echo json_encode(["data" => [], "error" => $e->getMessage()]);
    }
}
