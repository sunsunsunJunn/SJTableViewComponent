//
//  SJTableViewController.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/26.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJTableViewController.h"
#import "SJAvartarCellModel.h"
#import "SJLeftTitleRightArrowCellModel.h"
#import "SJLeftTitleRightTitleCellModel.h"
#import "SJLeftTitleRightCopyCellModel.h"
#import "SJSectionHeaderViewModel.h"

@interface SJTableViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation SJTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
  // cell高度由控件撑开需写这句
  tableView.estimatedRowHeight = 40;
	[self.view addSubview:tableView];
	self.tableView = tableView;
  
	//数据创建 可以放在一个viewModel中网络请求后处理
	self.dataSource = [NSMutableArray array];
	[self createDataSource];
}

- (void)createDataSource {
	//固定高度
	SJAvartarCellModel *avartar = [SJAvartarCellModel avartarCellModelByLeftTitle:@"头像" avartarURL:@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1574941816&di=f0adb7ee79202e5f51577fd34f7c17e4&src=http://b-ssl.duitang.com/uploads/item/201409/30/20140930222602_GP5jS.jpeg" arrowLocalPath:@"mk_return_goods_alert_arrow"];
	SJLeftTitleRightArrowCellModel *name = [SJLeftTitleRightArrowCellModel leftTitleRightArrowCellModelByLeftTitle:@"名字" arrowLocalPath:@"mk_return_goods_alert_arrow"];
	SJLeftTitleRightTitleCellModel *number = [SJLeftTitleRightTitleCellModel leftTitleRightTitleCellModelByLeftTitle:@"微信号" rightTitle:@"Stephen"];
	SJLeftTitleRightArrowCellModel *more = [SJLeftTitleRightArrowCellModel leftTitleRightArrowCellModelByLeftTitle:@"更多" arrowLocalPath:@"mk_return_goods_alert_arrow"];
	
	SJSectionHeaderViewModel *sectionHeader = [[SJSectionHeaderViewModel alloc] init];
	SJLeftTitleRightArrowCellModel *address = [SJLeftTitleRightArrowCellModel leftTitleRightArrowCellModelByLeftTitle:@"我的地址" arrowLocalPath:@"mk_return_goods_alert_arrow"];
	
	//约束写法
	SJLeftTitleRightCopyCellModel *copy = [[SJLeftTitleRightCopyCellModel alloc] init];
	copy.leftTitle = @"这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字";
	__weak typeof(self) wSelf = self;
	copy.copyButtonClickedBlock = ^(SJLeftTitleRightCopyCellModel * _Nonnull cellModel) {
		NSLog(@"点击了放大文字");
		__strong typeof(wSelf) self = wSelf;
		//cell高度变化 需要清除高度缓存 重新计算
		[self.tableView sj_cleanCellHeightInCellModel:cellModel];
		cellModel.isExpanded = !cellModel.isExpanded;
		[self.tableView reloadRowsAtIndexPaths:@[[self.tableView sj_indexPathForCellModel:cellModel]] withRowAnimation:UITableViewRowAnimationFade];
	};
	
	
	/*
	//一个sectoin 带有sectionHeader
	self.tableView.sj_oneSectionHeaderModel = sectionHeader;
	[self.tableView.sj_oneSectionRowArray addObjectsFromArray:@[avartar,
																															name,
																															number,
																															more,
																															copy,
																															address]];
	//一个section的写法2
	self.tableView.sj_oneSectionRowArray = @[avartar,
																					 name,
																					 number,
																					 more,
																					 copy,
																					 address].mutableCopy;
	*/
		
	//多个section
	SJTableViewSection *section0 = [[SJTableViewSection alloc] init];
  //使用默认样式header footer
  SJTableViewPlaceholderHeaderFooterModel *defaultHeader = [[SJTableViewPlaceholderHeaderFooterModel alloc] init];
  defaultHeader.backgroundColor = [UIColor greenColor];
  defaultHeader.height = 10;
  section0.header = defaultHeader;
	section0.rowArray = @[avartar,
												name,
												number,
												more].mutableCopy;
	
	SJTableViewSection *section1 = [[SJTableViewSection alloc] init];
	section1.header = sectionHeader;
	section1.rowArray = @[address,
												copy].mutableCopy;
	
	//多个section写法1
	[self.tableView.sj_sectionArray addObjectsFromArray:@[section0,section1]];
	
	/*
	//多个section写法2
	self.tableView.sj_sectionArray = @[section0,
																		 section1].mutableCopy;
	*/
	
	self.tableView.sj_willConfigureCellAtIndexPathBlock = ^(UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
	};
	
	self.tableView.sj_didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
		NSLog(@"点击了第%ld个section第%ld行的cell", (long)indexPath.section, (long)indexPath.row);
	};
	
	[self.tableView reloadData];
}

- (void)dealloc {
	NSLog(@"%@ dealloc", [self class]);
}

@end
