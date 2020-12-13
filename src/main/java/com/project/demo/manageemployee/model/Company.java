package com.project.demo.manageemployee.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "company")
@Getter
@Setter
public class Company extends AuditModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long companyId;

    @Column(columnDefinition = "text")
    private String companyName;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "managerId", nullable = false)
    private Employee employee;
}
