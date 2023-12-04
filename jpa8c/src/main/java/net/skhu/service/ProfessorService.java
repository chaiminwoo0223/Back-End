package net.skhu.service;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.skhu.entity.Professor;
import net.skhu.model.ProfessorEdit;
import net.skhu.repository.ProfessorRepository;

@Service
public class ProfessorService {

	@Autowired ProfessorRepository professorRepository;
    ModelMapper modelMapper = new ModelMapper();

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

    public void insert(ProfessorEdit professorEdit,
            BindingResult bindingResult) throws Exception {
        if (hasErrors(professorEdit, bindingResult))
            throw new Exception("입력 데이터 오류");
        Professor professor = toDto(professorEdit);
        professorRepository.save(professor);
    }

    public void update(ProfessorEdit professorEdit,
            BindingResult bindingResult) throws Exception {
        if (hasErrors(professorEdit, bindingResult))
            throw new Exception("입력 데이터 오류");
        Professor professor = toDto(professorEdit);
        professorRepository.save(professor);
    }

    public void delete(int id) {
        professorRepository.deleteById(id);
    }

    public Professor toDto(ProfessorEdit professorEdit) {
        return modelMapper.map(professorEdit, Professor.class);
    }

    public ProfessorEdit toEditModel(Professor professorDto) {
        return modelMapper.map(professorDto, ProfessorEdit.class);
    }

    public boolean hasErrors(ProfessorEdit professorEdit, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) return true;
        Professor professor2 = findByName(professorEdit.getName());
        if (professor2 != null && professor2.getId() != professorEdit.getId()) {
            bindingResult.rejectValue("name", null, "이름이 중복됩니다.");
            return true;
        }
        return false;
    }
}