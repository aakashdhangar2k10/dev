<?php

include(SITE_ROOT . '/includes/db.php');

//login confirmation
confirm_logged_in();
$sql = "SELECT screenlock FROM accounts WHERE acct_id = '$_SESSION[acct_id]'";
$gid = $conn->query($sql);
$gid->execute();
$row = $gid->fetch(PDO::FETCH_ASSOC);
$screenstat = $row['screenlock'];


if ($screenstat == 'OFF') {

  if (isset($_GET['logout'])) {

    /*********************SELECT LAST INSERT ID*****************************/
    $sql = "SELECT oic_id FROM accounts WHERE acct_id = '$_SESSION[acct_id]'";
    $gid = $conn->query($sql);
    $gid->execute();
    $row = $gid->fetch(PDO::FETCH_ASSOC);
    $oic_id = $row['oic_id'];
    /*******************END***********************************************/
    unset($_SESSION['index.php']);
    session_destroy();
?>
    <script type="text/javascript">
      window.location = "<?php echo WEB_ROOT; ?>login.php";
    </script>
  <?php
    // header("Location: login.php");//redirecting to login form when session is destroyed
    exit;
  }
  ?>

  <?php
  
  ?>

  <style>
    #uprall {
      text-transform: uppercase;
    }

    #upr {
      text-transform: capitalize;
    }
  </style>

  <!DOCTYPE html>
  <html data-ng-app="">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Van Stock And Rediness System</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT; ?>bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT; ?>css/font-awesome-4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT; ?>css/ionicons-2.0.1/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT; ?>plugins/datatables/dataTables.bootstrap.css">
    <!-- fullCalendar 2.2.5-->
    <link rel="stylesheet" href="<?php echo WEB_ROOT; ?>plugins/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="<?php echo WEB_ROOT; ?>plugins/fullcalendar/fullcalendar.print.css" media="print">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo WEB_ROOT; ?>dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="<?php echo WEB_ROOT; ?>dist/css/skins/skin-blue.min.css">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!-- [if lt IE 9]> -->
    <!-- <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <!-- <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> -->
    <!-- [endif] -->
    <!-- <link rel="shortcut icon" href="<?php echo WEB_ROOT; ?>images/" type="image/x-icon" />   -->
    <!-- <link rel="shortcut icon" href="<?php echo WEB_ROOT; ?>images/" type="image/x-icon" /> -->

    <style>
      .active-branch h3 {
        color: #007bff;
        /* Blue highlight */
        font-weight: bold;
      }
    </style>

  </head>

  <!--  <body class="hold-transition skin-blue sidebar-mini"> -->

  <body class="fixed skin-blue  sidebar-mini ">
    <div class="wrapper">

      <?php
      include_once 'header.php';
      ?>

      <!------------------------- Left side column. contains the logo and sidebar --------------------------------->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel (optional) -->
          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <!-- Optionally, you can add icons to the links -->
            <li id="dashboard">
              <a href="<?php echo WEB_ROOT; ?>index.php">
                <i class="fa fa-dashboard"></i> <span> Dashboard</span>
              </a>
            </li>

            <li class="treeview">
              <a href="#"><i class="fa fa-taxi"></i> <span>Service Requests</span> <i class="fa fa-angle-left pull-right"></i></a>

              <ul class="treeview-menu">
                <li><a href="<?php echo WEB_ROOT; ?>modules/Vehicle/index.php?view=add"><i class="fa fa-plus text-aqua"></i> Add New Van </a></li>
                <li><a href="<?php echo WEB_ROOT; ?>modules/Vehicle/index.php?view=add_van"><i class="fa fa-plus text-aqua"></i> Add Van Photos </a></li>
                <li><a href="<?php echo WEB_ROOT; ?>modules/Vehicle/index.php?view=inspection"><i class="fa fa-plus text-aqua"></i> Add inspection </a></li>
                <li><a href="<?php echo WEB_ROOT; ?>modules/Vehicle/index.php?view=view_van_list"><i class="fa fa-search text-aqua"></i> View Van List</a></li>
              </ul>
            </li>
            </a>
            </li>
            <?php if ($_SESSION['type'] == 'Administrator') { ?>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-file"></i>
                <span>Report</span>
              </a>
              <ul class="treeview-menu">
                <li><a href="<?php echo WEB_ROOT; ?>modules/report/index.php"><i class="fa fa-search text-aqua"></i> View Report</a></li>
              </ul>
            </li>
             <?php } ?>

            <!--////////////////////////// Settings //////////////////////////////////////////-->

            <?php if ($_SESSION['type'] == 'Administrator') { ?>
              <li class="header">Settings</li>
              <li class="treeview">
                <a href="#">
                  <i class="ion ion-person-stalker"> </i>
                  <span>Users</span><i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="<?php echo WEB_ROOT; ?>modules/Users/index.php?view=add"><i class="fa fa-plus text-aqua"></i> Add New Users</a></li>
                  <li><a href="<?php echo WEB_ROOT; ?>modules/Users/index.php?view=list"><i class="fa fa-search text-aqua"></i> View Users List</a></li>
                </ul>
              </li>

            <?php } ?>
            <?php if ($_SESSION['type'] == 'Administrator') { ?>
              <li class="treeview">
                <a href="#"><i class="fa fa-sitemap"></i> <span>Branch </span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                  <!-- <li><a href="<?php echo WEB_ROOT; ?>modules/branches/index.php?view=add"><i class="fa fa-plus text-aqua"></i> Add New Branch</a></li> -->
                  <li><a href="<?php echo WEB_ROOT; ?>modules/branches/index.php?view=list"><i class="fa fa-search text-aqua"></i> View Branchs List</a></li>

                </ul>
              </li>

            <?php } ?>

          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>





      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">

        <!-- Main content -->
        <section class="content">
          <?php check_message(); ?>
          <?php
          require_once $content;
          ?>

          <!-- Your Page Content Here -->

          <!--End Your Page Content Here -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

    
      <!-- REQUIRED JS SCRIPTS -->

      <!-- jQuery 2.1.4 -->
      <script src="<?php echo WEB_ROOT; ?>plugins/jQuery/jQuery-2.1.4.min.js"></script>
      <!-- Bootstrap 3.3.5 -->
      <script src="<?php echo WEB_ROOT; ?>bootstrap/js/bootstrap.min.js"></script>
      <!-- DataTables -->
      <script src="<?php echo WEB_ROOT; ?>plugins/datatables/jquery.dataTables.min.js"></script>
      <script src="<?php echo WEB_ROOT; ?>plugins/datatables/dataTables.bootstrap.min.js"></script>
      <!-- SlimScroll -->
      <script src="<?php echo WEB_ROOT; ?>plugins/slimScroll/jquery.slimscroll.min.js"></script>
      <!-- FastClick -->
      <script src="<?php echo WEB_ROOT; ?>plugins/fastclick/fastclick.min.js"></script>
      <!-- AdminLTE App -->
      <script src="<?php echo WEB_ROOT; ?>dist/js/app.min.js"></script>
      <!-- AdminLTE for demo purposes -->
      <script src="<?php echo WEB_ROOT; ?>dist/js/demo.js"></script>
      <!-- fullCalendar 2.2.5 -->
      <script src="<?php echo WEB_ROOT; ?>js/moment.min.js"></script>
      <script src="<?php echo WEB_ROOT; ?>plugins/fullcalendar/fullcalendar.min.js"></script>
      <!-- page script -->

  </body>

  </html>
<?php


} else {

  redirect('modules/lockscreen/lockscreen.php');
}

?>
<?php
include_once 'footer.php';
?>