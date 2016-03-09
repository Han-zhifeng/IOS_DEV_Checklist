//
//  ItemDetailViewController.h
//  Checklist
//
//  Created by 韩志峰 on 16/3/8.
//  Copyright © 2016年 Zhifeng Han. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController*)controller;

-(void)itemDetailViewController:(ItemDetailViewController*)controller didFinishAddingItem:(ChecklistItem*)item;

-(void)itemDetailViewcontroller:(ItemDetailViewController*)controller
        didFinishEditingItem:(ChecklistItem*)item;

@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>

//左上角cancel点击动作
- (IBAction)cancel:(id)sender;
//右上角done点击动作
- (IBAction)done:(id)sender;

//文本输入框属性
@property (weak, nonatomic) IBOutlet UITextField *textField;
//右上角done按钮属性
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

//代理属性
@property(nonatomic,weak) id <ItemDetailViewControllerDelegate> delegate;

//被编辑的ChecklistItem
@property(nonatomic,strong) ChecklistItem *itemToEdit;

@end
