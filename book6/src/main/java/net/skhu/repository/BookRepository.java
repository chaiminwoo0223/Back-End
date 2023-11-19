package net.skhu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.skhu.entity.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {

	Book findByAuthor(String author);
    List<Book> findByTitle(String title);
    List<Book> findByTitleStartsWith(String title);
    List<Book> findByCategoryName(String name);
    List<Book> findByCategoryNameStartsWith(String name);

    List<Book> findByOrderByTitle();
    List<Book> findByOrderByTitleDesc();
    List<Book> findByCategoryIdOrderByTitleDesc(int id);

}
