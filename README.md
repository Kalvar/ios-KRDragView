## Screen Shot

<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRDrageView-1.png" alt="KRDragView" title="KRDragView" style="margin: 20px;" class="center" />
<img src="https://dl.dropbox.com/u/83663874/GitHubs/KRDrageView-2.png" alt="KRDragView" title="KRDragView" style="margin: 20px;" class="center" />

## Supports

KRDragView supports MRC ( Manual Reference Counting ), if you did want it support to ARC, that just use Xode tool to auto convert to ARC. ( Xcode > Edit > Refactor > Convert to Objective-C ARC )

## How To Get Started

KRDragView simulates dragging the UIView to move to the screen sides like the menu below Home-Page of iOS Facebook app.

``` objective-c
- (void)viewDidLoad
{
    krViewDrags = [[KRViewDrags alloc] initWithView:self.outView
                                           dragMode:krViewDragModeFromLeftToRight];
    self.krViewDrags.sideInstance = 40.0f;
    self.krViewDrags.durations    = 0.15f;
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [krViewDrags start];
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [krViewDrags stop];
    [super viewWillDisappear:animated];
}

-(IBAction)open:(id)sender{
    [self.krViewDrags open];
}
```

## Version

KRDragView now is V0.5.1 beta.

## License

KRDragView is available under the MIT license ( or Whatever you wanna do ). See the LICENSE file for more info.
