<?php
require_once("../../includes/initialize.php");
include('../../includes/db.php');
$action = (isset($_GET['action']) && $_GET['action'] != '') ? $_GET['action'] : '';

switch ($action) {
    case 'add':
        add_user($conn);
        break;

    case 'list':
        getUsers();
        break;

    case 'edit':
        edit_user($conn);
        break;


    case 'view':
        view_user($conn);
        break;

    case 'delrecord':
        delrecord();
        break;

    case 'delete':
        doDelete();
        break;
}


function add_user($conn)
{
    if (isset($_POST['save']) || isset($_POST['saveandadd'])) {
        // Set timezone and current date-time
        $signupdate = date("Y-m-d H:i:s");

        // Get form data and sanitize
        $fname    = trim($_POST['fname']);
        $lname    = trim($_POST['lname']);
        $mname    = trim($_POST['mname']);
        $contact_no  = trim($_POST['contact_no']);
        $username = trim($_POST['username']);
        $pass     = $_POST['pass'];
        $c_pass   = $_POST['c_pass'];
        $type     = trim($_POST['type']);
        $branch   = trim($_POST['branch']);

        // Validate required fields
        if (empty($fname) || empty($lname) || empty($username) || empty($pass) || empty($c_pass) || empty($type) || empty($branch)) {
            echo "Please fill in all required fields.";
            return;
        }

        // Check if passwords match
        if ($pass !== $c_pass) {
            echo "Passwords do not match.";
            return;
        }

        // Hash the password
        $hashedPassword = password_hash($pass, PASSWORD_DEFAULT);

        // Handle profile image
        $uploadDir = 'uploads/'; // Make sure this directory exists and is writable
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true); // Create folder if it doesn't exist
        }

        if (!empty($_FILES['image']['name']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
            $allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
            if (!in_array($_FILES['image']['type'], $allowedTypes)) {
                echo "Invalid image format.";
                return;
            }

            $imageName = time() . '_' . basename($_FILES['image']['name']); // Prevent name collisions
            $targetFile = $uploadDir . $imageName;

            if (move_uploaded_file($_FILES['image']['tmp_name'], $targetFile)) {
                // File uploaded successfully
            } else {
                echo "Failed to upload image.";
                return;
            }
        } else {
            // Use default image if none uploaded
            $imageName = 'default.jpg';
            // Optionally copy the default image into uploads folder if needed
            if (!file_exists($uploadDir . $imageName)) {
                copy('../../defaultimage/defaultimage.jpg', $uploadDir . $imageName);
            }
        }

        // Default status and screenlock
        $status = 'Offline';
        $screenlock = 'OFF';

        try {
            // Insert into accounts table
            $stmt = $conn->prepare("INSERT INTO accounts 
                (fname,lname,mname,username,password, type, contact_no, imagename, status, signupdate, screenlock, branch_id) 
                VALUES (:fname,:lname,:mname,:username, :password, :type, :contact_no, :imagename, :status, :signupdate, :screenlock, :branch_id)");

            $stmt->execute([
                ':fname'     => $fname,
                ':lname'     => $lname,
                ':mname'     => $mname,
                ':username'  => $username,
                ':password'  => $hashedPassword,
                ':type'      => $type,
                ':contact_no' => $contact_no,
                ':imagename' => $imageName,
                ':status'    => $status,
                ':signupdate' => $signupdate,
                ':screenlock' => $screenlock,
                ':branch_id' => $branch
            ]);

            echo "User added successfully.";

            // Redirect based on button clicked
            if (isset($_POST['save'])) {
                header("Location: index.php?view=add");
                exit();
            } else {
                header("Location: index.php?view=add");
                exit();
            }
        } catch (PDOException $e) {
            echo "Database error: " . $e->getMessage();
        }
    }
}
function view_user($conn)
{
    if (!isset($_GET['id']) || empty($_GET['id'])) {
        echo "Invalid request. No User ID provided.";
        return;
    }

    $id = intval($_GET['id']); // sanitize

    try {
        $stmt = $conn->prepare("SELECT * FROM accounts WHERE acct_id = :id");
        $stmt->execute([':id' => $id]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$user) {
            echo "User not found.";
            return;
        }
        header("Location: index.php?view=view&id=$id");
        exit();
    } catch (PDOException $e) {
        echo "Database error: " . $e->getMessage();
    }
}


function edit_user($conn)
{
    if (isset($_POST['update'])) {
        $acct_id  = intval($_POST['acct_id']); // hidden input in edit form

        // Get form data
        $fname      = trim($_POST['fname']);
        $lname      = trim($_POST['lname']);
        $mname      = trim($_POST['mname']);
        $contact_no = trim($_POST['contact_no']);
        $username   = trim($_POST['username']);
        $type       = trim($_POST['type']);
        $branch     = trim($_POST['branch']);

        // Basic validation
        if (empty($fname) || empty($lname) || empty($username) || empty($type) || empty($branch)) {
            echo "Please fill in all required fields.";
            return;
        }

        // Password update (only if provided)
        $pass       = $_POST['pass'] ?? '';
        $c_pass     = $_POST['c_pass'] ?? '';
        $hashedPassword = null;

        if (!empty($pass)) {
            if ($pass !== $c_pass) {
                echo "Passwords do not match.";
                return;
            }
            $hashedPassword = password_hash($pass, PASSWORD_DEFAULT);
        }

        // Handle profile image
        $uploadDir = 'uploads/';
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }

        $imageName = null; // only update if new image uploaded
        if (!empty($_FILES['image']['name']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
            $allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
            if (!in_array($_FILES['image']['type'], $allowedTypes)) {
                echo "Invalid image format.";
                return;
            }

            $imageName = time() . '_' . basename($_FILES['image']['name']);
            $targetFile = $uploadDir . $imageName;

            if (!move_uploaded_file($_FILES['image']['tmp_name'], $targetFile)) {
                echo "Failed to upload image.";
                return;
            }
        }

        try {
            // Build dynamic SQL update
            $sql = "UPDATE accounts SET 
                        fname = :fname,
                        lname = :lname,
                        mname = :mname,
                        username = :username,
                        type = :type,
                        contact_no = :contact_no,
                        branch_id = :branch_id";

            // Only update password if provided
            if ($hashedPassword !== null) {
                $sql .= ", password = :password";
            }

            // Only update image if new uploaded
            if ($imageName !== null) {
                $sql .= ", imagename = :imagename";
            }

            $sql .= " WHERE acct_id = :acct_id";

            $stmt = $conn->prepare($sql);

            // Bind parameters
            $params = [
                ':fname'      => $fname,
                ':lname'      => $lname,
                ':mname'      => $mname,
                ':username'   => $username,
                ':type'       => $type,
                ':contact_no' => $contact_no,
                ':branch_id'  => $branch,
                ':acct_id'    => $acct_id
            ];

            if ($hashedPassword !== null) {
                $params[':password'] = $hashedPassword;
            }
            if ($imageName !== null) {
                $params[':imagename'] = $imageName;
            }

            $stmt->execute($params);

            echo "User updated successfully.";

            // Redirect back to list
            header("Location: index.php?view=list");
            exit();
        } catch (PDOException $e) {
            echo "Database error: " . $e->getMessage();
        }
    }
}



// controller.php
function getUsers()
{
    include('../../includes/db.php');
    
    try {
        $stmt = $conn->prepare("SELECT * FROM accounts ORDER BY acct_id DESC");
        $stmt->execute();
        $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $users;
    } catch (PDOException $e) {
        // Return error message
        return ['error' => $e->getMessage()];
    }
}
