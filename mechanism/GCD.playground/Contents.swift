//: Playground - noun: a place where people can play

import UIKit

/**
  同步若干个异步调用
 */

var queue = DispatchQueue.global()

var group = DispatchGroup()

queue.async(group: group) { 
    print("加载图片1")
}



queue.async(group: group) {
    print("加载图片2")
}



queue.async(group: group) {
    print("加载图片3")
}


queue.async(group: group) {
    print("加载图片4")
}



group.notify(queue: queue) {
    print("图片加载完成")
}


let time = DispatchTime(uptimeNanoseconds: 1 * NSEC_PER_SEC);
//static void dispatch_async_repeated_internal(dispatch_time_t firstPopTime, double intervalInSeconds, dispatch_queue_t queue, void(^work)(BOOL *stop)

func dispatchAsyncRepeat(_ time:DispatchTime, interval:Double, queue:DispatchQueue) {
    
}

//dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//dispatch_group_t group = dispatch_group_create();
//dispatch_group_async(group, queue, ^{ /*加载图片1 */ });
//dispatch_group_async(group, queue, ^{ /*加载图片2 */ });
//dispatch_group_async(group, queue, ^{ /*加载图片3 */ });
//dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//    // 合并图片
//    });


/**
 
 dispatch_barrier_async 的作用是什么
 */


let serial = DispatchQueue(label: "com.playground.serial")
serial.async {
    for i in 0...5 {
        print("🛑 \(i)")
    }
}

serial.async {
    for i in 5...10 {
        print("🛑 \(i)")
    }
}


let concurrent = DispatchQueue(label: "com.plagground.concurrent", attributes:.concurrent)

concurrent.async {
    for i in 0..<5 {
        print("💙 \(i)")
    }
}

concurrent.async {
    for i in 5..<10 {
        print("💙 \(i)")
    }
}
