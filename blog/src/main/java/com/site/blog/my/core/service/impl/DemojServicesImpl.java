package com.site.blog.my.core.service.impl;

import com.site.blog.my.core.dao.DemojMapper;
import com.site.blog.my.core.service.DemojServices;
import com.site.blog.my.core.testentity.FreeTime;
import com.site.blog.my.core.testentity.Student;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DemojServicesImpl implements DemojServices {

    @Resource
    DemojMapper demojMapper;

    @Override
    public List<Student> getStudentList(Integer start , Integer limit) {

        return demojMapper.selectStudentByKey(start , limit);
    }

    @Override
    public Student getStudentBystuid(Integer stuid) {
        return demojMapper.selectStudentBYstuid(stuid);
    }

    @Override
    public List<FreeTime> getFreeTimeBYstuid(int stuid) {
        return demojMapper.selectFreeTimeBYstuid(stuid);
    }
}
