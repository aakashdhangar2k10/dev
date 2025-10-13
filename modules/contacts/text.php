<?php /*if($_SESSION['type']=='Administrator'){*/?>
 

        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Messaging 
            <small>Control Panel</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
            <li class="active">Messaging Area</li>
          </ol>
        </section>
        <hr>
  

 <style>
#uprall {
    text-transform:uppercase;
}
#upr {
    text-transform:capitalize;
}
</style>


<?php
$id = $_GET['id'];


 
                $dbhost = "localhost";
                $dbname = "asidatabase";
                $dbusername = "root";
                $dbpassword = "";                    
                $conn = new PDO("mysql:host=$dbhost;dbname=$dbname",$dbusername,$dbpassword);
   
/*********************PDO QUERY*****************************/
                $sql = "SELECT * FROM oic oic, accounts acct WHERE oic.oic_id = acct.oic_id  AND oic.oic_id  = '$id' AND acct.oic_id = '$id'";
                $gid = $conn->query($sql);
                $gid->execute();
                $rs= $gid->fetch(PDO::FETCH_ASSOC);  
                
                $rs['oic_id'];  
                $_SESSION['oic_fname'] = $rs['oic_fname'];   
                $_SESSION['oic_lname'] = $rs['oic_lname'];   
                $_SESSION['oic_mname'] = $rs['oic_mname'];
                $fullname = $_SESSION['oic_fname'].' '.$_SESSION['oic_lname'];
                $_SESSION['contact'] = $rs['contact'];    
/*******************END***********************************************/

?>
 

          <div class="row">
            <div class="col-xs-12">
        
              <div class="box" style=" outline:none; border-radius:20px 20px 20px 20px ; border:transparent;">
                <div class="box-header">
                  <!-- <h3 class="box-title">Data Table With Full Features</h3> -->
                </div><!-- /.box-header -->
                <div class="box-body">
                     <p><span style="color:RED; font-size:20px;"><b>NOTE:  </b></span>  The message that you're about to compose will be send to <span style="color:#0a0;" id="upr"><?php echo $fullname; ?></span> once you have clicked the <span style="color:blue;">Send Now</span> button below.  </p>
                     <hr>

                 <CENTER> <form action="" Method="POST" >
                  
                    
                      <textarea rows="15" cols="100" name="txt" autofocus required placeholder="Compose some message here..."></textarea> 
 
                      <br>  <br>
     
                      <button style="background:#0a0;color:white; box-shadow:0px 2px 2px 1px #777; outline:none; border-radius:50px 50px ;" type="submit" class="btn btn-default" name="send"><span class="glyphicon glyphicon-envelope"></span> Send Now</button>
                      <br> 

                  </form></CENTER>


                  <br>
               

                  <?php

                  if(isset($_POST['send'])){


                    $text = $_POST['txt'];

                    //API CHIKKA TEXT MESSAGING
                    include('ChikkaSMS.php');
                    $clientId = '2846ee791ac97e49b2811f806b6d51dad4ccef29136e86e43a4087c2aa99d32f';
                    $secretKey = 'c9c9881c85e5627e3986c6620cdf815405e1af2fc2c004977e9fce08aafe45c0';
                    $shortCode = '29290782';
                    $chikkaAPI = new ChikkaSMS($clientId,$secretKey,$shortCode);


/*
                    $sql = mysql_query("SELECT stud_id, CONCAT(stud_fname,' ',stud_lname)AS fullname, contact FROM student");

                    while($row = mysql_fetch_array($sql)){

                      $query1 = mysql_query("SELECT COUNT(a.att_logintime) AS loginme FROM attendance a, event e WHERE e.eve_id = a.eve_id AND e.semester = '2nd sem' AND e.schoolyear = '2015-2016' AND a.att_logintime = '00:00:00' AND a.stud_id = '$row[stud_id]'");
                      $results1 = mysql_fetch_array($query1);
                      $totallogin = $results1['loginme'];

                      $query2 = mysql_query("SELECT COUNT(a.att_logouttime) AS logoutme FROM attendance a, event e WHERE e.eve_id = a.eve_id AND e.semester = '2nd sem' AND e.schoolyear = '2015-2016' AND a.att_logouttime = '00:00:00' AND a.stud_id = '$row[stud_id]'");
                      $results2 = mysql_fetch_array($query2);
                      $totallogout = $results2['logoutme'];

                      $totalabsents = ($totallogin + $totallogout); 
                      $SmsId = rand();
                      $cellnum = $row['contact'];
                      $msg = 'Good day! '.$row['fullname'].' you have '.$totalabsents.' absences...    '.$sunctions;
*/

                      //sending SMS to students



                      $SmsId = rand();
                      $cellnum = $_SESSION['contact'];
                      $msg = 'FROM: RCMG, '.$text;
                      try {
                      $response = $chikkaAPI->sendText($SmsId, $cellnum,$msg);
                        
                      } catch (Exception $e) {
                    message($e, "error");
                        
                      }


                    message('Message has been successfully sent!', "success");
                    redirect ('index.php');  
                  }

                  ?>


                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
 

  

<?php
  /* }else{

 redirect('../../errorpage/page_404.html');
 

}*/
?>




