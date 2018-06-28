//
//  ViewController.m
//  JC_Category
//
//  Created by user on 2018/6/5.
//  Copyright © 2018 user. All rights reserved.
//

#import "ViewController.h"
#import "JCUIkitHeader.h"
#import "TestObj.h"
#import "JCFundationHeader.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    UIView *view = [[UIView alloc] initWithFrame:(CGRect){100,100,200,200}];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
     UIView *view1 = [[UIView alloc] initWithFrame:(CGRect){100,100,20,20}];
    view1.backgroundColor = [UIColor blueColor];
    [view addSubview:view1];
    
    [view JC_AddShadowOffset:CGSizeZero shadowRadius:8 color:UIColor.lightGrayColor opacity:0.8 cornerRadius:10];
    
 
}

- (IBAction)Btn1_Event:(id)sender {

    NSArray *temp = @[@"1中文是吗",@"3",@"6"];
    NSLog(@"%@",temp);

    NSArray *temp_Array = @[[TestObj new],[TestObj new]];
    NSLog(@"%@",temp_Array);

    NSLog(@"%@",temp_Array.firstObject);


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
