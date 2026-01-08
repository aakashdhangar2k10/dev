<?php
include('includes/initialize.php');
include('./includes/db.php');
// session_start(); 
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Van Stock And Readiness System - Login</title>
  <link href="<?php echo WEB_ROOT; ?>css/login.css" rel="stylesheet">
  <!-- <link rel="shortcut icon" href="<?php echo WEB_ROOT; ?>images/" type="image/x-icon" /> -->
</head>

<body class="bg-light">

  <div class="container d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="card shadow-lg p-4" style="max-width: 400px; width:100%;">
      <div class="text-center mb-3">
        <h3 class="fw-bold">Van Stock & Readiness System</h3>
      </div>

      <form action="" method="post">
        <div class="mb-3">
          <label for="uname" class="form-label">Username</label>
          <input type="text" class="form-control" id="uname" name="uname" required autofocus>
        </div>
        <div class="mb-3">
          <label for="upass" class="form-label">Password</label>
          <input type="password" class="form-control" id="upass" name="upass" required>
        </div>

        <div class="d-grid">
          <button type="submit" name="btnlogin" class="btn btn-primary">Sign In</button>
        </div>
      </form>

      <div class="mt-3 text-center small">
        <span class="text-danger">Don't have an account?</span><br>
        <span class="text-success">Please ask the administrator for access</span>
      </div>
    </div>
  </div>

  <?php
if (isset($_POST['btnlogin'])) {
    $uname = trim($_POST['uname']);
    $upass = trim($_POST['upass']);

    // Fetch user
    $statement = $conn->prepare("SELECT * FROM accounts WHERE username = :username LIMIT 1");
    $statement->execute([':username' => $uname]);
    $row = $statement->fetch(PDO::FETCH_ASSOC);

    if ($row && password_verify($upass, $row['password'])) {
        // Save user details
        $_SESSION['acct_id']   = $row['acct_id'];
        $_SESSION['stud_id']   = $row['stud_id'];
        $_SESSION['type']      = $row['type'];
        $_SESSION['username']  = $row['username'];
        $_SESSION['imagename'] = $row['imagename'];
        $_SESSION['branch_id'] = $row['branch_id'];

        // 🔹 Fetch branch short_name from branches_tbl
        if (!empty($row['branch_id'])) {
            $stmt = $conn->prepare("SELECT short_name FROM branches_tbl WHERE id = :branch_id LIMIT 1");
            $stmt->execute([':branch_id' => $row['branch_id']]);
            $branch = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($branch) {
                $_SESSION['short_name'] = $branch['short_name'];
            } else {
                $_SESSION['short_name'] = null;
            }
        }

        echo "<script>window.location='index.php';</script>";
    } else {
        echo "<script>alert('Invalid Username or Password!');</script>";
    }
}
?>


</body>

</html>