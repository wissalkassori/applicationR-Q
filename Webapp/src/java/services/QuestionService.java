package services;

import dao2.QuestionDao;
import entities.Question;
import java.util.List;

public class QuestionService implements IService<Question> {
    private final QuestionDao dao = new QuestionDao();

    @Override
    public boolean create(Question o) {
        return dao.create(o);
    }

    @Override
    public boolean delete(Question o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(Question o) {
        return dao.update(o);
    }

    @Override
    public List<Question> findAll() {
        return dao.findAll();
    }

    @Override
    public Question findById(int id) {
        return dao.findById(id);
    }
}
