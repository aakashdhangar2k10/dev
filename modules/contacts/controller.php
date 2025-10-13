<?php 
require_once ("../../includes/initialize.php");
$action = (isset($_GET['action']) && $_GET['action'] != '') ? $_GET['action'] : '';

switch ($action) {
	case 'add' :
	doInsert();
	break;

	case 'addschd' :
	doInsertsched();
	break;
	
	case 'edit' :
	doEdit();
	break;


	case 'addstudentselected' :
	doAddSelected();
	break;

	case 'delrecord' :
	delrecord();
	break;
	
	case 'delete' :
	doDelete();
	break;

	case 'deletesubject' :
	doDeletesubject();
	break;

	case 'deleteenrolled' :
	doDeleteenrolled();
	break;


	case 'editadmin' :
	editadmin();
	break;


	case 'deleteabsent' :
	doDeleteabsent();
	break;
	}




function editadmin(){

if(isset($_POST['update'])){

	$idnum = $_POST['idnum'];
	$fn = $_POST['fname'];
	$ln = $_POST['lname'];
	$mn = $_POST['mname'];
	$phone = $_POST['cont'];
	$username = $_POST['username'];
	$password = md5($_POST['password']);



	mysql_query("UPDATE oic SET oic_lname = '$ln', oic_fname = '$fn', oic_mname = '$mn', contact = '$phone' WHERE oic_id = '$idnum'");
	mysql_query("UPDATE accounts SET username = '$username', password = '$password' WHERE oic_id = '$idnum'");

/*	mysql_query("UPDATE instructor SET instructfname = '$fn', instructlname = '$ln', instructmname = '$mn', instructgender = '$gender', instructphone = '$phone' WHERE instructid ='$idnum'");
*/	message("User information was successfully updated!", "success");
	redirect('../../index.php');
 
}

}



		

function doInsert(){

   @$id=$_POST['selector'];
	  $key = count($id);
	//multi delete using checkbox as a selector

if($key > 0){

	for($i=0;$i<$key;$i++){


		        $dbhost = "localhost";
                $dbname = "asidatabase";
                $dbusername = "root";
                $dbpassword = "";                    
                $conn = new PDO("mysql:host=$dbhost;dbname=$dbname",$dbusername,$dbpassword);
   
/*********************PDO QUERY*****************************/
                $sql = "SELECT oic_id FROM accounts WHERE acct_id = '$_SESSION[acct_id]'";
                $gid = $conn->query($sql);
                $gid->execute();
                $res= $gid->fetch(PDO::FETCH_ASSOC);  
                
                $userid = $res['oic_id'];  
                
                $query = $conn->prepare("INSERT INTO contacts(ID, oic_id, owner)VALUES('', ($id[$i]), '$userid')");
	            $query->execute();
	}

	message("New contact has been successfully added!","success");
	redirect('index.php');

}
else{
	message("Please select contact to be added!","info");
	redirect('index.php?view=add');
}
}


 




function doInsertsched(){
		
if (isset($_POST['savesched'])){

	if ($_POST['sub'] == "Select Subject" OR $_POST['days'] == "Select Day" OR $_POST['hours'] == "" OR $_POST['yr'] == "Select Year & Section" ) {
		$messageStats = false;
		message("All field is required!","error");
		redirect('index.php?view=addsched');
	}else{
		

	  	$instruct     = $_GET['ids'];
		$subt  		  = $_POST['sub'];
		$days   	  = $_POST['days'];
		$hours  	  = $_POST['hours'];
		$yr   		  = $_POST['yr'];
		
		
 
		 

 mysql_query("INSERT INTO subschedule(subschedid,subtaughtid,day,hours,yearsection,instructid)VALUES('','$subt','$days','$hours','$yr','$instruct')");
  
			 	message("New schedule created successfully!", "success");
			 	redirect('index.php?view=viewsubjects&id='.$instruct);
			 	 
		
	}
}




elseif (isset($_POST['saveandnew'])){

		if ($_POST['sub'] == "Select Subject" OR $_POST['days'] == "Select Day" OR $_POST['hours'] == "" OR $_POST['yr'] == "Select Year & Section" ) {
		$messageStats = false;
		message("All field is required!","error");
		redirect('index.php?view=addsched');
	}else{
		

	  	$instruct     = $_GET['ids'];
		$subt  		  = $_POST['sub'];
		$days   	  = $_POST['days'];
		$hours  	  = $_POST['hours'];
		$yr   		  = $_POST['yr'];
		
		
 
		 

 mysql_query("INSERT INTO subschedule(subschedid,subtaughtid,day,hours,yearsection,instructid)VALUES('','$subt','$days','$hours','$yr','$instruct')");
  
			 	message("New schedule created successfully!", "success");
			 	redirect('index.php?view=addsched&id='.$instruct);
			 	 

		
	}
}

}





