package org.union.domain;

import java.util.Comparator;

public class PeriodComparator implements Comparator<PeriodMediaVO> {

	@Override
	public int compare(PeriodMediaVO first, PeriodMediaVO second) {

		int firstValue = first.getAllCount();
		int secondValue = second.getAllCount();

		if(firstValue > secondValue) {
			return -1;
			
		}else if (firstValue < secondValue) {
			return 1;
		
		}else {
			return 0;
		}
	}

}
