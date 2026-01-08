 
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            List of Users 
            <small>Control Panel</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
            <li class="active">Users Area</li>
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
 

                  <form action="controller.php?action=add" Method="POST">  
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr style="background:orange;">
                        
                             <th><input type="checkbox" name="chkall" id="chkall" onclick="return checkall('selector[]');"> Select all</th>
                           <th>Users</th>
      
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
                


$query = $conn->prepare("SELECT o.oic_id, a.type, a.imagename, a.imagefile, CONCAT(O.oic_lname,', ',o.oic_fname,' ',o.oic_mname)as fullname, o.contact, a.username, a.password FROM oic o, accounts a WHERE o.oic_id = a.oic_id AND o.oic_id != '$userid'");
$query->execute();
$row = $query->fetchall();


  foreach($row as $result) {

      echo '<tr style="background:white;">';


                $sql = "SELECT oic_id FROM accounts WHERE acct_id = '$_SESSION[acct_id]'";
                $gid = $conn->query($sql);
                $gid->execute();
                $res= $gid->fetch(PDO::FETCH_ASSOC);  
                
                $usersid = $res['oic_id'];  

 
                 $sql = "SELECT * FROM contacts WHERE oic_id = '$result[oic_id]' AND owner = '$usersid'";
                $gid = $conn->query($sql);
                $gid->execute();
                $rs= $gid->fetch(PDO::FETCH_ASSOC);  
                
                // $id = $rs['oic_id'];  

 

if(!isset($rs['oic_id'])){

 

         echo '<td width="15%"><input type="checkbox" name="selector[]" id="selector[]" value=" '.$result['oic_id'].'"/>Add to Contact</td>';
  
              echo'<td> <div class="info-box">
                <!-- Apply any bg-* class to to the icon to color it -->
                <span class="info-box-icon bg-green">
                <img width="100em" height="85em" title="Profile picture"  src="data:image;base64,'.$result['imagefile'].'" class="user-image" alt="User Image">  </i></span>
                <div class="info-box-content">
                  <span id="upr"  class="info-box-text">Name: '.$result['fullname'].'</span>
                  <span id="upr" class="info-box-text">Type: '.$result['type'].'</span>
                  <span class="info-box-number"><span class="glyphicon glyphicon-phone btn-md" aria-hidden="true""></span> : '.$result['contact'].'</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
              </td>';
 
          }

           echo '</tr>';
            

            } 
            ?>






                    </tbody>
 
                  </table>  

                    <br>
                    <div class="pull-left">
                      
              <button style="background:#0a0;color:white; box-shadow:0px 2px 2px 1px #777; outline:none; border-radius:50px 50px ;" type="submit" name="add" class="btn btn-default"><i class="ion ion-person-add"></i> Add Selected to Contact</button>
                          </div><br><br>
                  </form>

 
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
 










 