package sdg.demo.java;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "employee")
public class Employee {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	private String employeename;
	private String employeetitle;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEmployeename() {
		return employeename;
	}
	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}
	public String getEmployeetitle() {
		return employeetitle;
	}
	public void setEmployeetitle(String employeetitle) {
		this.employeetitle = employeetitle;
	}
	
	/*
	public String searchTitleByName(String name) {
		return myconn.searchEmpTitle(name);
	}
*/
}
