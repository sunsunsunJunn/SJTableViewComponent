//
//  SJTableViewImplement.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/23.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJTableViewImplement.h"
#import "SJTableViewCellProtocol.h"
#import "SJTableViewHeaderFooterModelProtocol.h"
#import "SJTableViewHeaderFooterProtocol.h"
#import "SJTableViewSection.h"

@interface SJTableViewImplement ()

@property (nonatomic, strong) NSMutableSet *cellReusableIdentifierSet;
@property (nonatomic, strong) NSMutableSet *headerFooterReusableIdentifierSet;

@end

@implementation SJTableViewImplement

#pragma mark - Public Methods

- (id<SJTableViewCellModelProtocol>)cellModelForIndexPath:(NSIndexPath *)indexPath {
	if (!self.sectionArray.count) {
		return nil;
	}
	
	SJTableViewSection *secionModel = self.sectionArray[indexPath.section];
	
	if (![secionModel isKindOfClass:[SJTableViewSection class]]) {
		return nil;
	}
	
	if (secionModel.rowArray.count <= indexPath.row) {
		return nil;
	}
	
	return secionModel.rowArray[indexPath.row];
}

- (NSIndexPath *)indexPathForCellModel:(id<SJTableViewCellModelProtocol>)cellModel {
	NSIndexPath *indexPath = nil;
	
	for (int i = 0; i < self.sectionArray.count; i++) {
		NSArray *rowArray = self.sectionArray[i].rowArray;
		if ([rowArray containsObject:cellModel]) {
			NSInteger rowIndex = [rowArray indexOfObject:cellModel];
			indexPath = [NSIndexPath indexPathForRow:rowIndex inSection:i];
			break;
		}
	}

	return indexPath;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.sectionArray[section].rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	SJTableViewSection *tableViewSection = self.sectionArray[indexPath.section];
	id<SJTableViewCellModelProtocol>cellModel = tableViewSection.rowArray[indexPath.row];
	
	Class cellClass = [cellModel sj_cellClass] ? [cellModel sj_cellClass] : UITableViewCell.class;
	NSString *cellIdentifier = NSStringFromClass(cellClass);
	if (![self isRegistedCellIdentifier:cellIdentifier]) {
		NSString *path = [[NSBundle mainBundle] pathForResource:NSStringFromClass(cellClass) ofType:@"nib"];
		if (path) {
			[tableView registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:cellIdentifier];
		} else {
			[tableView registerClass:cellClass forCellReuseIdentifier:cellIdentifier];
		}
		[self.cellReusableIdentifierSet addObject:cellIdentifier];
	}
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
	
	if (self.willConfigureCellAtIndexPathBlock) {
		self.willConfigureCellAtIndexPathBlock(cell, indexPath);
	}
	
	if ([cell conformsToProtocol:@protocol(SJTableViewCellProtocol)]) {
		UITableViewCell<SJTableViewCellProtocol> *tmpCell = (UITableViewCell<SJTableViewCellProtocol> *)cell;

		if ([cell respondsToSelector:@selector(sj_configureCellByCellModel:)]) {
			[tmpCell sj_configureCellByCellModel:cellModel];
		}
		
		if ([cell respondsToSelector:@selector(sj_configureCellByCellModel:atIndexPath:)]) {
			[tmpCell sj_configureCellByCellModel:cellModel atIndexPath:indexPath];
		}
	}
	
	return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	SJTableViewSection *tableViewSection = self.sectionArray[indexPath.section];
	id<SJTableViewCellModelProtocol>cellModel = tableViewSection.rowArray[indexPath.row];
	
	CGFloat cellHeight = cell.frame.size.height;
	CGFloat cacheHeight = cellModel.sj_cellHeight;

	//高度缓存处理
	if (cacheHeight == 0
			|| cacheHeight != cellHeight) {
		cellModel.sj_cellHeight = cellHeight;
	}
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	SJTableViewSection *tableViewSection = self.sectionArray[indexPath.section];
	id<SJTableViewCellModelProtocol>cellModel = tableViewSection.rowArray[indexPath.row];
	return cellModel.sj_cellHeight ?:1.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	SJTableViewSection *tableViewSection = self.sectionArray[indexPath.section];
	id<SJTableViewCellModelProtocol>cellModel = tableViewSection.rowArray[indexPath.row];
	
	if ([cellModel respondsToSelector:@selector(sj_cellHeight)] && cellModel.sj_cellHeight > 0) {
		return cellModel.sj_cellHeight;
	}

	return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	id<SJTableViewHeaderFooterModelProtocol> header = self.sectionArray[section].header;
	
	if ([header respondsToSelector:@selector(sj_headerFooterHeight)] && header.sj_headerFooterHeight >= 0) {
		return header.sj_headerFooterHeight;
	}
	
	return tableView.style == UITableViewStylePlain ? 0 : CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	id<SJTableViewHeaderFooterModelProtocol> footer = self.sectionArray[section].footer;
	
	if ([footer respondsToSelector:@selector(sj_headerFooterHeight)] && footer.sj_headerFooterHeight >= 0) {
		return footer.sj_headerFooterHeight;
	}
	
	return tableView.style == UITableViewStylePlain ? 0 : CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	id<SJTableViewHeaderFooterModelProtocol> header = self.sectionArray[section].header;
	
	return [self viewForHeaderFooterWithTableView:tableView
																				 headerFooterModel:header
																				section:section];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
	id<SJTableViewHeaderFooterModelProtocol> footer = self.sectionArray[section].footer;
	
	return [self viewForHeaderFooterWithTableView:tableView
																				 headerFooterModel:footer
																				section:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (self.didSelectRowAtIndexPathBlock) {
		self.didSelectRowAtIndexPathBlock(tableView, indexPath);
	}
}

#pragma mark - Private Methods

- (__kindof UIView *)viewForHeaderFooterWithTableView:(UITableView *)tableView headerFooterModel:(id<SJTableViewHeaderFooterModelProtocol>)headerFooterModel section:(NSInteger)section {
	
	Class headerFooterClass = [headerFooterModel sj_headerFooterClass] ? [headerFooterModel sj_headerFooterClass] : UIView.class;
	NSString *headerFooterIdentifier = NSStringFromClass(headerFooterClass);
	
	UIView *view = nil;
	if ([headerFooterClass isSubclassOfClass:UITableViewHeaderFooterView.self]) {
		view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
		if (!view) {
			NSString *path = [[NSBundle mainBundle] pathForResource:NSStringFromClass(headerFooterClass) ofType:@"nib"];
			if (path) {
				[tableView registerNib:[UINib nibWithNibName:NSStringFromClass(headerFooterClass) bundle:nil] forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];
			} else {
				[tableView registerClass:headerFooterClass forHeaderFooterViewReuseIdentifier:headerFooterIdentifier];
			}
			view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterIdentifier];
		}
	} else {
		view = [headerFooterClass new];
	}
	
	if ([view conformsToProtocol:@protocol(SJTableViewHeaderFooterProtocol)]) {
		UIView<SJTableViewHeaderFooterProtocol> *tmpView = (UIView<SJTableViewHeaderFooterProtocol> *)view;
		
		if ([tmpView respondsToSelector:@selector(sj_configureHeaderFooterByHeaderFooterModel:)]) {
			[tmpView sj_configureHeaderFooterByHeaderFooterModel:headerFooterModel];
		}
		
		if ([tmpView respondsToSelector:@selector(sj_configureHeaderFooterByHeaderFooterModel:inSection:)]) {
			[tmpView sj_configureHeaderFooterByHeaderFooterModel:headerFooterModel inSection:section];
		}
	}
	
	return view;
}

- (BOOL)isRegistedCellIdentifier:(NSString *)cellIdentifier {
	return [self.cellReusableIdentifierSet containsObject:cellIdentifier];
}

- (BOOL)isRegistedHeaderFooterIdentifier:(NSString *)cellIdentifier {
	return [self.headerFooterReusableIdentifierSet containsObject:cellIdentifier];
}

#pragma mark - Setter Getter

- (NSMutableSet *)cellReusableIdentifierSet {
	if (!_cellReusableIdentifierSet) {
		_cellReusableIdentifierSet = [NSMutableSet set];
	}
	return _cellReusableIdentifierSet;
}

- (NSMutableSet *)headerFooterReusableIdentifierSet {
	if (!_headerFooterReusableIdentifierSet) {
		_headerFooterReusableIdentifierSet = [NSMutableSet set];
	}
	return _headerFooterReusableIdentifierSet;
}

@end
