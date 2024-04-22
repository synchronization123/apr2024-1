<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu and Content</title>
<style>
    /* CSS for the top bar */
    .top-bar {
        background-color: skyblue;
        padding: 10px 20px; /* Adjust padding as needed */
        color: white;
        text-align: center;
    }
</style>
<style>
    /* CSS for the top bar */
    .top-bar {
        background-color: skyblue;
        padding: 10px 20px; /* Adjust padding as needed */
        color: white;
        text-align: right; /* Align text to the right */
    }

    /* CSS for dropdown menu */
    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        z-index: 1;
        right: 0; /* Align dropdown to the right */
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {
        background-color: #f1f1f1;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }
</style>



<style>
  /* Basic styling for the layout */
  body {
    margin: 0;
    font-family: Arial, sans-serif;
  }
  .container {
    display: flex;
  }
  #left-menu {
    width: 200px;
    background-color: #f2f2f2;
    padding: 5px;
  }
  #content {
    flex-grow: 1;
    padding: 50px;
    margin-left: 70px; /* Add a margin to prevent overlapping with the left menu */
  }
</style>
</head>
<body>

<div class="top-bar">
    <div class="dropdown"  align=="right">
        <span>Menu</span>
        <div class="dropdown-content">
            <a href="profile.php">Profile</a>
            <a href="logout.php">Logout</a>
        </div>
    </div>
</div>

<div class="top-bar">
  
</div>

<div class="container">
  <div id="left-menu">
    <?php include('leftmenu.php'); ?>
  </div>
  
  
  

  <div id="content">
 



 
 
 
 
<?php
// Include database connection
require_once "db_connect.php";
// Exception and error handling
try {
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    // Check if the user is logged in
    if (!isset($_SESSION['user_id'])) {
        throw new Exception("You are not logged in.");
    }

    // Fetch user role if set
    $user_role = isset($_SESSION['role_id']) ? $_SESSION['role_id'] : null;

    // Fetch assignments for today based on user role
    if ($user_role == 5) {
        // Fetch assignments for logged-in user only for today
        $query_today = "SELECT patches.*, users.ufname, users.ulname 
                        FROM patches 
                        INNER JOIN users ON patches.assigned_to = users.user_id 
                        WHERE assigned_to = :user_id 
                        AND DATE(eta) = CURDATE()
                        AND status IN ('Not Started', 'InProgress')";
        $stmt_today = $db->prepare($query_today);
        $stmt_today->bindParam(':user_id', $_SESSION['user_id']);
        $stmt_today->execute();
        $assignments_today = $stmt_today->fetchAll(PDO::FETCH_ASSOC);

        // Fetch assignments for logged-in user only for tomorrow
        $query_tomorrow = "SELECT patches.*, users.ufname, users.ulname 
                           FROM patches 
                           INNER JOIN users ON patches.assigned_to = users.user_id 
                           WHERE assigned_to = :user_id 
                           AND DATE(eta) = DATE_ADD(CURDATE(), INTERVAL 1 DAY)
                           AND status IN ('Not Started', 'InProgress')";
        $stmt_tomorrow = $db->prepare($query_tomorrow);
        $stmt_tomorrow->bindParam(':user_id', $_SESSION['user_id']);
        $stmt_tomorrow->execute();
        $assignments_tomorrow = $stmt_tomorrow->fetchAll(PDO::FETCH_ASSOC);
    } else {
        // Fetch assignments for all users for today
        $query_today = "SELECT patches.*, users.ufname, users.ulname 
                        FROM patches 
                        INNER JOIN users ON patches.assigned_to = users.user_id 
                        WHERE DATE(eta) = CURDATE()
                        AND status IN ('Not Started', 'InProgress')";
        $stmt_today = $db->prepare($query_today);
        $stmt_today->execute();
        $assignments_today = $stmt_today->fetchAll(PDO::FETCH_ASSOC);

        // Fetch assignments for all users for tomorrow
        $query_tomorrow = "SELECT patches.*, users.ufname, users.ulname 
                           FROM patches 
                           INNER JOIN users ON patches.assigned_to = users.user_id 
                           WHERE DATE(eta) = DATE_ADD(CURDATE(), INTERVAL 1 DAY)
                           AND status IN ('Not Started', 'InProgress')";
        $stmt_tomorrow = $db->prepare($query_tomorrow);
        $stmt_tomorrow->execute();
        $assignments_tomorrow = $stmt_tomorrow->fetchAll(PDO::FETCH_ASSOC);
    }
	
	   // Fetch assignments where ETA is not mentioned for all users
        $query_no_eta = "SELECT patches.*, users.ufname, users.ulname 
                         FROM patches 
                         INNER JOIN users ON patches.assigned_to = users.user_id 
                         WHERE eta IS NULL
                         AND status IN ('Not Started', 'InProgress')";
        $stmt_no_eta = $db->prepare($query_no_eta);
        $stmt_no_eta->execute();
        $assignments_no_eta = $stmt_no_eta->fetchAll(PDO::FETCH_ASSOC);
    

	

} catch (Exception $e) {
    $error_message = $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<style>
	/* CSS for left menu */
#left-menu {
    position: fixed; /* Fixed position */
    top: 0; /* Position from the top */
    left: 0; /* Position from the left */
    width: 200px; /* Set the width */
    height: 100%; /* Full height */
    background-color: #f8f9fa; /* Background color */
    padding: 20px; /* Padding */
    border-right: 1px solid #dee2e6; /* Right border */
}

