# Pithy Dart

一个简洁高效的 Flutter 扩展库，提供链式调用的 Widget 扩展、屏幕适配、工具类等，让 Flutter 开发更加简单优雅。

## 特性

- 🎨 **Widget 扩展**：100+ 链式方法，告别嵌套地狱
- 📱 **屏幕适配**：ScreenUtil 响应式布局
- 🎯 **Text/Icon 扩展**：快速设置样式和属性
- 📦 **List 转布局**：一行代码将列表转为 Column/Row/Stack
- 🔧 **常用工具**：平台判断、导航、颜色、时间等
- ✨ **毛玻璃效果**：GlossyContainer 组件

---

## 安装

```yaml
dependencies:
  pithy_dart: ^1.0.0
```

```dart
import 'package:pithy_dart/pithy_dart.dart';
```

---

## 快速开始

### 1. Widget 扩展 - 告别嵌套

**传统写法：**
```dart
Container(
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.symmetric(horizontal: 20),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Text('Hello'),
)
```

**链式调用：**
```dart
Text('Hello')
  .padding(all: 16)
  .margin(horizontal: 20)
  .backgroundColor(Colors.blue)
  .borderRadius(all: 12)
```

### 2. 屏幕适配

```dart
void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),  // 设计稿尺寸
      child: MyApp(),
    ),
  );
}

// 使用
Container(
  width: 100.w,      // 宽度适配
  height: 50.h,      // 高度适配
  child: Text(
    'Title',
    style: TextStyle(fontSize: 16.sp),  // 字体适配
  ),
).borderRadius(all: 8.r)  // 圆角适配
```

---

## 主要功能

## 📦 Widget 扩展

### 布局相关
```dart
// 内边距
widget.padding(all: 16)
widget.padding(horizontal: 20, vertical: 10)
widget.paddingOnly(left: 10, top: 5)

// 外边距
widget.margin(all: 20)
widget.margin(horizontal: 16)

// 对齐
widget.center()
widget.align(Alignment.topLeft)

// 尺寸
widget.size(width: 100, height: 50)
widget.width(200)
widget.height(100)
```

### 样式相关
```dart
// 背景色
widget.backgroundColor(Colors.blue)
widget.backgroundColor(Colors.red, animate: true)  // 支持动画

// 圆角
widget.borderRadius(all: 12)
widget.borderRadius(topLeft: 10, bottomRight: 10)
widget.circular()  // 圆形

// 边框
widget.border(color: Colors.blue, width: 2)
widget.borderOnly(left: 2, color: Colors.red)

// 阴影
widget.boxShadow(color: Colors.black26, blurRadius: 8)
widget.elevation(4)  // Material 阴影
```

### 交互相关
```dart
// 点击
widget.onTap(() => print('clicked'))
widget.onDoubleTap(() => print('double clicked'))
widget.onLongPress(() => print('long pressed'))

// 涟漪效果
widget.ripple()
widget.ripple(splashColor: Colors.blue)

// 手势
widget.gestures(
  onTap: () {},
  onPanUpdate: (details) {},
)
```

### 动画相关
```dart
// 透明度动画
widget.opacity(0.5, animate: true)

// 旋转
widget.rotate(angle: 0.5)

// 缩放
widget.scale(scale: 1.2, animate: true)

// 移动
widget.translate(offset: Offset(10, 20))
```

### 其他
```dart
// 可见性
widget.visible(isVisible)
widget.hide()  // 隐藏但保留空间
widget.offstage(isOffstage)  // 完全移除

// 裁剪
widget.clipRect()
widget.clipRRect(borderRadius: 12)
widget.clipOval()  // 椭圆裁剪

// Hero 动画
widget.hero(tag: 'imageHero')

// 约束
widget.constrained(maxWidth: 300, minHeight: 100)
widget.expanded(flex: 1)
widget.flexible()
```

---

## 📝 Text 扩展

```dart
Text('Hello')
  .fontSize(18)
  .fontWeight(FontWeight.bold)
  .textColor(Colors.blue)
  .letterSpacing(1.2)
  .lineHeight(1.5)
  .textAlign(TextAlign.center)
  .maxLines(2)
  .overflow(TextOverflow.ellipsis)
  .underline()  // 下划线
  .lineThrough()  // 删除线
```

---

## 🎨 Icon 扩展

```dart
Icon(Icons.home)
  .iconSize(32)
  .iconColor(Colors.red)
  .copyWith(size: 40, color: Colors.blue)
```

---

## 📋 List 扩展 - 快速转布局

```dart
// Column（垂直布局）
[
  Text('Item 1'),
  Text('Item 2'),
  Text('Item 3'),
].toColumn()

// 带间距
[...].toColumnSpace(spacing: 10)

// Row（水平布局）
[...].toRow()
[...].toRowSpace(spacing: 16)

// Stack（层叠布局）
[...].toStack()

// Wrap（自动换行）
[...].toWrap(spacing: 8, runSpacing: 8)

// ListView
[...].toListView(separator: Divider())
```

---

## 🔤 String 扩展

