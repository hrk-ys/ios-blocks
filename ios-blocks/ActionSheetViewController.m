//
//  ActionSheetViewController.m
//  ios-blocks
//
//  Created by Yoshifuji Hiroki on 12/05/03.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ActionSheetViewController.h"
#import "UIActionSheet+Blocks.h"

@interface ActionSheetViewController ()

@end

@implementation ActionSheetViewController

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
    
    {
        UIButton* bt = [UIButton buttonWithType:110];
        [bt setTitle:@"sheet1" forState:UIControlStateNormal];
        bt.frame = CGRectMake(10, 10, 90, 40);
        [bt addTarget:self action:@selector(showActionSheet) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bt];
    }
    {
        UIButton* bt = [UIButton buttonWithType:110];
        [bt setTitle:@"sheet2" forState:UIControlStateNormal];
        bt.frame = CGRectMake(110, 10, 90, 40);
        [bt addTarget:self action:@selector(showActionSheet2) forControlEvents:UIControlEventTouchUpInside];
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

- (void)showActionSheet
{
    UIActionSheet* as = [[UIActionSheet alloc] initWithTitle:@"sample"
                                                       block:^(NSInteger buttonIndex){
                                                           UITextView* textView = (UITextView*)[self.view viewWithTag:TEXTVIEW_TAG];
                                                           textView.text = [textView.text stringByAppendingFormat:@"button:%d\n", buttonIndex];
                                                       } 
                                           cancelButtonTitle:@"cancell"
                                      destructiveButtonTitle:@"destruct"
                                           otherButtonTitles:@"oth1", @"oth2",
                         nil];
    [as showInView:self.view];
    [as autorelease];
}

- (void)showActionSheet2
{
    UIActionSheet* as = [[UIActionSheet alloc] init];
    as.title = @"sample";
    [as addButtonWithTitle:@"bu1" withBlock:^{
        UITextView* textView = (UITextView*)[self.view viewWithTag:TEXTVIEW_TAG];
        textView.text = [textView.text stringByAppendingFormat:@"bu1\n"];
    }];
    [as addButtonWithTitle:@"bu2" withBlock:^{
        UITextView* textView = (UITextView*)[self.view viewWithTag:TEXTVIEW_TAG];
        textView.text = [textView.text stringByAppendingFormat:@"bu2\n"];
    }];
    [as addButtonWithTitle:@"cancel" withBlock:^{
        UITextView* textView = (UITextView*)[self.view viewWithTag:TEXTVIEW_TAG];
        textView.text = [textView.text stringByAppendingFormat:@"cancel\n"];
    }];
    [as setCancelButtonIndex:2];
    [as showInView:self.view];
    [as autorelease];
}

@end
