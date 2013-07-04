## Screen Shot

<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRDrageView-1.png" alt="KRDragView" title="KRDragView" style="margin: 20px;" class="center" /> &nbps;
<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRDrageView-2.png" alt="KRDragView" title="KRDragView" style="margin: 20px;" class="center" />

## Supports

KRDragView supports ARC.

## How To Get Started

KRDragView simulates dragging and sliding the view to show the menu under background. You can slide the view or drag it to move to show something under itself.

``` objective-c
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

-(IBAction)open:(id)sender
{
    [self.krViewDrags open];
}
```

## Version

KRDragView now is V0.5.2 beta.

## License

KRDragView is available under the MIT license ( or Whatever you wanna do ). See the LICENSE file for more info.
