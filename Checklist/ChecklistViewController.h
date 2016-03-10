//
//  ViewController.h
//  Checklist
//
//  Created by 韩志峰 on 16/3/7.
//  Copyright © 2016年 Zhifeng Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"
@class Checklist;

@interface ChecklistViewController : UITableViewController<ItemDetailViewControllerDelegate>

@property (nonatomic,strong)Checklist *checklist;


@end

