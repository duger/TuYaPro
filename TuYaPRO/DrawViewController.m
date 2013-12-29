//
//  DrawViewController.m
//  TuYaPRO
//
//  Created by Duger on 13-9-23.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "DrawViewController.h"
#import "DrawView.h"
#import "ChangeColorView.h"
#import "ChangeLineColorManger.h"
#import "ChangeLineWidthView.h"


@interface DrawViewController ()

@end

@implementation DrawViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ImageArray = [[NSMutableArray alloc]init];
    self.view.backgroundColor = self.color;
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(didClickSaveItem:)];
    
    self.navigationItem.rightBarButtonItem = saveItem;
    
    
    //navigation 上的按钮
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"背景",@"画笔颜色",@"画笔大小"]];
    [segmentedControl addTarget:self action:@selector(didClickSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.frame = CGRectMake(0, 0, 90, 30);
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.momentary = YES;
    //    [self.navigationController.navigationBar addSubview:segmentedControl];
    //    [segmentedControl setFrame:CGRectMake(215, 7, 45, 30)];
    self.navigationItem.titleView = segmentedControl;
    [segmentedControl release];
    
    ChangeColorView *backgroundColorView = [[ChangeColorView alloc]init];
    backgroundColorView.tag = 101;
    backgroundColorView.delegate = self;
    [[UIApplication sharedApplication].keyWindow addSubview:backgroundColorView];
    
    ChangeLineColorManger *lineColorView = [[ChangeLineColorManger alloc]init];
    lineColorView.tag = 102;
    lineColorView.delegate = self;
    [[UIApplication sharedApplication].keyWindow addSubview:lineColorView];
    
    ChangeLineWidthView *lineWidthView = [[ChangeLineWidthView alloc]init];
    lineWidthView.tag = 103;
    lineWidthView.delegate = self;
    [[UIApplication sharedApplication].keyWindow addSubview:lineWidthView];
    
    
    DrawView *drawView = [[DrawView alloc]initWithFrame:CGRectMake(10, 8, 300, 400)];
    drawView.backgroundColor = [ChangeColorView instance].changedColor;
    drawView.tag = 105;
    

    [self.view addSubview:drawView];
//    [drawView release];
    
    
    //    CustomScrollView *customScrollView  = [[CustomScrollView alloc]init];
    //    customScrollView.tag = 104;
    ////    customScrollView.delegate = self;
    //    [customScrollView.imageArray addObjectsFromArray:self.imageArray];
    
}



- (void)didReceiveMemoryWarning
{
//    self.view = nil;
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didClickSegmentedControl:(UISegmentedControl *)sender
{
    ChangeColorView *backgroundColorView = (ChangeColorView *)[[UIApplication sharedApplication].keyWindow viewWithTag:101];
    ChangeLineColorManger *lineColorView = (ChangeLineColorManger *)[[UIApplication sharedApplication].keyWindow viewWithTag:102];
    ChangeLineWidthView *lineWidthView = (ChangeLineWidthView *)[[UIApplication sharedApplication].keyWindow viewWithTag:103];
   
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            //            backgroundColorView.titleTextField.text = @"背景颜色";
            backgroundColorView.hidden = NO;
            
            
//            drawView.backgroundColor = [ChangeColorView instance].changedColor;
            break;
        case 1:
            lineColorView.hidden = NO;
            //            lineColorView.titleTextField.text = @"画笔颜色";
            
            break;
        case 2:
            lineWidthView.hidden = NO;
//            drawView.linewidth = lineWidthView.lineWidth;
            break;
            
        default:
            break;
    }
    
}


-(void)didClickSaveItem:(UIBarButtonItem *)button
{
    DrawView *drawView = (DrawView *)[self.view viewWithTag:105];
    
    [self.ImageArray addObject:[drawView getMyImage]];

    [[CustomScrollView instance].imageArray insertObject:[drawView getMyImage] atIndex:0];
    NSLog(@"DrawView ImageArray%d",self.ImageArray.count);
    NSLog(@"单例CustomScrollView %d",[CustomScrollView instance].imageArray.count);
}

#pragma mark CustonScrollView Delegate
-(void)getImages
{
    
    
}

#pragma mark ChangeColorView Delegate
-(void)reSetBackgroundColor
{
    DrawView *drawView = (DrawView *)[self.view viewWithTag:105];
    drawView.backgroundColor = [ChangeColorView instance].changedColor;
}

-(NSString *)giveMeYourBackgroundTitle
{
    return @"背景颜色";
}

-(NSString *)giveMeYourLineColorTitle
{
    return @"画笔颜色";
}
-(NSString *)giveMeYourLineWidthTitle
{
    return @"画笔宽度";
}
#pragma mark ChangeLineColorManger Delegate
-(void)reSetColor:(UIColor *)color
{
    DrawView *drawView = (DrawView *)[self.view viewWithTag:105];
    drawView.lineColor = color;
}

#pragma mark ChangeLineWidth Delegate
-(void)resetLineWidth:(CGFloat)lineWidth
{
    DrawView *drawView = (DrawView *)[self.view viewWithTag:105];
    drawView.linewidth = lineWidth;
}

@end
