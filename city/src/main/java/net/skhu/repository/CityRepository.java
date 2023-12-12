package net.skhu.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import net.skhu.entity.City;

public interface CityRepository extends JpaRepository<City, Integer> {

	City findByName(String name);

    Page<City> findByNameStartsWithOrDistrictDistrictNameStartsWith(
            String name, String districtName, Pageable pageable);
}