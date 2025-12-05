<?php
$db_host = '127.0.0.1';
$db_name = 'techsolutions';
$db_user = 'root';
$db_pass = '';

try {
    $pdo = new PDO("mysql:host=$db_host;dbname=$db_name;charset=utf8mb4", $db_user, $db_pass);
    
    $username = 'admin';
    $password = 'admin123';
    $hash = password_hash($password, PASSWORD_DEFAULT);

    $stmt = $pdo->prepare('INSERT IGNORE INTO admins (username, password_hash) VALUES (?, ?)');
    $stmt->execute([$username, $hash]);
    
    echo "✅ Admin créé avec succès !<br>";
    echo "Login: <strong>admin</strong><br>";
    echo "Password: <strong>admin123</strong><br><br>";
    echo "<a href='admin_login.php'>Aller à la connexion Admin</a>";
} catch (Exception $e) {
    echo "❌ Erreur: " . $e->getMessage();
}
?>