package com.project.demo.manageemployee.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "team")
@Getter
@Setter
public class Team extends AuditModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long teamId;

    @Column(columnDefinition = "text")
    private String teamName;

    @Column(columnDefinition = "text")
    private String description;

    @ManyToMany(mappedBy = "teams", fetch = FetchType.LAZY)
    private Collection<Employee> employees;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "departmentId", nullable = false)
    private Department department;
}
