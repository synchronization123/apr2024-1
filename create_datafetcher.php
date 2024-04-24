<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fetch Jira ID's</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Enter data:</h2>
        <form method="post">
            <div class="form-group">
                <textarea class="form-control" name="paragraph" rows="5" cols="50"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

        <?php
        include 'db_connect.php';

        function extractWordsWithPrefixes($paragraph, $conn) {
            $prefixes = array();
            $sql = "SELECT prefix FROM prefixes";
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $prefixes[] = $row["prefix"];
                }
            }

            $pattern = '/\b(' . implode('|', $prefixes) . ')\w+\b/i'; 
            preg_match_all($pattern, $paragraph, $matches);
            return $matches[0];
        }

        function displayMessage($message, $type = 'success') {
            echo '<div class="alert alert-' . $type . ' mt-3" role="alert">' . $message . '</div>';
        }

        try {
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $paragraph = $_POST["paragraph"];
                if (empty($paragraph)) {
                    throw new Exception(".");
                }

                $pe_words = extractWordsWithPrefixes($paragraph, $conn);

                $insertedRows = 0;
                foreach ($pe_words as $word) {
                    $word = strtoupper($word);
                    $sql = "INSERT IGNORE INTO analysis (issuekey) VALUES (?)";
                    $stmt = $conn->prepare($sql);
                    $stmt->bind_param("s", $word);
                    if ($stmt->execute()) {
                        $insertedRows += $stmt->affected_rows;
                    }
                }

                if ($insertedRows > 0) {
                    displayMessage("Data inserted successfully!", "success");
                } else {
                    displayMessage("No new data added due to duplicates.", "info");
                }
            }

            $sql = "SELECT * FROM analysis ORDER BY id";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo '<h3>Added Data:</h3>';
                echo '<ul>';
                while ($row = $result->fetch_assoc()) {
                    echo '<li>' . $row["issuekey"] . '</li>';
                }
                echo '</ul>';
            }
        } catch (Exception $e) {
            displayMessage($e->getMessage(), "danger");
        }

        $conn->close();
        ?>
		
		
		
		
		
    </div>
</body>
</html>
