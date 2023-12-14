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
import net.skhu.entity.Professor;
import net.skhu.model.Pagination;
import net.skhu.model.ProfessorEdit;
import net.skhu.repository.ProfessorRepository;

@Service
public class ProfessorService {

	@Data @AllArgsConstructor
    public class Order {
        int value;
        String label;
    }

	Order[] orders = new Order[] {
		new Order(0, "정렬 순서"),
	    new Order(1, "이름 오름차순"),
	    new Order(2, "이름 내림차순"),
	    new Order(3, "학과 오름차순"),
	    new Order(4, "연구실 오름차순")
	};

	Sort[] sorts = new Sort[] {
	    Sort.by(Sort.Direction.ASC, "id"),
	    Sort.by(Sort.Direction.ASC, "name"),
	    Sort.by(Sort.Direction.DESC, "name"),
	    Sort.by(Sort.Direction.ASC, "department.name"),
	    Sort.by(Sort.Direction.ASC, "office"),
	};

    @Autowired ProfessorRepository professorRepository;
    ModelMapper modelMapper = new ModelMapper();

    public Order[] getOrders() {
        return orders;
    }

    public ProfessorEdit findOne(int id) {
    	Professor professorEntity = professorRepository.findById(id).get();
        return toEditModel(professorEntity);
    }

    public Professor findByName(String name) {
        return professorRepository.findByName(name);
    }

    public List<Professor> findAll(Pagination pagination) {
    	int orderIndex = pagination.getOd();
        PageRequest pageRequest = PageRequest.of(pagination.getPg() - 1,
        		pagination.getSz(), sorts[orderIndex]);
        Page<Professor> page;
        if (pagination.getSt().length() == 0)
            page = professorRepository.findAll(pageRequest);
        else
            page = professorRepository.findByNameOrOfficeStartsWithOrDepartmentNameStartsWith(
                    pagination.getSt(), pagination.getSt(), pagination.getSt(), pageRequest);
        pagination.setRecordCount((int)page.getTotalElements());
        return page.getContent();
    }

    public void insert(ProfessorEdit professorEdit, BindingResult bindingResult,
            Pagination pagination) throws Exception {
        if (hasErrors(professorEdit, bindingResult))
            throw new Exception("입력 데이터 오류");
        Professor professor = toEntity(professorEdit);
        professorRepository.save(professor);
        pagination.setSt("");
        pagination.setOd(0);
        int lastPage = (int)Math.ceil((double)professorRepository.count() / pagination.getSz());
        pagination.setPg(lastPage);
    }

    public void update(ProfessorEdit professorEdit,
            BindingResult bindingResult) throws Exception {
        if (hasErrors(professorEdit, bindingResult))
            throw new Exception("입력 데이터 오류");
        Professor professor = toEntity(professorEdit);
        professorRepository.save(professor);
    }

    public void delete(int id) {
        professorRepository.deleteById(id);
    }

    public Professor toEntity(ProfessorEdit professorEdit) {
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