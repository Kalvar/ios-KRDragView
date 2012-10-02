//
//  KRViewDrags.m
//  
//
//  Created by Kalvar on 12/10/2.
//  Copyright (c) 2012年 Flashaim Inc. All rights reserved.
//

#import "KRViewDrags.h"

@interface KRViewDrags (){
    UIPanGestureRecognizer *_panGestureRecognizer;
    
}

@property (nonatomic, assign) CGPoint _orignalPoints;
@property (nonatomic, assign) CGPoint _matchPoints;
@property (nonatomic, retain) UIPanGestureRecognizer *_panGestureRecognizer;
@property (nonatomic, assign) UIView *_gestureView;

@end

@interface KRViewDrags (fixDrages)

-(void)_initWithVars;
-(void)_allocPanGesture;
-(void)_addViewDragGesture;
-(void)_removeViewDrageGesture;
-(void)_moveView:(UIView *)_targetView toX:(CGFloat)_toX toY:(CGFloat)_toY;
-(void)_handleDrag:(UIPanGestureRecognizer*)_panGesture;
-(CGFloat)_statusBarHeight;
-(CGFloat)_caculateDiffViewCenterChanged;

@end

@implementation KRViewDrags (fixDrages)

-(void)_initWithVars{
    self._gestureView   = self.view;
    self._orignalPoints = self._gestureView.center;
    self.sideInstance   = 40.0f;
    [self _resetMatchPoints];
}

-(void)_resetMatchPoints{
    /*
     * 因為不允許上下移動，所以 Y 軸幾乎不會動
     * 如果現在的 Y 軸與原始的 Y 軸不相等，代表畫面上的 View 有變動
     */
    //修正誤差
    CGFloat _yOffset = 0.0f;
    if( self._gestureView.center.y != self._orignalPoints.y ){
        _yOffset = self._gestureView.center.y - self._orignalPoints.y;
    }
    self._matchPoints = CGPointMake(self._orignalPoints.x,
                                    ( self._orignalPoints.y + _yOffset ));
    /*
     //因應 StatusBar 的變化所寫的
     self._matchPoints = CGPointMake(self._orignalPoints.x,
                                    ( self._orignalPoints.y - [self _caculateDiffViewCenterChanged] ));
     */
    
}

-(void)_allocPanGesture{
    //只 alloc 一次
    if( _panGestureRecognizer ) return;
    //加入拖拉手勢
    _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                    action:@selector(_handleDrag:)];
}

-(void)_addViewDragGesture{
    [self._gestureView addGestureRecognizer:self._panGestureRecognizer];
}

-(void)_removeViewDrageGesture{
    [self._gestureView removeGestureRecognizer:self._panGestureRecognizer];
}

-(void)_moveView:(UIView *)_targetView
             toX:(CGFloat)_toX
             toY:(CGFloat)_toY
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationBeginsFromCurrentState:YES];
    _targetView.frame = CGRectMake(_toX,
                                   _toY,
                                   _targetView.frame.size.width,
                                   _targetView.frame.size.height);
    [UIView commitAnimations];
}

