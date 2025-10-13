<?php
require_once("../../includes/initialize.php");
$action = (isset($_GET['action']) && $_GET['action'] != '') ? $_GET['action'] : '';

switch ($action) {
	case 'add':
		doInsert();
		break;

	case 'addschd':
		doInsertsched();
		break;

	case 'editusers':
		editusers();
		break;


	case 'addstudentselected':
		doAddSelected();
		break;

	case 'delrecord':
		delrecord();
		break;

	case 'delete':
		doDelete();
		break;

	case 'deletesubject':
		doDeletesubject();
		break;

	case 'deleteenrolled':
		doDeleteenrolled();
		break;


	case 'editadmin':
		editadmin();
		break;


	case 'deleteabsent':
		doDeleteabsent();
		break;
}




function editadmin()
{

	if (isset($_POST['adminupdate'])) {

		$idnum = $_POST['idnum'];
		$fn = $_POST['fname'];
		$ln = $_POST['lname'];
		$mn = $_POST['mname'];
		$phone = $_POST['cont'];
		$username = $_POST['username'];
		$password = md5($_POST['password']);

		$dbhost = "localhost";
		$dbname = "rcmgdb";
		$dbusername = "root";
		$dbpassword = "";
		$conn = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbusername, $dbpassword);

		$query = $conn->prepare("UPDATE oic SET oic_lname = '$ln', oic_fname = '$fn', oic_mname = '$mn', contact = '$phone' WHERE oic_id = '$idnum'");
		$query->execute();

		$query = $conn->prepare("UPDATE accounts SET username = '$username', password = '$password' WHERE oic_id = '$idnum'");
		$query->execute();

		message("User information was successfully updated!", "success");
		redirect('index.php?view=edit&id=' . $_SESSION['oic_id']);
	}
}









function editusers()
{
	global $mydb;


	$emp_id = $_POST['id'];
	$fn = $_POST['fname'];
	$ln = $_POST['lname'];
	$mn = $_POST['mname'];
	$address = $_POST['address'];
	$contact = $_POST['contact'];
	$position = $_POST['position'];
	$imagefile = "";
	if ((!empty($_FILES["uploaded_file"])) && ($_FILES['uploaded_file']['error'] == 0)) {
		//Check if the file is JPEG image and it's size is less than 350Kb
		$filename = time() . '_' . basename($_FILES['uploaded_file']['name']);
		$newname = "uploads/" . $filename;
		if (move_uploaded_file($_FILES['uploaded_file']['tmp_name'], $newname)) {
			$imagefile = ",imagefile = '$filename'";
		}
	}

	$mydb->setQuery("UPDATE employee SET lname = '$ln', fname = '$fn', mname = '$mn', contact = '$contact', address = '$address', emp_position = '$position' $imagefile WHERE emp_id = '$emp_id'");
	$mydb->executeQuery();
	/*	$mydb->setQuery("UPDATE instructor SET instructfname = '$fn', instructlname = '$ln', instructmname = '$mn', instructgender = '$gender', instructphone = '$phone' WHERE instructid ='$idnum'");
*/
	message("Employee's information was successfully updated!", "success");
	redirect('index.php');
}






