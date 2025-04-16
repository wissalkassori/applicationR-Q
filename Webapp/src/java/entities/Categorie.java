package entities;

import javax.persistence.*;

@Entity
public class Categorie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String nom;

    public Categorie() {}

    public Categorie(String nom) {
        this.nom = nom;
    }

    public int getId() {
        return id;
    }

    public Categorie(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
