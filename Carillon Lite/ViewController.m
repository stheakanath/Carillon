//
//  ViewController.m
//  Carillon Lite
//
//  Created by Sony Theakanath on 10/22/13.
//  Copyright (c) 2013 Sony Theakanath. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize webview;

- (void)viewDidLoad
{
    CGSize screenSize = [self currentSize];
    CGFloat screenWidth = screenSize.width;
    CGFloat screenHeight = screenSize.height;
    [super viewDidLoad];
    [self.webview setFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.thecarillon.org"]];
    [self.webview loadRequest:nsrequest];

    [self.navigationItem setTitle:@"The Carillon Mobile"];
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                  initWithTitle:@"Menu"
                                  style:UIBarButtonItemStyleBordered
                                  target:self
                                  action:@selector(opentray)];
    [self.navigationItem setLeftBarButtonItem:flipButton];
    NSLog(@"1");
}

-(void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(orientationChanged:)  name:UIDeviceOrientationDidChangeNotification  object:nil];
    
    NSLog(@"2");

}

-(void)opentray {
    [self.mm_drawerController setDrawerVisualStateBlock:[MMDrawerVisualState swingingDoorVisualStateBlock]];
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];

}


- (void)orientationChanged:(NSNotification *)notification{
    [self adjustViewsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void) adjustViewsForOrientation:(UIInterfaceOrientation) orientation {
    CGSize screenSize = [self currentSize];
    CGFloat screenWidth = screenSize.width;
    CGFloat screenHeight = screenSize.height;
    [super viewDidLoad];
    [self.webview setFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
}

-(CGSize) currentSize
{
    return [self sizeInOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

-(CGSize) sizeInOrientation:(UIInterfaceOrientation)orientation
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIApplication *application = [UIApplication sharedApplication];
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        size = CGSizeMake(size.height, size.width);
    }
    if (application.statusBarHidden == NO)
    {
        size.height -= MIN(application.statusBarFrame.size.width, application.statusBarFrame.size.height);
    }
    return size;
}

-(void)viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
    NSLog(@"4");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
