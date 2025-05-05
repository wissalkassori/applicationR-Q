<%-- 
    Document   : register
    Created on : 5 mai 2025, 00:01:21
    Author     : Hp
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card p-4 shadow-sm">
        <h3 class="text-center">Créer un compte</h3>
        <form action="register" method="post">
            <div class="mb-3">
                <label for="login" class="form-label">Nom d'utilisateur</label>
                <input type="text" name="login" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Mot de passe</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <button class="btn btn-primary w-100">S'inscrire</button>
        </form>
    </div>
</div>

</body>
</html>
