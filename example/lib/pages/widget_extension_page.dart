import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class WidgetExtensionPage extends StatefulWidget {
  const WidgetExtensionPage({super.key});

  @override
  State<WidgetExtensionPage> createState() => _WidgetExtensionPageState();
}

class _WidgetExtensionPageState extends State<WidgetExtensionPage> {
  bool _isAnimated = false;

  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('已复制到剪贴板'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final examples = [
      _ExampleItem(
        title: 'padding',
        description: '内边距',
        code: 'widget.padding(all: 20)',
        detailCode: '''// 所有方向相同
widget.padding(all: 20)

// 水平和垂直
widget.padding(horizontal: 16, vertical: 8)

// 单独设置
widget.padding(left: 10, top: 20, right: 10, bottom: 20)''',
        builder: (context) => Container()
            .backgroundColor(Colors.blue.shade100)
            .padding(all: 16)
            .child(Text('padding', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
      ),
      _ExampleItem(
        title: 'backgroundColor',
        description: '背景颜色',
        code: 'widget.backgroundColor(Colors.purple)',
        detailCode: '''// 设置纯色背景
widget.backgroundColor(Colors.purple)

// 支持动画
widget.backgroundColor(Colors.blue, animate: true)''',
        builder: (context) => Text('背景色',
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500))
            .backgroundColor(Colors.purple)
            .padding(all: 12),
      ),
      _ExampleItem(
        title: 'borderRadius',
        description: '圆角',
        code: 'widget.borderRadius(all: 20)',
        detailCode: '''// 所有圆角相同
widget.borderRadius(all: 20)

// 单独设置
widget.borderRadius(
  topLeft: 20, 
  topRight: 20,
  bottomLeft: 0, 
  bottomRight: 0
)''',
        builder: (context) => Container(width: 70, height: 70)
            .backgroundColor(Colors.orange)
            .borderRadius(all: 15)
            .center(),
      ),
      _ExampleItem(
        title: 'boxShadow',
        description: '阴影',
        code: 'widget.boxShadow(...)',
        detailCode: '''// 添加阴影
widget.boxShadow(
  color: Colors.blue.withOpacity(0.3),
  blurRadius: 8,
  offset: Offset(0, 3),
)''',
        builder: (context) => Container(width: 90, height: 60)
            .backgroundColor(Colors.white)
            .borderRadius(all: 8)
            .boxShadow(
              color: Colors.blue.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 3),
            )
            .center(),
      ),
      _ExampleItem(
        title: 'width & height',
        description: '尺寸',
        code: 'widget.width(150).height(80)',
        detailCode: '''// 设置宽度
widget.width(150)

// 设置高度
widget.height(80)

// 链式调用
widget.width(150).height(80)

// 支持动画
widget.width(150, animate: true)''',
        builder: (context) => Container()
            .backgroundColor(Colors.green)
            .width(110)
            .height(70)
            .center(),
      ),
      _ExampleItem(
        title: 'opacity',
        description: '透明度',
        code: 'widget.opacity(0.5)',
        detailCode: '''// 设置透明度 (0.0 - 1.0)
widget.opacity(0.5)

// 完全透明
widget.opacity(0.0)

// 完全不透明
widget.opacity(1.0)''',
        builder: (context) => Text('透明度',
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500))
            .padding(all: 12)
            .backgroundColor(Colors.red)
            .opacity(0.5)
            .center(),
      ),
      _ExampleItem(
        title: 'rotate',
        description: '旋转',
        code: 'widget.rotate(angle: 0.3)',
        detailCode: '''// 旋转 Widget（弧度）
widget.rotate(angle: 0.3)

// 旋转 90 度
widget.rotate(angle: pi / 2)

// 旋转 180 度
widget.rotate(angle: pi)''',
        builder: (context) => Container(width: 60, height: 60)
            .backgroundColor(Colors.teal)
            .rotate(angle: 0.3)
            .center(),
      ),
      _ExampleItem(
        title: 'scale',
        description: '缩放',
        code: 'widget.scale(all: 1.5)',
        detailCode: '''// 等比缩放
widget.scale(all: 1.5)

// 分别设置
widget.scale(x: 1.5, y: 0.8)''',
        builder: (context) => Container(width: 50, height: 50)
            .backgroundColor(Colors.pink)
            .scale(all: 1.3)
            .center(),
      ),
      _ExampleItem(
        title: 'align',
        description: '对齐',
        code: 'widget.alignLeft() / alignCenter() / alignRight()',
        detailCode: '''// 左对齐
widget.alignLeft()

// 居中对齐
widget.alignCenter()

// 右对齐
widget.alignRight()

// 顶部对齐
widget.alignTop()

// 底部对齐
widget.alignBottom()''',
        builder: (context) => Column(
          children: [
            Container(width: 40, height: 40)
                .backgroundColor(Colors.red)
                .alignLeft(),
            SizedBox(height: 6),
            Container(width: 40, height: 40)
                .backgroundColor(Colors.green)
                .alignCenter(),
            SizedBox(height: 6),
            Container(width: 40, height: 40)
                .backgroundColor(Colors.blue)
                .alignRight(),
          ],
        ),
      ),
      _ExampleItem(
        title: 'onTap',
        description: '点击事件',
        code: 'widget.onTap(() { })',
        detailCode: '''// 添加点击事件
widget.onTap(() {
  print('已点击');
})

// 双击事件
widget.onDoubleTap(() {
  print('双击');
})

// 长按事件
widget.onLongPress(() {
  print('长按');
})''',
        builder: (context) =>
            Text('点击', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500))
                .padding(all: 14)
                .backgroundColor(Colors.blue)
                .borderRadius(all: 8)
                .onTap(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('已点击'),
                        duration: Duration(seconds: 1)),
                  );
                })
                .center(),
      ),
      _ExampleItem(
        title: 'ripple',
        description: '涟漪效果',
        code: 'widget.ripple()',
        detailCode: '''// 添加 Material 涟漪效果
widget.ripple()

// 自定义涟漪颜色
widget.ripple(splashColor: Colors.blue)''',
        builder: (context) => Text('涟漪',
                style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w500))
            .padding(all: 14)
            .backgroundColor(Colors.purple.shade100)
            .borderRadius(all: 8)
            .ripple()
            .center(),
      ),
      _ExampleItem(
        title: 'elevation',
        description: 'Material 阴影',
        code: 'widget.elevation(8)',
        detailCode: '''// Material Design 阴影
widget.elevation(8)

// 不同的阴影高度
widget.elevation(2)  // 轻微阴影
widget.elevation(8)  // 中等阴影
widget.elevation(16) // 强阴影''',
        builder: (context) => Container(width: 90, height: 60)
            .backgroundColor(Colors.white)
            .borderRadius(all: 8)
            .elevation(8)
            .center(),
      ),
      _ExampleItem(
        title: 'animate',
        description: '动画效果',
        code: 'widget.animate(duration, curve)',
        detailCode: '''// 让属性支持动画
widget
  .backgroundColor(color, animate: true)
  .width(size, animate: true)
  .animate(Duration(milliseconds: 500), Curves.easeInOut)

// 不同的动画曲线
Curves.easeIn
Curves.easeOut
Curves.bounceIn
Curves.elasticOut''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container()
                .backgroundColor(
                  _isAnimated ? Colors.blue : Colors.red,
                  animate: true,
                )
                .width(_isAnimated ? 60 : 40, animate: true)
                .height(_isAnimated ? 60 : 40, animate: true)
                .borderRadius(all: _isAnimated ? 30 : 6, animate: true)
                .animate(
                  const Duration(milliseconds: 500),
                  Curves.easeInOut,
                )
                .center(),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isAnimated = !_isAnimated;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text('切换', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
      _ExampleItem(
        title: 'gradient',
        description: '渐变背景',
        code: 'widget.backgroundLinearGradient(...)',
        detailCode: '''// 线性渐变
widget.backgroundLinearGradient(
  colors: [Colors.purple, Colors.blue],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)

// 径向渐变
widget.backgroundRadialGradient(
  colors: [Colors.yellow, Colors.orange],
)''',
        builder: (context) => Container(height: 70)
            .backgroundLinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
            .borderRadius(all: 10)
            .center(),
      ),
      _ExampleItem(
        title: 'expanded',
        description: '扩展空间',
        code: 'widget.expanded()',
        detailCode: '''// 在 Row/Column 中占据剩余空间
Row(
  children: [
    Container(...),
    Container(...).expanded(),
    Container(...),
  ],
)

// 设置 flex
widget.expanded(flex: 2)''',
        builder: (context) => Row(
          children: [
            Container(width: 40, height: 50).backgroundColor(Colors.red),
            Container(height: 50).backgroundColor(Colors.green).expanded(),
            Container(width: 40, height: 50).backgroundColor(Colors.blue),
          ],
        ).height(50),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Widget 扩展'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: examples.asMap().entries.map((entry) {
            return _buildExampleCard(entry.value, entry.key);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildExampleCard(_ExampleItem item, int index) {
    return Container(
      width: 420,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 标题和描述
          Container(
            padding: EdgeInsets.fromLTRB(24, 20, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          
          // 效果图
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.all(24),
            height: 220,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!, width: 1),
            ),
            child: Transform.scale(
              scale: 1.3,
              child: item.builder(context),
            ),
          ),
          
          SizedBox(height: 16),
          
          // 代码区域
          Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 简单调用
                _buildCodeBlock(
                  title: '简单调用',
                  code: item.code,
                  onCopy: () => _copyToClipboard(item.code, context),
                ),
                
                SizedBox(height: 16),
                
                // 详细调用
                _buildCodeBlock(
                  title: '调用详情',
                  code: item.detailCode,
                  onCopy: () => _copyToClipboard(item.detailCode, context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeBlock({
    required String title,
    required String code,
    required VoidCallback onCopy,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[100]!, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题栏 + 复制按钮
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
                InkWell(
                  onTap: onCopy,
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.copy,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(width: 6),
                        Text(
                          '复制',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // 代码内容
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              code,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 15,
                color: Colors.blue[900],
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on Widget {
  Widget child(Widget child) {
    return child;
  }
}

class _ExampleItem {
  final String title;
  final String description;
  final String code;
  final String detailCode;
  final Widget Function(BuildContext) builder;

  _ExampleItem({
    required this.title,
    required this.description,
    required this.code,
    required this.detailCode,
    required this.builder,
  });
}

