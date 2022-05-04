<?php require('core/init.php');   ?>

<?php     

//Create a new topic object
$topic = new Topic;

//Create a new topic object
$user = new User;

//Get Topic ID from URL
$topic_id = $_GET['id'];

//Process Reply
if(isset($_POST['do_reply'])){
    //create data array
    $data = array();
    $data['topic_id'] = $_GET['id'];
    $data['body'] = $_POST['reply'];
    $data['user_id'] = getUser()['user_id'];

    //Create Validator
    $validate = new Validator;

    //Required Fields
    $field_array = array('reply');

    if($validate->isRequired($field_array)){
        //Post Reply
        if($topic->reply($data)){
            redirect('topic.php?id='.$topic_id, 'Your Reply has been Posted', 'success');
        }else{
            redirect('topic.php?id='.$topic_id, 'An error occured, reply not posted.', 'error');
        }
    }else{
        redirect('topic.php?id='.$topic_id, 'Your Reply was blank', 'error');  
    }
}

//Get template and create Assign Vars
$template = new Template('templates/topic.php');

//Assign Vars
$template->topic = $topic->getTopic($topic_id);
$template->replies = $topic->getReplies($topic_id);
$template->title = $topic->getTopic($topic_id)->title;
$template->totalCategories = $topic->getTotalCategories();
$template->totalUsers = $user->getTotalUsers();
$template->totalTopics = $topic->getTotalTopics();


//Display template
echo $template;


?>