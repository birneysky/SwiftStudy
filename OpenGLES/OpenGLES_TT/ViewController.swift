//
//  ViewController.swift
//  OpenGLES_TT
//
//  Created by birney on 2018/1/29.
//  Copyright © 2018年 RongCloud. All rights reserved.
//

import GLKit

struct SceneVertex {
    var positionCoords : GLKVector3
}

extension Array {
    func size () -> Int {
        if self.count > 0 {
            return self.count * MemoryLayout.size(ofValue: self.first!)
        }
        return 0;
    }
}

class ViewController: GLKViewController,GLKViewControllerDelegate {
    var vertextBufferId: GLuint
    let baseEeffect: GLKBaseEffect
    var vertices: [SceneVertex]
    required init?(coder aDecoder: NSCoder) {
        self.vertextBufferId = GLuint()
        self.baseEeffect = GLKBaseEffect()
        self.vertices = [SceneVertex(positionCoords:GLKVector3Make(-0.5, -0.5, 0)),
                         SceneVertex(positionCoords:GLKVector3Make( 0.5, -0.5, 0)),
                         SceneVertex(positionCoords:GLKVector3Make(-0.5, 0.5, 0))]
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let glkView = self.view as! GLKView
        glkView.enableSetNeedsDisplay = false
        let context = EAGLContext(api: .openGLES2)
        glkView.context = context!
        EAGLContext.setCurrent(context)
        self.delegate = self;
        self.baseEeffect.useConstantColor = GLboolean(GL_TRUE)
        self.baseEeffect.constantColor = GLKVector4Make(1, 1, 1, 1)
        
        glClearColor(0, 0, 0, 1)
        ///为缓存唯一标识
        glGenBuffers(GLsizei(1), &vertextBufferId)
        ///为接下来的运算绑定缓存
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), vertextBufferId)
        ///复制数据到缓存中
        glBufferData(GLenum(GL_ARRAY_BUFFER), vertices.size(), vertices, GLenum(GL_STATIC_DRAW));
        
    }
    
    func glkViewControllerUpdate(_ controller: GLKViewController) {
        let randomValue = Double(arc4random()%100)/100
        let vertext = SceneVertex(positionCoords: GLKVector3Make(Float(randomValue), Float(randomValue), 0));
        self.vertices[0] = vertext
        let isCopy = arc4random() % 5 == 0
        if isCopy {
            glBufferData(GLenum(GL_ARRAY_BUFFER), vertices.size(), vertices, GLenum(GL_STATIC_DRAW));
        }
        //self.vertices.first?.positionCoords.x = self.vertices.first?.positionCoords.x + 0.1
    }
    
    /// GLKViewDelegate 代理方法一直被调用，这是怎么回事
    override func glkView(_ view: GLKView, drawIn rect: CGRect) {
        ///baseEffect准备好当前OpenGLES的上下文环境,以便为使用baseeffect生成的属性和Shading Language程序的绘图做好准备
        baseEeffect.prepareToDraw()
        /// 设置当前绑定的帧缓存的像素颜色渲染缓存中的每一个像素的颜色为前面glClearColor函数设定的值
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        let position = GLuint(GLKVertexAttrib.position.rawValue)
        /// 启用顶点缓存渲染操作
        glEnableVertexAttribArray(position)
        //// 告知OpenGLES顶点数据在哪里，以及怎么解析每个顶点保存的数据
        glVertexAttribPointer(position,
                              GLint(3),
                              GLenum(GL_FLOAT),
                              GLboolean(GL_FALSE),
                              GLsizei(MemoryLayout.size(ofValue: vertices.first!)),
                              nil)
        //// 执行绘图操作
        glDrawArrays(GLenum(GL_TRIANGLES), GLint(0), 3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

