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
    

    UIView *view = [[UIView alloc] initWithFrame:(CGRect){100,100,100,100}];
    UIView *viewFornt = [[UIView alloc] initWithFrame:view.bounds];

    view.backgroundColor = [UIColor blueColor];
    viewFornt.backgroundColor = [UIColor redColor];

    view.layer.cornerRadius = 20;
    view.clipsToBounds = YES;

    [self.view addSubview:view];
    [view addSubview:viewFornt];
}

- (IBAction)Btn1_Event:(id)sender {

    NSArray *temp = @[@"1中文是吗",@"3",@"6"];
    NSLog(@"%@",temp);

    NSArray *temp_Array = @[[TestObj new],[TestObj new]];
    NSLog(@"%@",temp_Array);

    NSLog(@"%@",temp_Array.firstObject);

//    
//    [UIDevice JC_JumpSystemItemString:@"General&path=ACCESSIBILITY" handle:^(BOOL isSuccess) {
//
//        NSLog(@"success %@",isSuccess?@"YES":@"NO");
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
