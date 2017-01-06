package com.videoPlatform.util;

/**
 * 
 * 上传状态类
 * 
 */
public class Progress {
 
 /** 已读字节 **/
 private long bytesRead = 0L;
 /** 已读MB **/
 private String mbRead = "0";
 /** 总长度 **/
 private long contentLength = 0L;
 /****/
 private int items;
 /** 已读百分比 **/
 private String percent;
 
 private NumUtil numUtil;
 
 public long getBytesRead() {
  return bytesRead;
 }
 
 public void setBytesRead(long bytesRead) {
  this.bytesRead = bytesRead;
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
 
 public String getPercent() {
  percent = numUtil.getPercent(bytesRead, contentLength);
  return percent;
 }
 
 public void setPercent(String percent) {
  this.percent = percent;
 }

 
 public String getMbRead() {
  mbRead = numUtil.divideNumber(bytesRead, 1000000);
  return mbRead;
 }
 
 public void setMbRead(String mbRead) {
  this.mbRead = mbRead;
 }
 
}
