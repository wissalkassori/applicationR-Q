package entities;

import javax.persistence.Entity;

@Entity
public class Admin extends User {

    public Admin() {
        super();
    }

    public Admin(String login, String password) {
        super(login, password);
    }

    // Tu peux ajouter ici des méthodes spécifiques à l'admin si besoin
}
