//
//  DataModel.h
//  Checklist
//
//  Created by 韩志峰 on 16/3/10.
//  Copyright © 2016年 Zhifeng Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic,strong)NSMutableArray *lists;
-(void)saveChecklists;

-(NSInteger)indexOfSelectedChecklist;
-(void)setIndexOfSelectedChecklist:(NSInteger)index;

@end
