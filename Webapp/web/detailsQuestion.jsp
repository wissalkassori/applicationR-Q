<%-- 
    Document   : detailsQuestion
    Created on : 26 avr. 2025, 03:01:23
    Author     : Hp
--%>

<%@ page import="entities.Question, java.util.List, entities.Reponse" %>
<%@ include file="header.jsp" %>

<h2>${question.titre}</h2>
<p>${question.contenu}</p>
<p>Catégorie : ${question.categorie.nom}</p>

<hr>
<h3>Réponses</h3>
<div id="reponses">
    <c:forEach var="rep" items="${listeReponses}">
        <div><strong>${rep.user.login}</strong>: ${rep.contenu}</div>
    </c:forEach>
</div>

<form id="formReponse">
    <input type="hidden" name="questionId" value="${question.id}" />
    <textarea name="contenu" required></textarea>
    <button type="submit">Envoyer</button>
</form>

<script>
    document.getElementById("formReponse").onsubmit = function(e) {
        e.preventDefault();
        fetch("ajouterReponse", {
            method: "POST",
            body: new FormData(this)
        }).then(res => res.text()).then(html => {
            document.getElementById("reponses").innerHTML = html;
            this.reset();
        });
    };
</script>

<%@ include file="footer.jsp" %>
