<?php
// Include database connection
require 'db.php';

// Fetch posts along with category name from the database
$sql = 'SELECT p.id, p.title, p.content, p.image_url, p.user_id, c.category_name, p.category_id, u.name, u.avatar_url
        FROM posts p
        JOIN users u ON p.user_id = u.id
        JOIN categories c ON p.category_id = c.id
        ORDER BY p.id DESC';
$posts = $pdo->query($sql)->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>W - Social Network</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
</head>

<body>
    <div class="d-flex">
        <?php include 'includes/sidebar.partial.php'; ?>

        <div class="main w-100">
            <?php include 'includes/nav.partial.php'; ?>

            <div class="px-4">
                <div class="masonry">
                    <?php
                    foreach ($posts as $post):
                        include 'includes/post.card.php';
                    endforeach;
                    ?>
                </div>
            </div>
        </div>
    </div>

    <script src="assets/js/bootstrap.min.js"></script>
</body>

</html>