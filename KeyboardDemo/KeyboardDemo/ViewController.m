//
//  ViewController.m
//  KeyboardDemo
//
//  Created by 沈强 on 16/4/6.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "ViewController.h"
#import "SQKeyboardTool.h"

@interface ViewController ()<UITextFieldDelegate, SQKeyboardToolDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;

/** 所有的文本框数组 */
@property (nonatomic, strong) NSArray *fields;

/** 工具条 */
@property (nonatomic, weak) SQKeyboardTool *toolbar;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fields = @[self.nameField, self.emailField, self.addressField];
    
    // 加载工具条控件
    SQKeyboardTool *toolbar = [SQKeyboardTool tool];
    toolbar.toolbarDelegate = self;
    self.toolbar = toolbar;
    
    // 设置工具条
    self.nameField.inputAccessoryView = toolbar;
    self.emailField.inputAccessoryView = toolbar;
    self.addressField.inputAccessoryView = toolbar;
}

//- (void)testInputViewAndInputAccessoryView
//{
//    // 更换键盘
//    UIView *keyboard = [[UIView alloc] init];
//    keyboard.frame = CGRectMake(0, 0, 0, 100);
//    keyboard.backgroundColor = [UIColor redColor];
//    self.emailField.inputView = keyboard;
//
//    // 设置键盘顶部的工具条;
//    UIView *toolbar = [[UIView alloc] init];
//    toolbar.frame = CGRectMake(0, 0, 0, 44);
//    toolbar.backgroundColor = [UIColor blueColor];
//    self.nameField.inputAccessoryView = toolbar;
//    //    self.nameField.inputAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - <XMGKeyboardToolDelegate>

//- (void)keyboardToolDidClickPreviousItem:(XMGKeyboardTool *)tool
//{
//    NSUInteger currentIndex = 0;
//    for (UIView *view in self.view.subviews) {
//        if ([view isFirstResponder]) {
//            currentIndex = [self.fields indexOfObject:view];
//        }
//    }
//    currentIndex--;
//
//    [self.fields[currentIndex] becomeFirstResponder];
//
//    self.toolbar.previousItem.enabled = (currentIndex != 0);
//    self.toolbar.nextItem.enabled = YES;
//}
//
//- (void)keyboardToolDidClickNextItem:(XMGKeyboardTool *)tool
//{
//    NSUInteger currentIndex = 0;
//    for (UIView *view in self.view.subviews) {
//        if ([view isFirstResponder]) {
//            currentIndex = [self.fields indexOfObject:view];
//        }
//    }
//    currentIndex++;
//
//    [self.fields[currentIndex] becomeFirstResponder];
//
//    self.toolbar.previousItem.enabled = YES;
//    self.toolbar.nextItem.enabled = (currentIndex != self.fields.count - 1);
//}
//
//- (void)keyboardToolDidClickDoneItem:(XMGKeyboardTool *)tool
//{
//    [self.view endEditing:YES];
//}

- (void)keyboardTool:(SQKeyboardTool *)tool didClickItem:(SQKeyboardToolItem)item
{
    if (item == SQKeyboardToolItemPrevious) {
        NSUInteger currentIndex = 0;
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        currentIndex--;
        
        [self.fields[currentIndex] becomeFirstResponder];
        
        self.toolbar.previousItem.enabled = (currentIndex != 0);
        self.toolbar.nextItem.enabled = YES;
        
    } else if (item == SQKeyboardToolItemNext) {
        NSUInteger currentIndex = 0;
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        currentIndex++;
        
        [self.fields[currentIndex] becomeFirstResponder];
        
        self.toolbar.previousItem.enabled = YES;
        self.toolbar.nextItem.enabled = (currentIndex != self.fields.count - 1);
        
    } else if (item == SQKeyboardToolItemDone) {
        
        [self.view endEditing:YES];
    }
}

#pragma mark - <UITextFieldDelegate>
/**
 * 当点击键盘右下角的return key时,就会调用这个方法
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.nameField) {
        // 让emailField成为第一响应者
        [self.emailField becomeFirstResponder];
    } else if (textField == self.emailField) {
        // 让addressField成为第一响应者
        [self.addressField becomeFirstResponder];
    } else if (textField == self.addressField) {
        [self.view endEditing:YES];
        //        [textField resignFirstResponder];
    }
    return YES;
}

/**
 * 键盘弹出就会调用这个方法
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSUInteger currentIndex = [self.fields indexOfObject:textField];
    
    self.toolbar.previousItem.enabled = (currentIndex != 0);
    self.toolbar.nextItem.enabled = (currentIndex != self.fields.count - 1);
}

@end
