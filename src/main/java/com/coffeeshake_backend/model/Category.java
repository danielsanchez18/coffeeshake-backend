package com.coffeeshake_backend.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idCategory;
    private String nameCategory;

    @OneToMany(mappedBy = "category")
    private Set<Product> products = new HashSet<>();

    public Category() { }

    public Category(Long idCategory, String nameCategory) {
        this.idCategory = idCategory;
        this.nameCategory = nameCategory;
    }

    public Long getIdCategory() { return idCategory; }
    public void setIdCategory(Long idCategory) { this.idCategory = idCategory; }
    public String getNameCategory() { return nameCategory; }
    public void setNameCategory(String nameCategory) { this.nameCategory = nameCategory; }
}
