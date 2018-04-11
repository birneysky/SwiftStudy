//
//  ViewController.m
//  OpenGLES
//
//  Created by birneysky on 2017/3/19.
//  Copyright © 2017年 birneysky. All rights reserved.
//

#import "ViewController.h"
#import <GLKit/GLKit.h>
#import <OpenGLES/gltypes.h>

@interface ViewController ()

@property (nonatomic,strong) GLKBaseEffect* baseEffect;
@property (nonatomic,readonly) GLKView* glView;

@end


typedef struct{
    GLKVector3 postionCoords;
}SceneVertex;


static const SceneVertex vertices[] = {
    {{-0.5f, -0.5f, 0.0}},
    {{0.5f, -0.5f, 0.0}},
    {{-0.5f, 0.5f, 0.0}}
};

@implementation ViewController
{
    GLuint vertexBufferID;
}

#pragma mark - *** Properties ****
- (GLKBaseEffect*) baseEffect{
    if (!_baseEffect) {
        _baseEffect = [[GLKBaseEffect alloc] init];
        _baseEffect.useConstantColor = GL_TRUE;
        _baseEffect.constantColor = GLKVector4Make(1.0f, 1.0f, 1.0f, 1.0f);
    }
    return _baseEffect;
}

- (GLKView*) glView{
    return (GLKView*)self.view;
}


#pragma mark -  *** Init ***
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.glView.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:self.glView.context];
    
    /// 设置当前OpenGL ES 的上下文的“清除颜色”为不透明的黑色。该颜色用于上下文的帧缓存被清除时初始化每个像素的颜色值
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    
    ///为缓存生成独一无二的标识符，第一个参数用于指定要生成的缓存标识符的数量。
    glGenBuffers(1, &vertexBufferID);
    
    ///为接下来的运算绑定缓存
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferID);
    
    ///复制数据到缓存中
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
