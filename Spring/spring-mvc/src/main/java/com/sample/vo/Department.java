package com.sample.vo;

public class Department {

	private int id;
	private String name;
	private int managerId;
	private int locationId;
	
	public Department() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + ", managerId=" + managerId + ", locationId=" + locationId
				+ "]";
	}
	
}
