//
//  ViewController.m
//  Checklist
//
//  Created by 韩志峰 on 16/3/7.
//  Copyright © 2016年 Zhifeng Han. All rights reserved.
//
//

#import "ChecklistViewController.h"
#import "ChecklistItem.h"
#import "Checklist.h"

@interface ChecklistViewController ()

@end

@implementation ChecklistViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = self.checklist.name;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/**
 * 列表内数据处理相关
 */

//列表内有多少行数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.checklist.items count];
}

//规范cell内是否已经被点击状态
-(void)configureCheckmarkForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item{
    
    UILabel *label = (UILabel *)[cell viewWithTag:1001];
    
    if(item.checked){
        label.text = @"√";
    }else{
        label.text = @"";
    }
}

-(void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item{
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
    
}

//列表cell内数据
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    ChecklistItem *item = self.checklist.items[indexPath.row];
    
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    
    return cell;
}

/**
 * 列表点击动作处理相关
 */

//选中某一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    ChecklistItem *item = self.checklist.items[indexPath.row];
    
    [item toggleChecked];
    
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//删除某一行
-(void)tableView:(UITableView *)tableView commitEditingStyle: (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.checklist.items removeObjectAtIndex:indexPath.row];

    
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}


/**
 * 跳转时添加代理对象，AddItemTableViewController
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"AddItem"]){
    
        UINavigationController *navigationController = segue.destinationViewController;
        
        ItemDetailViewController *controller = (ItemDetailViewController*) navigationController.topViewController;
        
        controller.delegate = self;
    }else if([segue.identifier isEqualToString:@"EditItem"]){
        
        UINavigationController *navigationController = segue.destinationViewController;
        
        ItemDetailViewController *controller = (ItemDetailViewController*) navigationController.topViewController;
        
        controller.delegate = self;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        controller.itemToEdit = self.checklist.items[indexPath.row];
        
    }
}

/**
 * 处理代理，AddItemTableViewController
 */

-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller{ [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item{
    NSInteger newRowIndex = [self.checklist.items count];
    [self.checklist.items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    
    NSArray *indexPaths = @[indexPath];
    
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)itemDetailViewcontroller:(ItemDetailViewController *)controller didFinishEditingItem: (ChecklistItem *)item{
    NSInteger index = [self.checklist.items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    [self configureTextForCell:cell withChecklistItem:item];

    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