function doInsert()
{

	global $mydb;


	if (isset($_POST['save'])) {

		/*DATE SIGNED UP*/
		date_default_timezone_set('Asia/Manila');
		$signupdate = date("D M d, Y g:i a");
		/*END DATE*/


		error_reporting(1);

		//Include database connection details
		require_once("../../includes/initialize.php");
		$errmsg_arr = array();
		//Validation error flag
		$errflag = false;
		//Function to sanitize values received from the form. Prevents SQL injection
		function clean($str)
		{
			$str = @trim($str);
			if (get_magic_quotes_gpc()) {
				$str = stripslashes($str);
			}
			return mysql_real_escape_string($str);
		}

		//Sanitize the POST values


		$id = $mydb->escape_value($_POST['id']);
		$fname = $mydb->escape_value($_POST['fname']);
		$mname = $mydb->escape_value($_POST['mname']);
		$lname = $mydb->escape_value($_POST['lname']);
		$address = $mydb->escape_value($_POST['address']);
		$address = $mydb->escape_value($_POST['address']);
		$position = $mydb->escape_value($_POST['position']);
		$cont = $mydb->escape_value($_POST['contact']);
		$dhired = $signupdate;



		if ($_FILES['uploaded_file']['size'] >= 1048576 * 5) {
			$errmsg_arr[] = 'file selected exceeds 5MB size limit';
			$errflag = true;
		}

		//If there are input validations, redirect back to the registration form
		if ($errflag) {
			redirect('index.php?view=add');
			exit();
		}
		//upload random name/number
		$rd2 = mt_rand(1000, 9999) . "_File";

		//Check that we have a file
		if ((!empty($_FILES["uploaded_file"])) && ($_FILES['uploaded_file']['error'] == 0)) {
			//Check if the file is JPEG image and it's size is less than 350Kb
			$filename = time() . '_' . basename($_FILES['uploaded_file']['name']);

			$ext = substr($filename, strrpos($filename, '.') + 1);

			if (($ext != "exe") && ($_FILES["uploaded_file"]["type"] != "application/x-msdownload")) {
				//Determine the path to which we want to save this file      
				//$newname = dirname(__FILE__).'/upload/'.$filename;
				$newname = "uploads/" . $filename;
				//Check if the file with the same name is already exists on the server
				if (!file_exists($newname)) {
					//Attempt to move the uploaded file to it's new place
					if ((move_uploaded_file($_FILES['uploaded_file']['tmp_name'], $newname))) {
						//successful upload
						// echo "It's done! The file has been saved as: ".$newname;		  


						$result2 = $mydb->setQuery("INSERT INTO employee VALUES('$id', '$fname', '$mname', '$lname', '$address', '$position', '$cont', '$dhired', '$filename')");
						$result2 = $mydb->executeQuery();
						if ($result2) {
							//$errmsg_arr[] = 'Record was saved in the database and the file was uploaded';	 	
							message("Record was saved in the database and the file was uploaded!", "success");
							$errflag = true;
							if ($errflag) {
								$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
								redirect('index.php');
								exit();
							}
						} else {
							//$errmsg_arr[] = 'Record was not saved in the database but file was uploaded';

							$errflag = true;
							if ($errflag) {
								message("Record was not saved in the database but file was uploaded!", "info");
								redirect('index.php?view=add');
								exit();
							}
						}
					} else {
						//unsuccessful upload
						//echo "Error: A problem occurred during file upload!";
						//$errmsg_arr[] = 'upload of file ' .$filename. ' was unsuccessful';
						$errflag = true;
						if ($errflag) {
							//$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
							message("upload of file " . $filename . " was unsuccessful'!", "error");
							redirect('index.php?view=add');
							exit();
						}
					}
				} else {
					//existing upload
					// echo "Error: File ".$_FILES["uploaded_file"]["name"]." already exists";
					//$errmsg_arr[] = 'Error: File >>'.$_FILES["uploaded_file"]["name"].'<< already exists';
					$errflag = true;
					if ($errflag) {
						//$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
						message("Error: File " . $_FILES["uploaded_file"]["name"] . " already exists!", "error");
						redirect('index.php?view=add');
						exit();
					}
				}
			} else {
				//wrong file upload
				//echo "Error: Only .jpg images under 350Kb are accepted for upload";
				// $errmsg_arr[] = 'Error: All file types except .exe file under 5 Mb are not accepted for upload';
				$errflag = true;
				if ($errflag) {
					//$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
					message("Error: All file types less than 350kb are accepted, except .exe file!", "error");
					redirect('index.php?view=add');
					exit();
				}
			}
		} else {
			//no file to upload
			//echo "Error: No file uploaded";

			//$errmsg_arr[] = 'Error: No file uploaded';
			$errflag = true;
			if ($errflag) {
				//$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
				message("Error: No file uploaded!", "error");
				redirect('index.php?view=add');
				exit();
			}
		}


		mysql_close();
	} elseif (isset($_POST['saveandadd'])) {


		/*DATE SIGNED UP*/
		date_default_timezone_set('Asia/Manila');
		$signupdate = date("D M d, Y g:i a");
		/*END DATE*/


		error_reporting(0);

		//Include database connection details
		require_once("../../includes/initialize.php");
		$errmsg_arr = array();
		//Validation error flag
		$errflag = false;
		//Function to sanitize values received from the form. Prevents SQL injection
		function clean($str)
		{
			$str = @trim($str);
			if (get_magic_quotes_gpc()) {
				$str = stripslashes($str);
			}
			return mysql_real_escape_string($str);
		}

		//Sanitize the POST values


		$id = $mydb->escape_value($_POST['id']);
		$fname = $mydb->escape_value($_POST['fname']);
		$mname = $mydb->escape_value($_POST['mname']);
		$lname = $mydb->escape_value($_POST['lname']);
		$address = $mydb->escape_value($_POST['address']);
		$address = $mydb->escape_value($_POST['address']);
		$position = $mydb->escape_value($_POST['position']);
		$cont = $mydb->escape_value($_POST['contact']);
		$dhired = $signupdate;



		if ($_FILES['uploaded_file']['size'] >= 1048576 * 5) {
			$errmsg_arr[] = 'file selected exceeds 5MB size limit';
			$errflag = true;
		}

		//If there are input validations, redirect back to the registration form
		if ($errflag) {
			redirect('index.php?view=add');
			exit();
		}
		//upload random name/number
		$rd2 = mt_rand(1000, 9999) . "_File";

		//Check that we have a file
		if ((!empty($_FILES["uploaded_file"])) && ($_FILES['uploaded_file']['error'] == 0)) {
			//Check if the file is JPEG image and it's size is less than 350Kb
			$filename = time() . '_' . basename($_FILES['uploaded_file']['name']);

			$ext = substr($filename, strrpos($filename, '.') + 1);

			if (($ext != "exe") && ($_FILES["uploaded_file"]["type"] != "application/x-msdownload")) {
				//Determine the path to which we want to save this file      
				//$newname = dirname(__FILE__).'/upload/'.$filename;
				$newname = "uploads/" . $filename;
				//Check if the file with the same name is already exists on the server
				if (!file_exists($newname)) {
					//Attempt to move the uploaded file to it's new place
					if ((move_uploaded_file($_FILES['uploaded_file']['tmp_name'], $newname))) {
						//successful upload
						// echo "It's done! The file has been saved as: ".$newname;		  


						$result2 = $mydb->setQuery("INSERT INTO employee VALUES('$id', '$fname', '$mname', '$lname', '$address', '$position', '$cont', '$dhired', '$filename')");

						if ($result2) {
							//$errmsg_arr[] = 'Record was saved in the database and the file was uploaded';	 	
							message("Record was saved in the database and the file was uploaded!", "success");
							$errflag = true;
							if ($errflag) {
								$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
								redirect('index.php?view=add');
								exit();
							}
						} else {
							//$errmsg_arr[] = 'Record was not saved in the database but file was uploaded';

							$errflag = true;
							if ($errflag) {
								message("Record was not saved in the database but file was uploaded!", "info");
								redirect('index.php?view=add');
								exit();
							}
						}
					} else {
						//unsuccessful upload
						//echo "Error: A problem occurred during file upload!";
						//$errmsg_arr[] = 'upload of file ' .$filename. ' was unsuccessful';
						$errflag = true;
						if ($errflag) {
							//$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
							message("upload of file " . $filename . " was unsuccessful'!", "error");
							redirect('index.php?view=add');
							exit();
						}
					}
				} else {
					//existing upload
					// echo "Error: File ".$_FILES["uploaded_file"]["name"]." already exists";
					//$errmsg_arr[] = 'Error: File >>'.$_FILES["uploaded_file"]["name"].'<< already exists';
					$errflag = true;
					if ($errflag) {
						//$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
						message("Error: File " . $_FILES["uploaded_file"]["name"] . " already exists!", "error");
						redirect('index.php?view=add');
						exit();
					}
				}
			} else {
				//wrong file upload
				//echo "Error: Only .jpg images under 350Kb are accepted for upload";
				// $errmsg_arr[] = 'Error: All file types except .exe file under 5 Mb are not accepted for upload';
				$errflag = true;
				if ($errflag) {
					//$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
					message("Error: All file types less than 350kb are accepted, except .exe file!", "error");
					redirect('index.php?view=add');
					exit();
				}
			}
		} else {
			//no file to upload
			//echo "Error: No file uploaded";

			//$errmsg_arr[] = 'Error: No file uploaded';
			$errflag = true;
			if ($errflag) {
				//$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
				message("Error: No file uploaded!", "error");
				redirect('index.php?view=add');
				exit();
			}
		}


		mysql_close();
	}
}







