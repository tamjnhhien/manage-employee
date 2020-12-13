package com.project.demo.manageemployee;

import com.project.demo.manageemployee.controller.EmployeeController;
import com.project.demo.manageemployee.dto.DepartmentDto;
import com.project.demo.manageemployee.dto.EmployeeDto;
import com.project.demo.manageemployee.dto.TeamDto;
import com.project.demo.manageemployee.service.EmployeeService;
import org.apache.tomcat.util.codec.binary.Base64;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.hasSize;
import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@WebMvcTest(EmployeeController.class)
class ManageEmployeeApplicationTests {

	@Autowired
	private MockMvc mvc;

	@MockBean
	private EmployeeService employeeService;

	@Test
	void contextLoads() throws Exception{
		DepartmentDto department = new DepartmentDto(1L , "department1");
		List<TeamDto> teams = Arrays.asList(new TeamDto(1L, "team1", "team Java", department));
		List<EmployeeDto> employeeList = IntStream.range(0, 10)
				.mapToObj(i -> new EmployeeDto(Long.valueOf(i), "hien " + i, 25 + i, "Female", "Developer", teams))
				.collect(Collectors.toList());

		given(employeeService.getEmployeeList()).willReturn(employeeList);

		String basicDigestHeaderValue = "Basic " + new String(Base64.encodeBase64(("admin:123456").getBytes()));

		for (int i = 1; i < 10; i++) {
			mvc.perform(get("/api/v1/employees").header("Authorization", basicDigestHeaderValue).contentType(MediaType.APPLICATION_JSON))
					.andExpect(status().isOk())
					.andExpect(jsonPath("$", hasSize(10)))
					.andExpect(jsonPath("$["+ i +"].employeeId", is(i)))
					.andExpect(jsonPath("$["+ i +"].employeeName", is("hien " + i)))
					.andExpect(jsonPath("$["+ i +"].age", is(25 + i)))
					.andExpect(jsonPath("$["+ i +"].gender", is("Female")))
					.andExpect(jsonPath("$["+ i +"].position", is("Developer")))
					.andExpect(jsonPath("$["+ i +"].teams.size()", is(teams.size())));
		}
	}
}
