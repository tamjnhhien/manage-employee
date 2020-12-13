package com.project.demo.manageemployee.service.impl;

import com.project.demo.manageemployee.dto.EmployeeDto;
import com.project.demo.manageemployee.repository.EmployeeRepository;
import com.project.demo.manageemployee.service.EmployeeService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import static com.project.demo.manageemployee.constant.CommonConst.LIMIT_DATA;
import static com.project.demo.manageemployee.constant.CommonConst.PAGE;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;

    @Override
    public List<EmployeeDto> getEmployeeList() {
        ModelMapper modelMapper = new ModelMapper();
        var employeeList = employeeRepository.findAll(PageRequest.of(PAGE, LIMIT_DATA)).toList();
        return employeeList.stream().map(employee -> modelMapper.map(employee, EmployeeDto.class))
                .collect(Collectors.toList());
    }
}
