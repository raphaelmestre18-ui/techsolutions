<?php
// filepath: c:\xampp\htdocs\techsolutions\admin_login.php
session_start();

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';

    // Connexion DB (adapter si besoin)
    $db_host = '127.0.0.1';
    $db_name = 'techsolutions';
    $db_user = 'root';
    $db_pass = '';

    try {
        $pdo = new PDO("mysql:host=$db_host;dbname=$db_name;charset=utf8mb4", $db_user, $db_pass, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        ]);
    } catch (Exception $e) {
        $error = 'Erreur connexion DB';
    }

    if (!$error && $username && $password) {
        $stmt = $pdo->prepare('SELECT id, username, password_hash FROM admins WHERE username = ? LIMIT 1');
        $stmt->execute([$username]);
        $admin = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($admin && password_verify($password, $admin['password_hash'])) {
            $_SESSION['admin_id'] = $admin['id'];
            $_SESSION['admin_username'] = $admin['username'];
            header('Location: admin_dashboard.php');
            exit;
        } else {
            $error = 'Identifiants incorrects';
        }
    } else {
        if (!$error) $error = 'Veuillez remplir tous les champs';
    }
}
?>
<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Admin — TechSolutions</title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="fichier_css.css">
  <style>
    /* header style matching site */
    .site-top {
      display:flex;
      align-items:center;
      justify-content:space-between;
      padding:18px 36px;
      background:#fff;
      box-shadow:0 1px 0 rgba(0,0,0,0.05);
      position:sticky;
      top:0;
      z-index:50;
    }
    .brand { display:flex; align-items:center; gap:12px; }
    .brand img{ height:34px; width:auto; display:block; }
    .main-nav { display:flex; gap:22px; align-items:center; }
    .main-nav a{ color:#222; text-decoration:none; font-weight:600; }
    .actions { display:flex; gap:12px; align-items:center; }

    /* hero + login card */
    .hero {
      background: linear-gradient(135deg,#4f6bed 0%,#2f3fb8 60%, #2a2b80 100%);
      padding:60px 20px;
      min-height:400px;
      display:flex;
      align-items:center;
      justify-content:center;
    }
    .hero-inner {
      width:100%;
      max-width:1100px;
      display:flex;
      gap:40px;
      align-items:center;
      color:#fff;
    }
    .hero-copy { flex:1; }
    .hero-copy h1 { font-size:36px; margin:0 0 12px; line-height:1.05; }
    .hero-copy p { margin:0 0 20px; opacity:0.95; }

    .login-panel {
      width:360px;
      background:#fff;
      color:#222;
      border-radius:12px;
      padding:28px;
      box-shadow: 0 20px 50px rgba(10,12,50,0.25);
    }
    .login-panel .logo { text-align:center; margin-bottom:12px; }
    .login-panel .logo img { height:44px; width:auto; display:inline-block; }

    .form-group { margin-bottom:14px; }
    .form-group label { display:block; font-size:13px; color:#444; margin-bottom:6px; font-weight:600; }
    .form-group input {
      width:100%; padding:12px 14px; border:1px solid #e6e9f2; border-radius:8px;
      font-size:14px; box-sizing:border-box;
    }
    .form-group input:focus { outline:none; border-color:#5b7cf2; box-shadow:0 6px 18px rgba(91,124,242,0.12); }

    .btn {
      display:inline-block; width:100%; padding:12px; border-radius:10px;
      background: linear-gradient(90deg,#566ff7,#6f4df0);
      color:#fff; font-weight:700; border:0; cursor:pointer; font-size:15px;
    }

    .error {
      background:#fff5f6; color:#b31d2e; padding:10px 12px; border-radius:8px;
      border-left:4px solid #e63b4a; margin-bottom:12px; font-size:14px;
    }

    footer.page-foot { text-align:center; padding:28px 12px; color:#889; font-size:14px; }

    @media (max-width:900px){
      .hero-inner{ flex-direction:column; align-items:stretch; gap:24px; }
      .hero-copy { text-align:center; }
      .login-panel { margin:0 auto; }
    }
  </style>
</head>
<body>

  <header class="site-top" role="banner">
    <div class="brand">
      <a href="TS.php"><img src="IMG/LogoTechsolutions.png" alt="TechSolutions"></a>
      <div class="brand-name" style="font-weight:700;color:#222">TechSolutions</div>
    </div>

    <nav class="main-nav" role="navigation" aria-label="Main">
      <a href="TS.php">Accueil</a>
      <a href="Services.php">Services</a>
      <a href="Actualites.php">Actualités</a>
      <a href="Contact.php">Contact</a>
    </nav>

    <div class="actions">
      <a href="#" style="color:#7b7f8a; text-decoration:none; margin-right:8px;">Espace Client</a>
      <a href="admin_login.php" style="background:#ffffff; padding:8px 14px; border-radius:10px; box-shadow:0 8px 20px rgba(46,52,151,0.12); text-decoration:none; color:#24307a; font-weight:700;">Admin</a>
    </div>
  </header>

  <main>
    <section class="hero" aria-hidden="false">
      <div class="hero-inner">
        <div class="hero-copy">
          <h1>Solutions Technologiques Innovantes pour Votre Entreprise</h1>
          <p>Accédez à l'espace d'administration pour gérer le contenu et les composants. Connectez‑vous avec vos identifiants.</p>
        </div>

        <div class="login-panel" role="form" aria-labelledby="admin-login-title">
          <div class="logo">
            <img src="IMG/LogoTechsolutions.png" alt="Logo">
          </div>

          <h3 id="admin-login-title" style="text-align:center; margin:6px 0 16px; font-size:20px;">Espace Admin</h3>

          <?php if ($error): ?>
            <div class="error"><?php echo htmlspecialchars($error); ?></div>
          <?php endif; ?>

          <form method="POST" autocomplete="off" novalidate>
            <div class="form-group">
              <label for="username">Nom d'utilisateur</label>
              <input id="username" name="username" type="text" required placeholder="admin">
            </div>

            <div class="form-group">
              <label for="password">Mot de passe</label>
              <input id="password" name="password" type="password" required placeholder="••••••••">
            </div>

            <button class="btn" type="submit">Se connecter</button>
          </form>

          <div style="text-align:center; margin-top:12px;">
            <a href="TS.php" style="color:#5b7cf2; text-decoration:none; font-weight:600;">← Retour à l'accueil</a>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer class="page-foot">© 2025 TechSolutions</footer>

</body>
</html>