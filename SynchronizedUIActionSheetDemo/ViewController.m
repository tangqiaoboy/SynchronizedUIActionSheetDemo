//
//  ViewController.m
//  SynchronizedUIActionSheetDemo
//
//  Created by Tang Qiao on 12-6-24.
//  Copyright (c) 2012年 blog.devtang.com . All rights reserved.
//

#import "ViewController.h"
#import "SynchronizedUIActionSheet.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)say:(NSString *)args, ... {
    NSMutableArray * array = [NSMutableArray array];
    if (args) {
        NSString *tmpStr;

        va_list strings;
        va_start(strings, args);
        [array addObject:args];
        while ((tmpStr = va_arg(strings, id)) != nil) {
            [array addObject:tmpStr];
        }
        va_end(strings);
    }
    NSLog(@"array = %@", array);
}
- (IBAction)testArgButtonPressed:(id)sender {
    [self say:@"say", @"333", @"abc", nil];
}

- (IBAction)testButtonPressed:(id)sender {
    SynchronizedUIActionSheet * synActionSheet = [[SynchronizedUIActionSheet alloc] init];
    synActionSheet.titles = [NSArray arrayWithObjects:@"aaa", @"bbb", @"ccc", @"ddd", nil];
    synActionSheet.destructiveButtonIndex = 1;
    synActionSheet.cancelButtonIndex = 3;
    NSUInteger result = [synActionSheet showInView:self.view];
    NSLog(@"result = %d", result);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
