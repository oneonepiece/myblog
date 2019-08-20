package com.site.blog.my.core.service;

import com.site.blog.my.core.testentity.FreeTime;
import com.site.blog.my.core.testentity.Student;


import java.util.List;

public interface DemojServices {

    List<Student> getStudentList(Integer start ,Integer limit);
    Student getStudentBystuid(Integer stuid);
    List<FreeTime> getFreeTimeBYstuid(int stuid);
}
