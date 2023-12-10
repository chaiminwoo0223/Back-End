package net.skhu.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class ProfessorEdit {
	int id;

    @NotEmpty @NotBlank
    @Size(min=2, max=12)
    String name;

    @NotEmpty @NotBlank
    @Pattern(regexp="010-[0-9]{3,4}-[0-9]{4}", message="휴대폰 번호를 입력하세요. 예:010-000-0000")
    String phone;

    @NotEmpty @Email
    String email;

    @NotEmpty @NotBlank
    @Pattern(regexp="[0-9]{4}", message="연구실을 입력하세요. 예:0000")
    String office;

    @Min(value=1, message="학과를 선택하세요.")
    int departmentId;
}