
<?php
require_once("../../includes/initialize.php");
include('../../includes/db.php');
 
$view = (isset($_GET['view']) && $_GET['view'] != '') ? $_GET['view'] : '';
switch ($view) {
	case 'add' :
        $title="add";	
		$content='add.php';		
		break;
	case 'sendmessage' :
        $title="sendmessage";	
		$content='../Messaging/index.php';		
		break;
	case 'edit' :
        $title="edit";	
		$content='edit.php';		
		break;
	case 'view' :
        $title="view";	
		$content='view.php';		
		break;
	case 'profile' :
        $title="Profile";	
		$content='profile.php';		
		break;
	case 'list' :
        $title="list";	
		$content='list.php';			
		break;
	// default :
	//     $title="list";	
	// 	$content ='list.php';		
}
require_once '../../views/frontendTemplate.php';
?>
