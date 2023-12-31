package net.skhu.service;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.skhu.dto.Movie;
import net.skhu.mapper.MovieMapper;
import net.skhu.model.MovieEdit;

@Service
public class MovieService {

    @Autowired
    MovieMapper movieMapper;
    ModelMapper modelMapper = new ModelMapper();

    public MovieEdit findOne(int id) {
    	Movie movieDto = movieMapper.findOne(id);
        return toEditModel(movieDto);
    }

    public Movie findByTitle(String title) {
        return movieMapper.findByTitle(title);
    }

    public List<Movie> findAll() {
        return movieMapper.findAll();
    }

    public void insert(MovieEdit movieEdit,
            BindingResult bindingResult) throws Exception {
        if (hasErrors(movieEdit, bindingResult))
            throw new Exception("입력 데이터 오류");
        Movie movie = toDto(movieEdit);
        movieMapper.insert(movie);
    }

    public void update(MovieEdit movieEdit,
            BindingResult bindingResult) throws Exception {
        if (hasErrors(movieEdit, bindingResult))
            throw new Exception("입력 데이터 오류");
        Movie movie = toDto(movieEdit);
        movieMapper.update(movie);
    }

    public void delete(int id) {
        movieMapper.delete(id);
    }

    public Movie toDto(MovieEdit movieEdit) {
        return modelMapper.map(movieEdit, Movie.class);
    }

    public MovieEdit toEditModel(Movie movieDto) {
        return modelMapper.map(movieDto, MovieEdit.class);
    }

    public boolean hasErrors(MovieEdit movieEdit, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) return true;
        Movie movie2 = findByTitle(movieEdit.getTitle());
        if (movie2 != null && movie2.getId() != movieEdit.getId()) {
            bindingResult.rejectValue("title", null, "제목이 중복됩니다.");
            return true;
        }
        return false;
    }
}
