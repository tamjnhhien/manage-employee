package com.project.demo.manageemployee.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.List;

import static com.project.demo.manageemployee.constant.CommonConst.*;
import static com.project.demo.manageemployee.constant.CommonConst.POSITION_NONE;

@Data
@Builder
@Embeddable
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeDto implements Serializable {
    private Long employeeId;
    private String employeeName;
    private Integer age;
    private String gender;
    private String position;
    List<TeamDto> teams;

    public void setGender(Boolean isFemale) {
        if (isFemale) {
            this.gender = GENDER_FEMALE;
        } else {
            this.gender = GENDER_MALE;
        }
    }

    public void setPosition(Integer position) {
        switch (position) {
            case 0:
                this.position = POSITION_CEO;
                break;
            case 1:
                this.position = POSITION_PM;
                break;
            case 2:
                this.position = POSITION_DEV;
                break;
            case 3:
                this.position = POSITION_TEST;
                break;
            case 4:
                this.position = POSITION_COMTOR;
                break;
            default:
                this.position = POSITION_NONE;
                break;
        }
    }
}
