<?php
include('../../includes/db.php'); // DB connection

// Get branch_id from GET parameter and validate it
$branch_id = isset($_GET['id']) ? (int)$_GET['id'] : null;

if (!$branch_id) {
    die("<div class='alert alert-danger'>Invalid Branch ID.</div>");
}

try {
    // Prepare and execute the query securely
    $sql = "SELECT * FROM branches_tbl WHERE id = :id LIMIT 1";
    $stmt = $conn->prepare($sql);
    $stmt->execute([':id' => $branch_id]);
    $branch = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$branch) {
        die("<div class='alert alert-warning'>Branch not found.</div>");
    }
} catch (PDOException $e) {
    die("Error: " . htmlspecialchars($e->getMessage()));
}
?>

<!-- Content Header -->
<section class="content-header">
  <h1>Branches Information</h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Branch Information</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title"><?php echo htmlspecialchars($branch['full_name']); ?> Information</h3>
          <a href="index.php?view=list" class="btn btn-primary btn-sm pull-right">
            <i class="fa fa-arrow-left"></i> Back
          </a>
        </div>
        <div class="box-body row">
          <div class="col-sm-8">
            <table class="table table-bordered table-striped">
              <tbody>
                <tr><th>Short Name</th><td><?php echo htmlspecialchars($branch['short_name']); ?></td></tr>
                <tr><th>Full Name</th><td><?php echo htmlspecialchars($branch['full_name']); ?></td></tr>
                <tr><th>Address</th><td><?php echo htmlspecialchars($branch['address']); ?></td></tr>
                <tr><th>Pin Code</th><td><?php echo htmlspecialchars($branch['pincode']); ?></td></tr>
                <tr><th>Code</th><td><?php echo htmlspecialchars($branch['code']); ?></td></tr>
                <tr><th>Year</th><td><?php echo htmlspecialchars($branch['year_established']); ?></td></tr>
              </tbody>
            </table>
          </div>
          <div class="col-sm-4">
            <img src="<?php echo htmlspecialchars($branch['logo']); ?>" 
                 class="img-responsive img-thumbnail" 
                 style="max-height:300px;" 
                 alt="<?php echo htmlspecialchars($branch['full_name']); ?>" />
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
