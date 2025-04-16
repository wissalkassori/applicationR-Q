package test;

import dao.*;
import entities.*;
import java.util.List;
import util.HibernateUtil;

public class Test {
    public static void main(String[] args) {

        // Initialisation de Hibernate
        HibernateUtil.getSessionFactory();

        // ------------------ Test Categorie ------------------
        System.out.println("==> Test Categorie");
        CategorieDao cd = new CategorieDao();
        Categorie cat = new Categorie("Informatique");
        cd.create(cat);
       //cd.delete(cd.findById(1));

        for (Categorie c : cd.findAll()) {
            System.out.println("Categorie: " + c.getNom());
        }

        System.out.println("==> Test User");
        UserDao ud = new UserDao();
        User user = new User("wissal", "pass123");
        ud.create(user);

        for (User u : ud.findAll()) {
            System.out.println("User: " + u.getLogin());
        }

        // ------------------ Test Admin ------------------
       System.out.println("==> Test Admin");

         // Création de l'instance du DAO
         AdminDao adminDao = new AdminDao();
         Admin admin = new Admin("admin", "admin123");

         adminDao.create(admin);

        for (Admin a : adminDao.findAll()) {
        System.out.println("Admin: " + a.getLogin() + " | Mot de passe: " + a.getPassword());
        }
        
        System.out.println("==> Test Question");
        QuestionDao qd = new QuestionDao();
        Question question = new Question("Comment utiliser Hibernate ?", "Je veux apprendre à utiliser Hibernate.", cat, user);
        qd.create(question);

        for (Question q : qd.findAll()) {
            System.out.println("Question: " + q.getTitre());
        }
        
        System.out.println("==> Test Reponse");
        ReponseDao rd = new ReponseDao();
        Reponse reponse = new Reponse(question, user, "Tu dois utiliser HibernateUtil et bien configurer hibernate.cfg.xml.");
        rd.create(reponse);

        for (Reponse r : rd.findAll()) {
            System.out.println("Réponse: " + r.getContenu());
        }

        System.out.println("==> Test terminé avec succès ");
    }
}
