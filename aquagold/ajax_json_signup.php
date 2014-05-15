<?php
//email signup ajax call
if($_GET['action'] == 'signup'){
	
    //mysql_connect('72.167.233.38','aquagold','Aquagold2014!');  
	mysql_connect('68.178.216.52','aquagold','Aquagold2014!');  
	mysql_select_db('aquagold');
	
	//sanitize data
	$name = mysql_real_escape_string($_POST['signup-name']);
	$email = mysql_real_escape_string($_POST['signup-email']);
	$user = mysql_real_escape_string($_POST['signup-user']);
	
	//validate name - check if input was empty
	if(empty($name)){
		$status = "error";
		$message = "You did not enter your name!";
	}
	else if(empty($email)){ //validate email address - check if input was empty
		$status = "error";
		$message = "You did not enter an email address!";
	}
	else if(!preg_match('/^[^\W][a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*\@[a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*\.[a-zA-Z]{2,4}$/', $email)){ //validate email address - check if is a valid email address
			$status = "error";
			$message = "You have entered an invalid email address!";
	}
	else if(empty($user)){ //validate user - check if input was empty
		$status = "error";
		$message = "You did not choose a user type!";
	}
	else {
		$existingSignup = mysql_query("SELECT * FROM signups WHERE signup_email_address='$email'");   
		if(mysql_num_rows($existingSignup) < 1){
			
			$date = date('Y-m-d');
			$time = date('H:i:s');
			
			$insertSignup = mysql_query("INSERT INTO signups (signup_name, signup_email_address, signup_user, signup_date, signup_time) VALUES ('$name','$email','$user','$date','$time')");
			if($insertSignup){ //if insert is successful
				$status = "success";
				$message = "Thank you for signing up!";
				//emails
				$message1 = "Name: $name
Email: $email
User: $user";
				mail("info@aquavitpharma.com", "Info @ Aquavitpharma FWD: subscription", $message1, "From:" . $email);
				if($user == 'consumer'){
					$message2 = "Hi $name,
                    
Thank you for your interest in AQUAGOLD® fine touch™. When AQUAGOLD® fine touch™ debuts in early 2014, we will send you an exclusive AQUAGOLD® fine touch™ introductory offer to use with your participating physician. At that time, we'll also invite you to enroll in our Gold Rush Loyalty Program.
					
                    Sincerely,
                    
                    AQUAGOLD® team";
					$from = "goldrush@aquagoldfinetouch.com";
				} else {
					$message2 = "Hi Dr. $name,
                    
Thank you for your interest in AQUAGOLD® fine touch™. When AQUAGOLD® fine touch™ debuts in early 2014, we will send you an exclusive AQUAGOLD® fine touch™ introductory offer. At that time, we'll also invite you to enroll in our Heart of Gold Loyalty Program.
					
                    Sincerely,
                    
                    AQUAGOLD® team";
					$from = "heartofgold@aquagoldfinetouch.com";
				}
				mail($email, "Info @ Aquavitpharma FWD: subscription", $message2, "From:" . $from);	
			}
			else { //if insert fails
				$status = "error";
				$message = "Ooops, Theres been a technical error!";	
			}
		}
		else { //if already signed up
			$status = "error";
			$message = "This email address has already been registered!";
		}
	}
	
	//return json response
	$data = array(
		'status' => $status,
		'message' => $message
	);
	
	echo json_encode($data);
	exit;
}
?>