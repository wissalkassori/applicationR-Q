<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Categorie" %>
<%@ page import="dao.CategorieDao" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Catégories</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            margin: 0;
            padding: 0;
            text-align: center;
            color: #333;
        }

        h2 {
            margin-top: 40px;
            font-size: 28px;
            color: #00796b;
        }

        form {
            margin: 20px auto;
            max-width: 400px;
        }

        input[type="text"] {
            padding: 10px;
            width: 70%;
            border: 1px solid #ccc;
            border-radius: 10px;
            margin-right: 10px;
        }

        button {
            padding: 10px 20px;
            border: none;
            background-color: #00796b;
            color: white;
            border-radius: 10px;
            cursor: pointer;
        }

        button:hover {
            background-color: #004d40;
        }

        ul {
            list-style: none;
            padding: 0;
            max-width: 500px;
            margin: 30px auto;
        }

        li {
            background: #b2dfdb;
            margin: 10px 0;
            padding: 12px;
            border-radius: 10px;
        }

        li a {
            text-decoration: none;
            color: #004d40;
            font-weight: bold;
        }

        li a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h2>Liste des Catégories</h2>

    <!-- Formulaire d'ajout de catégorie -->
    <form method="post">
        <input type="text" name="nomCategorie" placeholder="Nouvelle catégorie" required />
        <button type="submit">Ajouter</button>
    </form>

    <ul>
        <%
            CategorieDao categorieDao = new CategorieDao();

            // Traitement de l'ajout
            String nomCat = request.getParameter("nomCategorie");
            if (nomCat != null && !nomCat.trim().isEmpty()) {
                Categorie nouvelleCat = new Categorie(nomCat.trim());
                categorieDao.create(nouvelleCat);
            }

            // Affichage des catégories
            List<Categorie> categories = categorieDao.findAll();
            for (Categorie c : categories) {
        %>
            <li>
                <a href="questions.jsp?categorieId=<%= c.getId() %>"><%= c.getNom() %></a>
            </li>
        <%
            }
        %>
    </ul>
</body>
</html>
