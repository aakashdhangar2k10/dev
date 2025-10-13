<?php
include('../../includes/db.php');

// Get branch_id from GET parameter and validate it
$branch_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($branch_id <= 0) {
    die("<div class='alert alert-danger'>Invalid Branch ID.</div>");
}

try {
    // Secure query with placeholder
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

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>Edit Branch Information</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="index.php?view=list">Branch List</a></li>
        <li class="active">Edit Branch</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Edit Branch</h3>
                    <a href="index.php?view=list" class="btn btn-primary btn-sm pull-right">
                        <i class="fa fa-arrow-left"></i> Back
                    </a>
                </div><!-- /.box-header -->

                <div class="box-body row">
                    <div class="col-sm-8">
                        <form action="controller.php?action=edit_branch" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="<?php echo htmlspecialchars($branch['id']); ?>">

                            <table class="table table-bordered table-striped">
                                <tbody>
                                    <tr>
                                        <th>Short Name</th>
                                        <td>
                                            <input type="text" name="short_name" class="form-control"
                                                value="<?php echo htmlspecialchars($branch['short_name']); ?>" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Full Name</th>
                                        <td>
                                            <input type="text" name="full_name" class="form-control"
                                                value="<?php echo htmlspecialchars($branch['full_name']); ?>" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Address</th>
                                        <td>
                                            <textarea name="address" class="form-control" required><?php echo htmlspecialchars($branch['address']); ?></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Pin Code</th>
                                        <td>
                                            <input type="text" name="pincode" class="form-control"
                                                value="<?php echo htmlspecialchars($branch['pincode']); ?>" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Code</th>
                                        <td>
                                            <input type="text" name="code" class="form-control"
                                                value="<?php echo htmlspecialchars($branch['code']); ?>" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Year</th>
                                        <td>
                                            <input type="number" name="year" class="form-control"
                                                value="<?php echo htmlspecialchars($branch['year_established']); ?>" required>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                    </div>

                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>Branch Logo</label><br>
                            <?php if (!empty($branch['logo'])): ?>
                                <img src="<?php echo htmlspecialchars($branch['logo']); ?>" class="img-responsive img-thumbnail" style="max-height:150px;" alt="Branch Logo"><br><br>
                            <?php else: ?>
                                <p>No Logo Available</p>
                            <?php endif; ?>
                            <input type="file" name="branch_logo" class="form-control">
                            <small>Leave blank if you don't want to change the logo.</small>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <button type="submit" name="save" class="btn btn-success">Update Branch</button>
                    </div>

                    </form>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->
