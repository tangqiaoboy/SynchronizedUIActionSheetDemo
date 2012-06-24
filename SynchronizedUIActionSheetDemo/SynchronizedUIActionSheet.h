//
//  SynchronizedUIActionSheet.h
//  SynchronizedUIActionSheetDemo
//
//  Created by Tang Qiao on 12-6-24.
//  Copyright (c) 2012年 blog.devtang.com . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SynchronizedUIActionSheet : NSObject<UIActionSheetDelegate>

@property (nonatomic, strong) NSArray * titles;
@property (nonatomic, assign) NSInteger destructiveButtonIndex;
@property (nonatomic, assign) NSInteger cancelButtonIndex;


- (id)initWithTitles:(NSArray *)titles;

- (NSInteger)showInView:(UIView *)view;

@end
