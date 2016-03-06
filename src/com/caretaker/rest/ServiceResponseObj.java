package com.caretaker.rest;

import java.sql.Date;
import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class ServiceResponseObj {
	//public String careTakeId;
	public List<String> services;
	//public String fromDate ;
	//public String toDate;
	//public int Rate;
	//public String BD;
	public ServiceResponseObj() {
	}

}
