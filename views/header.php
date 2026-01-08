 <?php
 include(SITE_ROOT . '/includes/db.php');

    // assuming these are already set at login
    $username = htmlspecialchars($_SESSION['username']);
    $branch_id = $_SESSION['branch_id'];
    $branch_name = $_SESSION['short_name'];
    $profile_picture = isset($_SESSION['imagename']) ? htmlspecialchars($_SESSION['imagename']) : "";
    $user_type = $_SESSION['type']; // Example: 'Administrator' or 'User'
    ?>
 <!-- Main Header -->
 <header class="main-header">
     <!-- LOGO -->
     <a href="#" class="logo">VSRS</a>

     <!-- Header Navbar: style can be found in header.less -->
     <nav class="navbar navbar-static-top" role="navigation">

         <!-- Sidebar toggle button-->
         <a href="#" class="sidebar-toggle " data-toggle="offcanvas" role="button">
             <span class="sr-only">Toggle navigation</span>
         </a>
         <!-- Navbar Right Menu -->
         <div class="navbar-custom-menu">
             <ul class="nav navbar-nav">

                 <!-- Tasks: style can be found in dropdown.less -->
                 <li class="dropdown tasks-menu">
                     <?php if ($user_type === 'Administrator'): ?>
                         <!-- Dropdown for Administrators -->
                         <a href="#" class="dropdown-toggle btn-warning text-white font-weight-bold" data-toggle="dropdown">
                             <?php echo "Branch : $branch_name"; ?>
                         </a>
                         <!-- <ul class="dropdown-menu">
                             <li class="header btn-warning text-white text-center font-weight-bold">Branches</li>
                             <li>
                                 <ul class="menu">
                                     <li><a href="#"><h3>Branch 1</h3></a></li>
                                     <li><a href="#"><h3>Branch 2</h3></a></li>
                                 </ul>
                             </li>
                             <li class="footer text-center">
                                 <a href="<?php echo WEB_ROOT; ?>modules/branches/index.php?view=list">
                                     <h5>View All</h5>
                                 </a>
                             </li>
                         </ul> -->
                     <?php else: ?>
                         <!-- Plain text for non-administrators -->
                         <a href="javascript:void(0);" class="btn-warning text-white font-weight-bold">
                             <?php echo "Branch : $branch_name"; ?>
                         </a>
                     <?php endif; ?>
                 </li>

                 <!-- User Account: style can be found in dropdown.less -->
                 <li class="dropdown user user-menu">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                         <img src="<?php echo WEB_ROOT . 'modules/Users/uploads/' . $profile_picture; ?>" class="user-image" alt="User Image">
                         <span class="hidden-xs"><?php echo $username; ?></span>
                     </a>
                     <ul class="dropdown-menu">
                         <li class="user-header">
                             <img src="<?php echo WEB_ROOT . 'modules/Users/uploads/' . $profile_picture; ?>" class="img-circle" alt="User Image">
                             <p><?php echo $username; ?></p>
                         </li>

                         <!-- Menu Footer-->
                         <li class="user-footer">
                             <div class="pull-left">
                                 <a href="<?php echo WEB_ROOT; ?>modules/Users/index.php?view=profile" class="btn btn-default btn-flat">Profile</a>
                             </div>
                             <div class="pull-right">
                                 <a href="<?php echo WEB_ROOT; ?>includes/logout.php" class="btn btn-default btn-flat">Logout <i class="glyphicon glyphicon-log-out"></i> </a>
                             </div>
                         </li>
                     </ul>
                 </li>
             </ul>
         </div>
     </nav>
 </header>