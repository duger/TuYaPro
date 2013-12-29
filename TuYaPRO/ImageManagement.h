//
//  ImageManagement.h
//  TuYaPRO
//
//  Created by Duger on 13-9-24.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageManagement : UIView
+(ImageManagement *)instance;


@property(nonatomic,retain) UIImage *image;

-(void)deleteImage;
-(void)reloadImage;
@end
