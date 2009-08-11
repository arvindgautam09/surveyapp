/**
 * 
 */
package com.okaya.services.survey.actions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Monika
 *
 */
public class TestAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<String> cities;
	private String myCity;
	private String state;
	private List<String> towns;
	
	public TestAction(){
		cities = new ArrayList<String>();
		cities.add("Patna");
		cities.add("Dhanbad");
		cities.add("Noida");
		cities.add("Manali");
		state = "Bihar";
		towns = new ArrayList<String>();
		towns.add("Ara");
		towns.add("Bhagalpur");
		towns.add("Chhapra");
		towns.add("Darbhanga");
		towns.add("Muzzafarpur");
		towns.add("Siwan");
		
		//myCity = "Dhanbad";
	}
	
	public String newCity(){
		System.out.println("Length of City Name:"+ myCity.length());
		return "SUCCESS";
	}
	
	public String places(){
		return "SUCCESS";
	}
	
	public String state(){
		if(myCity.equalsIgnoreCase("PATNA")){
			state = "Bihar";
		}else if (myCity.equalsIgnoreCase("DHANBAD")){
			state = "Jharkhand";
		}else if (myCity.equalsIgnoreCase("MANALI")){
			state = "Himachal Pradesh";
		}else if (myCity.equalsIgnoreCase("NOIDA")){
			state = "Uttar Pradesh";
		}else{
			state = "Don't Know";
		}
		return "SUCCESS";
	}
	
	public String towns() throws IOException{
		System.out.println("In towns.............");
		if(myCity.equalsIgnoreCase("PATNA")){
			state = "Bihar";
			towns.clear();
			towns.add("Ara");
			towns.add("Bhagalpur");
			towns.add("Chhapra");
			towns.add("Darbhanga");
			towns.add("Muzzafarpur");
			towns.add("Siwan");
		}else if (myCity.equalsIgnoreCase("DHANBAD")){
			state = "Jharkhand";
			towns.clear();
			towns.add("Ranchi");
			towns.add("Bokaro");
			towns.add("Jamshedpur");
		}else if (myCity.equalsIgnoreCase("MANALI")){
			state = "Himachal Pradesh";
			towns.clear();
			towns.add("Parwanoo");
			towns.add("Supti");
			towns.add("Kullu");
			towns.add("Manikaran");
		}else if (myCity.equalsIgnoreCase("NOIDA")){
			state = "Uttar Pradesh";
			towns.clear();
			towns.add("Varanasi");
			towns.add("Allahabad");
			towns.add("Mathura");
			towns.add("Ayodhya");
		}else{
			towns.clear();
			state = "Don't Know";
		}
		//out.print(towns);
		return "SUCCESS";
	}

	/**
	 * @return the cities
	 */
	public List<String> getCities() {
		return cities;
	}

	/**
	 * @param cities the cities to set
	 */
	public void setCities(List<String> cities) {
		this.cities = cities;
	}

	/**
	 * @return the myCity
	 */
	public String getMyCity() {
		return myCity;
	}

	/**
	 * @param myCity the myCity to set
	 */
	public void setMyCity(String myCity) {
		this.myCity = myCity;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @return the towns
	 */
	public List<String> getTowns() {
		return towns;
	}

	/**
	 * @param towns the towns to set
	 */
	public void setTowns(List<String> towns) {
		this.towns = towns;
	}
	
	
}
