package com.project.demo.manageemployee.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "employee")
@Getter
@Setter
public class Employee extends AuditModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long employeeId;

    @Column(columnDefinition = "text")
    private String employeeName;

    @Column(columnDefinition = "integer")
    private Integer age;

    @Column(columnDefinition = "boolean")
    private boolean gender;

    @Column(columnDefinition = "integer")
    private Integer position;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "employee_team", joinColumns = @JoinColumn(name = "employeeId"),
            inverseJoinColumns = @JoinColumn(name = "teamId"))
    private List<Team> teams;
}
