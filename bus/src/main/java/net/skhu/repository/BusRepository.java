package net.skhu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.skhu.entity.Bus;

public interface BusRepository extends JpaRepository<Bus, Integer> {

	Bus findByBusNo(String busNo);
    List<Bus> findByFirstStop(String firstStop);
    List<Bus> findByCategoryId(int id);
    List<Bus> findByCategoryCategoryName(String categoryName);
    List<Bus> findByOrderByFirstBus();

}
