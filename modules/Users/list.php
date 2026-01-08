<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
    Users List
    <small>Control Panel</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
    <li class="active">Users List</li>
  </ol>
</section>

<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box box-info">
        <div class="box-header with-border">
          <h3 class="box-title">Manage Users</h3>
        </div>

        <div class="box-body">
          <?php if ($_SESSION['type'] == 'Administrator') { ?>

            <!-- Responsive Table Wrapper -->
            <div class="table-responsive">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>S. No.</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Contact No.</th>
                    <th>Role Type</th>
                    <th>Branch</th>
                    <th>Profile</th>
                    <th class="text-center">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  include('controller.php'); // adjust path if needed

                  $users = getUsers();
                  if (count($users) > 0) {
                    $s_no = 1;
                    foreach ($users as $user) {
                      echo "<tr>";
                      echo "<td data-label='S. No.'>" . $s_no++ . "</td>";
                      echo "<td data-label='Name'>" . htmlspecialchars($user['fname']) . " " . htmlspecialchars($user['mname']) . " " . htmlspecialchars($user['lname']) . "</td>";
                      echo "<td data-label='Username'>" . htmlspecialchars($user['username']) . "</td>";
                      echo "<td data-label='Contact No.'>" . htmlspecialchars($user['contact_no']) . "</td>";
                      $typeLabel = ($user['type'] === 'Administrator') ? 'Admin' : 'Staff';
                      echo "<td data-label='Type'>" . htmlspecialchars($typeLabel) . "</td>";
                      echo "<td data-label='Branch'>" . htmlspecialchars($user['short_name']) . "</td>";
                      echo "<td data-label='Profile'>";
                      if (!empty($user['imagename'])) {
                        echo "<img src='uploads/" . htmlspecialchars($user['imagename']) . "' width='50' height='50' class='img-circle'>";
                      } else {
                        echo "No Image";
                      }
                      echo "</td>";
                      echo "<td data-label='Actions' class='text-center'>";
                      echo "<a href='controller.php?action=view&id={$user['acct_id']}' class='btn btn-info btn-sm' style='margin: 2px;'><i class='fa fa-eye'></i></a>";
                      echo "<a href='" . rtrim(WEB_ROOT, '/') . "/modules/Users/index.php?view=edit&id={$user['acct_id']}' class='btn btn-warning btn-sm' style='margin: 2px;'><i class='fa fa-edit'></i></a>";
                      //echo "<a href='delete.php?id=" . urlencode($user['acct_id']) . "' class='btn btn-danger btn-sm' onclick=\"return confirm('Are you sure you want to delete this user?');\" style='margin: 2px;'><i class='fa fa-trash'></i></a>";
                      echo "</td>";
                      echo "</tr>";
                    }
                  } else {
                    echo "<tr><td colspan='8'>No users found.</td></tr>";
                  }
                  ?>
                </tbody>
              </table>
            </div><!-- /.table-responsive -->

            <br>
            <div class="pull-left">
              <a href="index.php?view=add" class="btn btn-success">
                <i class="ion ion-person-add"></i> Add New User
              </a>
            </div>

          <?php } ?>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section>

<!-- ✅ Responsive Table CSS for Card View -->
<style>
@media (max-width: 767px) {
  .table-responsive table thead {
    display: none;
  }
  .table-responsive table tbody tr {
    display: block;
    margin-bottom: 15px;
    border: 1px solid #dee2e6;
    border-radius: .5rem;
    background: #fff;
    padding: 10px;
    box-shadow: 0 2px 4px rgba(0,0,0,.05);
  }
  .table-responsive table tbody td {
    display: flex;
    justify-content: space-between;
    padding: .5rem;
    border: none;
    border-bottom: 1px solid #f1f1f1;
  }
  .table-responsive table tbody td:last-child {
    border-bottom: none;
  }
  .table-responsive table tbody td::before {
    content: attr(data-label);
    font-weight: 600;
    color: #495057;
  }
}
</style>
