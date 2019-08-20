package com.site.blog.my.core.util.websocket;

import com.site.blog.my.core.entity.WebSocketUser;
import javafx.beans.binding.ObjectExpression;

import java.util.List;

public class Maintest implements Runnable {

    public static void main(String[] args) throws InterruptedException {

        Thread th1 = new Thread(new Maintest());
        Thread th2 = new Thread(new Maintest());
        Thread th3 = new Thread(new Maintest());
//        Thread th4 = new Thread(new Maintest());
//        Thread th5 = new Thread(new Maintest());
//        Thread th6 = new Thread(new Maintest());


        th1.start();
        th2.start();
        th3.start();
//        th4.start();
//        th5.start();
//        th6.start();

        Thread.sleep(200);
        int a = 0;
        while (true){
            System.out.println(a +"次 \n");
            a++;
            MessageQueueUtil mess =  RoomUtil.getRoom(1);
            List<WebSocketUser> list = mess.getAll();
            System.out.println("\nsize:" + list.size() );
            for (WebSocketUser li : list){
                System.out.println(li.getName() + li.getMessage());
            }
            Thread.sleep(200);
        }
    }


    @Override
    public void run() {

        while (true){
            for (int i=0; i<100000; i++){
                MessageQueueUtil mess =  RoomUtil.getRoom(1);
                WebSocketUser user = new WebSocketUser();
                user.setUserid(1);
                user.setName(Thread.currentThread().getName());
                user.setMessage("mess" +i);
                mess.put(user);
                try {
                    Thread.sleep(200);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

//            if (i%5==0){
//                List<WebSocketUser> list = mess.getAll();
//                for (WebSocketUser li : list){
//                    System.out.println(li.getName());
//                }
//            }
            }
        }


    }
}
