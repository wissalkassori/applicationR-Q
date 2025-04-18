package services;

import dao2.AdminDao;
import entities.Admin;
import java.util.List;

public class AdminService implements IService<Admin> {
    private final AdminDao dao = new AdminDao();

    @Override
    public boolean create(Admin o) {
        return dao.create(o);
    }

    @Override
    public boolean delete(Admin o) {
        return dao.delete(o);
    }

    @Override
    public boolean update(Admin o) {
        return dao.update(o);
    }

    @Override
    public List<Admin> findAll() {
        return dao.findAll();
    }

    @Override
    public Admin findById(int id) {
        return dao.findById(id);
    }
}
