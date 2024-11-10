<div class="card post-card">
    <a href="post?id=<?= $post['id'] ?>">
        <img src="<?= htmlspecialchars($post['image_url']) ?>" alt="Post image" class="card-img-top">
    </a>

    <div class="card-body">
        <div class="d-flex mb-2">
            <span class="badge rounded-pill text-bg-light">
                <a href="category?id=<?= $post['category_id'] ?>"><?= htmlspecialchars($post['category_name']) ?></a>
            </span>
        </div>

        <a href="post?id=<?= $post['id'] ?>">
            <p class="card-text mb-0 fw-bold"><?= htmlspecialchars($post['title']) ?></p>
            <p class="card-text mb-0"><?= htmlspecialchars($post['content']) ?></p>
        </a>


        <a href="profile?id=<?= $post['user_id'] ?>" class="mt-2 d-flex align-items-center gap-2 avatar-box">
            <img src="<?= htmlspecialchars($post['avatar_url']) ?>" class="rounded-circle avatar" alt="avatar">
            <p class="mb-0"><?= htmlspecialchars($post['name']) ?></p>
        </a>
    </div>
</div>