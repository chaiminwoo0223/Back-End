package net.skhu.model;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class BookEdit {
	int id;

    @NotEmpty @NotBlank
    @Size(min=1, max=10)
    String title;

    @NotEmpty @NotBlank
    @Size(min=1, max=10)
    String author;

    @NotEmpty @NotBlank
    @Pattern(regexp="[0-9]{4,5}",
             message="가격을 입력하세요 예:00000")
    int price;

    @NotEmpty @NotBlank
    @Size(min=1, max=10)
    String publisher;

    @Min(value=1, message="카테고리를 선택하세요.")
    int categoryId;
}
