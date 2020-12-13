package com.project.demo.manageemployee.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;

@Data
@Builder
@Embeddable
@AllArgsConstructor
@NoArgsConstructor
public class TeamDto {
    private Long teamId;
    private String teamName;
    private String description;
    private DepartmentDto department;
}
