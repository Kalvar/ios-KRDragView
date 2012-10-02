//
//  KRViewDrags.h
//
//  ilovekalvar@gmail.com
//
//  Created by Kuo-Ming Lin on 12/10/2.
//  Copyright (c) 2012年 Kuo-Ming Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

//拖拉模式
typedef enum _krViewDragModes {
    //由左至右
    krViewDragModeFromLeftToRight = 0,
    //由右至左
    krViewDragModeFromRightToLeft,
    //兩邊都行( 未補完 )
    krViewDragModeBoth
} krViewDragModes;

@interface KRViewDrags : NSObject{
    //作用的 View
    UIView *view;
    //拖拉模式
    krViewDragModes dragMode;
    //距離螢幕邊緣多遠就定位
    CGFloat sideInstance;
}

@property (nonatomic, retain) UIView *view;
@property (nonatomic, assign) krViewDragModes dragMode;
@property (nonatomic, assign) CGFloat sideInstance;

-(id)initWithView:(UIView *)_targetView drageMode:(krViewDragModes)_dragMode;
-(void)start;
-(void)stop;
-(void)reset;

@end
