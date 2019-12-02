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

- (id<SJTableViewCellModelProtocol>)sj_cellModelForIndexPath:(NSIndexPath *)indexPath {
	return [self.sj_tableViewImplement cellModelForIndexPath:indexPath];
}

- (NSIndexPath *)sj_indexPathForCellModel:(id<SJTableViewCellModelProtocol>)cellModel {
	return [self.sj_tableViewImplement indexPathForCellModel:cellModel];
}

- (void)sj_cleanCellHeightInCellModel:(id<SJTableViewCellModelProtocol>)cellModel {
	cellModel.sj_cellHeight = 0;
}

#pragma mark - Setter Getter

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
	sj_tableViewImplement.willConfigureCellAtIndexPathBlock = ^(UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
		__strong typeof(wSelf) self = wSelf;
		if (self.sj_willConfigureCellAtIndexPathBlock) {
			self.sj_willConfigureCellAtIndexPathBlock(cell, indexPath);
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

- (void)setSj_willConfigureCellAtIndexPathBlock:(void (^)(UITableViewCell * _Nonnull, NSIndexPath * _Nonnull))sj_willConfigureCellAtIndexPathBlock {
	objc_setAssociatedObject(self, @selector(sj_willConfigureCellAtIndexPathBlock), sj_willConfigureCellAtIndexPathBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITableViewCell * _Nonnull, NSIndexPath * _Nonnull))sj_willConfigureCellAtIndexPathBlock {
	return objc_getAssociatedObject(self, _cmd);
}


- (void)setSj_didSelectRowAtIndexPathBlock:(void (^)(UITableView * _Nonnull, NSIndexPath * _Nonnull))sj_didSelectRowAtIndexPathBlock{
	objc_setAssociatedObject(self, @selector(sj_didSelectRowAtIndexPathBlock), sj_didSelectRowAtIndexPathBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITableView * _Nonnull, NSIndexPath * _Nonnull))sj_didSelectRowAtIndexPathBlock {
	return objc_getAssociatedObject(self, _cmd);
}

@end
