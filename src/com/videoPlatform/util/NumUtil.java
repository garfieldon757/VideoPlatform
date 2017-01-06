package com.videoPlatform.util;

import java.text.DecimalFormat;

public class NumUtil {

	public String divideNumber(long dividedNum , long divideNum){
		long result = dividedNum / divideNum;
		DecimalFormat df = new DecimalFormat( "0.000 ");
		return df.format(result);
	}
	
	public String getPercent(long readBytes , long totalBytes){
		long result = readBytes / totalBytes;
		DecimalFormat df = new DecimalFormat( "0.000 ");
		return df.format(result);
	}
	
}
