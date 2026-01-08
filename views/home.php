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

<!-- END UPDATE -->


<!-------------------------------- Small boxe1 (Start box) ------------------->
<div class="row">
  <div class="col-lg-6 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-aqua">
      <div class="inner">

        <?php
        $total_van = $conn->query('SELECT COUNT(id) FROM vehicle_details_tbl')->fetchColumn();
        echo '<h3>' . $total_van . '</h3>';
        ?>
        <p>Total Van</p>
      </div>
      <div class="icon">
        <i class="fa fa-car"></i>
      </div>
      <a href="<?php echo WEB_ROOT; ?>modules/Vehicle/index.php?view=view_van_list" class="small-box-footer">View More info <i class="fa fa-arrow-circle-right"></i></a>
    </div>
  </div><!-- ./col -->


  <!-------------------------------- Small boxe2 (Start box) ------------------->
  <div class="col-lg-6 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-yellow">
      <div class="inner">

        <?php
        $total_staff = $conn->query('SELECT COUNT(acct_id) FROM accounts')->fetchColumn();
        echo '<h3>' . $total_staff . '</h3>';
        ?>
        <p>Staff</p>
      </div>
      <div class="icon">
        <i class="glyphicon glyphicon-user"></i>
      </div>
      <a href="<?php echo WEB_ROOT; ?>modules/Users/index.php?view=list" class="small-box-footer">View More info <i class="fa fa-arrow-circle-right"></i></a>
    </div>
  </div><!-- ./col -->






  <!-------------------------------- Small boxe3 (Start box) ------------------->
  <!-- <div class="col-lg-3 col-xs-6"> -->
    <!-- small box -->
    <!-- <div class="small-box bg-green"> -->
      <!-- <div class="inner"> -->

        <?php
        // $emp = $conn->query('SELECT COUNT(emp_id) FROM employee')->fetchColumn();
        // echo '<h3>' . $emp . '</h3>';
        ?>
        <!-- <p>Services</p> -->
      <!-- </div> -->
      <!-- <div class="icon"> -->
        <!-- <img src="<?php echo WEB_ROOT; ?>plugins/icon/brake.png" alt="" srcset=""> -->
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
        <!-- <p>Finished Requests</p>
      </div>
      <div class="icon"> -->
        <!-- <img src="<?php echo WEB_ROOT; ?>plugins/icon/alert.png" alt="" srcset=""> -->
        <!-- <i class="glyphicon glyphicon-ok-circle"></i> -->


      <!-- </div> -->
      <!-- <a href="#" class="small-box-footer">View More info <i class="fa fa-arrow-circle-right"></i></a> -->
    <!-- </div> -->
  <!-- </div> -->
  <!-- ./col -->
</div><!-- /.row -->