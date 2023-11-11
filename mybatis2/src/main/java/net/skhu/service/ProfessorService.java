package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.dto.Professor;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.model.ProfessorEdit;

@Service
public class ProfessorService {

	@Autowired
    ProfessorMapper professorMapper;

    public ProfessorEdit findOne(int id) {
    	Professor professorDto = professorMapper.findOne(id);
        return toEditModel(professorDto);
    }

    public List<Professor> findAll() {
        return professorMapper.findAll();
    }

    public void insert(ProfessorEdit professorEdit) {
    	Professor professor = toDto(professorEdit);
        professorMapper.insert(professor);
    }

    public void update(ProfessorEdit professorEdit) {
    	Professor professor = toDto(professorEdit);
        professorMapper.update(professor);
    }

    public void delete(int id) {
        professorMapper.delete(id);
    }

    public Professor toDto(ProfessorEdit professorEdit) {
    	Professor professorDto = new Professor();
    	professorDto.setId(professorEdit.getId());
    	professorDto.setName(professorEdit.getName());
    	professorDto.setDepartmentId(professorEdit.getDepartmentId());
    	professorDto.setDepartmentName(professorEdit.getDepartmentName());
    	professorDto.setEmail(professorEdit.getEmail());
    	professorDto.setPhone(professorEdit.getPhone());
    	professorDto.setOffice(professorEdit.getOffice());
        return professorDto;
    }

    public ProfessorEdit toEditModel(Professor professorDto) {
    	ProfessorEdit professorEdit = new ProfessorEdit();
    	professorEdit.setId(professorDto.getId());
    	professorEdit.setName(professorDto.getName());
    	professorEdit.setDepartmentId(professorDto.getDepartmentId());
    	professorEdit.setDepartmentName(professorDto.getDepartmentName());
    	professorEdit.setEmail(professorDto.getEmail());
    	professorEdit.setPhone(professorDto.getPhone());
    	professorEdit.setOffice(professorDto.getOffice());
        return professorEdit;
    }
}
