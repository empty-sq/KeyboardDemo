//
//  SQKeyboardTool.m
//  KeyboardDemo
//
//  Created by 沈强 on 16/4/6.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQKeyboardTool.h"

@implementation SQKeyboardTool

+ (instancetype)tool {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (IBAction)previous:(id)sender {
    //    if ([self.delegate respondsToSelector:@selector(keyboardToolDidClickPreviousItem:)]) {
    //        [self.delegate keyboardToolDidClickPreviousItem:self];
    //    }
    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:SQKeyboardToolItemPrevious];
    }
}

- (IBAction)next:(id)sender {
    //    if ([self.delegate respondsToSelector:@selector(keyboardToolDidClickNextItem:)]) {
    //        [self.delegate keyboardToolDidClickNextItem:self];
    //    }
    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:SQKeyboardToolItemNext];
    }
}

- (IBAction)done:(id)sender {
    //    if ([self.delegate respondsToSelector:@selector(keyboardToolDidClickDoneItem:)]) {
    //        [self.delegate keyboardToolDidClickDoneItem:self];
    //    }
    
    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:SQKeyboardToolItemDone];
    }
}

@end
