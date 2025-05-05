<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entities.Question" %>
<%@ page import="entities.Reponse" %>
<%@ page import="dao.QuestionDao" %>
<%@ page import="dao.ReponseDao" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détail Question</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #f0f4c3, #ffffff);
            margin: 0;
            padding: 30px;
            color: #333;
            text-align: center;
        }
        .container {
            max-width: 800px;
            margin: auto;
        }
        .question {
            background: #fff9c4;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        .reponses {
            background: #f1f8e9;
            padding: 20px;
            border-radius: 12px;
            text-align: left;
        }
        .reponse-form textarea {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 10px;
        }
        .reponse-form button {
            background-color: #558b2f;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 8px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<%
    int id = 0;
    try {
        id = Integer.parseInt(request.getParameter("id"));
    } catch (Exception e) {
        out.println("<h2 style='color:red;'>❌ ID de question invalide.</h2>");
        return;
    }

    QuestionDao qdao = new QuestionDao();
    ReponseDao rdao = new ReponseDao();
    Question question = qdao.findById(id);

    if (question == null) {
%>
    <h2 style="color:red;">❌ La question avec l'ID <%= id %> n'existe pas.</h2>
    <p>Veuillez vérifier l’URL ou insérer une question avec cet ID.</p>
<%
        return;
    }

    List<Reponse> reponses = rdao.findAll();
%>

<div class="container">
    <div class="question">
        <h2><%= question.getTitre() %></h2>
        <p><%= question.getContenu() %></p>
    </div>

    <div class="reponses" id="reponseList">
        <h3>Réponses</h3>
        <%
            for (Reponse r : reponses) {
                if (r.getQuestion().getId() == id) {
        %>
            <p>💬 <%= r.getContenu() %></p>
        <%
                }
            }
        %>
    </div>

    <div class="reponse-form">
        <form id="reponseForm">
            <textarea name="contenu" placeholder="Votre réponse..." required></textarea>
            <input type="hidden" name="questionId" value="<%= id %>">
            <button type="submit">Publier</button>
        </form>
    </div>
</div>

<script>
    $('#reponseForm').submit(function(e) {
        e.preventDefault();
        $.post('AjouterReponseServlet', $(this).serialize(), function() {
            const contenu = $('textarea[name="contenu"]').val();
            $('#reponseList').append('<p>💬 ' + contenu + '</p>');
            $('textarea[name="contenu"]').val('');
        });
    });
</script>

</body>
</html>
