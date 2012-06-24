//
//  SynchronizedUIActionSheet.m
//  SynchronizedUIActionSheetDemo
//
//  Created by Tang Qiao on 12-6-24.
//  Copyright (c) 2012年 Netease. All rights reserved.
//

#import "SynchronizedUIActionSheet.h"

@implementation SynchronizedUIActionSheet

-(id)initWithActionSheet:(UIActionSheet *)actionSheet {
    self = [super init];
    if (self) {
        _actionSheet = actionSheet;
    }
    return self;
}

-(NSUInteger)showInView:(UIView *)view {
    _actionSheet.delegate = self;
    [_actionSheet showInView:view];
    CFRunLoopRun();
    return index;
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    index = buttonIndex;
    _actionSheet = nil;
    NSString * title = [actionSheet buttonTitleAtIndex:buttonIndex];
    NSLog(@"title = %@", title);
    CFRunLoopStop(CFRunLoopGetCurrent());
}


@end
