package services;

import dao2.ReponseDao;
import entities.Reponse;
import java.util.List;

public class ReponseService implements IService<Reponse> {
    private final ReponseDao dao = new ReponseDao();

    @Override
    public boolean create(Reponse o) {
        return dao.create(o);
    }

    @Override
    public boolean delete(Reponse o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(Reponse o) {
        return dao.update(o);
    }

    @Override
    public List<Reponse> findAll() {
        return dao.findAll();
    }

    @Override
    public Reponse findById(int id) {
        return dao.findById(id);
    }
}
