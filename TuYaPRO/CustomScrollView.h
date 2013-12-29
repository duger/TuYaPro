//
//  CustomScrollView.h
//  TuYaPRO
//
//  Created by Duger on 13-9-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomScrollViewDelegate <NSObject>
@optional
-(void)didClickImage;
-(void)getImages;
//@property(nonatomic,retain) NSMutableArray *imageArray;

@end

@interface CustomScrollView : UIView<UIScrollViewDelegate,UIPageViewControllerDelegate>

+(CustomScrollView *)instance;

@property(nonatomic,retain) UIImage *nowImage;
@property(nonatomic,retain) NSMutableArray *imageArray;
@property(nonatomic,assign)id<CustomScrollViewDelegate> delegate;
@property(nonatomic,retain) UIScrollView *imageScrollView;
@property(nonatomic,retain) UIPageControl *pageControl;

-(void)reloadImages;
@end
