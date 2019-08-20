package com.site.blog.my.core.testentity;

import java.util.ArrayList;
import java.util.Date;

/**
 * @author Lin
 *学生表
 *
 */
public class Student {

	//数据库自增id
	private Integer id;
	//学生学号
    private Integer stuid;
    //名字
    private String name;

    public Student(){}

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

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

}
