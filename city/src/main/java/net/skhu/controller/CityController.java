package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.validation.Valid;
import net.skhu.entity.City;
import net.skhu.entity.District;
import net.skhu.model.CityEdit;
import net.skhu.model.Pagination;
import net.skhu.service.CityService;
import net.skhu.service.DistrictService;

@Controller
@RequestMapping("city")
public class CityController {

	@Autowired CityService cityService;
    @Autowired DistrictService districtService;

    @GetMapping("list")
    public String list(Model model, Pagination pagination) {
        List<City> citys = cityService.findAll(pagination);
        model.addAttribute("citys", citys);
        model.addAttribute("orders", cityService.getOrders());
        return "city/list";
    }

    @GetMapping("create")
    public String create(Model model, Pagination pagination) {
    	CityEdit cityEdit = new CityEdit();
        List<District> districts = districtService.findAll();
        model.addAttribute("cityEdit", cityEdit);
        model.addAttribute("districts", districts);
        return "city/edit";
    }

    @PostMapping("create")
    public String create(Model model, Pagination pagination,
            @Valid CityEdit cityEdit, BindingResult bindingResult) {
        try {
            cityService.insert(cityEdit, bindingResult, pagination);
            return "redirect:list?" + pagination.getQueryString();
        }
        catch (Exception e) {
            model.addAttribute("districts", districtService.findAll());
            bindingResult.rejectValue("", null, "등록할 수 없습니다.");
            return "city/edit";
        }
    }

    @GetMapping("edit")
    public String edit(Model model, int id, Pagination pagination) {
    	CityEdit cityEdit = cityService.findOne(id);
        List<District> districts = districtService.findAll();
        model.addAttribute("cityEdit", cityEdit);
        model.addAttribute("districts", districts);
        return "city/edit";
    }

    @PostMapping(value="edit", params="cmd=save")
    public String edit(Model model, Pagination pagination,
            @Valid CityEdit cityEdit, BindingResult bindingResult) {
        try {
            cityService.update(cityEdit, bindingResult);
            return "redirect:list?" + pagination.getQueryString();
        }
        catch (Exception e) {
            model.addAttribute("districts", districtService.findAll());
            bindingResult.rejectValue("", null, "수정할 수 없습니다.");
            return "city/edit";
        }
    }

    @PostMapping(value="edit", params="cmd=delete")
    public String delete(Model model, Pagination pagination,
    		CityEdit cityEdit, BindingResult bindingResult) {
        try {
            cityService.delete(cityEdit.getId());
            return "redirect:list?" + pagination.getQueryString();
        }
        catch (Exception e) {
            model.addAttribute("districts", districtService.findAll());
            bindingResult.rejectValue("", null, "삭제할 수 없습니다.");
            return "city/edit";
        }
    }
}