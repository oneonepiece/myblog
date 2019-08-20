package com.site.blog.my.core.util.websocket;

import com.site.blog.my.core.entity.WebSocketUser;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;

//房间号
//使用，new一个房间，然后设置
public class MessageQueueUtil {

    private int roomid;
    //消息计数
    //private  int messageCount = 1;
    //信息缓存大小，默认10条
    private int size = 5;
    //private static LinkedList list = new LinkedList();
    //队列，线程安全
    private  ConcurrentLinkedQueue list = new ConcurrentLinkedQueue();

   // private static ConcurrentHashMap<String,Object> messages = new ConcurrentHashMap<>();
    private  List<String> users = Collections.synchronizedList(new ArrayList<>());


    public MessageQueueUtil(int roomid ) {
        this(roomid,5);
    }
    public MessageQueueUtil(int roomid , int size) {
        this.roomid = roomid;
        this.size = size;
        for (int i = 0; i < size; i++) {
            WebSocketUser user = new WebSocketUser();
            user.setId(1);
            list.offer(user);

        }
    }

    //入队和出队是否都＋synchronized  ??
    public  void put(Object v){
        //删除
        list.poll();
        //插入
        list.offer(v);

    }

    public  LinkedList getAll() {
        LinkedList<Object> messages = new LinkedList<>();
        if (!list.isEmpty()){
            for (Object li:list){
                messages.add(li);
            }
        }else {
            messages = null;
        }
        return messages;
    }
    public boolean isEmpty() {
        return list.isEmpty();
    }

    //添加用户
    public  void addUser(String userid) {
        users.add(userid);

    }

    //查询id
    public  Boolean findUser(String userid) {

        for (String s : users) {
            if (s.equals(userid)) {
                return true;
            }
        }
        return false;
    }

    //该房间存储的信息条数
    public void setSize(int size){
        this.size = size;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }
}
