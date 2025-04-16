package entities;

import javax.persistence.*;

@Entity
public class Reponse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String contenu;

    @ManyToOne
    private Question question;

    @ManyToOne
    private User user;

    public Reponse() {}

    public Reponse(String contenu, Question question, User user) {
        this.contenu = contenu;
        this.question = question;
        this.user = user;
    }

    public Reponse(Question question, User user, String tu_dois_utiliser_HibernateUtil_et_bien_co) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getContenu() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

 
}
