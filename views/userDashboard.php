<?php
include('includes/initialize.php');
// include('db.php');
//login confirmation
confirm_logged_in();

?>



<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Dashboard
        <small>Control Panel</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">Dashboard</li>
    </ol>
</section>
<br>


<!-- UPDATE ACCOUNTS TO ONLINE -->

<?php
// echo "SELECT oic_id FROM accounts WHERE acct_id = '$_SESSION[acct_id]'";
// $user = $conn->prepare("SELECT oic_id FROM accounts WHERE acct_id = '$_SESSION[acct_id]'")->execute();
// $res =  $user->fetch();

// $stmt = $conn->prepare("UPDATE accounts SET status = 'Online' WHERE oic_id = '$_SESSION[oic_id]'");
// $stmt->execute();

?>
<!-- END UPDATE -->


<!-------------------------------- Small boxe1 (Start box) ------------------->
<div class="row">
    <div class="col-lg-6 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-aqua">
            <div class="inner">

                <?php
                $assigned_staff = $_SESSION['acct_id']; // assigned staff from session
                $branch_id = $_SESSION['branch_id']; 
                $total_van = $conn->prepare("SELECT COUNT(id) FROM vehicle_details_tbl WHERE assigned_staff = ? AND is_deleted = 0");
                $total_van->execute([$assigned_staff]);
                $count = $total_van->fetchColumn();
                echo '<h3>' . $count . '</h3>';

                ?>
                <p>Total Van</p>
            </div>
            <div class="icon">
                <!-- <img src="<?php echo WEB_ROOT; ?>plugins/icon/hierarchy.png" alt="" srcset=""> -->
                <!-- <i class="ion-android-mail"></i> -->
                <i class="fa fa-car"></i>

            </div>
            <a href="<?php echo WEB_ROOT; ?>modules/Vehicle/index.php?view=view_van_list" class="small-box-footer">View More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
    </div><!-- ./col -->


    <!-------------------------------- Small boxe2 (Start box) ------------------->
    <!-- <div class="col-lg-3 col-xs-6"> -->
        <!-- small box -->
        <!-- <div class="small-box bg-yellow"> -->
            <!-- <div class="inner"> -->

                <?php
                // $assigned_staff = $_SESSION['acct_id']; // assigned staff from session
                // $total_van = $conn->prepare("SELECT COUNT(id) FROM vehicle_details_tbl WHERE branch_id = ? AND assigned_staff = ?");
                // $total_van->execute([$branch_id, $assigned_staff]);
                // $count = $total_van->fetchColumn();
                //  echo '<h3>' . $count . '</h3>';
                ?>

                <!-- <p>Assign Van</p> -->
            <!-- </div> -->
            <!-- <div class="icon"> -->
                <!-- <img src="<?php echo WEB_ROOT; ?>plugins/icon/lamp-post.png" alt="" srcset=""> -->
                <!-- <i class="ion ion-android-create"></i> -->
            <!-- </div> -->
            <!-- <a href="<?php echo WEB_ROOT; ?>modules/Vehicle/index.php?view=view_van_list" class="small-box-footer">View More info <i class="fa fa-arrow-circle-right"></i></a> -->
        <!-- </div> -->
    <!-- </div> -->
    <!-- ./col -->

    <!-------------------------------- Small boxe3 (Start box) ------------------->
    <!-- <div class="col-lg-3 col-xs-6"> -->
        <!-- small box -->
        <!-- <div class="small-box bg-green">
            <div class="inner">

                <?php
                // $emp = $conn->query('SELECT COUNT(emp_id) FROM employee')->fetchColumn();
                // echo '<h3>' . $emp . '</h3>';
                ?>
                <p>Pending Services</p>
            </div>
            <div class="icon"> -->
                <!-- <img src="<?php echo WEB_ROOT; ?>plugins/icon/brake.png" alt="" srcset=""> -->
                <!-- <i class="ion ion-android-person"></i> -->
                <!-- <i class="glyphicon glyphicon-wrench"></i> -->

            <!-- </div> -->
            <!-- <a href="<?php echo WEB_ROOT; ?>modules/Vehicle/index.php?view=view_van_list" class="small-box-footer">View More info <i class="fa fa-arrow-circle-right"></i></a> -->
        <!-- </div> -->
    <!-- </div> -->
    <!-- ./col -->

    <!-------------------------------- Small boxe4 (Start box) ------------------->
    <!-- <div class="col-lg-3 col-xs-6"> -->
        <!-- small box -->
        <!-- <div class="small-box bg-red"> -->
            <!-- <div class="inner"> -->
                <?php
                // $random = $conn->query('SELECT COUNT(id) FROM random')->fetchColumn();
                // echo '<h3>' . $random . '</h3>';
                // echo '<h3>2</h3>';
                ?>
                <!-- <p>Finished Requests</p> -->
            <!-- </div> -->
            <!-- <div class="icon"> -->
                <!-- <img src="<?php echo WEB_ROOT; ?>plugins/icon/alert.png" alt="" srcset=""> -->
                <!-- <i class="glyphicon glyphicon-ok-circle"></i> -->
            <!-- </div> -->
            <!-- <a href="<?php echo WEB_ROOT; ?>modules/Vehicle/index.php?view=view_van_list" class="small-box-footer">View More info <i class="fa fa-arrow-circle-right"></i></a> -->
        <!-- </div> -->


    <!-- </div> -->
    <!-- ./col -->

</div><!-- /.row -->

<div class="col-12">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">Info</h3>
        </div>
        <div class="box-body">
            <div class="d-flex justify-content-center">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="newVanInput">Add New Van</label>
                        <div class="input-group">
                            <input type="text" id="newVanInput" class="form-control text-uppercase" placeholder="Enter Vehicle No.">
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-primary" onclick="openVanPage()">
                                    <i class="fa fa-download"></i> Get Details
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function openVanPage() {
        const input = document.getElementById('newVanInput').value.trim();
        if (!input) {
            alert('Please enter the vehicle number.');
            return;
        }
        const baseUrl = '<?php echo WEB_ROOT; ?>modules/Vehicle/index.php?view=add';
        const url = baseUrl + '&vehicle_no=' + encodeURIComponent(input);
        window.location.href = url;
    }
</script>