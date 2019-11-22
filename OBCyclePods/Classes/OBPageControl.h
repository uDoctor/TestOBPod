//
//  OBPageControl.h
//  OBCycleView
//
//  Created by 李杨 on 2019/11/5.
//  Copyright © 2019 OB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OBPageControl : UIView

@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic, assign) CGFloat space;
@property (nonatomic, assign) CGSize normalSize;
@property (nonatomic, assign) CGSize selectSize;

@property (nonatomic, strong) UIImage *normalImg;
@property (nonatomic, strong) UIImage *selectImg;

@end

NS_ASSUME_NONNULL_END
