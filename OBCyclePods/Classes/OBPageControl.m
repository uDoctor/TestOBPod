//
//  OBPageControl.m
//  OBCycleView
//
//  Created by 李杨 on 2019/11/5.
//  Copyright © 2019 OB. All rights reserved.
//

#import "OBPageControl.h"


#define KTag 1900
#define KSpace 10

@implementation OBPageControl

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupData];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupData];
    }
    return self;
}

- (void)setupData {
    self.selectIndex = 0;
    self.pageCount = 0;
    self.normalSize = CGSizeMake(8, 8);
    self.selectSize = CGSizeMake(12, 12);
    self.space = 10;
}
- (void)setPageCount:(NSInteger)pageCount {
    _pageCount = pageCount;
    [self refreshPoint];
    
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    _selectIndex = selectIndex;
    [self refreshPoint];
}

- (void)refreshPoint {
    CGFloat point_w = self.normalSize.width;
    CGFloat space = self.space;
    CGFloat totle_W = (point_w + space)*(self.pageCount -1) + self.selectSize.width +space;
    
    CGFloat firstX = ((self.bounds.size.width -totle_W)/2.f) + space/2.f;
    CGFloat pointY = (self.bounds.size.height -self.normalSize.height)/2.f;
    
    CGRect rect = CGRectMake(firstX, pointY, point_w, self.normalSize.height);
    for (int i = 0; i < self.pageCount; i ++) {
        UIColor *color = [UIColor yellowColor];
        CGFloat wid = self.normalSize.width;
        rect.size = self.normalSize;
        rect.origin.y = (self.bounds.size.height -self.normalSize.height)/2.f;
        if (self.selectIndex == i) {
            rect.origin.y = (self.bounds.size.height -self.selectSize.height)/2.f;
            rect.size = self.selectSize;
            wid = self.selectSize.width;
            color = [UIColor redColor];
        }
        UIImageView *iv = [self viewWithTag:KTag+i];
        if (iv == nil) {
            iv = [[UIImageView alloc] initWithFrame:rect];
        } else {
            iv.frame = rect;
        }
        iv.layer.cornerRadius = rect.size.width/2.f;
        rect.origin.x += self.space + wid;
        iv.tag = KTag+i;
        iv.backgroundColor = color;
        [self addSubview:iv];
    }
}

@end
