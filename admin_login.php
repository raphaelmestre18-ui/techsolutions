<?php
// filepath: c:\xampp\htdocs\techsolutions\admin_login.php
session_start();

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';

    // Connexion DB
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
        $error = 'Veuillez remplir tous les champs';
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>TechSolutions — Admin Login</title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="fichier_css.css">
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
      margin: 0;
    }
    .login-container {
      background: white;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 10px 40px rgba(0,0,0,0.2);
      width: 100%;
      max-width: 400px;
    }
    .login-container h1 {
      text-align: center;
      color: #333;
      margin-bottom: 30px;
      font-size: 24px;
    }
    .login-container .logo {
      text-align: center;
      margin-bottom: 20px;
    }
    .login-container .logo img {
      height: 50px;
      width: auto;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-group label {
      display: block;
      margin-bottom: 8px;
      color: #555;
      font-weight: 600;
    }
    .form-group input {
      width: 100%;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 14px;
      box-sizing: border-box;
      transition: border-color 0.3s;
    }
    .form-group input:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 5px rgba(102, 126, 234, 0.3);
    }
    .error {
      background: #fee;
      color: #c33;
      padding: 12px;
      border-radius: 5px;
      margin-bottom: 20px;
      border-left: 4px solid #c33;
    }
    .btn-login {
      width: 100%;
      padding: 12px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: transform 0.2s;
    }
    .btn-login:hover {
      transform: translateY(-2px);
    }
    .back-link {
      text-align: center;
      margin-top: 20px;
    }
    .back-link a {
      color: #667eea;
      text-decoration: none;
      font-size: 14px;
    }
    .back-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="login-container">
    <div class="logo">
      <img src="IMG/LogoTechsolutions.png" alt="TechSolutions">
    </div>
    <h1>Espace Admin</h1>
    
    <?php if ($error): ?>
      <div class="error"><?php echo htmlspecialchars($error); ?></div>
    <?php endif; ?>

    <form method="POST">
      <div class="form-group">
        <label for="username">Nom d'utilisateur</label>
        <input type="text" id="username" name="username" required placeholder="admin" autocomplete="off">
      </div>

      <div class="form-group">
        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" required placeholder="••••••••">
      </div>

      <button type="submit" class="btn-login">Se connecter</button>
    </form>

    <div class="back-link">
      <a href="TS.php">← Retour à l'accueil</a>
    </div>
  </div>

</body>
</html>