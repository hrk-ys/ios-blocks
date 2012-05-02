//
//  TimerViewController.m
//  ios-blocks
//
//  Created by Yoshifuji Hiroki on 12/05/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TimerViewController.h"
#import "NSTimer+Blocks.h"

@interface TimerViewController () {
    NSTimer* _timer;
}
@end

@implementation TimerViewController

#define TEXTVIEW_TAG 1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    {
        UIButton* bt = [UIButton buttonWithType:110];
        [bt setTitle:@"repeats" forState:UIControlStateNormal];
        bt.frame = CGRectMake(10, 10, 90, 40);
        [bt addTarget:self action:@selector(startRepeats) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bt];
    }

    {
        UIButton* bt = [UIButton buttonWithType:110];
        [bt setTitle:@"one time" forState:UIControlStateNormal];
        bt.frame = CGRectMake(110, 10, 90, 40);
        [bt addTarget:self action:@selector(startNoRepeats) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bt];
    }

    UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 300)];
    textView.tag = TEXTVIEW_TAG;
    [textView autorelease];
    [self.view addSubview:textView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)startRepeats
{
    if (_timer) {
        [_timer invalidate];
        [_timer release], _timer = nil;
        return;
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
        UITextView* textView = (UITextView*)[self.view viewWithTag:TEXTVIEW_TAG];
        textView.text = [textView.text stringByAppendingFormat:@"repeats\n"];
    } repeats:YES];
    [_timer retain];
}

- (void)startNoRepeats
{
    [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
        UITextView* textView = (UITextView*)[self.view viewWithTag:TEXTVIEW_TAG];
        textView.text = [textView.text stringByAppendingFormat:@"norepeats\n"];
    } repeats:NO];
}

@end
