package controllers;

import entities.Question;
import entities.Reponse;
import entities.User;
import services.ReponseService;

import java.util.List;

public class ReponseController {

    private final ReponseService service = new ReponseService();

    public boolean addReponse(String contenu, Question question, User user) {
        return service.create(new Reponse(question, user, contenu));
    }

    public boolean deleteReponse(int id) {
        Reponse r = service.findById(id);
        return r != null && service.delete(r);
    }

    public boolean updateReponse(int id, String newContenu) {
        Reponse r = service.findById(id);
        if (r != null) {
            r.setContenu(newContenu);
            return service.update(r);
        }
        return false;
    }

    public List<Reponse> getAllReponses() {
        return service.findAll();
    }

    public Reponse getReponseById(int id) {
        return service.findById(id);
    }
}
