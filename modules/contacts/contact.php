<?php /*if($_SESSION['type']=='Administrator'){ */?>
 

        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Contacts 
            <small>Control Panel</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
            <li class="active">Contacts Area</li>
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







          <div class="row">
            <div class="col-xs-12">
          

              <div class="box" style=" outline:none; border-radius:20px 20px 20px 20px ; border:transparent;">
                <div class="box-header">
                  <!-- <h3 class="box-title">Data Table With Full Features</h3> -->
                </div><!-- /.box-header -->
                <div class="box-body">

          

                  <form action="controller.php?action=delete" Method="POST">  
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr style="background:orange;">
                        

                           <th>Contacts</th>
                           <th>Actions</th>

                      </tr>
                    </thead>
                    <tbody>



<?php 


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
  
$query = $conn->prepare("SELECT o.oic_id, a.type, a.imagename, a.imagefile, a.status, CONCAT(O.oic_lname,', ',o.oic_fname,' ',o.oic_mname)as fullname, o.contact, a.username, a.password FROM oic o, accounts a, contacts c WHERE o.oic_id = a.oic_id AND o.oic_id = c.oic_id AND c.owner = '$res[oic_id]'");
$query->execute();
$row = $query->fetchall();


  foreach($row as $result) {

              echo '<tr style="background:white;">';
 
              echo'<td> <div class="info-box">
                <!-- Apply any bg-* class to to the icon to color it -->
                <span class="info-box-icon bg-red">
                <img width="100em" height="85em" title="Profile picture"  src="data:image;base64,'.$result['imagefile'].'" class="user-image" alt="User Image">  </i></span>
                <div class="info-box-content">
                  <span id="upr"  class="info-box-text">Name: '.$result['fullname'].'</span>
                  <span id="upr" class="info-box-text">Type: '.$result['type'].'</span>
                  <span class="info-box-number"><span class="glyphicon glyphicon-phone btn-md" aria-hidden="true""></span> : '.$result['contact'].'</span>';

                    if($result['status'] == 'Online'){
                        echo'<i class="ion-android-checkbox-outline"> </i> <span style="color:#0a0; font-size:20;">'.$result['status'].'</span> ';
                    }elseif($result['status'] == 'Offline'){
                           echo'<i class="ion-android-close"> </i> <span style="color:black; font-size:20;">'.$result['status'].'</span> ';
                    }             
               
               echo' </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
              </td>';


            echo '<td width="25%"><center> <a id="no" class="btn btn-success" href = "index.php?view=text&id='.$result['oic_id'].'"><i class="fa fa-send"></i> Text</a><a id="no" class="btn btn-danger"  style="color:white;" href = "controller.php?action=delrecord&tid='.$result['oic_id'].'"><i class="fa fa-trash"></i> Delete</a>  </center></td>';

                       
              echo '</tr>';
            } 
            ?>

<!-- 
 <a id="no" class="btn btn-success" href = "index.php?view=chat&id='.$result['oic_id'].'"><i class="ion-ios-chatboxes-outline text-white"> </i> Chat</a> 
 -->


                    </tbody>
 
                  </table>  

                    <br>
                    <div class="pull-left">
                         <a style="background:#0a0;color:white; box-shadow:0px 2px 2px 1px #777; outline:none; border-radius:50px 50px ;" href="index.php?view=add" class="btn btn-default"><i class="ion ion-person-add"></i> Add New Contacts</a>
        

        <?php if($_SESSION['type']=='Administrator'){ ?>
                     <a style="background:#0a0;color:white; box-shadow:0px 2px 2px 1px #777; outline:none; border-radius:50px 50px ;" href="index.php?view=textall" class="btn btn-default"><i class="fa fa-send"></i> Text All Contacts</a>
        <?php } ?>
                   <!--    <button style="background:red;color:white; box-shadow:0px 2px 2px 1px #777; outline:none; border-radius:50px 50px ;" type="submit" class="btn btn-default" name="delete"><i class="fa fa-trash"></i> Delete Selected Contacts</button>
      -->               </div><br><br>
                  </form>





 
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
 











 
<?php
/*   }else{

 redirect('../../errorpage/page_404.html');
 

}*/
?>




