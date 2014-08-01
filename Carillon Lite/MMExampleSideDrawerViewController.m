//
//  MMEXAMPLESIDEDRAWERVIEWCONTROLLER
//  Wear Pants
//
//  Created by Sony Theakanath on 6/18/13.
//  Copyright (c) 2013 Sony Theakanath. All rights reserved.
//


#import "MMExampleSideDrawerViewController.h"
#import "MMSideDrawerTableViewCell.h"
#import "MMSideDrawerSectionHeaderView.h"
#import "ViewController.h"
#import "AppDelegate.h"

@implementation MMExampleSideDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, screenWidth, screenHeight) style:UITableViewStylePlain];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.tableView setSeparatorColor:[UIColor colorWithRed:49.0/255.0 green:54.0/255.0 blue:57.0/255.0 alpha:1.0]];
    [self.tableView setBackgroundColor:[UIColor colorWithRed:77.0/255.0 green:79.0/255.0 blue:80.0/255.0 alpha:1.0]];
    [self.view setBackgroundColor:[UIColor colorWithRed:66.0/255.0 green:69.0/255.0 blue:71.0/255.0 alpha:1.0]];
    self.drawerWidths = @[@(160),@(200),@(240),@(280),@(320)];
    [self.view setBackgroundColor:[UIColor clearColor]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.tableView.numberOfSections-1)] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 1)
        return 3;
    else {
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MMSideDrawerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    }
    if(indexPath.section == 1) {
        if(indexPath.row == 0)
            [cell.textLabel setText:@"Bugs? Contact Me!"];
        else if(indexPath.row == 1)
            [cell.textLabel setText:@"Rate This App!"];
        else if(indexPath.row == 2)
            [cell.textLabel setText:@"sonytheakanath.com"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    } else {
        if(indexPath.row == 0)
            [cell.textLabel setText:@"Masculinity Blog"];
        else if(indexPath.row == 1)
            [cell.textLabel setText:@"Sports Scores"];
        else if(indexPath.row == 2)
            [cell.textLabel setText:@"Carillon Website"];
        else if(indexPath.row == 3)
            [cell.textLabel setText:@"Bellarmine News"];
        else if(indexPath.row == 4)
            [cell.textLabel setText:@"Zenfolio"];
    }
    return cell;
}


-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"The Carillon Mobile";
    else
        return @"More";
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MMSideDrawerSectionHeaderView* headerView =  [[MMSideDrawerSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), 20.0f)];
    [headerView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [headerView setTitle:[tableView.dataSource tableView:tableView titleForHeaderInSection:section]];
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 23.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 1) {
        if(indexPath.row == 0){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"mailto:Sony.Theakanath14@bcp.org"stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        } else if(indexPath.row == 1) {
            //Reset url
            NSString *url = @"https://itunes.apple.com/us/app/the-carillon/id687444974?mt=8";
            url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[url stringByAppendingFormat:@""]]];
        } else if(indexPath.row == 2) {
            NSString *url = @"http://www.sonytheakanath.com";
            url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[url stringByAppendingFormat:@""]]];
        }
    } else {
        if(indexPath.row == 0) {
            NSString *url = @"http://masculinitysummit.wordpress.com/";
            url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[url stringByAppendingFormat:@""]]];
        } else if(indexPath.row == 1) {
            NSString *url = @"http://www.bcp.org/athletics/index.aspx";
            url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[url stringByAppendingFormat:@""]]];
        } else if(indexPath.row == 2) {
            NSString *url = @"http://www.thecarillon.org";
            url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[url stringByAppendingFormat:@""]]];
        } else if(indexPath.row == 3) {
            NSString *url = @"http://www.bcp.org/news/index.aspx?pageaction=ViewPublic&ModuleID=191";
            url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[url stringByAppendingFormat:@""]]];
        } else if(indexPath.row == 4) {
            NSString *url = @"http://carillon.zenfolio.com/";
            url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[url stringByAppendingFormat:@""]]];
        }
    }
    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
    }
}

@end
