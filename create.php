<?php require('core/init.php');   ?>

<?php    

//Create Topics Object
$topic = new Topic;

//Create Users Object
$user = new User;


//Create Validator Object
$validate = new Validator;


//Check for submission

if(isset($_POST['do_create'])){
	$data = array();
	$data['title'] = $_POST['title'];
	$data['body'] = $_POST['body'];
	$data['category_id'] = $_POST['category'];
	$data['user_id'] = getUser()['user_id'];
	$data['last_activity'] = date("Y-m-d H:i:s");

	//Required Fileds
	$field_array = array('title', 'body', 'category');

	if($validate->isRequired($field_array)){

	if($topic->create($data)){
		redirect('index.php?id=' , 'Post was posted successfully', 'success');
	}else{
		redirect('index.php?id=' .$topic_id, 'Something went wrong with your post', 'error');
	}
	

}else{
	redirect('create.php', 'Please fill in all required fields', 'error');
}




}


//Get category From URL
$category = isset($_GET['category']) ? $_GET['category'] : null;

//Get user From URL
$user_id = isset($_GET['user']) ? $_GET['user'] : null;

//Get Template & Assign Vars
$template = new Template('templates/topics.php');

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



//Get template and create Assign Vars
$template = new Template('templates/create.php');
$template->topics = $topic->getAllTopics();
$template->totalTopics = $topic->getTotalTopics();
$template->totalCategories = $topic->getTotalCategories();
$template->totalUsers = $user->getTotalUsers();

//Display template
echo $template;


?>