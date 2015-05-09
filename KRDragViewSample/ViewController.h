//
//  ViewController.h
//  KRDragViewSample
//
//  ilovekalvar@gmail.com
//
//  Created by Kalvar Lin on 12/10/2.
//  Copyright (c) 2012年 Kalvar Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KRDragView;

@interface ViewController : UIViewController

@property (nonatomic, strong) KRDragView *krDragViews;
@property (nonatomic, strong) IBOutlet UIView *outView;

-(IBAction)open:(id)sender;
-(IBAction)back:(id)sender;

@end
