package com.misha.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.misha.model.SitterRegistration;

@Repository
public interface SitterRepository  extends CrudRepository<SitterRegistration, Integer>{
	
		//String countDistanceQuery = "(3959 * ACOS(COS(RADIANS(28.6147086)) * COS(RADIANS(lat)) * COS(RADIANS(lng) - RADIANS(77.3242727)) + SIN(RADIANS(28.6147086)) * SIN(RADIANS(lat)))) AS DISTANCE";
		
		String countDistanceQuery = "(3959 * ACOS(COS(RADIANS(:latitude)) * COS(RADIANS(lat)) * COS(RADIANS(lng) - RADIANS(:longitude)) + SIN(RADIANS(:latitude)) * SIN(RADIANS(lat)))) AS DISTANCE";

	  @Query(value = "SELECT *, "+countDistanceQuery+" FROM sitterdetails a WHERE a.address LIKE %:address% HAVING DISTANCE < 25 ORDER BY DISTANCE LIMIT 0, 20" , nativeQuery = true)
	  public List<SitterRegistration> findByAddressAndSort(String address, String latitude, String longitude);
	 
}

