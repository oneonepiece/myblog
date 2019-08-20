package com.site.blog.my.core.controller.blog;

import com.site.blog.my.core.entity.WebSocketUser;
import com.site.blog.my.core.util.websocket.MessageQueueUtil;
import com.site.blog.my.core.util.websocket.RoomUtil;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;


/**
 * websocket 控制器
 */

@Controller
public class GreetingController {

//    @MessageMapping("/hello")
//    @SendTo("/topic/greetings")
//    public Greeting greeting(WebSocketUser message) throws Exception {
//        Thread.sleep(1000); // simulated delay
//        return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
//    }

    /*
    *发送消息并应答
    *
     */
    @MessageMapping("/message_send")
    @SendTo("/topic/reply")
    public WebSocketUser receiving(WebSocketUser message ) throws Exception {
        Thread.sleep(500); // simulated delay
        //return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
        if (message.getUserid() <0 || message.getName() ==null){
            return null;
        }
        //String userid = session.getId();
        MessageQueueUtil room1 = RoomUtil.getRoom(1);
        room1.put(message);
        return message;
    }


}