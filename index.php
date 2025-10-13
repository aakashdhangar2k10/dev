<?php
require_once("includes/initialize.php");
include('includes/db.php');

$view = (isset($_GET['page']) && $_GET['page'] != '') ? $_GET['page'] : '';

switch ($view) {
    case '1':
        $title = "Home";

        // Role-based home page
        if (isset($_SESSION['type']) && $_SESSION['type'] === 'Administrator') {
            $content = 'home.php';        // Administrator home
        } else {
            $content = 'userDashboard.php';    // Non-Administrator home
        }
        break;

    default:
        // Default page also role-based
        if (isset($_SESSION['type']) && $_SESSION['type'] === 'Administrator') {
            $title = "Home";
            $content = 'home.php';
        } else {
            $title = "Home";
            $content = 'userDashboard.php';
        }
        break;
}

require_once 'views/frontendTemplate.php';
?>
