<%-- 
    Document   : mesQuestions
    Created on : 26 avr. 2025, 03:03:05
    Author     : Hp
--%>

<%@ page import="entities.User, java.util.List, entities.Question" %>
<%@ include file="header.jsp" %>

<h2>Mes Questions</h2>
<c:forEach var="q" items="${mesQuestions}">
    <div><a href="detailsQuestion.jsp?id=${q.id}">${q.titre}</a></div>
</c:forEach>

<h2>Mes Réponses</h2>
<c:forEach var="r" items="${mesReponses}">
    <div>Sur <a href="detailsQuestion.jsp?id=${r.question.id}">${r.question.titre}</a> : ${r.contenu}</div>
</c:forEach>

<%@ include file="footer.jsp" %>
