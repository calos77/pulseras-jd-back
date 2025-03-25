package com.pulserasjd.jewelry;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.SQLDelete;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "PRODUCTS")
@SQLDelete(sql = "UPDATE PRODUCTS P SET P.status = 1")
public class Product {

    private Long id;
    private String name;
    private String description;
    private Double price;
    private String mainImage;
    private Long category;
    private Long status;
    private String materials;
}
