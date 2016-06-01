//
//  ViewController.m
//  Runtime-
//
//  Created by Sir-Anne-Blair on 16/6/2.
//  Copyright © 2016年 anne-blair. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //正常情况下
    [Person Eat];     //打印吃
    [Person Drink];    //打印喝
    
    
    //动态交换两个方法的调用
    //交换
    // 获取两个类的类方法
    Method m1 = class_getClassMethod([Person class], @selector(Eat));
    Method m2 = class_getClassMethod([Person class], @selector(Drink));
    // 开始交换方法实现
    method_exchangeImplementations(m1, m2);
    // 交换后，神奇的事情发生了，先打喝，再打印吃
    [Person Eat];
    [Person Drink];
    
    
}



@end
