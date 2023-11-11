package net.skhu.service;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.skhu.dto.Professor;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.model.ProfessorEdit;

@Service
public class ProfessorService {

	@Autowired
    ProfessorMapper professorMapper;
	ModelMapper modelMapper = new ModelMapper();

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
    	return modelMapper.map(professorEdit, Professor.class);
    }

    public ProfessorEdit toEditModel(Professor professorDto) {
    	return modelMapper.map(professorDto, ProfessorEdit.class);
    }

    public boolean hasErrors(ProfessorEdit professorEdit, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) return true;
        return false;
    }
}