```dart
// 非空判断
String? text;
text.isNotEmpty  // 安全的非空检查
text.isEmpty

// 类型转换
'123'.toInt()          // 123
'3.14'.toDouble()      // 3.14
'true'.toBool()        // true
'#FF5733'.toColor()    // Color(0xFFFF5733)

// 工具方法
'hello'.capitalize()   // 'Hello'
'  text  '.trimAll()   // 'text'
```

---

## 📱 Context 扩展

```dart
// 屏幕信息
context.screenWidth
context.screenHeight
context.isLandscape
context.isPortrait

// 导航
context.push(NewPage())
context.pop()
context.pushReplacement(NewPage())

// 颜色（主题色）
context.primaryColor
context.accentColor
context.backgroundColor
```

---

## 🧭 Navigator 扩展

```dart
// Material 风格导航
context.navigator.pushMaterial(DetailPage())

// iOS 风格导航
context.navigator.pushCupertino(DetailPage())

// 替换页面
context.navigator.pushReplacementMaterial(NewPage())

// 清除并跳转
context.navigator.pushAndRemoveUntilMaterial(
  HomePage(),
  (route) => false,
)
```

---

## ⏱️ Duration 扩展

```dart
// 快速创建时长
1.seconds        // Duration(seconds: 1)
500.milliseconds // Duration(milliseconds: 500)
2.minutes        // Duration(minutes: 2)
1.hours          // Duration(hours: 1)
7.days           // Duration(days: 7)

// 延迟执行
2.seconds.future.then((_) {
  print('2秒后执行');
});

// 或者
await 3.seconds.delay();
print('3秒后执行');
```

---

## 📐 Padding 扩展

```dart
// 快速创建 EdgeInsets
16.paddingAll           // EdgeInsets.all(16)
20.paddingHorizontal    // EdgeInsets.symmetric(horizontal: 20)
10.paddingVertical      // EdgeInsets.symmetric(vertical: 10)
```

---

## 🖥️ Platform 扩展

```dart
// 平台判断
context.isAndroid
context.isIOS
context.isWeb
context.isMacOS
context.isWindows
context.isLinux
context.isMobile      // iOS 或 Android
context.isDesktop     // Windows、macOS 或 Linux
```

---

## 🎨 Colors 扩展

```dart
// 快速访问主题色
context.themeColors.primary
context.themeColors.secondary
context.themeColors.surface
context.themeColors.error
```

---

## 📺 MediaQuery 扩展

```dart
// 便捷访问媒体查询信息
context.sizes.width
context.sizes.height
context.sizes.padding
context.sizes.viewInsets
context.sizes.devicePixelRatio
```

---

## 🌟 GlossyContainer - 毛玻璃效果

```dart
GlossyContainer(
  width: 300,
  height: 200,
  child: Text('毛玻璃效果'),
)

// 自定义
GlossyContainer(
  width: 300,
  height: 200,
  borderRadius: BorderRadius.circular(20),
  gradient: GlossyGradient.primary,
  child: Column(
    children: [
      Text('标题'),
      Text('内容'),
    ],
  ),
)
```

---

## 🛠️ UI 工具类

```dart
// 快速创建 Text
UI.text('Hello', fontSize: 16, color: Colors.blue)

// 快速创建 Icon
UI.icon(Icons.home, size: 24, color: Colors.red)

// 占位符
UI.placeholder(width: 100, height: 100)
UI.placeholder(width: 100, height: 100, color: Colors.grey)
```

---

## 🐛 DevTools 扩展

```dart
// 简单的日志输出
object.log()
'Debug message'.log()
user.log()  // 打印对象
```

---

## 💡 实用示例

### 示例 1：简单卡片
```dart
Container(
  child: Column(
    children: [
      Text('标题').fontSize(20).fontWeight(FontWeight.bold),
      SizedBox(height: 8),
      Text('描述文本').textColor(Colors.grey),
    ],
  ),
)
  .padding(all: 16)
  .backgroundColor(Colors.white)
  .borderRadius(all: 12)
  .elevation(2)
  .onTap(() => print('卡片被点击'))
```

### 示例 2：响应式布局
```dart
[
  Icon(Icons.home).iconSize(32),
  SizedBox(width: 16),
  Text('首页').fontSize(18),
]
  .toRow()
  .padding(all: 20)
  .backgroundColor(Colors.blue)
  .center()
```

### 示例 3：带动画的容器
```dart
Container(
  child: Text('点击我'),
)
  .size(width: 200.w, height: 100.h)
  .backgroundColor(Colors.purple, animate: true)
  .borderRadius(all: 12.r)
  .opacity(0.9, animate: true)
  .scale(scale: 1.0, animate: true)
  .onTap(() {
    // 状态改变会自动播放动画
  })
```

### 示例 4：列表转布局
```dart
List<String> items = ['Apple', 'Banana', 'Orange'];

// 方式 1：转为 Column
items
  .map((item) => Text(item))
  .toList()
  .toColumnSpace(spacing: 10)

// 方式 2：转为 Wrap
items
  .map((item) => Chip(label: Text(item)))
  .toList()
  .toWrap(spacing: 8, runSpacing: 8)
```

---

## 📚 更多示例

查看 `/example` 目录获取完整的示例代码，包括：
- Widget 扩展完整演示
- ScreenUtil 屏幕适配
- 各种布局和动画
- 实际应用场景

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License
