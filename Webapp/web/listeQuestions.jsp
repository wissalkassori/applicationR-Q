<%-- 
    Document   : listeQuestions
    Created on : 26 avr. 2025, 03:00:23
    Author     : Hp
--%>

<%@ page import="java.util.List, entities.Question" %>
<%@ include file="header.jsp" %>

<h2>Liste des questions</h2>
<c:forEach var="q" items="${listeQuestions}">
    <div>
        <h3><a href="detailsQuestion.jsp?id=${q.id}">${q.titre}</a></h3>
        <p>Catégorie : ${q.categorie.nom} | Par : ${q.user.login}</p>
    </div>
</c:forEach>

<%@ include file="footer.jsp" %>

