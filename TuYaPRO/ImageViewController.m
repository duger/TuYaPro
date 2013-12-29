//
//  ImageViewController.m
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageManagement.h"
#import "CustomScrollView.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"看图";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = self.color;
    UIBarButtonItem *deleteItem = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStyleBordered target:self action:@selector(didClickdeleteItem)];
    self.navigationItem.rightBarButtonItem = deleteItem;
    ImageManagement *imageView = [[ImageManagement alloc]init];
    imageView.tag = 10001;
//    imageView.image = [CustomScrollView instance].nowImage;
    [self.view addSubview:imageView];
//    [imageView release];

}


-(void)viewWillAppear:(BOOL)animated
{
   
    ImageManagement *imageView = (ImageManagement *)[self.view viewWithTag:10001];
    [imageView reloadImage];
//    imageView.image = [CustomScrollView instance].nowImage;
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didClickdeleteItem
{
    ImageManagement *imageView = (ImageManagement *)[self.view viewWithTag:10001];
   
    [imageView deleteImage];
    [imageView removeFromSuperview];
}

@end