function doInsertsched()
{
	global $mydb;

	if (isset($_POST['savesched'])) {

		if ($_POST['sub'] == "Select Subject" or $_POST['days'] == "Select Day" or $_POST['hours'] == "" or $_POST['yr'] == "Select Year & Section") {
			$messageStats = false;
			message("All field is required!", "error");
			redirect('index.php?view=addsched');
		} else {


			$instruct     = $_GET['ids'];
			$subt  		  = $_POST['sub'];
			$days   	  = $_POST['days'];
			$hours  	  = $_POST['hours'];
			$yr   		  = $_POST['yr'];





			$mydb->setQuery("INSERT INTO subschedule(subschedid,subtaughtid,day,hours,yearsection,instructid)VALUES('','$subt','$days','$hours','$yr','$instruct')");

			message("New schedule created successfully!", "success");
			redirect('index.php?view=viewsubjects&id=' . $instruct);
		}
	} elseif (isset($_POST['saveandnew'])) {

		if ($_POST['sub'] == "Select Subject" or $_POST['days'] == "Select Day" or $_POST['hours'] == "" or $_POST['yr'] == "Select Year & Section") {
			$messageStats = false;
			message("All field is required!", "error");
			redirect('index.php?view=addsched');
		} else {


			$instruct     = $_GET['ids'];
			$subt  		  = $_POST['sub'];
			$days   	  = $_POST['days'];
			$hours  	  = $_POST['hours'];
			$yr   		  = $_POST['yr'];





			$mydb->setQuery("INSERT INTO subschedule(subschedid,subtaughtid,day,hours,yearsection,instructid)VALUES('','$subt','$days','$hours','$yr','$instruct')");

			message("New schedule created successfully!", "success");
			redirect('index.php?view=addsched&id=' . $instruct);
		}
	}
}





