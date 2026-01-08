<?php if($_SESSION['type']=='Administrator'){?>
 

        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Direct Chat 
            <small>Control Panel</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
            <li class="active">Chat Area</li>
          </ol>
        </section>
        <hr>
  


                 <CENTER> <form action="#" Method="POST" >
                  
                    
                   <!-- Construct the box with style you want. Here we are using box-danger -->
<!-- Then add the class direct-chat and choose the direct-chat-* contexual class -->
<!-- The contextual class should match the box, so we are using direct-chat-danger -->
<div class="box box-success direct-chat direct-chat-success">
  <div class="box-header with-border">
    <h3 class="box-title">Direct Chat</h3>
    <div class="box-tools pull-right">
      <span data-toggle="tooltip" title="3 New Messages" class="badge bg-red">3</span>
      <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
      <!-- In box-tools add this button if you intend to use the contacts pane -->
      <button class="btn btn-box-tool" data-toggle="tooltip" title="Contacts" data-widget="chat-pane-toggle"><i class="fa fa-comments"></i></button>
      <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
    </div>
  </div><!-- /.box-header -->
  <div class="box-body">
    <!-- Conversations are loaded here -->
    <div class="direct-chat-messages">
      <!-- Message. Default to the left -->
      <div class="direct-chat-msg">
        <div class="direct-chat-info clearfix">
          <span class="direct-chat-name pull-left">Randy Villacora</span>
          <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
        </div><!-- /.direct-chat-info -->
        <img class="direct-chat-img" src="../../images/randy.jpg" alt="message user image"><!-- /.direct-chat-img -->
        <div class="direct-chat-text">
          Is this template really for free? That's unbelievable! 
        </div><!-- /.direct-chat-text -->
      </div><!-- /.direct-chat-msg -->

      <!-- Message to the right -->
      <div class="direct-chat-msg right">
        <div class="direct-chat-info clearfix">
          <span class="direct-chat-name pull-right">Nikki Hills</span>
          <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
        </div><!-- /.direct-chat-info -->
        <img class="direct-chat-img" src="../../images/blank-profile.jpg" alt="message user image"><!-- /.direct-chat-img -->
        <div class="direct-chat-text">
          You better believe it! You better believe it! You better believe it! You better believe it! You better believe it! You better believe it! You better believe it! You better believe it! You better believe it! You better believe it!You better believe it!
        </div><!-- /.direct-chat-text -->
      </div><!-- /.direct-chat-msg -->
    </div><!--/.direct-chat-messages-->

    <!-- Contacts are loaded here -->
    <div class="direct-chat-contacts">
      <ul class="contacts-list">
        <li>
          <a href="#">
            <img class="contacts-list-img" src="../../images/blank-profile.jpg" alt="Contact Avatar">
            <div class="contacts-list-info">
              <span class="contacts-list-name">
                Count Dracula
                <small class="contacts-list-date pull-right">2/28/2015</small>
              </span>
              <span class="contacts-list-msg">How have you been? I was...</span>
            </div><!-- /.contacts-list-info -->
          </a>
        </li><!-- End Contact Item -->
      </ul><!-- /.contatcts-list -->
    </div><!-- /.direct-chat-pane -->
  </div><!-- /.box-body -->
  <div class="box-footer">
    <div class="input-group">

      <form action="#" method="post">
      <input autofocus type="text" name="message" placeholder="Type Message ..." class="form-control">
      <span class="input-group-btn">
        <button name="send" type="submit" class="btn btn-success btn-flat">Send</button>
      </form>



<?php

                    date_default_timezone_set('Asia/Manila');       

                  if(isset($_POST['send'])){
          
                    $users = mysql_query("SELECT oic_id FROM accounts WHERE acct_id = '$_SESSION[acct_id]'");
                    $ress = mysql_fetch_assoc($users);
                    $sender = $ress['oic_id'];
                    $recepient = $_GET['id'];
                    $chat = $_POST['message'];          
                    $datechat = date("D M d, Y g:i a");

                    mysql_query("INSERT INTO pmessage(sender, recepient, chat, datechat)VALUES('$sender', '$recepient', '$chat', '$datechat')");
                    message('Message has been successfully sent!', "success");
                    redirect ('index.php');  
                  }

?>





      </span>
    </div>
  </div><!-- /.box-footer-->
</div><!--/.direct-chat -->
</form></CENTER>



                

 

 
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
 

  

<?php
   }else{

 redirect('../../errorpage/page_404.html');
 

}
?>




