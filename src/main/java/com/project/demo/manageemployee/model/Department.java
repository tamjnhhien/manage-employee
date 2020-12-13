package com.project.demo.manageemployee.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "department")
@Getter
@Setter
public class Department extends AuditModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long departmentId;

    @Column(columnDefinition = "text")
    private String departmentName;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "managerId", nullable = false)
    private Employee employee;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "companyId", nullable = false)
    private Company company;
}