function doEdit(){
	if (isset($_POST['save'])){

		if ($_POST['name'] == "" OR $_POST['username'] == "" OR $_POST['pass'] == "") {
			$messageStats = false;
			message("All field is required!","error");
			redirect('index.php?view=add');
		}else{
			

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
			 	message("New [". $acc_name ."] created successfully!", "success");
				redirect('index.php');
				
			
		}
	}
		
}

function delrecord(){

	$id = $_GET['tid'];



	            $dbhost = "localhost";
                $dbname = "asidatabase";
                $dbusername = "root";
                $dbpassword = "";                    
                $conn = new PDO("mysql:host=$dbhost;dbname=$dbname",$dbusername,$dbpassword);
   
/*********************PDO QUERY*****************************/
                $sql = "SELECT oic_id FROM accounts WHERE acct_id = '$_SESSION[acct_id]'";
                $gid = $conn->query($sql);
                $gid->execute();
                $row= $gid->fetch(PDO::FETCH_ASSOC);  
                $oic_id = $row['oic_id'];
/*******************END***********************************************/


	 $query = $conn->prepare("DELETE FROM contacts WHERE oic_id = '$id' AND owner = '$oic_id'");
	 $query->execute();
 
	message("Contact has been successfully deleted!","success");
	redirect('index.php');
}




function doDelete(){
	
	  @$id=$_POST['selector'];
	  $key = count($id);
	//multi delete using checkbox as a selector
	
if($key > 0){

	for($i=0;$i<$key;$i++){


		 	$user = mysql_query("SELECT oic_id FROM accounts WHERE acct_id = '$_SESSION[acct_id]'");
            $res = mysql_fetch_assoc($user);
 
		mysql_query("DELETE FROM contacts WHERE oic_id = ($id[$i]) AND owner = '$res[oic_id]'");

	}

	message("Record has been successfully deleted!","success");
	redirect('index.php');

}
else{
	message("Please select records to be deleted!","error");
	redirect('index.php');

}
}





function doDeletesubject(){
	
	  @$id=$_POST['selector'];
	  $key = count($id);
	//multi delete using checkbox as a selector


	 $instruct = $_GET['instruct'];

	
if($key > 0){

	for($i=0;$i<$key;$i++){
 
		mysql_query("DELETE FROM subschedule WHERE subschedid = ($id[$i]) AND instructid = '$instruct'");
 		//mysql_query("DELETE FROM enrolled WHERE instructid = ($id[$i])");

	}

	message("Schedule has been successfully deleted!","success");
	redirect('index.php?view=viewsubjects&id='.$instruct);

}
else{
	message("Please select records to be deleted!","info");
	redirect('index.php?view=viewsubjects&id='.$instruct);

}
}







function doDeleteenrolled(){
	
	  @$id=$_POST['selector'];
	  $key = count($id);
	//multi delete using checkbox as a selector


	 $sched = $_GET['sched'];
	$instruct = $_GET['instruct'];
	
if($key > 0){

	for($i=0;$i<$key;$i++){
 
		 mysql_query("DELETE FROM enrolled WHERE  subschedid = '$sched' and studid = ($id[$i])");

	}

	message("Enrolled students was successfully deleted!","success");
	redirect('index.php?view=enrolled&xsub='.$sched.'&xsid='.$instruct);

}
else{
	message("Please select records to be deleted!","info");
	redirect('index.php?view=enrolled&xsub='.$sched.'&xsid='.$instruct);

}
}



function doAddSelected(){
	
	  @$id=$_POST['selector'];
	  $key = count($id);
	//multi delete using checkbox as a selector


	 $sched = $_GET['sched'];
	$instruct = $_GET['instruct'];
	
if($key > 0){

	for($i=0;$i<$key;$i++){
 
		 mysql_query("INSERT INTO enrolled(studid, subschedid)VALUES('($id[$i])','$sched')");

	}

	message("Students was successfully added!","success");
	redirect('index.php?view=enrolled&xsub='.$sched.'&xsid='.$instruct);

}
else{
	message("Please select records to be added!","info");
	redirect('index.php?view=enrolled&xsub='.$sched.'&xsid='.$instruct);

}
}







function doDeleteabsent(){
	
	  @$id=$_POST['selector'];
	  $key = count($id);
	//multi delete using checkbox as a selector


	 $studid = $_GET['studid'];
	 $schedid = $_GET['schedid'];
	 $studentid = $_GET['studentid'];
	 $studnetn = $_GET['studnetn'];
	 $instruct = $_GET['instruct'];
	
//if($key > 0){

	for($i=0;$i<$key;$i++){
 
		 mysql_query("DELETE FROM absences WHERE studid = ($id[$i]) and subschedid = '$schedid'");

	}

	message("Students absent was successfully deleted!","success");
	redirect('index.php?view=absent&sched='.$sched.'&id='.$studentid.'&fullname='.$studnetn.'&instruct='.$instruct);

//}
//else{
//	message("Please select records to be deleted!","info");
//	redirect('index.php?view=absent&sched='.$sched.'&id='.$studentid.'&fullname='.$studnetn.'&instruct='.$instruct);


//}
}

?>