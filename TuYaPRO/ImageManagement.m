//
//  ImageManagement.m
//  TuYaPRO
//
//  Created by Duger on 13-9-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ImageManagement.h"
#import "CustomScrollView.h"

@implementation ImageManagement
{
    UIImageView *imageView;
}

static ImageManagement *s_ImageManagement = nil;
+(ImageManagement *)instance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_ImageManagement == nil) {
            s_ImageManagement = [[ImageManagement alloc]initWithFrame:CGRectZero];
            
        }
    });
    return s_ImageManagement;
}




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame = CGRectMake(10, 8, 300, 400);
        
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
        imageView.backgroundColor = [UIColor purpleColor];
        imageView.image = [CustomScrollView instance].nowImage;
        
        [self addSubview:imageView];
        
    }
    return self;
}

-(void)reloadImage
{
    imageView.image = [CustomScrollView instance].nowImage;
}

-(void)deleteImage
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"删除" message:@"确认删除图片吗？" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alertView show];
    [[CustomScrollView instance].imageArray removeObjectAtIndex:[[CustomScrollView instance].imageArray indexOfObject:[CustomScrollView instance].nowImage]];
 
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
