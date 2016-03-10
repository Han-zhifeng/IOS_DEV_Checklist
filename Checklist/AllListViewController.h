//
//  AllListViewController.h
//  Checklist
//
//  Created by 韩志峰 on 16/3/9.
//  Copyright © 2016年 Zhifeng Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"
@class DataModel;

@interface AllListViewController : UITableViewController<ListDetailViewControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)DataModel *dataModel;

@end
