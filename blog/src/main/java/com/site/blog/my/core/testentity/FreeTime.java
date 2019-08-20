package com.site.blog.my.core.testentity;

import java.util.ArrayList;
import java.util.Date;

/**
 * @author Lin
 *空闲时间段表
 *
 */
public class FreeTime {

	private Integer id;
	private Integer stuid;
    private String startTime;
    private String endTime;

    public FreeTime(){}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStuid() {
		return stuid;
	}

	public void setStuid(Integer stuid) {
		this.stuid = stuid;
	}

	public String getStartTime()
	{
		return startTime;
	}
	public void setStartTime(String startTime)
	{
		this.startTime = startTime;
	}
	public String getEndTime()
	{
		return endTime;
	}
	public void setEndTime(String endTime)
	{
		this.endTime = endTime;
	}

}
