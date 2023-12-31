package net.skhu.service;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.skhu.entity.Student;
import net.skhu.model.StudentEdit;
import net.skhu.repository.StudentRepository;

@Service
public class StudentService {

    @Autowired StudentRepository studentRepository;
    ModelMapper modelMapper = new ModelMapper();

    public StudentEdit findOne(int id) {
        Student studentDto = studentRepository.findById(id).get();
        return toEditModel(studentDto);
    }

    public Student findByStudentNo(String studentNo) {
        return studentRepository.findByStudentNo(studentNo);
    }

    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    public void insert(StudentEdit studentEdit,
            BindingResult bindingResult) throws Exception {
        if (hasErrors(studentEdit, bindingResult))
            throw new Exception("입력 데이터 오류");
        Student student = toDto(studentEdit);
        studentRepository.save(student);
    }

    public void update(StudentEdit studentEdit,
            BindingResult bindingResult) throws Exception {
        if (hasErrors(studentEdit, bindingResult))
            throw new Exception("입력 데이터 오류");
        Student student = toDto(studentEdit);
        studentRepository.save(student);
    }

    public void delete(int id) {
        studentRepository.deleteById(id);
    }

    public Student toDto(StudentEdit studentEdit) {
        return modelMapper.map(studentEdit, Student.class);
    }

    public StudentEdit toEditModel(Student studentDto) {
        return modelMapper.map(studentDto, StudentEdit.class);
    }

    public boolean hasErrors(StudentEdit studentEdit, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) return true;
        Student student2 = findByStudentNo(studentEdit.getStudentNo());
        if (student2 != null && student2.getId() != studentEdit.getId()) {
            bindingResult.rejectValue("studentNo", null, "학번이 중복됩니다.");
            return true;
        }
        return false;
    }
}