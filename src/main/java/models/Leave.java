package models;

public class Leave {
	private int typeID;
	private String leave_type_name, total_days , emp_type,leave_description;

	public int getTypeID() {
		return typeID;
	}

    public String getLeave_description() {
        return leave_description;
    }

    public void setLeave_description(String leave_description) {
        this.leave_description = leave_description;
    }

	public void setTypeID(int typeID) {
		this.typeID = typeID;
	}

	public String getEmp_type() {
		return emp_type;
	}

	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}

	public String getLeave_type_name() {
		return leave_type_name;
	}

	public void setLeave_type_name(String leave_type_name) {
		this.leave_type_name = leave_type_name;
	}

	public String getTotal_days() {
		return total_days;
	}

	public void setTotal_days(String total_days) {
		this.total_days = total_days;
	}

	public Leave(int typeID, String emp_type, String leave_type_name, String total_days) {
	
		this.typeID = typeID;
		this.emp_type = emp_type;
		this.leave_type_name = leave_type_name;
		this.total_days = total_days;
	}

	public Leave(String leave_type_name, String total_days, String emp_type) {
	
		this.emp_type = emp_type;
		this.leave_type_name = leave_type_name;
		this.total_days = total_days;
	}

	public Leave(int typeID) {
		
		this.typeID = typeID;
	}

	public Leave() {
		
	}

}
