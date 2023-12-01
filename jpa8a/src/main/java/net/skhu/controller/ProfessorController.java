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
import net.skhu.model.ProfessorEdit;
import net.skhu.service.DepartmentService;
import net.skhu.service.ProfessorService;

@Controller
@RequestMapping("professor")
public class ProfessorController {

	@Autowired ProfessorService professorService;
    @Autowired DepartmentService departmentService;

    @GetMapping("list")
    public String list(Model model) {
        List<Professor> professors = professorService.findAll();
        model.addAttribute("professors", professors);
        return "professor/list";
    }

    @GetMapping("create")
    public String create(Model model) {
        ProfessorEdit professorEdit = new ProfessorEdit();
        List<Department> departments = departmentService.findAll();
        model.addAttribute("professorEdit", professorEdit);
        model.addAttribute("departments", departments);
        return "professor/edit";
    }

    @PostMapping("create")
    public String create(Model model,
            @Valid ProfessorEdit professorEdit, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("departments", departmentService.findAll());
            return "professor/edit";
        }
        Professor professor2 = professorService.findByName(professorEdit.getName());
        if (professor2 != null) {
            bindingResult.rejectValue("name", null, "이름이 중복됩니다.");
            model.addAttribute("departments", departmentService.findAll());
            return "professor/edit";
        }
        professorService.insert(professorEdit);
        return "redirect:list";
    }

    @GetMapping("edit")
    public String edit(Model model, int id) {
    	ProfessorEdit professorEdit = professorService.findOne(id);
        List<Department> departments = departmentService.findAll();
        model.addAttribute("professorEdit", professorEdit);
        model.addAttribute("departments", departments);
        return "professor/edit";
    }

    @PostMapping("edit")
    public String edit(Model model,
            @Valid ProfessorEdit professorEdit, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("departments", departmentService.findAll());
            return "professor/edit";
        }
        Professor professor2 = professorService.findByName(professorEdit.getName());
        if (professor2 != null && professor2.getId() != professorEdit.getId()) {
            bindingResult.rejectValue("Name", null, "이름이 중복됩니다.");
            model.addAttribute("departments", departmentService.findAll());
            return "professor/edit";
        }
        professorService.update(professorEdit);
        return "redirect:list";
    }

    @GetMapping("delete")
    public String delete(Model model, int id) {
    	professorService.delete(id);
        return "redirect:list";
    }
}