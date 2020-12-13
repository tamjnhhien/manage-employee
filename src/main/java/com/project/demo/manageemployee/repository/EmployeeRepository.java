package com.project.demo.manageemployee.repository;

import com.project.demo.manageemployee.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
}
