//
//  ImageViewController.m
//  KZ_QRCode_iOS
//
//  Created by Kieron Zhang on 2018/5/10.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "ImageViewController.h"
#import <KZ_QRCode_iOS/KZ_QRCodeManager.h>

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"二维码";
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 164, CGRectGetWidth(self.view.bounds) - 20, 40)];
    textField.text = @"ajkjlkjkljijijinasdfadsfadfqwerqwerqwe";
    [self.view addSubview:textField];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 210, CGRectGetWidth(self.view.bounds) - 20, 30);
    button.backgroundColor = [UIColor yellowColor];
    [button setTitle:@"生成二维码" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(createQRImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 250, CGRectGetWidth(self.view.bounds) - 20, CGRectGetWidth(self.view.bounds) - 20)];
    [self.view addSubview:imageView];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)];
    [self.view addGestureRecognizer:longPressGesture];
}

- (void)createQRImage {
    [textField resignFirstResponder];
    UIImage *image = [KZ_QRCodeManager QRImageWithString:textField.text backgroundColor:[UIColor clearColor] lineColor:[UIColor yellowColor] centerImage:[UIImage imageNamed:@"icon40.png"] sizeWidth:CGRectGetWidth(imageView.bounds)];
    imageView.image = image;
}

- (void)longPressGesture:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"识别二维码" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"识别图中二维码", nil];
        [actionSheet showInView:self.view];
    }
}

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != actionSheet.cancelButtonIndex) {
        NSString *code = [KZ_QRCodeManager QRCodeWithImage:imageView.image];
        if (code.length > 0) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"扫描结果" message:code delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
        }
        else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"扫描结果" message:@"无二维码" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
