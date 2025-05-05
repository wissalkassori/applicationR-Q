<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Question" %>
<%@ page import="entities.Categorie" %>
<%@ page import="entities.User" %>
<%@ page import="dao.QuestionDao" %>
<%@ page import="dao.CategorieDao" %>
<%@ page import="dao.UserDao" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Questions</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #ffffff, #e0f7fa);
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        h2 {
            font-size: 28px;
            color: #00796b;
            margin-bottom: 30px;
        }

        ul {
            list-style: none;
            padding: 0;
            max-width: 600px;
            margin: auto;
        }

        li {
            background: #b2dfdb;
            margin: 10px 0;
            padding: 15px;
            border-radius: 10px;
            text-align: left;
        }

        li a {
            text-decoration: none;
            font-size: 18px;
            color: #004d40;
            font-weight: bold;
        }

        li a:hover {
            text-decoration: underline;
        }

        form {
            margin-top: 40px;
            background: #e0f2f1;
            padding: 20px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            border-radius: 10px;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        button {
            padding: 10px 20px;
            background-color: #00796b;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #004d40;
        }
    </style>
</head>
<body>
    <h2>Liste des Questions</h2>
    <ul>
        <%
            String categorieIdParam = request.getParameter("categorieId");
            int categorieId = categorieIdParam != null ? Integer.parseInt(categorieIdParam) : 0;
            QuestionDao questionDao = new QuestionDao();
            CategorieDao categorieDao = new CategorieDao();
            List<Question> questions = questionDao.findAll();

            for (Question q : questions) {
                if (categorieId == 0 || q.getCategorie().getId() == categorieId) {
        %>
            <li>
                <a href="question_detail.jsp?id=<%= q.getId() %>">
                    <%= q.getTitre() %><br>
                    <span style="font-size: 14px; color: gray;">Catégorie : <%= q.getCategorie().getNom() %></span>
                </a>
            </li>
        <%
                }
            }
        %>
    </ul>

    <h2>Ajouter une nouvelle question</h2>
    <form method="post">
        <input type="text" name="titre" placeholder="Titre de la question" required />
        <textarea name="contenu" placeholder="Contenu de la question" rows="4" required></textarea>
        <select name="categorieId" required>
            <option value="">-- Choisir une catégorie --</option>
            <%
                List<Categorie> categories = categorieDao.findAll();
                for (Categorie c : categories) {
            %>
                <option value="<%= c.getId() %>"><%= c.getNom() %></option>
            <%
                }
            %>
        </select>
        <button type="submit">Publier la question</button>
    </form>

    <%
        // Traitement du formulaire
        String titre = request.getParameter("titre");
        String contenu = request.getParameter("contenu");
        String catIdStr = request.getParameter("categorieId");

        if (titre != null && contenu != null && catIdStr != null) {
            int catId = Integer.parseInt(catIdStr);
            Categorie categorie = categorieDao.findById(catId);

            // Exemple utilisateur fictif
            User user = new User("invite", "123"); // Remplacer par utilisateur connecté
            UserDao userDao = new UserDao();
            userDao.create(user); // évite erreurs si utilisateur pas encore en base

            Question nouvelle = new Question(titre, contenu, categorie, user);
            questionDao.create(nouvelle);
            response.sendRedirect("questions.jsp"); // Rafraîchissement après ajout
        }
    %>
</body>
</html>
