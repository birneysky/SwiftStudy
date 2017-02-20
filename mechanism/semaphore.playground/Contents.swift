//: Playground - noun: a place where people can play

import UIKit

/**
  简单来说就是控制访问资源的数量，比如系统有两个资源可以被利用，
 同时有三个线程要访问，只能允许两个线程访问，第三个应当等待资源被释放后再访问
 */

var semaphore = DispatchSemaphore(value: 1)

var globalQueue = DispatchQueue.global(priority:.`default`)

func taskFirst(){
    semaphore.wait()
    print("First task Staring")
    ///sleep(1)
    print("First task done")
    semaphore.signal()
}



func taskSecond(){
    semaphore.wait()
    print("Second task Staring")
    //sleep(1)
    print("Second task done")
    semaphore.signal()
}



func taskThird(){
    semaphore.wait()
    print("Third task Staring")
    //sleep(1)
    print("Third task done")
    semaphore.signal()
}


func taskFourth(){
    semaphore.wait()
    print("Fourth task Staring")
    //sleep(1)
    print("Fourth task done")
    semaphore.signal()
}



globalQueue.async {
    taskFirst()
}

globalQueue.async {
    taskSecond()
}

globalQueue.async {
    taskThird()
}
globalQueue.async {
    taskFourth()
}

