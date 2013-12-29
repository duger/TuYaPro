//
//  customView.h
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

@property(nonatomic,retain) UIView *changeView;
@property(nonatomic,retain) UITextField *titleTextField;
-(void)didClickedFinishButton:(UIButton *)button;
@end
