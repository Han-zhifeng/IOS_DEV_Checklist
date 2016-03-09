//
//  ChecklistItem.h
//  Checklist
//
//  Created by 韩志峰 on 16/3/8.
//  Copyright © 2016年 Zhifeng Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject

@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign)BOOL checked;

-(void)toggleChecked;

@end
