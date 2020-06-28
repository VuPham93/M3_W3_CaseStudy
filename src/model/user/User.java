package model.user;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private double balance;
    private List<String> roles;

    public User(int id, String name, String email, String password, double balance, String... roles) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.balance = balance;
        this.roles = new ArrayList<String>();
        if (roles != null) {
            this.roles.addAll(Arrays.asList(roles));
        }
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }
}
