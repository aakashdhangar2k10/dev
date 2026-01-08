
<?php
require_once("../../includes/initialize.php");
include('../../db.php');

$view = (isset($_GET['view']) && $_GET['view'] != '') ? $_GET['view'] : '';
switch ($view) {
 
	case '1' :
        $title="contact";	
		$content='contact.php';			
		break;
		case 'add' :
        $title="List of Contacts";	
		$content='users.php';			
		break;
				case 'text' :
        $title="Text";	
		$content='text.php';			
		break;
				case 'textall' :
        $title="Text All";	
		$content='textall.php';			
		break;
				case 'chat' :
        $title="Chat";	
		$content='chat.php';			
		break;
	default :
	    $title="contact";	
		$content ='contact.php';		
}
require_once '../../theme/frontendTemplate.php';
?>
