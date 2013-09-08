//
//  KRDragView.h
//  V0.8 beta
//
//  ilovekalvar@gmail.com
//
//  Created by Kuo-Ming Lin on 12/10/2.
//  Copyright (c) 2012 - 2013 年 Kuo-Ming Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

//拖拉模式
typedef enum _krDragViewModes
{
    //兩邊都行( 未補完 )
    krDragViewModeBothLeftAndRight = 0,
    //由左至右
    krDragViewModeFromLeftToRight,
    //由右至左
    krDragViewModeFromRightToLeft,
    //由上至下滑
    krDragViewModeFromTopToBottom,
    //由下至上滑
    krDragViewModeFromBottomToTop,
    //由下至上滑，並且允許往回拖拉
    krDragViewModeToTopAllowsDraggingBack,
    //由上至下滑，並且允許往回拖拉
    krDragViewModeToBottomAllowsDraggingBack
} krDragViewModes;

@interface KRDragView : NSObject
{
    //作用的 View
    UIView *view;
    //拖拉模式
    krDragViewModes dragMode;
    //距離螢幕邊緣多遠就定位
    CGFloat sideInstance;
    //最後定位的動畫時間
    CGFloat durations;
    //決定是否 Open 的跨越距離
    CGFloat openDistance;

}

@property (nonatomic, strong) UIView *view;
@property (nonatomic, assign) krDragViewModes dragMode;
@property (nonatomic, assign) CGFloat sideInstance;
@property (nonatomic, assign) CGFloat durations;
@property (nonatomic, assign) CGFloat openDistance;
@property (nonatomic, copy) void (^openCompletion) (void);
@property (nonatomic, copy) void (^closeCompletion) (void);

-(id)initWithView:(UIView *)_targetView dragMode:(krDragViewModes)_dragMode;
-(void)start;
-(void)stop;
-(void)open;
-(void)backToInitialState;

@end
