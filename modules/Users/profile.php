<?php
// session_start();
include('../../includes/db.php'); // Database connection file

// Check if user is logged in
if (!isset($_SESSION['acct_id'])) {
    header('Location: login.php');
    exit;
}

$user_id = $_SESSION['acct_id'];

try {
    // Fetch user details from database safely
    $stmt = $conn->prepare("SELECT * FROM accounts WHERE acct_id = :id LIMIT 1");
    $stmt->execute([':id' => $user_id]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user) {
        die("User not found!");
    }
} catch (PDOException $e) {
    die("Error: " . htmlspecialchars($e->getMessage()));
}
?>

<section class="content-header">
    <h1>Profile <small></small></h1>
    <ol class="breadcrumb">
        <li><a href="dashboard.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Profile</li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <div class="col-md-3">
            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">
                    <img class="profile-user-img img-responsive img-circle" style="width: 150px; height: 150px;"
                        src="./uploads/<?php echo htmlspecialchars($user['imagename'] ?: 'default.png'); ?>"
                        alt="User profile picture">
                    <h3 class="profile-username text-center"><?php echo htmlspecialchars($user['fname'] . ' ' . $user['lname']); ?></h3>
                    <p class="text-muted text-center"><?php echo htmlspecialchars($user['type']); ?></p>
                </div>
            </div>
        </div>

        <div class="col-md-9">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#profileview" data-toggle="tab">View</a></li>
                </ul>
                <div class="tab-content">
                    <!-- View Tab -->
                    <div class="active tab-pane" id="profileview">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">About Me</h3>
                            </div>
                            <div class="box-body">
                                <strong><i class="fa fa-user margin-r-5"></i> Name</strong>
                                <p><?php echo htmlspecialchars($user['fname']); ?></p>
                                <hr>
                                <strong><i class="fa fa-user margin-r-5"></i> Username</strong>
                                <p><?php echo htmlspecialchars($user['username']); ?></p>
                                <!-- <strong><i class="fa fa-envelope margin-r-5"></i> Email</strong> -->
                                <!-- <p class="text-muted"><?php echo htmlspecialchars($user['email']); ?></p> -->
                                <hr>
                                <strong><i class="fa fa-phone margin-r-5"></i> Contact</strong>
                                <p class="text-muted"><?php echo htmlspecialchars($user['contact_no']); ?></p>
                                <hr>
                            </div>
                        </div>
                    </div>

                    <!-- Edit Tab -->
                    <div class="tab-pane" id="profileedit">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Update Profile</h3>
                            </div>
                            <div style="padding: 20px;">
                                <form name="edit_profile" id="edit_profile" class="form-horizontal" method="post" action="profile-update.php">
                                    <input type="hidden" name="id" value="<?php echo htmlspecialchars($user['id']); ?>">

                                    <div class="form-group">
                                        <label for="firstname" class="col-sm-2 control-label">First Name</label>
                                        <div class="col-sm-10">
                                            <input name="firstname" id="firstname" type="text" class="form-control" placeholder="First Name"
                                                value="<?php echo htmlspecialchars($user['first_name']); ?>">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="lastname" class="col-sm-2 control-label">Last Name</label>
                                        <div class="col-sm-10">
                                            <input name="lastname" id="lastname" type="text" class="form-control" placeholder="Last Name"
                                                value="<?php echo htmlspecialchars($user['last_name']); ?>">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="username" class="col-sm-2 control-label">Username</label>
                                        <div class="col-sm-10">
                                            <input name="username" id="username" type="text" class="form-control" placeholder="User name"
                                                value="<?php echo htmlspecialchars($user['username']); ?>">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 control-label">Email</label>
                                        <div class="col-sm-10">
                                            <input name="email" id="email" type="email" class="form-control" placeholder="Email"
                                                value="<?php echo htmlspecialchars($user['email']); ?>">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-info">Update</button>
                                            <a href="#profileview" data-toggle="tab" class="btn btn-danger">Cancel</a>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div><!-- /.tab-pane -->
                </div>
            </div>
        </div><!-- /.col -->
    </div><!-- /.row -->
</section>