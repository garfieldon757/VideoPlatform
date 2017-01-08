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
		Integer endDatetime_month = Integer.parseInt( endDatetime.toString().substring(5, 7) );//起止日期的格式调整成整形的年度、月份、日期数字
		
		Integer yearDiff = endDatetime_year - startDatetime_year;
		Integer monthDiff = endDatetime_month - startDatetime_month;//计算差值
		
		Integer totalMonthNum = getTotalMonthNum(yearDiff, monthDiff);
		double average_interval_monthNum = totalMonthNum / 12;
		
		if(totalMonthNum <= 12){
			
			//起止时间小于等于12个月时，x轴仅显示相差的月份数目
			Integer index = 0;
			
			String temp = startDatetime_year.toString() + "-" + ( (startDatetime_month < 10)?("0"+startDatetime_month.toString()):startDatetime_month.toString() );
			xAxisValueList.add( temp );
			
			for(int i = 0; i <= totalMonthNum; i++, index++){
				startDatetime_month++;
				if( startDatetime_month > 12 ){
					startDatetime_year++;
					startDatetime_month = startDatetime_month - 12;
				}
				temp = startDatetime_year.toString() + "-" + ( (startDatetime_month < 10)?("0"+startDatetime_month.toString()):startDatetime_month.toString() );
				xAxisValueList.add( temp );
				
				if(i == totalMonthNum){
					break;
				}
			}
			
			temp = "";
			xAxisValueList.add(temp);
			//注意返回之后记得对空值进行判断，避免不必要的错误
			
		}else{
			//起止时间大于12个月时，x轴显示按照月份差的平均值作为单位间距
			Integer floor = (int) Math.floor(average_interval_monthNum);
			
			String temp = startDatetime_year.toString() + "-" + ( (startDatetime_month < 10)?("0"+startDatetime_month.toString()):startDatetime_month.toString() );
			xAxisValueList.add( temp );
			
			for(int i=0; i < 12; i++) 
			{
				startDatetime_month += floor ;
				if( startDatetime_month > 12 )
				{
					startDatetime_year++;
					startDatetime_month = startDatetime_month - 12;
				}
				temp = startDatetime_year.toString() + "-" + ( (startDatetime_month < 10)?("0"+startDatetime_month.toString()):startDatetime_month.toString() );
				xAxisValueList.add( temp );
			}
			
			for(int i = 0; i < (totalMonthNum % 12); i += floor)
			{
				startDatetime_month += floor ;
				if( startDatetime_month > 12 )
				{
					startDatetime_year++;
					startDatetime_month = startDatetime_month - 12;
				}
				temp = startDatetime_year.toString() + "-" + ( (startDatetime_month < 10)?("0"+startDatetime_month.toString()):startDatetime_month.toString() );
				xAxisValueList.add( temp );
			}//将剩余的月份按照间隔添加数据点
			
			startDatetime_month += floor ;
			if( startDatetime_month > 12 )
			{
				startDatetime_year++;
				startDatetime_month = startDatetime_month - 12;
			}
			temp = startDatetime_year.toString() + "-" + ( (startDatetime_month < 10)?("0"+startDatetime_month.toString()):startDatetime_month.toString() );
			xAxisValueList.add( temp );
			
			temp = "";
			xAxisValueList.add(temp);
			//注意返回之后记得对空值进行判断，避免不必要的错误
			
		}
		
		return xAxisValueList;
	}
	
	public Integer getTotalMonthNum(Integer yearDiff, Integer monthDiff){
		
		Integer totalMonthNum = 0;
		totalMonthNum = yearDiff * 12 + monthDiff ;
		return totalMonthNum;
	}
	
	public Integer getTotalDaysNum(Integer yearDiff, Integer monthDiff, Integer dayDiff){
		Integer totalDaysNum = 0;
		totalDaysNum = yearDiff * 365 + monthDiff * 12 + dayDiff;
		return totalDaysNum;
	}
	

}
