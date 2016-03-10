//
//  ChecklistItem.m
//  Checklist
//
//  Created by 韩志峰 on 16/3/8.
//  Copyright © 2016年 Zhifeng Han. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem


-(void)toggleChecked{
    self.checked = !self.checked;
}


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeBool:self.checked forKey:@"Checked"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if((self =[super init])){
        self.text = [aDecoder decodeObjectForKey:@"Text"];
        self.checked = [aDecoder decodeBoolForKey:@"Checked"];
    }
    return self;
}

@end
