//
//  MainScrollViewController.m
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "MainScrollViewController.h"
#import "AboutViewController.h"
#import "ImageViewController.h"
#import "DrawViewController.h"
#import "CustomScrollView.h"

@interface MainScrollViewController ()

@end

@implementation MainScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"DRAW";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    AboutViewController *aboutVC = [[AboutViewController alloc]init];
//    ImageViewController *imageVC = [[ImageViewController alloc]init];
    
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    CustomScrollView *customScrollView = [[CustomScrollView alloc]init];
    customScrollView.tag = 1001;
    [self.view addSubview:customScrollView];
    NSLog(@"mainScroll%d",customScrollView.imageArray.count);
    
    
    
    customScrollView.delegate = self;
    
    UIBarButtonItem *baceItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = baceItem;
    UIBarButtonItem *aboutItem = [[UIBarButtonItem alloc]initWithTitle:@"About" style:UIBarButtonItemStyleBordered target:self action:@selector(didClickAboutButton:)];
    self.navigationItem.rightBarButtonItem = aboutItem;
    UIBarButtonItem *DrawItem = [[UIBarButtonItem alloc]initWithTitle:@"NEW" style:UIBarButtonItemStyleBordered target:self action:@selector(didClickDrawButton:)];
    self.navigationItem.leftBarButtonItem = DrawItem;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    CustomScrollView *customScrollView = (CustomScrollView *) [self.view viewWithTag:1001];
    [customScrollView reloadImages];
    
    
}


-(void)didClickAboutButton:(UIBarButtonItem *)button
{
    AboutViewController *aboutVC = [[AboutViewController alloc]init];
    aboutVC.color = self.view.backgroundColor;
    [self.navigationController pushViewController:aboutVC animated:YES];

    [aboutVC release];
}

-(void)didClickDrawButton:(UIBarButtonItem *)button
{
    DrawViewController *drawVC = [[DrawViewController alloc]init];
    drawVC.color = self.view.backgroundColor;
    [self.navigationController pushViewController:drawVC animated:YES];
    
    [drawVC release];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didClickImage
{
    ImageViewController *imageVC = [[ImageViewController alloc]init];
    imageVC.color = self.view.backgroundColor;
    [self.navigationController pushViewController:imageVC animated:YES];
    
    [imageVC release];
}


@end
