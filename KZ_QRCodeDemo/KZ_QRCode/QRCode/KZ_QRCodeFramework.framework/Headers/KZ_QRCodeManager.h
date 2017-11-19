//
//  KZ_QRCodeManager.h
//  KZ_QRCode
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KZ_QRCodeManagerDelegate <NSObject>

@optional
- (void)QRCodeManagerDidScanResult:(NSString *)string;

@end

@interface KZ_QRCodeManager : NSObject

@property (nonatomic, weak) id<KZ_QRCodeManagerDelegate> delegate;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIImage *centerImage;

+ (instancetype)sharedManager;
- (void)addLayerToView:(UIView *)view;
- (void)addLayerToView:(UIView *)view scanCrop:(CGRect)scanCrop;

- (void)startRunning;
- (void)stopRuning;

+ (NSString *)QRCodeWithImage:(UIImage *)image;
- (UIImage *)QRImageWithString:(NSString *)string sizeWidth:(CGFloat)width;
+ (UIImage *)QRImageWithString:(NSString *)string backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor centerImage:(UIImage *)centerImage sizeWidth:(CGFloat)width;

@end
