//
//  ViewController.m
//  JC_Category
//
//  Created by user on 2018/6/5.
//  Copyright © 2018 user. All rights reserved.
//

#import "ViewController.h"
#import "JCUIkitHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    
}

- (IBAction)Btn1_Event:(id)sender {

    [UIDevice JC_JumpSystemItemString:@"General&path=ACCESSIBILITY" handle:^(BOOL isSuccess) {

        NSLog(@"success %@",isSuccess?@"YES":@"NO");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
