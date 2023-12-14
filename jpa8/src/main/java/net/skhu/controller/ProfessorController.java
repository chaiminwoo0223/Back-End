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
import net.skhu.entity.Department;
import net.skhu.entity.Professor;
import net.skhu.model.Pagination;
import net.skhu.model.ProfessorEdit;
import net.skhu.service.DepartmentService;
import net.skhu.service.ProfessorService;

@Controller
@RequestMapping("professor")
public class ProfessorController {

	@Autowired ProfessorService professorService;
    @Autowired DepartmentService departmentService;

    @GetMapping("list")
    public String list(Model model, Pagination pagination) {
        List<Professor> professors = professorService.findAll(pagination);
        model.addAttribute("professors", professors);
        model.addAttribute("orders", professorService.getOrders());
        return "professor/list";
    }

    @GetMapping("create")
    public String create(Model model, Pagination pagination) {
        ProfessorEdit professorEdit = new ProfessorEdit();
        List<Department> departments = departmentService.findAll();
        model.addAttribute("professorEdit", professorEdit);
        model.addAttribute("departments", departments);
        return "professor/edit";
    }

    @PostMapping("create")
    public String create(Model model, Pagination pagination,
            @Valid ProfessorEdit professorEdit, BindingResult bindingResult) {
    	try {
    		professorService.insert(professorEdit, bindingResult, pagination);
            return "redirect:list?" + pagination.getQueryString();
        }
        catch (Exception e) {
            model.addAttribute("departments", departmentService.findAll());
            bindingResult.rejectValue("", null, "등록할 수 없습니다.");
            return "professor/edit";
        }
    }

    @GetMapping("edit")
    public String edit(Model model, int id, Pagination pagination) {
    	ProfessorEdit professorEdit = professorService.findOne(id);
        List<Department> departments = departmentService.findAll();
        model.addAttribute("professorEdit", professorEdit);
        model.addAttribute("departments", departments);
        return "professor/edit";
    }

    @PostMapping(value="edit", params="cmd=save")
    public String edit(Model model, Pagination pagination,
            @Valid ProfessorEdit professorEdit, BindingResult bindingResult) {
        try {
        	professorService.update(professorEdit, bindingResult);
            return "redirect:list?" + pagination.getQueryString();
        }
        catch (Exception e) {
            model.addAttribute("departments", departmentService.findAll());
            bindingResult.rejectValue("", null, "수정할 수 없습니다.");
            return "professor/edit";
        }
    }

    @PostMapping(value="edit", params="cmd=delete")
    public String delete(Model model, Pagination pagination,
            ProfessorEdit professorEdit, BindingResult bindingResult) {
        try {
        	professorService.delete(professorEdit.getId());
            return "redirect:list?" + pagination.getQueryString();
        }
        catch (Exception e) {
            model.addAttribute("departments", departmentService.findAll());
            bindingResult.rejectValue("", null, "삭제할 수 없습니다.");
            return "professor/edit";
        }
    }
}