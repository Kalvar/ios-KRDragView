//
//  ViewController.m
//  KRDragViewSample
//
//  Created by Kalvar on 12/10/2.
//  Copyright (c) 2012年 Kuo-Ming Lin. All rights reserved.
//

#import "ViewController.h"
#import "KRViewDrags.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize krViewDrags;
@synthesize outView;

- (void)viewDidLoad
{
    krViewDrags = [[KRViewDrags alloc] initWithView:self.outView
                                          drageMode:krViewDragModeFromLeftToRight];
    self.krViewDrags.sideInstance = 40.0f;
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.krViewDrags start];
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.krViewDrags stop];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
    [krViewDrags release];
    [outView release];
    [super dealloc];
}

@end
