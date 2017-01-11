package com.videoPlatform.util;

import java.text.DecimalFormat;

/**
 * 
 * 上传状态类
 * 
 */
public class Progress {
 
 /** 已读字节 **/
 private long bytesRead = 0L;
 /** 已读MB **/
 private double mbRead = 0.00;
 /** 总长度 **/
 private long contentLength = 0L;
 /****/
 private int items;
 /** 已读百分比 **/
 private double percent;
public long getBytesRead() {
	return bytesRead;
}
public void setBytesRead(long bytesRead) {
	this.bytesRead = bytesRead;
}
public double getMbRead() {
	double result = (int)bytesRead / 1000000;
    return result;
}
public void setMbRead(double mbRead) {
	
	this.mbRead = mbRead;
}
public long getContentLength() {
	return contentLength;
}
public void setContentLength(long contentLength) {
	this.contentLength = contentLength;
}
public int getItems() {
	return items;
}
public void setItems(int items) {
	this.items = items;
}
public double getPercent() {
	double result = (double)bytesRead / (double)contentLength;
    return result;
}
public void setPercent(double percent) {
	this.percent = percent;
}
 
 
}