function doEdit()
{
	global $mydb;
	if (isset($_POST['save'])) {

		if ($_POST['name'] == "" or $_POST['username'] == "" or $_POST['pass'] == "") {
			$messageStats = false;
			message("All field is required!", "error");
			redirect('index.php?view=add');
		} else {


			$user = new User();
			$acctid			= $_GET['id'];
			$acc_name		= $_POST['name'];
			$acc_username   = $_POST['username'];
			$acc_password 	= $_POST['pass'];
			$acc_type 		= $_POST['type'];


			$user->ACCOUNT_NAME = $acc_name;
			$user->ACCOUNT_USERNAME = $acc_username;
			$user->ACCOUNT_PASSWORD = sha1($acc_password);
			$user->ACCOUNT_TYPE = $acc_type;

			$user->update($acctid);
			message("New [" . $acc_name . "] created successfully!", "success");
			redirect('index.php');
		}
	}
}

function delrecord()
{

	global $mydb;
	$id = $_GET['tid'];

	/*NEW PDO QUERY*/

	$employee = new employee();
	$employee->delete($id);


	/*/NEW PDO QUERY*/

	message("Record has been successfully deleted!", "success");
	redirect('index.php');
}




function doDelete()
{
	global $mydb;

	@$id = $_POST['selector'];
	$key = count($id);
	//multi delete using checkbox as a selector

	if ($key > 0) {

		for ($i = 0; $i < $key; $i++) {

			/*		$mydb->setQuery("DELETE FROM oic WHERE oic_id = ($id[$i])");
 		$mydb->setQuery("DELETE FROM accounts WHERE oic_id = ($id[$i])");
 		$mydb->setQuery("DELETE FROM contacts WHERE oic_id = ($id[$i])");
*/

			/*NEW PDO QUERY*/
			$employee = new employee();
			$employee->delete($id[$i]);


			/*/NEW PDO QUERY*/
		}

		message("Record has been successfully deleted!", "success");
		redirect('index.php');
	} else {
		message("Please select records to be deleted!", "error");
		redirect('index.php');
	}
}





function doDeletesubject()
{
	global $mydb;

	@$id = $_POST['selector'];
	$key = count($id);
	//multi delete using checkbox as a selector


	$instruct = $_GET['instruct'];


	if ($key > 0) {

		for ($i = 0; $i < $key; $i++) {

			$mydb->setQuery("DELETE FROM subschedule WHERE subschedid = ($id[$i]) AND instructid = '$instruct'");
			//$mydb->setQuery("DELETE FROM enrolled WHERE instructid = ($id[$i])");

		}

		message("Schedule has been successfully deleted!", "success");
		redirect('index.php?view=viewsubjects&id=' . $instruct);
	} else {
		message("Please select records to be deleted!", "info");
		redirect('index.php?view=viewsubjects&id=' . $instruct);
	}
}







