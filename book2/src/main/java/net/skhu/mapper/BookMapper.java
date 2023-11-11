package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.skhu.dto.Book;
import net.skhu.model.Pagination;

@Mapper
public interface BookMapper {

	@Select("""
            SELECT b.*, c.name categoryName
            FROM book b LEFT JOIN category c ON b.categoryId = c.id
            WHERE #{st} = '' OR
            b.title LIKE CONCAT('%', #{st}, '%') OR
            c.name LIKE CONCAT('%', #{st}, '%')
            LIMIT #{firstRecordIndex}, #{sz} """)
    List<Book> findAll(Pagination pagination);

    @Select("""
    		SELECT COUNT(*)
    		FROM book b LEFT JOIN category c ON b.categoryId = c.id
            WHERE #{st} = '' OR
            b.title LIKE CONCAT('%', #{st}, '%') OR
            c.name LIKE CONCAT('%', #{st}, '%') """)
    int getCount(Pagination pagination);

    @Select("SELECT * FROM book WHERE id = #{id}")
    Book findOne(int id);

    @Select("SELECT * FROM book WHERE title = #{title}")
    Book findByTitle(String title);

    @Insert("""
        INSERT book (title, author, categoryId, price, publisher, categoryName)
        VALUES (#{title}, #{author}, #{categoryId}, #{price}, #{publisher}, #{categoryName}) """)
    @Options(useGeneratedKeys=true, keyProperty="id")
    void insert(Book book);

    @Update("""
        UPDATE book SET
          title= #{title},
          author = #{author},
          categoryId = #{categoryId},
          price = #{price},
          publisher = #{publisher},
          categoryName = #{categoryName}
        WHERE id = #{id} """)
    void update(Book book);

    @Delete("DELETE FROM book WHERE id = #{id}")
    void delete(int id);
}
