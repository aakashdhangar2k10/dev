
<?php
require_once("../../includes/initialize.php");
include('../../includes/db.php');

$view = (isset($_GET['view']) && $_GET['view'] != '') ? $_GET['view'] : '';
switch ($view) {
	case 'add' :
        $title="add";	
		$content='add_vehicle.php';				
		break;
	case 'add_van' :
        $title="Add Van Photos";			
		$content='add_van_photos.php';		
		break;
	case 'edit_van_photos' :
        $title="Add Van Photos";			
		$content='edit_van_photos.php';		
		break;
	case 'view_vahan' :
        $title="view_vahan";	
		$content='vehicle_view.php';		
		break;
	case 'inspection' :
        $title="inspection";	
		$content='inspection_form.php';		
		break;
	case 'edit_inspection_form' :
        $title="inspection";	
		$content='edit_inspection_form.php';		
		break;
	case "view_van_list" :
        $page_title="All Vehicles";	
        $title="All Vehicles";	
		$content='Vehiclelist.php';			
		break;
	case "vehicle_pdf" :
        $page_title="All Vehicles";	
        $title="vehicle_pdf";	
		$content='vehicle_pdf.php';						
		break;
	case "generate_vehicle_pdf" :
        $page_title="generate_vehicle_pdf";	
        $title="generate_vehicle_pdf";	
		$content='generate_vehicle_pdf.php';						
		break;
	case "print_vahan" :
        $page_title="print_vahan";	
        $title="All Vehicles";	
		$content='print_vahan_report.php';			
		break;
	default :
	    $title="list";	
		$content ='Vehiclelist.php';		
}
require_once '../../views/frontendTemplate.php';
?>
