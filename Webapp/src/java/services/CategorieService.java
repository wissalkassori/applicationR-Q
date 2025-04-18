package services;

import dao2.CategorieDao;
import entities.Categorie;
import java.util.List;

public class CategorieService implements IService<Categorie> {
    private final CategorieDao dao;

    public CategorieService() {
        this.dao = new CategorieDao();
    }

    @Override
    public boolean create(Categorie o) {
        return dao.create(o);
    }

    @Override
    public boolean delete(Categorie o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(Categorie o) {
        return dao.update(o);
    }

    @Override
    public List<Categorie> findAll() {
        return dao.findAll();
    }

    @Override
    public Categorie findById(int id) {
        return dao.findById(id);
    }
}
