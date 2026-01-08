
<?php
require_once("../../includes/initialize.php");
include('../../includes/db.php');
 
$view = (isset($_GET['view']) && $_GET['view'] != '') ? $_GET['view'] : '';
switch ($view) {
	case 'add' :
        $title="add";	
		$content='add_branch.php';		
		break;
	case 'branch_view' :
        $title="branch";	
		$content='branch_view.php';		
		break;
	case 'branch_edit' :
        $title="edit";	
		$content='branch_edit.php';		
		break;
	case 'list' :
        $title="list";	
		$content='branches_list.php';			
		break;
	// default :
	//     $title="list";	
	// 	$content ='list.php';		
}
require_once '../../views/frontendTemplate.php';
?>
