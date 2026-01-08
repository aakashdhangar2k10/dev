
<?php
require_once("../../includes/initialize.php");
// include('../../db.php');
 
$view = (isset($_GET['view']) && $_GET['view'] != '') ? $_GET['view'] : '';
switch ($view) {
	case 'add' :
        $title="add";	
		$content='report_pdf.php';		
		break;
	case 'sendmessage' :
        $title="sendmessage";	
		$content='../Messaging/index.php';		
		break;
	case 'changepf' :
        $title="changepf";	
		$content='changepf.php';		
		break;
	case 'edit' :
        $title="edit";	
		$content='edit.php';		
		break;
	case 'edituser' :
        $title="edit";	
		$content='edituser/edit.php';		
		break;
	case '1' :
        $title="list";	
		$content='list.php';			
		break;
	default :
	    $title="list";	
		$content ='list.php';		
}
require_once '../../views/frontendTemplate.php';
?>
