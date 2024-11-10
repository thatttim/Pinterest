<?php
// Include database connection
require 'db.php';

// Get post ID from the URL (GET request)
$post_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($post_id > 0) {
    // Fetch the post details from the database
    $sql = 'SELECT p.id, p.title, p.content, p.image_url, c.category_name, u.name, u.avatar_url
            FROM posts p
            JOIN users u ON p.user_id = u.id
            JOIN categories c ON p.category_id = c.id
            WHERE p.id = :post_id';

    $stmt = $pdo->prepare($sql);
    $stmt->execute(['post_id' => $post_id]);
    $post = $stmt->fetch();

    // If the post is not found
    if (!$post) {
        echo "Post not found!";
        exit;
    }
} else {
    echo "Invalid post ID!";
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($post['title']) ?></title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/custom.css">
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
</head>

<body>
    <div class="d-flex">
        <?php include 'includes/sidebar.partial.php'; ?>

        <div class="main w-100">
            <?php include 'includes/nav.partial.php'; ?>

            <div class="mt-3 container text-center">
                <div class="row align-items-start">

                    <!-- მარცხენა სვეტი, სადაც სურათია -->
                    <div class="col">
                        <img src="<?= htmlspecialchars($post['image_url']) ?>" alt="Post image" class="card-img-top rounded">
                    </div>

                    <!-- მარჯვენა სვეტი, სადაც სათაური, აღწერა და ღილაკებია -->
                    <div class="col">
                        <!-- სათაური -->
                        <h3 class="card-title"><?= htmlspecialchars($post['title']) ?></h3>
                        <p class="card-text"><?= nl2br(htmlspecialchars($post['content'])) ?></p>

                        <!-- პროფილი -->
                        <div class="d-flex align-items-center mt-3">
                            <img src="<?= htmlspecialchars($post['avatar_url']) ?>" class="rounded-circle avatar" alt="avatar" width="50">
                            <div class="ms-3">
                                <p class="mb-0"><strong><?= htmlspecialchars($post['name']) ?></strong></p>
                                <p class="text-muted mb-0"><?= htmlspecialchars($post['category_name']) ?></p>
                            </div>
                        </div>

                        <!-- ღილაკები -->
                        <div class="mb-3">
                            <button type="button" class="btn btn-primary">Like</button>
                            <button type="button" class="btn btn-secondary">Share</button>
                            <a class="btn btn-success" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                Comment
                            </a>
                        </div>


                        <!-- კომენტარები -->
                        <div class="collapse" id="collapseExample">
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
                                <label for="floatingTextarea2">Comment</label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <script src="assets/js/bootstrap.min.js"></script>
</body>

</html>