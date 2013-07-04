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
    [super viewDidLoad];
    krViewDrags = [[KRViewDrags alloc] initWithView:self.outView
                                           dragMode:krViewDragModeFromLeftToRight];
    self.krViewDrags.sideInstance = 40.0f;
    self.krViewDrags.durations    = 0.15f;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.krViewDrags start];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.krViewDrags stop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma IBActions
-(IBAction)open:(id)sender
{
    [self.krViewDrags open];
}

@end
