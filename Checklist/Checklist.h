//
//  Checklist.h
//  Checklist
//
//  Created by 韩志峰 on 16/3/9.
//  Copyright © 2016年 Zhifeng Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject<NSCoding>

@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSMutableArray *items;

@end
