<?php
//before we store information of our member, we need to start first the session

session_start();

//create a new function to check if the session variable member_id is on set
function logged_in()
{
	return isset($_SESSION['acct_id']);
}


//this function if session member is not set then it will be redirected to login.php
function confirm_logged_in()
{
	if (!logged_in()) {

		redirect(WEB_ROOT . 'login.php');

?>
		<script type="text/javascript">
			window.location = "<?php echo WEB_ROOT; ?>login.php";
		</script>

	<?php
	}
}

function lockstatus()
{
	return isset($_SESSION['lockstatus']);
}
function screenlockstatus()
{
	if (logged_in() && $_SESSION['lockstatus'] == 'ON') { ?>
		<script type="text/javascript">
			window.location = "modules/lockscreen/lockscreen.php";
		</script>

<?php
	}
}

function message($msg = "", $msgtype = "")
{
	if (!empty($msg)) {
		// then this is "set message"
		// make sure you understand why $this->message=$msg wouldn't work
		$_SESSION['message'] = $msg;
		$_SESSION['msgtype'] = $msgtype;
	} else {
		// then this is "get message"
		return $message;
	}
}
function check_message()
{

	if (isset($_SESSION['message'])) {
		if (isset($_SESSION['msgtype'])) {
			if ($_SESSION['msgtype'] == "info") {
				echo  '<div class="alert alert-info">' . $_SESSION['message'] . '</div>';
			} elseif ($_SESSION['msgtype'] == "error") {
				echo  '<div class="alert alert-danger">' . $_SESSION['message'] . '</div>';
			} elseif ($_SESSION['msgtype'] == "success") {
				echo  '<div class="alert alert-success">' . $_SESSION['message'] . '</div>';
			}
			unset($_SESSION['message']);
			unset($_SESSION['msgtype']);
		}
	}
}

?>