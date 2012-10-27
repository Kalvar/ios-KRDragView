//
//  ViewController.h
//  KRDragViewSample
//
//  ilovekalvar@gmail.com
//
//  Created by Kuo-Ming Lin on 12/10/2.
//  Copyright (c) 2012年 Kuo-Ming Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KRViewDrags;

@interface ViewController : UIViewController

@property (nonatomic, retain) KRViewDrags *krViewDrags;
@property (nonatomic, retain) IBOutlet UIView *outView;

-(IBAction)open:(id)sender;

@end
