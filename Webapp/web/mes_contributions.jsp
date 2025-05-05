<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entities.User, entities.Question, entities.Reponse" %>
<%@ page import="dao.QuestionDao, dao.ReponseDao" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mes Contributions</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f1f8e9;
            padding: 30px;
            text-align: center;
            color: #333;
        }
        h2 {
            color: #33691e;
        }
        ul {
            list-style: none;
            padding: 0;
            max-width: 700px;
            margin: auto;
            text-align: left;
        }
        li {
            background: #dcedc8;
            margin: 10px 0;
            padding: 15px;
            border-radius: 10px;
        }
        a {
            color: #2e7d32;
            font-weight: bold;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
%>
<h2>Mes Questions</h2>
<ul>
<%
    if (user != null) {
        QuestionDao qdao = new QuestionDao();
        for (Question q : qdao.findAll()) {
            if (q.getUser().getId() == user.getId()) {
%>
    <li>🟢 <a href="question_detail.jsp?id=<%= q.getId() %>"><%= q.getTitre() %></a></li>
<%
            }
        }
    } else {
%>
    <li>⚠️ Vous n'êtes pas connecté.</li>
<%
    }
%>
</ul>

<h2>Mes Réponses</h2>
<ul>
<%
    if (user != null) {
        ReponseDao rdao = new ReponseDao();
        for (Reponse r : rdao.findAll()) {
            if (r.getUser().getId() == user.getId()) {
%>
    <li>💬 <%= r.getContenu() %><br>➡️ Sur : <a href="question_detail.jsp?id=<%= r.getQuestion().getId() %>"><%= r.getQuestion().getTitre() %></a></li>
<%
            }
        }
    }
%>
</ul>
</body>
</html>
