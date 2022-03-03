package sdg.demo.java;
import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.jboss.resteasy.annotations.jaxrs.PathParam;



@Path("/v1/api/sdg/demo/person")
public class SDGDemoController {
	
    private final EmployeeRepository empRepository;
	
	
	public SDGDemoController(EmployeeRepository empRepository) {
        this.empRepository = empRepository;
		
	}
	
	@GET
	@Path("/title/name/{name}")
	public String getEmployeeTitle(@PathParam String  name) {
		
		Employee emp = empRepository.findByEmployeename(name);
        if(emp != null) {
        	return emp.getEmployeetitle();
        } else {
        	return "No Name find";
        }
	}
	
	@GET
	@Path("/all")
	@Produces("application/json")
	
	public List<Employee> getAllEmployee() {
		
		List<Employee> emp = empRepository.findAll();
        return emp;
	}
	
	@POST
	@Path("/name/{name}/title/{title}")
    @Produces("application/json")
    public Employee addNewUser(@PathParam String name, @PathParam String title) {
		Employee user = new Employee();
        user.setEmployeename(name);
        user.setEmployeetitle(title);
        empRepository.save(user);
        return user;
    }
	
		
}
