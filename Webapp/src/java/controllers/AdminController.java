package controllers;

import entities.Admin;
import services.AdminService;

import java.util.List;

public class AdminController {

    private final AdminService service = new AdminService();

    public boolean addAdmin(String login, String password) {
        return service.create(new Admin(login, password));
    }

    public boolean deleteAdmin(int id) {
        Admin admin = service.findById(id);
        return admin != null && service.delete(admin);
    }

    public boolean updateAdmin(int id, String login, String password) {
        Admin admin = service.findById(id);
        if (admin != null) {
            admin.setLogin(login);
            admin.setPassword(password);
            return service.update(admin);
        }
        return false;
    }

    public List<Admin> getAllAdmins() {
        return service.findAll();
    }

    public Admin getAdminById(int id) {
        return service.findById(id);
    }
}
