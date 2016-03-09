//
//  AddItemTableViewController.m
//  Checklist
//
//  Created by 韩志峰 on 16/3/8.
//  Copyright © 2016年 Zhifeng Han. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ChecklistItem.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

//页面自动打开虚拟键盘
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.doneBarButton.enabled = NO;
    
    if(self.itemToEdit != nil){
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
        self.doneBarButton.enabled = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if([newText length] >0){
        self.doneBarButton.enabled = YES;
    }else{
        self.doneBarButton.enabled = NO;
    }
    return YES;
}


- (IBAction)cancel:(id)sender {
    [self.delegate itemDetailViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender { 
    
    if(self.itemToEdit == nil){
        ChecklistItem *item = [[ChecklistItem alloc]init];
        item.text = self.textField.text;
        item.checked = NO;
        [self.delegate itemDetailViewController:self didFinishAddingItem:item];
    }else{
        self.itemToEdit.text = self.textField.text;
        [self.delegate itemDetailViewcontroller:self didFinishEditingItem:self.itemToEdit];
    }
    
}

-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
@end
