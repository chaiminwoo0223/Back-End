package net.skhu.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import net.skhu.entity.Professor;

public interface ProfessorRepository extends JpaRepository<Professor, Integer> {

	Professor findByName(String name);

	Page<Professor> findByNameOrOfficeStartsWithOrDepartmentNameStartsWith(
            String name, String office, String departmentName, Pageable pageable);
}