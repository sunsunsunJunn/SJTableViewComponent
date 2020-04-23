//
//  UITableView+SJComponent.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/23.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "UITableView+SJComponent.h"
#import <objc/runtime.h>

@implementation UITableView (SJComponent)

#pragma mark - tableView数据设置

- (void)setSj_oneSectionRowArray:(NSMutableArray<id<SJTableViewCellModelProtocol>> *)sj_oneSectionRowArray {
	self.firstSection.rowArray = sj_oneSectionRowArray;
	self.sj_sectionArray = [NSMutableArray arrayWithObject:self.firstSection];
	objc_setAssociatedObject(self, @selector(sj_oneSectionRowArray), sj_oneSectionRowArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray<id<SJTableViewCellModelProtocol>> *)sj_oneSectionRowArray {
	NSMutableArray *rowArray = objc_getAssociatedObject(self, _cmd);
  
	if (!rowArray) {
		rowArray = [NSMutableArray array];
		self.sj_oneSectionRowArray = rowArray;
	}
	return rowArray;
}

- (void)setSj_oneSectionHeaderModel:(id<SJTableViewHeaderFooterModelProtocol>)sj_oneSectionHeaderModel {
	 self.firstSection.header = sj_oneSectionHeaderModel;
}

- (id<SJTableViewHeaderFooterModelProtocol>)sj_oneSectionHeaderModel {
	return self.firstSection.header;
}

- (void)setSj_oneSectionFooterModel:(id<SJTableViewHeaderFooterModelProtocol>)sj_oneSectionFooterModel {
	 self.firstSection.footer = sj_oneSectionFooterModel;
}

- (id<SJTableViewHeaderFooterModelProtocol>)sj_oneSectionFooterModel {
	return self.firstSection.footer;
}

- (SJTableViewSection *)firstSection {
	if (self.sj_sectionArray.count == 0) {
		[self.sj_sectionArray addObject:[[SJTableViewSection alloc] init]];
	}
	return self.sj_sectionArray.firstObject;
}

- (void)setSj_sectionArray:(NSMutableArray<SJTableViewSection *> *)sj_sectionArray {
	objc_setAssociatedObject(self, @selector(sj_sectionArray), sj_sectionArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	self.sj_tableViewImplement.sectionArray = sj_sectionArray;
}

- (NSMutableArray<SJTableViewSection *> *)sj_sectionArray {
	NSMutableArray<SJTableViewSection *> *tableViewSection = objc_getAssociatedObject(self, _cmd);
	
	if (!tableViewSection) {
		tableViewSection = [NSMutableArray array];
		self.sj_sectionArray = tableViewSection;
	}
	return tableViewSection;
}

- (void)setSj_tableViewImplement:(SJTableViewImplement *)sj_tableViewImplement {
	sj_tableViewImplement.sectionArray = self.sj_sectionArray;
  
	__weak typeof(self) wSelf = self;
	sj_tableViewImplement.didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
		__strong typeof(wSelf) self = wSelf;
		if (self.sj_didSelectRowAtIndexPathBlock) {
			self.sj_didSelectRowAtIndexPathBlock(tableView, indexPath);
		}
	};
	
  sj_tableViewImplement.cellForRowAtIndexPathBlock = ^(UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
		__strong typeof(wSelf) self = wSelf;
		if (self.sj_cellForRowAtIndexPathBlock) {
			self.sj_cellForRowAtIndexPathBlock(cell, indexPath);
		}
	};
  
  sj_tableViewImplement.scrollViewDidScrollBlock = ^(UIScrollView * _Nonnull scrollView) {
    __strong typeof(wSelf) self = wSelf;
    if (self.sj_scrollViewDidScrollBlock) {
      self.sj_scrollViewDidScrollBlock(scrollView);
    }
  };
	
  self.delegate = sj_tableViewImplement;
	self.dataSource = sj_tableViewImplement;
	
  objc_setAssociatedObject(self, @selector(sj_tableViewImplement), sj_tableViewImplement, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (SJTableViewImplement *)sj_tableViewImplement {
	SJTableViewImplement *sj_tableViewImplement = objc_getAssociatedObject(self, _cmd);
	
	if (!sj_tableViewImplement) {
		sj_tableViewImplement = [[SJTableViewImplement alloc] init];
		self.sj_tableViewImplement = sj_tableViewImplement;
	}
	return sj_tableViewImplement;
}

- (id<SJTableViewCellModelProtocol>)sj_cellModelForIndexPath:(NSIndexPath *)indexPath {
  return [self.sj_tableViewImplement cellModelForIndexPath:indexPath];
}

- (NSIndexPath *)sj_indexPathForCellModel:(id<SJTableViewCellModelProtocol>)cellModel {
  return [self.sj_tableViewImplement indexPathForCellModel:cellModel];
}

#pragma mark - tableView的一些回调处理

- (void)setSj_cellForRowAtIndexPathBlock:(void (^)(UITableViewCell * _Nonnull, NSIndexPath * _Nonnull))sj_cellForRowAtIndexPathBlock {
	objc_setAssociatedObject(self, @selector(sj_cellForRowAtIndexPathBlock), sj_cellForRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITableViewCell * _Nonnull, NSIndexPath * _Nonnull))sj_cellForRowAtIndexPathBlock {
	return objc_getAssociatedObject(self, _cmd);
}

- (void)setSj_didSelectRowAtIndexPathBlock:(void (^)(UITableView * _Nonnull, NSIndexPath * _Nonnull))sj_didSelectRowAtIndexPathBlock {
	objc_setAssociatedObject(self, @selector(sj_didSelectRowAtIndexPathBlock), sj_didSelectRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITableView * _Nonnull, NSIndexPath * _Nonnull))sj_didSelectRowAtIndexPathBlock {
	return objc_getAssociatedObject(self, _cmd);
}

- (void)setSj_scrollViewDidScrollBlock:(void (^)(UIScrollView * _Nonnull))sj_scrollViewDidScrollBlock {
  objc_setAssociatedObject(self, @selector(sj_scrollViewDidScrollBlock), sj_scrollViewDidScrollBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIScrollView * _Nonnull))sj_scrollViewDidScrollBlock {
  return objc_getAssociatedObject(self, _cmd);
}

@end
