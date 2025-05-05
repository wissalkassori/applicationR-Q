<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Bienvenue</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f2f1, #ffffff);
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            margin-top: 40px;
            font-size: 36px;
            color: #00796b;
        }

        nav {
            margin-top: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin: 10px 0;
        }

        a {
            text-decoration: none;
            font-size: 18px;
            color: #00796b;
            background-color: #b2dfdb;
            padding: 10px 20px;
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        a:hover {
            background-color: #00796b;
            color: white;
        }

        @media (min-width: 768px) {
            ul {
                display: flex;
                justify-content: center;
                gap: 30px;
            }

            li {
                margin: 0;
            }
        }

        .login-container {
            background: white;
            padding: 30px;
            margin: 40px auto;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 90%;
            max-width: 400px;
            text-align: center;
        }

        .login-container h2 {
            color: #00796b;
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 16px;
        }

        button {
            background-color: #00796b;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
            margin-top: 15px;
            width: 100%;
        }

        button:hover {
            background-color: #004d40;
        }
    </style>
</head>
<body>
    <h1>Bienvenue sur l'application Q&R</h1>

    <nav>
        <ul>
            <li><a href="categories.jsp">Catégories</a></li>
            <li><a href="questions.jsp">Questions</a></li>
            <li><a href="question_detail.jsp?id=1">Détail d’une question + réponses</a></li>
            <li><a href="mes_contributions.jsp">Mes Questions/Réponses</a></li>
            <li><a href="statistiques.jsp">Statistiques</a></li>
        </ul>
    </nav>

    <div class="login-container">
        <h2>Connexion</h2>
        <form action="LoginController" method="post">
            <input type="text" name="login" placeholder="Nom d'utilisateur" required>
            <input type="password" name="password" placeholder="Mot de passe" required>
            <button type="submit">Se connecter</button>
        </form>
    </div>
</body>
</html>
