package entities;

import javax.persistence.*;

@Entity
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String titre;
    private String contenu;

    @ManyToOne
    private Categorie categorie;

    @ManyToOne
    private User user;

    public Question() {}

    public Question(String titre, String contenu, Categorie categorie, User user) {
        this.titre = titre;
        this.contenu = contenu;
        this.categorie = categorie;
        this.user = user;
    }

    // Getters & setters

    public String getTitre() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
