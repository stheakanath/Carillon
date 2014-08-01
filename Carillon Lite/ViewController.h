//
//  ViewController.h
//  Carillon Lite
//
//  Created by Sony Theakanath on 10/22/13.
//  Copyright (c) 2013 Sony Theakanath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerDelegate.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerVisualState.h"

@interface ViewController : UIViewController <ViewControllerDelegate, UIWebViewDelegate>{
    UIWebView *webview;
}

@property (strong, nonatomic) IBOutlet UIWebView *webview;

@end
