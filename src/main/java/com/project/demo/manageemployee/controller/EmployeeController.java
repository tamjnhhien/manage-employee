package com.project.demo.manageemployee.controller;

import com.project.demo.manageemployee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static com.project.demo.manageemployee.constant.CommonConst.*;

@RestController
@RequestMapping(API_V1)
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @GetMapping(value = GET_EMPLOYEE_ALL, produces = JSON_UTF8)
    public ResponseEntity<?> getEmployeeList() {
        return ResponseEntity.ok(employeeService.getEmployeeList());
    }
}
