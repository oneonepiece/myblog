package com.site.blog.my.core.controller.blog;

import com.site.blog.my.core.service.DemojServices;
import com.site.blog.my.core.testentity.Student;
import com.site.blog.my.core.util.PageQueryUtil;
import com.site.blog.my.core.util.Result;
import com.site.blog.my.core.util.ResultGenerator;
import com.site.blog.my.core.util.websocket.MessageQueueUtil;
import com.site.blog.my.core.util.websocket.RoomUtil;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/restapi")
public class TestRestful {

    @Resource
    private DemojServices DemojServices;


    /*
     *聊天室获取历史消息
     */
    @GetMapping({ "/getmessage"})
    public LinkedList getMessageAll(HttpServletRequest request){

        MessageQueueUtil room1 = RoomUtil.getRoom(1);
        return room1.getAll();
    }


    //http://127.0.0.1:8080/restapi/api1?page=0&limit=5
    @GetMapping({ "/api1"})
    public Result respJSON(HttpServletRequest request ,@RequestParam Map<String, Object> params){

        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return null;
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);

        List<Student> stus =  DemojServices.getStudentList(pageUtil.getPage() , pageUtil.getLimit());

        return  ResultGenerator.genSuccessResult(stus);

    }


}
