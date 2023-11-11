package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import lombok.AllArgsConstructor;
import lombok.Data;
import net.skhu.dto.Book;
import net.skhu.model.Pagination;

@Mapper
public interface BookMapper {

    @Data
    @AllArgsConstructor
    public class Order {
        int value;
        String label;
    }

    Order[] orders = new Order[] {
        new Order(0, "정렬 순서"),
        new Order(1, "제목 오름차순"),
        new Order(2, "제목 내림차순"),
        new Order(3, "가격 오름차순"),
        new Order(4, "카테고리 오름차순")
    };

	@Select("""
            SELECT b.*, c.name categoryName
            FROM book b LEFT JOIN category c ON b.categoryId = c.id
            WHERE #{st} = '' OR
              b.title LIKE CONCAT('%', #{st}, '%') OR
              c.name LIKE CONCAT('%', #{st}, '%')
            ORDER BY
              (CASE WHEN #{od} = 0 THEN b.id END) ASC,
              (CASE WHEN #{od} = 1 THEN b.title END) ASC,
              (CASE WHEN #{od} = 2 THEN b.title END) DESC,
              (CASE WHEN #{od} = 3 THEN b.price END) ASC,
              (CASE WHEN #{od} = 4 THEN c.name END) ASC
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
