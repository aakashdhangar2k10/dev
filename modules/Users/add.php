<?php if ($_SESSION['type'] == 'Administrator') { ?>
  <!-- Content Header -->
  <section class="content-header">
    <h1>Users <small>Control Panel</small></h1>
    <ol class="breadcrumb">
      <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
      <li class="active">Add New Users</li>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-1"></div>

      <div class="col-md-10">
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">Add User</h3>
          </div>

          <form method="POST" action="controller.php?action=add" enctype="multipart/form-data">
            <div class="box-body">
              <div class="row">

                <!-- First Name -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>First Name <span style="color:red">*</span></label>
                    <input id="fname" class="form-control input-sm" name="fname" placeholder="First Name" type="text" required>
                  </div>
                </div>

                <!-- Last Name -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Last Name <span style="color:red">*</span></label>
                    <input id="lname" class="form-control input-sm" name="lname" placeholder="Last Name" type="text" required>
                  </div>
                </div>

                <!-- Middle -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Middle</label>
                    <input id="uprall" maxlength="4" class="form-control input-sm" name="mname" placeholder="Optional" type="text">
                  </div>
                </div>

                <!-- Username -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Username <span style="color:red">*</span></label>
                    <input class="form-control input-sm" name="username" placeholder="User Name" type="text" required>
                  </div>
                </div>

                <!-- Password -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Password <span style="color:red">*</span></label>
                    <input id="pass" class="form-control input-sm" name="pass" placeholder="Enter Password" type="password" required>
                  </div>
                </div>

                <!--Confirm Password -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Confirm Password<span style="color:red">*</span></label>
                    <input id="c_pass" class="form-control input-sm" name="c_pass" placeholder="Confirm Password" type="password" required>
                  </div>
                </div>

                <!-- Contact -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Contact <span style="color:red">*</span></label>
                    <input maxlength="11" class="form-control input-sm" name="contact_no" placeholder="Mobile Number" type="text" required>
                  </div>
                </div>

                <!-- Type -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Staff Role<span style="color:red">*</span></label>
                    <select class="form-control input-sm" name="type" required>
                      <option value="">Select User Type</option>
                      <!-- <option value="Administrator">Administrator</option> -->
                      <option value="Non-Administrator">Staff</option>
                    </select>
                  </div>
                </div>

                <!-- Branch -->
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Branch <span style="color:red">*</span></label>
                    <select class="form-control input-sm" name="branch" required>
                      <option value="">Select Branch</option>
                      <option value="1">Branch1</option>
                      <option value="2">Branch2</option>
                    </select>
                  </div>
                </div>

                <!-- Profile Pic -->
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Profile Picture</label>
                    <input type="file" class="form-control" name="image">
                    <span class="help-block">Profile Picture is Optional</span>
                  </div>
                </div>

              </div>
            </div><!-- /.box-body -->

            <div class="box-footer">
              <div class="pull-right">
                <button type="submit" name="save" class="btn btn-success">
                  <i class="glyphicon glyphicon-floppy-save"></i> Save
                </button>
                <button type="submit" name="saveandadd" class="btn btn-primary">
                  <i class="glyphicon glyphicon-plus"></i> Save and Add New
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

<?php } else {
  redirect('../../errorpage/page_404.html');
} ?>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    const pass = document.getElementById('pass');
    const c_pass = document.getElementById('c_pass');

    c_pass.addEventListener('input', function() {
      if (pass.value !== c_pass.value) {
        c_pass.setCustomValidity("Passwords do not match.");
      } else {
        c_pass.setCustomValidity("");
      }
    });

    form.addEventListener('submit', function(e) {
      if (pass.value !== c_pass.value) {
        e.preventDefault();
        alert("Passwords do not match!");
        c_pass.focus();
      }
    });
  });
</script>