//
//  ViewController.m
//  Recipe
//
//  Created by songbo on 15/12/23.
//  Copyright © 2015年 song. All rights reserved.
//

#import "ViewController.h"
#import "NetworkRequest.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    baidu *bb = [[baidu alloc] init];
    [bb updateWeatherAtLocation:@"dd" forNumberOfDays:1 call:^(ResultInfo *info) {
        if (info.bsucces) {
            
            NSLog(@"bdata%@",info.bdata);
        }else{
        
        
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
