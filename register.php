<?php require('core/init.php');   ?>

<?php     
//Create new topic 
$topic = new Topic;

//Create new user 
$user = new User;

//Create new validator
$validate = new Validator;


if(isset($_POST['register'])){
    //Create Data Array
	$data = array();
	$data['name'] = $_POST['name'];
	$data['email'] = $_POST['email'];
	$data['username'] = $_POST['username'];
	$data['password'] = md5($_POST['password']);
	$data['password2'] = md5($_POST['password2']);
	$data['about'] = $_POST['about'];
	$data['last_activity'] = date("Y-m-d H:i:s");

//Required Fields
$field_array = array('name','email','username','password','password2');
	
if($validate->isRequired($field_array)){
    if($validate->isValidEmail($data['email'])){
        if($validate->passwordsMatch($data['password'],$data['password2'])){
                //Upload Avatar Image
                if($user->uploadAvatar()){
                    $data['avatar'] = $_FILES["avatar"]["name"];
                }else{
                    $data['avatar'] = 'noimage.png';
                }
                //Register User
                if($user->register($data)){
                    redirect('index.php', 'You are registered and can now log in', 'success');
                } else {
                    redirect('index.php', 'Something went wrong with registration', 'error');
                }
        } else {
            redirect('register.php', 'Your passwords did not match', 'error');
        }
    } else {
        redirect('register.php', 'Please use a valid email address', 'error');
    }
} else {
    redirect('register.php', 'Please fill in all required fields', 'error');
}



}










//Get category From URL
$category = isset($_GET['category']) ? $_GET['category'] : null;

//Get user From URL
$user_id = isset($_GET['user']) ? $_GET['user'] : null;

//Get template and create Assign Vars
$template = new Template('templates/register.php');

//Assign Template Variables
if(isset($category)){
	$template->topics = $topic->getByCategory($category);
	$template->title = 'Posts In "'.$topic->getCategory($category)->name.'"';
}

//Check For User Filter
if(isset($user_id)){
	$template->topics = $topic->getByUser($user_id);
	//$template->title = 'Posts By "'.$user->getUser($user_id)->username.'"';
}

//Check For Category Filter
if(!isset($category) && !isset($user_id)){
	$template->topics = $topic->getAllTopics();
}

$template->topics = $topic->getAllTopics();
$template->totalTopics = $topic->getTotalTopics();
$template->totalCategories = $topic->getTotalCategories();
$template->totalUsers = $user->getTotalUsers();


//Display template
echo $template;



?>