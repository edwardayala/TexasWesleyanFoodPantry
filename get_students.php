<?php
require 'db.php';
$cmd = $_POST["command"];
switch($cmd)
{
	case "get_students":
		$result = $db->query("select * from student");
		$rows = array();
		while($row = $result->fetch(PDO::FETCH_ASSOC))
		{
		  $rows [] = $row;
		}
		echo json_encode($rows);
    break;

  case "get_inventory":
    $result = $db->query("select * from inventory");
    $rows = array();
    while($row = $result->fetch(PDO::FETCH_ASSOC))
    {
      $rows [] = $row;
    }
		echo json_encode($rows);
    break;

	case 'low_inventory':
		$result = $db->query("select * from inventory where amount <= 10");
		$rows = array();
    while($row = $result->fetch(PDO::FETCH_ASSOC))
    {
      $rows [] = $row;
    }
		echo json_encode($rows);
		break;

  case "get_volunteers":
    $result = $db->query("select * from student where type='vol'");
    $rows = array();
    while($row = $result->fetch(PDO::FETCH_ASSOC))
    {
      $rows [] = $row;
    }
		echo json_encode($rows);
    break;

  case "get_history":
    $result = $db->query("select * from history");
    $rows = array();
    while($row = $result->fetch(PDO::FETCH_ASSOC))
    {
      $rows [] = $row;
    }
		echo json_encode($rows);
    break;

  case "insert_student":
		parse_str($_POST["new_student_data"], $data);
		try{
	    $sql = $db->prepare("insert into student values(:first_name, :last_name, :student_id, :grade, :housing_status, :type)");
		  $sql->execute(array(':first_name'=>$data["first_name"], ':last_name'=>$data["last_name"], ':student_id'=>$data["student_id"], ':grade'=>$data["grade"], ':housing_status'=>$data["housing_status"], ':type'=>'stu'));
		  echo json_encode($data);
		} catch (PDOException $e) {
			die('An error has occurred! Please try again later.<br />' . $e->getMessage());
		}
		break;

  case "insert_volunteer":
		parse_str($_POST["student_data"], $data);
		try{
	    $sql = $db->prepare("insert into student values(:first_name, :last_name, :student_id, :grade, :housing_status, :type)");
		  $sql->execute(array(':first_name'=>$data["first_name"], ':last_name'=>$data["last_name"], ':student_id'=>$data["student_id"], ':grade'=>$data["grade"], ':housing_status'=>$data["housing_status"], ':type'=>'vol'));
		  echo json_encode($data);
		} catch (PDOException $e) {
			die('An error has occurred! Please try again later.<br />' . $e->getMessage());
		}
		break;

	// TODO: insert_item - check if item already exists - if exists: update; else: insert
  case "insert_item":
		parse_str($_POST["new_item"], $data);
		try{
      $sql = $db->prepare("insert into inventory values(:item, :amount)");
		  $sql->execute(array(':item'=>$data['item'], ':amount'=>$data['amount']));
		  echo json_encode($data);
		} catch (PDOException $e) {
			die('An error has occurred! Please try again later.<br />' . $e->getMessage());
		}
		break;

	case 'get_shopping_list':
		$result = $db->query("select * from shopping_list");
		$rows = array();
		while($row = $result->fetch(PDO::FETCH_ASSOC))
		{
			$rows [] = $row;
		}
		echo json_encode($rows);
		break;

	case 'insert_shopping_list':
		parse_str($_POST["log_data"], $data);
		try {
			$sql = $db->prepare("insert into shopping_list values(:item, :amount)");
			$sql->execute(array(':item'=>$data['item'], ':amount'=>$data['amount']));
			echo json_encode($data);
		} catch (PDOException $e) {
			die('An error has occurred! Please try again later.<br />' . $e->getMessage());
		}

		break;

  case "log_history":
    // $id =	$_POST["log_data"];
		parse_str($_POST["log_data"], $id);
    try{
      $sql = $db->prepare("insert into history values(" . $id['student_id'] . ", now())");
      $sql->execute();
      echo json_encode($id);
    } catch (PDOException $e) {
      die('An error has occurred! Please try again later.<br />' . $e->getMessage());
    }
    break;

	case "update_inventory":
		parse_str($_POST["log_data"], $data);
    try{
      $sql = $db->prepare("update inventory set amount = amount - :amount where item = :item" );
			$sql->execute(array(':amount'=>$data['amount'], ':item'=>$data['item']));
      echo json_encode($data);
    } catch (PDOException $e) {
      die('An error has occurred! Please try again later.<br />' . $e->getMessage());
    }
    break;

	case "delete_item":
	parse_str($_POST["log_data"], $data);
	try {
		// $sql = $db->prepare("update inventory set amount = amount - " . $data['amount'] . " where item = '" . $data['item']);
		$sql = $db->prepare("update inventory set amount = amount - :amount where item = :item");
		$sql->execute(array(':amount'=>$data['amount'], ':item'=>$data['item']));
		echo json_encode($data);
	} catch (PDOException $e) {
		die('An error has occurred! Please try again later.<br/>' . $e->getMessage());
	}
	break;

	case 'remove_volunteer':
		parse_str($_POST["log_data"], $data);
		try {
			$sql = $db->prepare("delete from student where student_id = :student_id and type= :type");
			$sql->execute(array(':student_id'=>$data['student_id'], ':type'=>'vol'));
			echo json_encode($data);
		} catch (PDOException $e) {
			die('An error has occurred! Please try again later.<br/>' . $e->getMessage());
		}
		break;

}
$db = null;
?>
