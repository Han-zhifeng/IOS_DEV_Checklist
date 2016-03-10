//
//  ListDetailViewController.h
//  Checklist
//
//  Created by 韩志峰 on 16/3/10.
//  Copyright © 2016年 Zhifeng Han. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListDetailViewController;
@class Checklist;

@protocol ListDetailViewControllerDelegate <NSObject>

-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller;
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist;
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist;


@end

@interface ListDetailViewController : UITableViewController<UITextFieldDelegate>

//文本输入框属性
@property(nonatomic,weak) IBOutlet UITextField *textField;
//右上角done按钮属性
@property(nonatomic,weak) IBOutlet UIBarButtonItem *doneBarButton;
@property(nonatomic,weak) id <ListDetailViewControllerDelegate>delegate;

@property(nonatomic,strong) Checklist *checklistToEdit;

- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;

@end
