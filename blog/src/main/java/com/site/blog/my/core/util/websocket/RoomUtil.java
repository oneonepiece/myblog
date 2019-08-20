package com.site.blog.my.core.util.websocket;

import java.util.HashMap;

/**
 * RoomUtil  功能描述
 *
 * @Author Lin
 * @Description //TODO $
 * @Date $ $
 * @Param $
 * @return $
 * @Version 1.0
 */
public class RoomUtil {

    private static HashMap<Integer ,MessageQueueUtil > rooms = new HashMap<>();

    static {
        MessageQueueUtil room_1 = new MessageQueueUtil(1,10);
        rooms.put(room_1.getRoomid() , room_1);
    }

    public RoomUtil(){  }

    public static MessageQueueUtil getRoom(int roomid){
        if (rooms.isEmpty())return null;
        return rooms.get(roomid);
    }

//    public static void setRoom(int roomid ,MessageQueueUtil messageRoom ){
//        rooms.put(roomid , messageRoom);
//    }


}
