package net.skhu.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Data
@Entity
public class City {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    String name;
    int population;
    int area;

    @ManyToOne
    @JoinColumn(name = "districtId")
    District district;
}