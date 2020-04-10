//
//  ViewController.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/23.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "ViewController.h"
#import "SJTableViewController.h"
#import "SJFeedListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)createDataSource {
	
}

- (IBAction)case1ButtonClicked:(id)sender {
	SJTableViewController *tableViewController = [[SJTableViewController alloc] init];
	[self.navigationController pushViewController:tableViewController animated:YES];
}

- (IBAction)mvvmCaseButtonClicked:(id)sender {
  SJFeedListViewController *feedList = [[SJFeedListViewController alloc] init];
  [self.navigationController pushViewController:feedList animated:YES];
}

@end
