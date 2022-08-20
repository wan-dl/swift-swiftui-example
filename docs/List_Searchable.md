# List Searchable

### 用法

```
List() {}
    .searchable(text: $searchKeyword, placement: SearchFieldPlacement.automatic, prompt: "搜索")
```

### SearchFieldPlacement

> 定义搜索框在视图中的位置

在用户滚动时始终可见搜索框

```swift
.searchable(text: $searchKeyword, placement: SearchFieldPlacement.navigationBarDrawer(displayMode: .always))
```

将搜索框置于导航栏中

```swift
.searchable(text: $searchFood, placement: SearchFieldPlacement.toolbar)
```