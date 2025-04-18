package controllers;

import entities.Categorie;
import entities.Question;
import entities.User;
import services.QuestionService;

import java.util.List;

public class QuestionController {

    private final QuestionService service = new QuestionService();

    // Méthode pour ajouter une question avec l'utilisateur en paramètre
    public boolean addQuestion(String titre, String contenu, Categorie categorie, User user) {
        return service.create(new Question(titre, contenu, categorie, user));
    }

    public boolean deleteQuestion(int id) {
        Question q = service.findById(id);
        return q != null && service.delete(q);
    }

    public boolean updateQuestion(int id, String titre, String contenu) {
        Question q = service.findById(id);
        if (q != null) {
            q.setTitre(titre);
            q.setContenu(contenu);
            return service.update(q);
        }
        return false;
    }

    public List<Question> getAllQuestions() {
        return service.findAll();
    }

    public Question getQuestionById(int id) {
        return service.findById(id);
    }
}
