//
//  ViewController.m
//  SynchronizedUIActionSheetDemo
//
//  Created by Tang Qiao on 12-6-24.
//  Copyright (c) 2012年 Netease. All rights reserved.
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
    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"button 1", @"button 2", @"button 3", @"button 4", nil];
    [sheet addButtonWithTitle:@"new added button"];
    sheet.destructiveButtonIndex = 0;
    sheet.cancelButtonIndex = 4;
    SynchronizedUIActionSheet * sas = [[SynchronizedUIActionSheet alloc] initWithActionSheet:sheet];
    NSUInteger result = [sas showInView:self.view];
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
