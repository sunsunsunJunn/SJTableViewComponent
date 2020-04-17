# SJTableViewComponent

[![Cocoapods](https://img.shields.io/cocoapods/v/SJTableViewComponent)](https://cocoapods.org/pods/SJTableViewComponent)&nbsp;


UITableView组件
参考项目：https://github.com/indulgeIn/YBHandyList

主要思想：cell和模型绑定，一一对应，不用考虑cellForRow中的位置判断,根据数据源model的位置，决定cell的位置，可以更加专注于数据的处理

## 安装

### CocoaPods

1. 在 Podfile 中添加 `pod 'SJTableViewComponent'`。
2. 执行 `pod install` 或 `pod update`。
3. 导入 `<SJTableViewComponent/SJTableViewComponent.h>`。

### 手动导入

1. 下载 Demo,将Demo中的 SJTableViewComponent 文件夹所有内容并且拖入你的工程中。
2. 导入 `SJTableViewComponent.h`。

## 用法

Demo中 SJTableViewController 中查看使用方法。

cellModel和cell一一对应

cellModel实现<SJTableViewCellModelProtocol>协议 必须实现的方法：

```
@synthesize sj_cellHeight = _sj_cellHeight;

- (nonnull Class<SJTableViewCellProtocol>)sj_cellClass {
	return [SJAvartarCell class];
}

```

cell实现<SJTableViewCellProtocol>协议可选择实现赋值的方法：

```

#pragma mark - SJTableViewCellProtocol

- (void)sj_configureCellByCellModel:(nonnull id<SJTableViewCellModelProtocol>)cellModel {	
  //cellModel为业务数据 根据数据做页面处理
  
	SJAvartarCellModel *avartarModel = cellModel;
	
	self.avartarLabel.text = avartarModel.leftTitle;
	
	[self.avartarImageView sd_setImageWithURL:[NSURL URLWithString:avartarModel.avartarURL]];
	
	self.arrowImageView.image = [UIImage imageNamed:avartarModel.arrowLocalPath];
}

```

## 版本更新记录

### 1.1.0 - 修复section=0时 tableview代理顺序可能会出现异常的问题
删除implement中的tableView的预估高度代理，需要使用cell由内部空间撑开，外部tableView需设置 
```
tableView.estimatedRowHeight = xx;
```

### 1.1.1 -  新增sectionHeader 占位样式model 用于快速构建无需定制样式的占位header或footer

```
SJTableViewPlaceholderHeaderFooterModel *defaultHeader = [[SJTableViewPlaceholderHeaderFooterModel alloc] init];
defaultHeader.backgroundColor = [UIColor greenColor];
defaultHeader.height = 10;
section0.header = defaultHeader;
```

### 1.1.2 -  新增TableView滚动的回调，新增Demo
