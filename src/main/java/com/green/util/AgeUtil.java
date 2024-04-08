package com.green.util;

import java.time.LocalDate;
import java.time.Period;
import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class AgeUtil {
	 public static int calculateAgeFromDate(Date birthDate) {
	        // java.sql.Date를 java.time.LocalDate로 직접 변환합니다.
	        LocalDate birthLocalDate = birthDate.toLocalDate();
	        LocalDate currentDate = LocalDate.now();
	        return Period.between(birthLocalDate, currentDate).getYears();
	    }
}
