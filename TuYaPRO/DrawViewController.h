//
//  DrawViewController.h
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomScrollView.h"
#import "ChangeLineColorManger.h"
#import "ChangeColorView.h"
#import "ChangeLineWidthView.h"


@interface DrawViewController : UIViewController<ChangeLineColorMangerDelegate,ChangeColorViewDelegate,ChangeLineWidthViewDelegate>

@property(nonatomic,retain) UIColor *color;
@property(nonatomic,retain) NSMutableArray *ImageArray;
@end
