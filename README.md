# SJTableViewComponent

[![Cocoapods](https://img.shields.io/cocoapods/v/SJTableViewComponent)]


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