function doDeleteenrolled()
{
	global $mydb;

	@$id = $_POST['selector'];
	$key = count($id);
	//multi delete using checkbox as a selector


	$sched = $_GET['sched'];
	$instruct = $_GET['instruct'];

	if ($key > 0) {

		for ($i = 0; $i < $key; $i++) {

			$mydb->setQuery("DELETE FROM enrolled WHERE  subschedid = '$sched' and studid = ($id[$i])");
		}

		message("Enrolled students was successfully deleted!", "success");
		redirect('index.php?view=enrolled&xsub=' . $sched . '&xsid=' . $instruct);
	} else {
		message("Please select records to be deleted!", "info");
		redirect('index.php?view=enrolled&xsub=' . $sched . '&xsid=' . $instruct);
	}
}



function doAddSelected()
{
	global $mydb;

	@$id = $_POST['selector'];
	$key = count($id);
	//multi delete using checkbox as a selector


	$sched = $_GET['sched'];
	$instruct = $_GET['instruct'];

	if ($key > 0) {

		for ($i = 0; $i < $key; $i++) {

			$mydb->setQuery("INSERT INTO enrolled(studid, subschedid)VALUES('($id[$i])','$sched')");
		}

		message("Students was successfully added!", "success");
		redirect('index.php?view=enrolled&xsub=' . $sched . '&xsid=' . $instruct);
	} else {
		message("Please select records to be added!", "info");
		redirect('index.php?view=enrolled&xsub=' . $sched . '&xsid=' . $instruct);
	}
}







function doDeleteabsent()
{
	global $mydb;

	@$id = $_POST['selector'];
	$key = count($id);
	//multi delete using checkbox as a selector


	$studid = $_GET['studid'];
	$schedid = $_GET['schedid'];
	$studentid = $_GET['studentid'];
	$studnetn = $_GET['studnetn'];
	$instruct = $_GET['instruct'];

	//if($key > 0){

	for ($i = 0; $i < $key; $i++) {

		$mydb->setQuery("DELETE FROM absences WHERE studid = ($id[$i]) and subschedid = '$schedid'");
	}

	message("Students absent was successfully deleted!", "success");
	redirect('index.php?view=absent&sched=' . $sched . '&id=' . $studentid . '&fullname=' . $studnetn . '&instruct=' . $instruct);

	//}
	//else{
	//	message("Please select records to be deleted!","info");
	//	redirect('index.php?view=absent&sched='.$sched.'&id='.$studentid.'&fullname='.$studnetn.'&instruct='.$instruct);


	//}
}

<?php
include 'db.php';

if ($_POST['action'] == 'listVehicles') {
    $where = " WHERE 1=1 ";
    if (!empty($_POST['vehicle_no'])) $where .= " AND vehicle_no LIKE '%".$_POST['vehicle_no']."%'";
    if (!empty($_POST['make'])) $where .= " AND make LIKE '%".$_POST['make']."%'";
    if (!empty($_POST['fuelType'])) $where .= " AND fuelType='".$_POST['fuelType']."'";
    if (!empty($_POST['motFrom']) && !empty($_POST['motTo'])) 
        $where .= " AND motDueDate BETWEEN '".$_POST['motFrom']."' AND '".$_POST['motTo']."'";

    $sql = "SELECT * FROM vehicles $where ORDER BY id DESC";
    $result = $conn->query($sql);

    $data = [];
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    echo json_encode(["data" => $data]);
    exit;
}

if ($_GET['action'] == 'exportVehicles') {
    header("Content-Type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=vehicles_report.xls");

    $where = " WHERE 1=1 ";
    if (!empty($_GET['vehicle_no'])) $where .= " AND vehicle_no LIKE '%".$_GET['vehicle_no']."%'";
    if (!empty($_GET['make'])) $where .= " AND make LIKE '%".$_GET['make']."%'";
    if (!empty($_GET['fuelType'])) $where .= " AND fuelType='".$_GET['fuelType']."'";
    if (!empty($_GET['motFrom']) && !empty($_GET['motTo'])) 
        $where .= " AND motDueDate BETWEEN '".$_GET['motFrom']."' AND '".$_GET['motTo']."'";

    $sql = "SELECT * FROM vehicles $where ORDER BY id DESC";
    $result = $conn->query($sql);

    echo "ID\tVehicle No\tMake\tModel\tColour\tFuel\tYear\tMOT Due\tTax Due\n";
    while ($row = $result->fetch_assoc()) {
        echo "{$row['id']}\t{$row['vehicle_no']}\t{$row['make']}\t{$row['model']}\t{$row['colour']}\t{$row['fuelType']}\t{$row['yearOfManufacture']}\t{$row['motDueDate']}\t{$row['taxDueDate']}\n";
    }
    exit;
}
?>
