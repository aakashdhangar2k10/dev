<?php if ($_SESSION['type'] == 'Administrator') {
  if (!isset($_GET['id']) || empty($_GET['id'])) {
    die("Invalid request. No User ID provided.");
  }

  $id = intval($_GET['id']);
  try {
    $stmt = $conn->prepare("SELECT * FROM accounts WHERE acct_id = :id");
    $stmt->execute([':id' => $id]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
      die("User not found.");
    }
  } catch (PDOException $e) {
    die("Database error: " . $e->getMessage());
  }
?>
  <!-- Content Header -->
  <section class="content-header">
    <h1>Users <small>Control Panel</small></h1>
    <ol class="breadcrumb">
      <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
      <li class="active">View User</li>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-1"></div>

      <div class="col-md-10">
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">User Details</h3>
          </div>

          <div class="box-body">
            <div class="row">

              <!-- First Name -->
              <div class="col-md-4">
                <div class="form-group">
                  <label>First Name</label>
                  <input type="text" class="form-control input-sm"
                    value="<?php echo htmlspecialchars($user['fname']); ?>" readonly>
                </div>
              </div>

              <!-- Last Name -->
              <div class="col-md-4">
                <div class="form-group">
                  <label>Last Name</label>
                  <input type="text" class="form-control input-sm"
                    value="<?php echo htmlspecialchars($user['lname']); ?>" readonly>
                </div>
              </div>

              <!-- Middle -->
              <div class="col-md-4">
                <div class="form-group">
                  <label>Middle</label>
                  <input type="text" class="form-control input-sm"
                    value="<?php echo htmlspecialchars($user['mname']); ?>" readonly>
                </div>
              </div>

              <!-- Username -->
              <div class="col-md-4">
                <div class="form-group">
                  <label>Username</label>
                  <input type="text" class="form-control input-sm"
                    value="<?php echo htmlspecialchars($user['username']); ?>" readonly>
                </div>
              </div>

              <!-- Contact -->
              <div class="col-md-4">
                <div class="form-group">
                  <label>Contact</label>
                  <input type="text" class="form-control input-sm"
                    value="<?php echo htmlspecialchars($user['contact_no']); ?>" readonly>
                </div>
              </div>

              <!-- Staff Role -->
              <div class="col-md-4">
                <div class="form-group">
                  <label>Role Type</label>
                  <?php
                  // Convert database value into readable label
                  $roleLabel = (strcasecmp($user['type'], 'Administrator') === 0) ? 'Admin' : 'Staff';
                  ?>
                  <input type="text" class="form-control input-sm"
                    value="<?php echo htmlspecialchars($roleLabel); ?>" readonly>
                </div>
              </div>


              <!-- Branch -->
              <!-- Branch -->
              <div class="col-md-4">
                <div class="form-group">
                  <label>Branch</label>
                  <?php
                  // Fetch branch short name using branch_id
                  $branchName = 'Not Found';
                  if (!empty($user['branch_id'])) {
                    try {
                      $stmtBranch = $conn->prepare("SELECT short_name FROM branches_tbl WHERE id = :id");
                      $stmtBranch->execute([':id' => $user['branch_id']]);
                      $branchRow = $stmtBranch->fetch(PDO::FETCH_ASSOC);
                      if ($branchRow) {
                        $branchName = $branchRow['short_name'];
                      }
                    } catch (PDOException $e) {
                      $branchName = "Error";
                    }
                  }
                  ?>
                  <input type="text" class="form-control input-sm"
                    value="<?php echo htmlspecialchars($branchName); ?>" readonly>
                </div>
              </div>


              <!-- Profile Pic -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Profile Picture</label><br>
                  <img src="uploads/<?php echo $user['imagename']; ?>"
                    alt="Profile Picture"
                    style="width:120px;height:120px;border-radius:8px;">
                </div>
              </div>

            </div>
          </div><!-- /.box-body -->

          <div class="box-footer">
            <div class="pull-right">
              <a href="index.php?view=edit&id=<?php echo $user['acct_id']; ?>" class="btn btn-warning">
                <i class="fa fa-edit"></i> Edit
              </a>
              <a href="index.php?view=list" class="btn btn-danger">
                <i class="fa fa-arrow-left"></i> Back
              </a>
            </div>
          </div><!-- /.box-footer -->
        </div>
      </div>

      <div class="col-md-1"></div>
    </div>
  </section>

<?php } else {
  redirect('../../errorpage/page_404.html');
} ?>