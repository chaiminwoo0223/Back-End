package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.entity.Department;
import net.skhu.entity.Professor;
import net.skhu.model.ProfessorEdit;
import net.skhu.repository.ProfessorRepository;

@Service
public class ProfessorService {
	@Autowired
    ProfessorRepository professorRepository;

    public ProfessorEdit findOne(int id) {
        Professor professorEntity = professorRepository.findById(id).get();
        return toEditModel(professorEntity);
    }

    public Professor findByName(String name) {
        return professorRepository.findByName(name);
    }

    public List<Professor> findAll() {
        return professorRepository.findAll();
    }

    public void insert(ProfessorEdit professorEdit) {
        Professor professor = toEntity(professorEdit);
        professorRepository.save(professor);
    }

    public void update(ProfessorEdit professorEdit) {
        Professor professor = toEntity(professorEdit);
        professorRepository.save(professor);
    }

    public void delete(int id) {
        professorRepository.deleteById(id);
    }

    public Professor toEntity(ProfessorEdit professorEdit) {
        Professor professorEntity = new Professor();
        professorEntity.setId(professorEdit.getId());
        professorEntity.setName(professorEdit.getName());
        Department department = new Department();
        department.setId(professorEdit.getDepartmentId());
        professorEntity.setDepartment(department);
        professorEntity.setPhone(professorEdit.getPhone());
        professorEntity.setEmail(professorEdit.getEmail());
        professorEntity.setOffice(professorEdit.getOffice());
        return professorEntity;
    }

    public ProfessorEdit toEditModel(Professor professorEntity) {
    	ProfessorEdit professorEdit = new ProfessorEdit();
    	professorEdit.setId(professorEntity.getId());
    	professorEdit.setName(professorEntity.getName());
    	professorEdit.setDepartmentId(professorEntity.getDepartment().getId());
    	professorEdit.setPhone(professorEntity.getPhone());
    	professorEdit.setEmail(professorEntity.getEmail());
    	professorEdit.setOffice(professorEntity.getOffice());
        return professorEdit;
    }
}