//
//  ViewController.m
//  KZ_QRCode
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"
#import <KZ_QRCodeFramework/KZ_QRCodeManager.h>

@interface ViewController () <KZ_QRCodeManagerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.title = @"扫描";
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"图片" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTapped)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    view.backgroundColor = [UIColor yellowColor];
    view.alpha = 0.5f;
    [self.view addSubview:view];
    
    [[KZ_QRCodeManager sharedManager] addLayerToView:self.view scanCrop:view.frame];
    [KZ_QRCodeManager sharedManager].delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[KZ_QRCodeManager sharedManager] startRunning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[KZ_QRCodeManager sharedManager] stopRuning];
}

- (void)rightButtonTapped {
    ImageViewController *imageViewController = [[ImageViewController alloc] init];
    [self.navigationController pushViewController:imageViewController animated:YES];
}

#pragma mark KZ_QRCodeManagerDelegate
- (void)QRCodeManagerDidScanResult:(NSString *)string {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"扫描结果" message:string delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
    [[KZ_QRCodeManager sharedManager] stopRuning];
}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [[KZ_QRCodeManager sharedManager] startRunning];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
