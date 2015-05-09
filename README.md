## Screen Shot

<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRDrageView-1.png" alt="KRDragView" title="KRDragView" style="margin: 20px;" class="center" /> &nbsp;
<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRDrageView-2.png" alt="KRDragView" title="KRDragView" style="margin: 20px;" class="center" />
<br />
<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRDrageView-3.png" alt="KRDragView" title="KRDragView" style="margin: 20px;" class="center" /> &nbsp;
<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRDrageView-4.png" alt="KRDragView" title="KRDragView" style="margin: 20px;" class="center" />

#### Podfile

```ruby
platform :ios, '7.0'
pod "KRDragView", "~> 0.8"
```

## How To Get Started

KRDragView simulates dragging and sliding the view to show the menu under background. Like the cards, you could drag the view and release it to move/ show something under itself.

``` objective-c
#pragma --mark Sample Methods
-(void)draggingFromTopToBottom
{
    //krDragViewModeToBottomAllowsDraggingBack mode is dragging the view from top to bottom.
    krDragViews = [[KRDragView alloc] initWithView:self.outView
                                          dragMode:krDragViewModeToBottomAllowsDraggingBack];
    self.krDragViews.sideInstance   = 80.0f;
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

-(void)draggingFromBottomToTop
{
    //krDragViewModeToTopAllowsDraggingBack mode is dragging the view from bottom to top.
    krDragViews = [[KRDragView alloc] initWithView:self.outView
                                          dragMode:krDragViewModeToTopAllowsDraggingBack];
    self.krDragViews.sideInstance   = self.view.frame.size.height;
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

#pragma --mark View Recycles
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self draggingFromTopToBottom];
    //[self draggingFromBottomToTop];
    
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

#pragma IBActions
-(IBAction)open:(id)sender
{
    [self.krDragViews open];
}

-(IBAction)back:(id)sender
{
    [self.krDragViews backToInitialState];
}
```

## Version

KRDragView now is V0.8 beta.

## License

KRDragView is available under the MIT license ( or Whatever you wanna do ). See the LICENSE file for more info.
