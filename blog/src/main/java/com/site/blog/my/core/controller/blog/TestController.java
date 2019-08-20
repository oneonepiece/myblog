package com.site.blog.my.core.controller.blog;

import com.site.blog.my.core.service.DemojServices;
import com.site.blog.my.core.testentity.FreeTime;
import com.site.blog.my.core.testentity.Student;
import com.site.blog.my.core.util.PageQueryUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
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

@Controller
@RequestMapping("/api")
public class TestController {

        public static String theme = "amaze";

        @Resource
        private com.site.blog.my.core.service.DemojServices DemojServices;


        /*
        *测试websocket
         */
    @GetMapping({ "/message"})
    public String message(HttpServletRequest request){

        return "blog/" + "summer" +"/springboot-websocket";
    }




        @GetMapping({ "/respjson"})
        public String respJSON(HttpServletRequest request){


            int a =0;
            int b = 5;
            List<Student> stus =  DemojServices.getStudentList( 0 ,5);
            for (Student s : stus){
                System.out.println(s.getName());
                List<FreeTime> free =  DemojServices.getFreeTimeBYstuid(s.getStuid());

                for (FreeTime fr:free){
                    System.out.println(fr.getStartTime());
                    System.out.println(fr.getEndTime());
                }
            }
            request.setAttribute("StudentList" , stus);
            request.setAttribute("FreeTime",  DemojServices.getFreeTimeBYstuid(12));

            return "blog/" + theme + "/demojstu";
        }

        @GetMapping("/get_stu_list")
        public String getStudentList(HttpServletRequest request , @RequestParam Map<String, Object> params) {

            if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
                return "eror/error_404";
            }

            PageQueryUtil pageUtil = new PageQueryUtil(params);
            int a =0;
            int b = 10;
            List<Student> stus =  DemojServices.getStudentList(a ,b);

            return "blog/" + theme + "/demojstu";
        }


    @GetMapping("/index")
    public String getStudentList(HttpServletRequest request) {

        return "blog/" + "summer" + "/index";
    }


}
