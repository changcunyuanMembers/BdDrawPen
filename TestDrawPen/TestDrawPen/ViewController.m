//
//  ViewController.m
//  TestDrawPen
//
//  Created by Liang on 15/3/18.
//  Copyright (c) 2015年 Baidu. All rights reserved.
//

#import "ViewController.h"
#import "DrawPenView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DrawPenView *penView = [[DrawPenView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:penView];
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
