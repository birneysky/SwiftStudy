//: Playground - noun: a place where people can play

import UIKit


/**
 访问控制关键字， 以文件为单位的
 
 swfit 2
 
 public 可以被模块外访问
 
 private 可以被本文件访问
 
 internal 可以被本模块访问
 
 如果不写，默认的访问控制为internal
 
 
 swift 3
 
 swift的访问空中模型是基于模块和源文件概念的（Swift’s access control model is based on the concept of modules and source files）
 
 模块是一个发布代码的单一单元，像framework 或者 一个应应用，在swift中可以使用import关键字导入另外一个其他的模块（A module is a single unit of code distribution—a framework or application that is built and shipped as a single unit and that can be imported by another module with Swift’s import keyword.）

 
 在swift中，每一个在xcode中构建的target（比如一个app bounle 或者framework），在swift中都被作为一个单独的模块来看
 
 （swift中提供了5中不同的访问控制等级）Swift provides five different access levels for entities within your code
 
 Open
 
 */




//let ui = UI()
//ui.fontColor
//ui.backgroundColor
let app = App(name:"hello world")
app.show()
app.switchMode()
app.show()
