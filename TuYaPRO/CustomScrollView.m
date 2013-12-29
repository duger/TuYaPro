//
//  CustomScrollView.m
//  TuYaPRO
//
//  Created by Duger on 13-9-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "CustomScrollView.h"
#import "ImageViewController.h"


@implementation CustomScrollView

static CustomScrollView *s_CustomScrollView = nil;
+(CustomScrollView *)instance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_CustomScrollView == nil) {
            s_CustomScrollView = [[CustomScrollView alloc]initWithFrame:CGRectZero];
        }
    });
    return s_CustomScrollView;
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(10, 8, 300, 400);
        
        self.imageArray = [[NSMutableArray alloc]init];
        //        [CustomScrollView instance].imageArray = [[NSMutableArray alloc]init];
        //        [[CustomScrollView instance].imageArray addObjectsFromArray:self.imageArray];
        self.backgroundColor = [UIColor whiteColor];
        self.imageScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
        self.imageScrollView.delegate = self;
        self.imageScrollView.showsHorizontalScrollIndicator = NO;
        self.imageScrollView.backgroundColor = [UIColor purpleColor];
        self.imageScrollView.pagingEnabled = YES;
        NSInteger count = [self.imageArray count];
        NSLog(@"%d",count);
        self.imageScrollView.contentSize = CGSizeMake(600 * (count + 1), 400);
        for (int i = 0; i <= count; i++) {
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * 310, 0, 300, 400)];
            imageView.backgroundColor = [UIColor purpleColor];
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didClickImageView:)];
            [tapGesture setNumberOfTapsRequired:2];
            [tapGesture setNumberOfTouchesRequired:1];
            @try {
                imageView.image = [self.imageArray objectAtIndex:i];
            }
            @catch (NSException *exception) {
                
            }
            @finally {
                
            }
            
            //            imageView.image = [[CustomScrollView instance].imageArray objectAtIndex:i];
            [imageView addGestureRecognizer:tapGesture];
            [self.imageScrollView addSubview:imageView];
            [tapGesture release];
            [imageView release];
        }
        
        [self addSubview:self.imageScrollView];
    }
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
    self.pageControl.center = CGPointMake(CGRectGetMidX(self.bounds), 385);
    //    self.pageControl.numberOfPages = 2;
    self.pageControl.currentPage = 0;
    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.pageControl];
    
    
    
    return self;
}

-(void)didClickImageView:(UIGestureRecognizer *)gesture
{
    if ([[CustomScrollView instance].imageArray count]== 0) {
        return;
    }
    [CustomScrollView instance].nowImage = [[CustomScrollView instance].imageArray objectAtIndex:(gesture.view.tag - 100)];
    NSLog(@"tag%d",gesture.view.tag);
    [self.delegate didClickImage];
    
}

-(void)reloadImages
{
    NSInteger count = [CustomScrollView instance].imageArray.count;
    NSLog(@"reloadImages%d",count);
    self.imageScrollView.contentSize = CGSizeMake(300 * (count), 400);
    for (int i = 0; i <= count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * 300, 0, 300, 400)];
        imageView.tag = 100 + i;
        imageView.backgroundColor = [UIColor purpleColor];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didClickImageView:)];
        [tapGesture setNumberOfTapsRequired:2];
        [tapGesture setNumberOfTouchesRequired:1];
        @try {
            imageView.image = [[CustomScrollView instance].imageArray objectAtIndex:i];
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
        
        
        self.pageControl.numberOfPages = [CustomScrollView instance].imageArray.count;
        self.pageControl.currentPage = 0;
        
        
        [imageView addGestureRecognizer:tapGesture];
        [self.imageScrollView addSubview:imageView];
        [tapGesture release];
        [imageView release];
        
    }
    
}

#pragma mark - UIScrollView Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //通过滚动的偏移量来判断目前页面所对应的小白点
    int page = self.imageScrollView.contentOffset.x / 300;
    //pagecontroll响应值的变化
    self.pageControl.currentPage = page;
}

-(void)changePage:(UIPageControl *)sender
{
    int page = self.pageControl.currentPage;    //获取当前pagecontroll的值
    NSLog(@"%d",page);
    [self.imageScrollView setContentOffset:CGPointMake(300 * (page - 1) , 0)];
    
}

- (void)dealloc
{
    self.pageControl = nil;
    self.imageArray = nil;
    self.imageScrollView = nil;
    [super dealloc];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
