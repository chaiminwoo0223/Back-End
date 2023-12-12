package net.skhu.model;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class CityEdit {
	int id;

	@NotBlank@NotEmpty
    @Size(min=2, max=20)
    String name;

    @Min(value=1, message="인구를 선택하세요.")
    int population;

    @Min(value=1, message="면적을 선택하세요.")
    int area;

    @Min(value=1, message="도를 선택하세요.")
    int districtId;
}