/* CSS for menu items */
.menu-item {
    margin-bottom: 10px; /* Margin between menu items */
}

.menu-link {
    color: #007bff; /* Link color */
    text-decoration: none; /* Remove underline */
}

.menu-link:hover {
    text-decoration: underline; /* Add underline on hover */
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    /* CSS for the delete button */
    .delete-button {
        background-color: gray;
        color: white;
        border: none;
        border-radius: 50%; /* Makes the button round */
        padding: 2px; /* Adjust padding as needed */
        cursor: pointer;
    }
</style>
<style>
    /* CSS for the edit button */
    .edit-button {
        background-color: gray;
        color: white;
        border: none;
        border-radius: 50%; /* Makes the button round */
        padding: 2px; /* Adjust padding as needed */
        cursor: pointer;
    }
</style>

	
</head>
<body>
    <div class="container mt-5">
        <?php if (isset($error_message)) : ?>
            <div class="alert alert-danger" role="alert">
                <?php echo $error_message; ?>
            </div>
        <?php else: ?>
                       <div class="row">
                <div class="col-md-6">
                    <div class="card">
                <div class="card-header">ETA for Today</div>
                        <div class="card-body">
                            <p>Total Count: <?php echo count($assignments_today); ?></p>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Assigned To</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($assignments_today as $assignment) : ?>
                                        <tr>
                                            <td>
                                                <form action="addpatchdetails.php" method="post">
                                                    <input type="hidden" name="assignment_id" value="<?php echo $assignment['assignment_id']; ?>">
                                                    <button type="submit" class="btn btn-link"><?php echo $assignment['title']; ?></button>
                                                </form>
                                            </td>
                                            <td><?php echo $assignment['ufname'] . ' ' . $assignment['ulname']; ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">ETA for Tomorrow</div>
                        <div class="card-body">
                            <p>Total Count: <?php echo count($assignments_tomorrow); ?></p>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Assigned To</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($assignments_tomorrow as $assignment) : ?>
                                        <tr>
                                            <td>
                                                <form action="addpatchdetails.php" method="post">
                                                    <input type="hidden" name="assignment_id" value="<?php echo $assignment['assignment_id']; ?>">
                                                    <button type="submit" class="btn btn-link"><?php echo $assignment['title']; ?></button>
                                                </form>
                                            </td>
                                            <td><?php echo $assignment['ufname'] . ' ' . $assignment['ulname']; ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">ETA Not Mentioned</div>
                        <div class="card-body">
                            <p>Total Count: <?php echo count($assignments_no_eta); ?></p>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Assigned To</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($assignments_no_eta as $assignment) : ?>
                                        <tr>
                                            <td>
                                                <form action="addpatchdetails.php" method="post">
                                                    <input type="hidden" name="assignment_id" value="<?php echo $assignment['assignment_id']; ?>">
                                                    <button type="submit" class="btn btn-link"><?php echo $assignment['title']; ?></button>
                                                </form>
                                            </td>
                                            <td><?php echo $assignment['ufname'] . ' ' . $assignment['ulname']; ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        <?php endif; ?>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
