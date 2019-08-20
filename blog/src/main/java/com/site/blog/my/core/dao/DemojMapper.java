package com.site.blog.my.core.dao;


import com.site.blog.my.core.testentity.FreeTime;
import com.site.blog.my.core.testentity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DemojMapper {

    List<Student> selectStudentByKey(@Param("start") Integer start , @Param("limit") Integer limit);

    Student selectStudentBYstuid(int stuid);

    List<FreeTime> selectFreeTimeBYstuid(int stuid);
}
