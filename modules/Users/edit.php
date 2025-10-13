<?php
if ($_SESSION['type'] == 'Administrator') {

  // fetch user from DB
  $id = $_GET['id'] ?? 0;
  $stmt = $conn->prepare("SELECT * FROM accounts WHERE acct_id = ?");
  $stmt->execute([$id]);
  $user = $stmt->fetch(PDO::FETCH_ASSOC);

  if (!$user) {
    redirect('../../errorpage/page_404.html');
    exit;
  }
?>
  <!-- Content Header -->
  <section class="content-header">
    <h1>Users <small>Control Panel</small></h1>
    <ol class="breadcrumb">
      <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
      <li class="active">Edit User</li>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-1"></div>

      <div class="col-md-10">
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">Edit User</h3>
          </div>

          <form method="POST" action="controller.php?action=edit" enctype="multipart/form-data">
            <input type="hidden" name="acct_id" value="<?php echo $user['acct_id']; ?>">

            <div class="box-body">
              <div class="row">

                <!-- First Name -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>First Name <span style="color:red">*</span></label>
                    <input id="fname" class="form-control input-sm" name="fname"
                      value="<?php echo htmlspecialchars($user['fname']); ?>"
                      type="text" required>
                  </div>
                </div>

                <!-- Last Name -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Last Name <span style="color:red">*</span></label>
                    <input id="lname" class="form-control input-sm" name="lname"
                      value="<?php echo htmlspecialchars($user['lname']); ?>"
                      type="text" required>
                  </div>
                </div>

                <!-- Middle -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Middle</label>
                    <input id="uprall" maxlength="4" class="form-control input-sm" name="mname"
                      value="<?php echo htmlspecialchars($user['mname']); ?>"
                      type="text">
                  </div>
                </div>

                <!-- Username -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Username <span style="color:red">*</span></label>
                    <input class="form-control input-sm" name="username"
                      value="<?php echo htmlspecialchars($user['username']); ?>"
                      type="text" required>
                  </div>
                </div>

                <!-- Password -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>New Password</label>
                    <input id="pass" class="form-control input-sm" name="pass" placeholder="Leave blank to keep current" type="password">
                  </div>
                </div>

                <!--Confirm Password -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Confirm Password</label>
                    <input id="c_pass" class="form-control input-sm" name="c_pass" placeholder="Confirm Password" type="password">
                  </div>
                </div>

                <!-- Contact -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Contact <span style="color:red">*</span></label>
                    <input maxlength="11" class="form-control input-sm" name="contact_no"
                      value="<?php echo htmlspecialchars($user['contact_no']); ?>"
                      type="text" required>
                  </div>
                </div>

                <!-- Type -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Staff Role<span style="color:red">*</span></label>
                    <select class="form-control input-sm" name="type" required>
                      <option value="">Select User Type</option>
                      <option value="Administrator" <?php echo ($user['type'] == 'Administrator') ? 'selected' : ''; ?>>Administrator</option>
                      <option value="Non-Administrator" <?php echo ($user['type'] == 'Non-Administrator') ? 'selected' : ''; ?>>Staff</option>
                    </select>
                  </div>
                </div>

                <!-- Branch -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Branch <span style="color:red">*</span></label>
                    <select class="form-control input-sm" name="branch" required>
                      <option value="">Select Branch</option>
                      <option value="1" <?php echo ($user['branch_id'] == '1') ? 'selected' : ''; ?>>Branch1</option>
                      <option value="2" <?php echo ($user['branch_id'] == '2') ? 'selected' : ''; ?>>Branch2</option>
                    </select>
                  </div>
                </div>

                <!-- Profile Pic -->
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Profile Picture</label><br>
                    <?php if (!empty($user['imagename'])) { ?>
                      <img src="uploads/<?php echo htmlspecialchars($user['imagename']); ?>" width="100" class="img-thumbnail"><br><br>
                    <?php } ?>
                    <input type="file" class="form-control" name="image">
                    <span class="help-block">Upload new to replace existing</span>
                  </div>
                </div>

              </div>
            </div><!-- /.box-body -->

            <div class="box-footer">
              <div class="pull-right">
                <button type="submit" name="update" class="btn btn-success">
                  <i class="glyphicon glyphicon-floppy-save"></i> Update
                </button>
                <a href="index.php?view=list" class="btn btn-danger">
                  <i class="fa fa-times"></i> Cancel
                </a>
              </div>
            </div><!-- /.box-footer -->
          </form>
        </div>
      </div>

      <div class="col-md-1"></div>
    </div>
  </section>

<?php
} else {
  redirect('../../errorpage/page_404.html');
}
?>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const pass = document.getElementById('pass');
    const c_pass = document.getElementById('c_pass');
    const form = document.querySelector('form');

    form.addEventListener('submit', function(e) {
      if (pass.value !== "" || c_pass.value !== "") {
        if (pass.value !== c_pass.value) {
          e.preventDefault();
          alert("Passwords do not match!");
          c_pass.focus();
        }
      }
    });
  });
</script>
