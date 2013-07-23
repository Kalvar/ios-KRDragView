## Screen Shot

<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRDrageView-1.png" alt="KRDragView" title="KRDragView" style="margin: 20px;" class="center" /> &nbsp;
<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRDrageView-2.png" alt="KRDragView" title="KRDragView" style="margin: 20px;" class="center" />

## Supports

KRDragView supports ARC.

## How To Get Started

KRDragView simulates dragging and sliding the view to show the menu under background. You can slide the view or drag it to move to show something under itself.

``` objective-c
- (void)viewDidLoad
{
    [super viewDidLoad];
    krDragViews = [[KRDragView alloc] initWithView:self.outView
                                           dragMode:krDragViewModeFromLeftToRight];
    self.krDragViews.sideInstance = 40.0f;
    self.krDragViews.durations    = 0.15f;
    //To set the distance of cross central line.
    self.krDragViews.openDistance = self.view.frame.size.height / 2; //80.0f
    [self.krDragViews start];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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

KRDragView now is V0.7 beta.

## License

KRDragView is available under the MIT license ( or Whatever you wanna do ). See the LICENSE file for more info.
