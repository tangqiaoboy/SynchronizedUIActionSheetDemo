//
//  SynchronizedUIActionSheet.h
//  SynchronizedUIActionSheetDemo
//
//  Created by Tang Qiao on 12-6-24.
//  Copyright (c) 2012年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SynchronizedUIActionSheet : NSObject<UIActionSheetDelegate> {
    UIActionSheet * _actionSheet;
    NSUInteger index;
}

-(id)initWithActionSheet:(UIActionSheet *)actionSheet;

-(NSUInteger)showInView:(UIView *)view;

@end
