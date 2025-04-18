package controllers;

import entities.Categorie;
import services.CategorieService;

import java.util.List;

public class CategorieController {

    private final CategorieService service = new CategorieService();

    public boolean addCategorie(String nom) {
        return service.create(new Categorie(nom));
    }

    public boolean removeCategorie(int id) {
        Categorie c = service.findById(id);
        return c != null && service.delete(c);
    }

    public boolean updateCategorie(int id, String nouveauNom) {
        Categorie c = service.findById(id);
        if (c != null) {
            c.setNom(nouveauNom);
            return service.update(c);
        }
        return false;
    }

    public List<Categorie> getAllCategories() {
        return service.findAll();
    }

    public Categorie getCategorieById(int id) {
        return service.findById(id);
    }
}
