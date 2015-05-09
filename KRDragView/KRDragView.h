//
//  KRDragView.h
//  V0.8 beta
//
//  ilovekalvar@gmail.com
//
//  Created by Kalvar Lin on 12/10/2.
//  Copyright (c) 2012 - 2015 年 Kalvar Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

//拖拉模式
typedef enum _krDragViewModes
{
    //兩邊都行( 未補完 ; None. )
    krDragViewModeBothLeftAndRight = 0,
    //由左至右 ( Left to Right. )
    krDragViewModeFromLeftToRight,
    //由右至左 ( Right to Left. )
    krDragViewModeFromRightToLeft,
    //由上至下滑 ( Top to Bottom )
    krDragViewModeFromTopToBottom,
    //由下至上滑 ( Bottom to Top. )
    krDragViewModeFromBottomToTop,
    //由下至上滑，並且允許往回拖拉 ( Bottom to Top, and Drag Back. )
    krDragViewModeToTopAllowsDraggingBack,
    //由上至下滑，並且允許往回拖拉 ( Top to Bottom, and Drag Back. )
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
