package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.entity.District;
import net.skhu.repository.DistrictRepository;

@Service
public class DistrictService {

	@Autowired
    public DistrictRepository districtRepository;

    public List<District> findAll() {
        return districtRepository.findAll();
    }
}