-(void)_handleDrag:(UIPanGestureRecognizer*)_panGesture
{
    //目前手勢 View 的中心位置
    CGPoint center      = _panGesture.view.center;
    //手勢在目前 View 上的觸碰點
    CGPoint translation = [_panGesture translationInView:_panGesture.view];
    //當前作用 View 的位置
    CGPoint viewCenter  = self._gestureView.frame.origin;
    //判斷是否需重設原比對用的 Y 座標值
    [self _resetMatchPoints];
    
//    NSLog(@"o.x : %f", self._matchPoints.x);
//    NSLog(@"v.x : %f", viewCenter.x);
//    NSLog(@"center.y : %f", center.y);
//    NSLog(@"o.y : %f", self._matchPoints.y);
//    NSLog(@"center.x : %f", center.x);
//    NSLog(@"trans.x : %f\n\n", translation.x);
    
    switch (self.dragMode) {
        case krViewDragModeFromLeftToRight:
            /*
             * 只允許往右移動
             */
            if( translation.x < 0 && viewCenter.x <= 0 ) return;
            //拖拉移動
            if (_panGesture.state == UIGestureRecognizerStateChanged) {
                if( center.y == self._matchPoints.y ){
                    center = CGPointMake(center.x + translation.x,
                                         self._matchPoints.y);
                    _panGesture.view.center = center;
                    [_panGesture setTranslation:CGPointZero inView:_panGesture.view];
                }
            }
            
            //結束觸碰
            if(_panGesture.state == UIGestureRecognizerStateEnded){
                CGFloat _screenWidth  = self._gestureView.frame.size.width;
                CGFloat _moveDistance = _screenWidth - self.sideInstance;
                //檢查 X 是否已過中線
                if( viewCenter.x > _screenWidth / 2 ){
                    //打開
                    [self _moveView:self._gestureView toX:_moveDistance toY:0.0f];
                }else{
                    //回到原點
                    [self _moveView:self._gestureView toX:0.0f toY:0.0f];
                }
            }
            break;
        case krViewDragModeFromRightToLeft:
            /*
             * 只允許往左移動
             */
            if( translation.x > 0 && viewCenter.x >= 0 ) return;
            /*
             * 不允許上下移動
             */
            //if( translation.y != self._orignalPoints.y ) return;
            //拖拉移動
            if (_panGesture.state == UIGestureRecognizerStateChanged) {
                if( center.y == self._matchPoints.y ){
                    center = CGPointMake(center.x + translation.x,
                                         self._matchPoints.y);
                    _panGesture.view.center = center;
                    [_panGesture setTranslation:CGPointZero inView:_panGesture.view];
                }
            }
            
            //結束觸碰
            if(_panGesture.state == UIGestureRecognizerStateEnded){
                CGFloat _screenWidth  = self._gestureView.frame.size.width;
                CGFloat _moveDistance = -(_screenWidth - self.sideInstance);
                //檢查 X 是否已過中線
                if( viewCenter.x < -( _screenWidth / 2 ) ){
                    //打開
                    [self _moveView:self._gestureView toX:_moveDistance toY:0.0f];
                }else{
                    //回到原點
                    [self _moveView:self._gestureView toX:0.0f toY:0.0f];
                }
            }
            break;
        case krViewDragModeBoth:
            //... Nothing else ( Waiting for add the codes. )
            //...
            break;
        default:
            
            break;
    }
}

-(CGFloat)_statusBarHeight{
    CGSize _size = [UIApplication sharedApplication].statusBarFrame.size;
    //NSLog(@"%f", _size.height);
    return _size.height;
}

-(CGFloat)_caculateDiffViewCenterChanged{
    CGFloat _height     = [self _statusBarHeight];
    CGFloat _baseHeight = 20.0f;
    //代表可能開啟了熱點之類
    if( _height > _baseHeight ){
        return ( _height - _baseHeight );
    }
    //可能是隱藏狀態列
    if( _height <= 0.0f ){
        return _baseHeight;
    }
    return 0.0f;
}

@end


@implementation KRViewDrags

@synthesize _orignalPoints;
@synthesize _matchPoints;
@synthesize _panGestureRecognizer;
@synthesize _gestureView;

@synthesize view;
@synthesize dragMode;
@synthesize sideInstance;

-(id)init{
    self = [super init];
    if( self ){
        self.view = nil;
    }
    return self;
}

-(id)initWithView:(UIView *)_targetView drageMode:(krViewDragModes)_dragMode{
    self = [super init];
    if( self ){
        self.view     = _targetView;
        self.dragMode = _dragMode;
        [self _initWithVars];
        [self _allocPanGesture];
    }
    return self;
}

-(void)dealloc{
    [view release];
    [_panGestureRecognizer release];
    
    [super dealloc];
}

#pragma Methods
-(void)start{
    [self _addViewDragGesture];
}

-(void)stop{
    [self _removeViewDrageGesture];
}

-(void)reset{
    [self _removeViewDrageGesture];
    [self _initWithVars];
    [self _allocPanGesture];
}

@end
