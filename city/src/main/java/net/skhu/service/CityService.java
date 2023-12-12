package net.skhu.service;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import lombok.AllArgsConstructor;
import lombok.Data;
import net.skhu.entity.City;
import net.skhu.model.CityEdit;
import net.skhu.model.Pagination;
import net.skhu.repository.CityRepository;

@Service
public class CityService {

	@Data @AllArgsConstructor
    public class Order {
        int value;
        String label;
    }

    Order[] orders = new Order[] {
        new Order(0, "정렬 순서"),
        new Order(1, "도시명 오름차순"),
        new Order(2, "인구 내림차순"),
        new Order(3, "면적 내림차순"),
        new Order(4, "소속도명 오름차순")
    };

    Sort[] sorts = new Sort[] {
        Sort.by(Sort.Direction.ASC, "id"),
        Sort.by(Sort.Direction.ASC, "name"),
        Sort.by(Sort.Direction.DESC, "population"),
        Sort.by(Sort.Direction.DESC, "area"),
        Sort.by(Sort.Direction.ASC, "district.districtName"),
    };

    @Autowired CityRepository cityRepository;
    ModelMapper modelMapper = new ModelMapper();

    public Order[] getOrders() {
        return orders;
    }

    public CityEdit findOne(int id) {
    	City cityEntity = cityRepository.findById(id).get();
        return toEditModel(cityEntity);
    }

    public City findByName(String name) {
        return cityRepository.findByName(name);
    }

    public List<City> findAll(Pagination pagination) {
        int orderIndex = pagination.getOd();
        PageRequest pageRequest = PageRequest.of(pagination.getPg() - 1,
                pagination.getSz(), sorts[orderIndex]);
        Page<City> page;
        if (pagination.getSt().length() == 0)
            page = cityRepository.findAll(pageRequest);
        else
            page = cityRepository.findByNameStartsWithOrDistrictDistrictNameStartsWith(
                    pagination.getSt(), pagination.getSt(), pageRequest);
        pagination.setRecordCount((int)page.getTotalElements());
        return page.getContent();
    }

    public void insert(CityEdit cityEdit, BindingResult bindingResult,
            Pagination pagination) throws Exception {
        if (hasErrors(cityEdit, bindingResult))
            throw new Exception("입력 데이터 오류");
        City city = toEntity(cityEdit);
        cityRepository.save(city);
        pagination.setSt("");
        pagination.setOd(0);
        int lastPage = (int)Math.ceil((double)cityRepository.count() / pagination.getSz());
        pagination.setPg(lastPage);
    }

    public void update(CityEdit cityEdit,
            BindingResult bindingResult) throws Exception {
        if (hasErrors(cityEdit, bindingResult))
            throw new Exception("입력 데이터 오류");
        City city = toEntity(cityEdit);
        cityRepository.save(city);
    }

    public void delete(int id) {
        cityRepository.deleteById(id);
    }

    public City toEntity(CityEdit cityEdit) {
        return modelMapper.map(cityEdit, City.class);
    }

    public CityEdit toEditModel(City cityDto) {
        return modelMapper.map(cityDto, CityEdit.class);
    }

    public boolean hasErrors(CityEdit cityEdit, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) return true;
        City city2 = findByName(cityEdit.getName());
        if (city2 != null && city2.getId() != cityEdit.getId()) {
            bindingResult.rejectValue("name", null, "도시명이 중복됩니다.");
            return true;
        }
        return false;
    }
}