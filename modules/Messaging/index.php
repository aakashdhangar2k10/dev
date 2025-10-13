
<?php
require_once("../../includes/initialize.php");
include('../../db.php');

$view = (isset($_GET['view']) && $_GET['view'] != '') ? $_GET['view'] : '';
switch ($view) {
 
	case '1' :
        $title="list";	
		$content='list.php';			
		break;
	default :
	    $title="list";	
		$content ='list.php';		
}
require_once '../../theme/frontendTemplate.php';
?>
