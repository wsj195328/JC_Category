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
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            
        }
    });
    
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
