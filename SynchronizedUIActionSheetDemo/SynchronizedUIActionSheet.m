//
//  SynchronizedUIActionSheet.m
//  SynchronizedUIActionSheetDemo
//
//  Created by Tang Qiao on 12-6-24.
//  Copyright (c) 2012年 blog.devtang.com . All rights reserved.
//

#import "SynchronizedUIActionSheet.h"

@implementation SynchronizedUIActionSheet {
    UIActionSheet * _actionSheet;
    NSInteger _selectedIndex;
}

@synthesize titles = _titles;
@synthesize destructiveButtonIndex = _destructiveButtonIndex;
@synthesize cancelButtonIndex = _cancelButtonIndex;

- (id)initWithTitles:(NSArray *)titles {
    self = [super init];
    if (self) {
        _titles = titles;
        _destructiveButtonIndex = 0;
        _cancelButtonIndex = titles.count - 1;
    }
    return self;
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    _cancelButtonIndex = titles.count - 1;
}

- (NSInteger)showInView:(UIView *)view {
    _actionSheet = [[UIActionSheet alloc] init];
    for (NSString * title in _titles) {
        [_actionSheet addButtonWithTitle:title];
    }
    if (_destructiveButtonIndex != -1) {
        _actionSheet.destructiveButtonIndex = _destructiveButtonIndex;
    }
    if (_cancelButtonIndex != -1) {
        _actionSheet.cancelButtonIndex = _cancelButtonIndex;
    }
    [_actionSheet showInView:view];
    CFRunLoopRun();
    return _selectedIndex;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    _selectedIndex = buttonIndex;
    _actionSheet = nil;
    CFRunLoopStop(CFRunLoopGetCurrent());
}


@end
