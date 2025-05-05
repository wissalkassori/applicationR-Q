<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Categorie" %>
<%@ page import="entities.Question" %>
<%@ page import="dao.CategorieDao" %>
<%@ page import="dao.QuestionDao" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Statistiques</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

        canvas {
            margin-top: 30px;
            max-width: 600px;
            width: 90%;
            background: #ffffff;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            h2 {
                font-size: 24px;
            }
            canvas {
                width: 95%;
            }
        }
    </style>
</head>
<body>
    <h2>Statistiques : Questions par Catégorie</h2>
    <canvas id="statChart" width="400" height="200"></canvas>

    <%
        CategorieDao categorieDao = new CategorieDao();
        QuestionDao questionDao = new QuestionDao();
        List<Categorie> categories = categorieDao.findAll();
        List<Question> questions = questionDao.findAll();

        StringBuilder labels = new StringBuilder();
        StringBuilder data = new StringBuilder();

        for (Categorie c : categories) {
            int count = 0;
            for (Question q : questions) {
                if (q.getCategorie().getId() == c.getId()) {
                    count++;
                }
            }
            labels.append("'").append(c.getNom()).append("',");
            data.append(count).append(",");
        }
    %>

    <script>
        const ctx = document.getElementById('statChart').getContext('2d');
        const statChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [<%= labels.toString() %>],
                datasets: [{
                    label: 'Nombre de questions',
                    data: [<%= data.toString() %>],
                    backgroundColor: 'rgba(0, 150, 136, 0.5)',
                    borderColor: 'rgba(0, 150, 136, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>
