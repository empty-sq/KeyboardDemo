//
//  SQKeyboardTool.h
//  KeyboardDemo
//
//  Created by 沈强 on 16/4/6.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SQKeyboardToolItemPrevious,
    SQKeyboardToolItemNext,
    SQKeyboardToolItemDone
} SQKeyboardToolItem;

@class SQKeyboardTool;

@protocol SQKeyboardToolDelegate <NSObject>

@optional
//- (void)keyboardToolDidClickPreviousItem:(XMGKeyboardTool *)tool;
//- (void)keyboardToolDidClickNextItem:(XMGKeyboardTool *)tool;
//- (void)keyboardToolDidClickDoneItem:(XMGKeyboardTool *)tool;
- (void)keyboardTool:(SQKeyboardTool *)tool didClickItem:(SQKeyboardToolItem)item;

@end

@interface SQKeyboardTool : UIToolbar

@property (weak, nonatomic, readonly) IBOutlet UIBarButtonItem *nextItem;
@property (weak, nonatomic, readonly) IBOutlet UIBarButtonItem *previousItem;

/** 代理 */
@property (nonatomic, weak) id<SQKeyboardToolDelegate> toolbarDelegate;

+ (instancetype)tool;

@end
