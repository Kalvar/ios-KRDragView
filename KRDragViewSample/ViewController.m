//
//  ViewController.m
//  KRDragViewSample
//
//  Created by Kalvar on 12/10/2.
//  Copyright (c) 2012年 Kuo-Ming Lin. All rights reserved.
//

#import "ViewController.h"
#import "KRDragView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize krDragViews;
@synthesize outView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    krDragViews = [[KRDragView alloc] initWithView:self.outView
                                           dragMode:krDragViewModeToTopAllowsDraggingBack];
    self.krDragViews.sideInstance   = self.view.frame.size.height; //40.0f;
    self.krDragViews.durations      = 0.15f;
    //To set the distance of cross central line.
    self.krDragViews.openDistance   = 80.0f; //self.view.frame.size.height / 2;
    self.krDragViews.openCompletion = ^{
        NSLog(@"open");
    };
    self.krDragViews.closeCompletion = ^{
        NSLog(@"close");
    };
    [self.krDragViews start];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[self.krDragViews start];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.krDragViews stop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma IBActions
-(IBAction)open:(id)sender
{
    [self.krDragViews open];
}

-(IBAction)back:(id)sender
{
    [self.krDragViews backToInitialState];
}

@end
