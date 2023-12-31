package net.skhu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.skhu.entity.Professor;

public interface ProfessorRepository extends JpaRepository<Professor, Integer> {

	Professor findByName(String name);
}