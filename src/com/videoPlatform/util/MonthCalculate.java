package com.videoPlatform.util;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class MonthCalculate {
	
	private Date startDatetime;
	private Date endDatetime;
	
	public MonthCalculate(Date startDatetime, Date endDatetime) {
		super();
		this.startDatetime = startDatetime;
		this.endDatetime = endDatetime;
	}
	
	public List<String> calculateAndOutput(){
		
		List<String> xAxisValueList = new ArrayList<String>();
		
		Integer startDatetime_year = Integer.parseInt( startDatetime.toString().substring(0, 4) );
		Integer startDatetime_month = Integer.parseInt( startDatetime.toString().substring(5, 7) );

		Integer endDatetime_year = Integer.parseInt( endDatetime.toString().substring(0, 4) );
		Integer endDatetime_month = Integer.parseInt( endDatetime.toString().substring(5, 7) );//起止日期的格式调整成整形的年度和月份数字
		
		Integer yearDiff = endDatetime_year - startDatetime_year;
		Integer monthDiff = endDatetime_month - startDatetime_month;//计算差值
		
		Integer totalMonthNum = getTotalMonth(yearDiff, monthDiff);
		double average_interval_monthNum = totalMonthNum / 12;
		Integer ceil  = (int) Math.ceil(average_interval_monthNum);
		Integer floor = (int) Math.floor(average_interval_monthNum);
		if(totalMonthNum <= 12){
			//起止时间小于等于12个月时，x轴仅显示相差的月份数目
			for(int i = 0; i < totalMonthNum; i++){
				startDatetime_month++;
				if( startDatetime_month > 12 ){
					startDatetime_year++;
					startDatetime_month = 1;
				}
				
				String temp = startDatetime_year.toString() + "-" + ( (startDatetime_month < 10)?("0"+startDatetime_month.toString()):startDatetime_month.toString() );
				xAxisValueList.add( temp );
			}
		}else{
			//起止时间大于12个月时，x轴根据平均的间隔选取12个点作为横坐标轴
			for(int i= 0; i < 12; i++){
				//偶数次间隔较小，奇数次间隔较大
				if( i % 2 == 0 ){
					startDatetime_month += ceil;
				}else{
					startDatetime_year += floor;
				}
				//防止跨年
				if(startDatetime_month > 12){
					startDatetime_year++;
					startDatetime_month -= 12;
				}
				String temp = startDatetime_year.toString() + startDatetime_month.toString();
				xAxisValueList.add( temp );
			}
		}
		
		return xAxisValueList;
	}
	
	public Integer getTotalMonth(Integer yearDiff, Integer monthDiff){
		
		Integer totalMonthNum = 0;
		totalMonthNum = yearDiff * 12 + monthDiff ;
		return totalMonthNum;
	}
	

}
