import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class ListExtensionPage extends StatelessWidget {
  const ListExtensionPage({super.key});

  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('已复制到剪贴板'), duration: Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final examples = [
      _ExampleItem(
        title: 'toColumn',
        description: '转换为 Column',
        code: '[widget1, widget2].toColumn()',
        detailCode: '''// 基本用法
[widget1, widget2, widget3].toColumn()

// 设置对齐方式
[widget1, widget2].toColumn(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.center,
)''',
        builder:
            (context) => _buildDemoWidgets()
                .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
                .backgroundColor(Colors.grey[100]!)
                .padding(all: 12)
                .borderRadius(all: 8),
      ),
      _ExampleItem(
        title: 'toColumnSpace',
        description: '带间距的 Column',
        code: '[widget1, widget2].toColumnSpace(space: 12)',
        detailCode: '''// 自动添加间距
[widget1, widget2, widget3].toColumnSpace(space: 12)

// 带对齐方式
[widget1, widget2].toColumnSpace(
  space: 16,
  crossAxisAlignment: CrossAxisAlignment.start,
)''',
        builder:
            (context) => _buildDemoWidgets()
                .toColumnSpace(
                  space: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                )
                .backgroundColor(Colors.grey[100]!)
                .padding(all: 12)
                .borderRadius(all: 8),
      ),
      _ExampleItem(
        title: 'toRow',
        description: '转换为 Row',
        code: '[widget1, widget2].toRow()',
        detailCode: '''// 基本用法
[widget1, widget2, widget3].toRow()

// 设置对齐方式
[widget1, widget2].toRow(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
)''',
        builder:
            (context) => _buildColorBoxes()
                .toRow()
                .backgroundColor(Colors.grey[100]!)
                .padding(all: 12)
                .borderRadius(all: 8),
      ),
      _ExampleItem(
        title: 'toRowSpace',
        description: '带间距的 Row',
        code: '[widget1, widget2].toRowSpace(space: 12)',
        detailCode: '''// 自动添加间距
[widget1, widget2, widget3].toRowSpace(space: 12)

// 带对齐方式
[widget1, widget2].toRowSpace(
  space: 16,
  mainAxisAlignment: MainAxisAlignment.center,
)''',
        builder:
            (context) => _buildColorBoxes()
                .toRowSpace(space: 12)
                .backgroundColor(Colors.grey[100]!)
                .padding(all: 12)
                .borderRadius(all: 8),
      ),
      _ExampleItem(
        title: 'toStack',
        description: '转换为 Stack',
        code: '[widget1, widget2].toStack()',
        detailCode: '''// 基本用法
[widget1, widget2, widget3].toStack()

// 结合 positioned 使用
[
  Container(...),
  Container(...).positioned(left: 20, top: 20),
  Container(...).positioned(right: 20, bottom: 20),
].toStack()''',
        builder:
            (context) =>
                [
                      Container(
                        width: 100,
                        height: 100.h,
                        color: Colors.red.shade200,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        color: Colors.green.shade200,
                      ).positioned(left: 20, top: 20),
                      Container(
                        width: 60,
                        height: 60.h,
                        color: Colors.blue.shade200,
                      ).positioned(left: 40, top: 40),
                    ]
                    .toStack()
                    .width(100)
                    .height(100)
                    .borderRadius(all: 8)
                    .center(),
      ),
      _ExampleItem(
        title: 'toWrap',
        description: '自动换行布局',
        code: '[...widgets].toWrap(spacing: 8.w)',
        detailCode: '''// 基本用法
[widget1, widget2, widget3].toWrap()

// 设置间距
[...widgets].toWrap(
  spacing: 8.w,      // 水平间距
  runSpacing: 8.h,   // 垂直间距
)''',
        builder:
            (context) => _buildManyItems()
                .toWrap(spacing: 8.w, runSpacing: 8.h)
                .backgroundColor(Colors.grey[100]!)
                .padding(all: 12)
                .borderRadius(all: 8),
      ),
      _ExampleItem(
        title: 'toListView',
        description: '可滚动列表',
        code: '[...widgets].toListView()',
        detailCode: '''// 基本用法
[widget1, widget2, widget3].toListView()

// 设置滚动方向
[...widgets].toListView(
  scrollDirection: Axis.horizontal,
)''',
        builder:
            (context) => Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: _buildScrollableItems().toListView(),
            ),
      ),
      _ExampleItem(
        title: '实际应用',
        description: '组合使用示例',
        code: '[...widgets].toColumnSpace(space: 12)',
        detailCode: '''// 实际应用场景
[
  Text('标题').fontSize(20).bold(),
  Text('描述文本').textColor(Colors.grey),
  [
    Tag1Widget(),
    Tag2Widget(),
  ].toRowSpace(space: 8),
  ActionButton(),
].toColumnSpace(
  space: 12,
  crossAxisAlignment: CrossAxisAlignment.start,
)''',
        builder:
            (context) => [
                  Text(
                    '标题',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '这是一个实际应用示例',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  ),
                  [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Text(
                        '标签1',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Text(
                        '标签2',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ].toRowSpace(space: 8),
                  ElevatedButton(onPressed: () {}, child: const Text('操作按钮')),
                ]
                .toColumnSpace(
                  space: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                )
                .padding(all: 16)
                .backgroundColor(Colors.white)
                .borderRadius(all: 12)
                .boxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('List 扩展'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Wrap(
          spacing: 20.w,
          runSpacing: 20.h,
          children:
              examples.asMap().entries.map((entry) {
                return _buildExampleCard(entry.value, entry.key, context);
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildExampleCard(_ExampleItem item, int index, BuildContext context) {
    return Container(
      width: 420.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 标题和描述
          Container(
            padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),

          // 效果图
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: EdgeInsets.all(24.w),
            height: 220.h,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey[200]!, width: 1.w),
            ),
            child: Center(child: item.builder(context)),
          ),

          SizedBox(height: 16.h),

          // 代码区域
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 简单调用
                _buildCodeBlock(
                  title: '简单调用',
                  code: item.code,
                  onCopy: () => _copyToClipboard(item.code, context),
                ),

                SizedBox(height: 16.h),

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
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.blue[100]!, width: 1.5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题栏 + 复制按钮
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                ),
                InkWell(
                  onTap: onCopy,
                  borderRadius: BorderRadius.circular(6.r),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.copy, size: 16.sp, color: Colors.white),
                        SizedBox(width: 6.w),
                        Text(
                          '复制',
                          style: TextStyle(
                            fontSize: 14.sp,
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
            padding: EdgeInsets.all(16.w),
            child: Text(
              code,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 15.sp,
                color: Colors.blue[900],
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDemoWidgets() {
    return [
      Text('第一项', style: TextStyle(fontSize: 16)),
      Text('第二项', style: TextStyle(fontSize: 16)),
      Text('第三项', style: TextStyle(fontSize: 16)),
    ];
  }

  List<Widget> _buildColorBoxes() {
    return [
      Container(width: 40, height: 40, color: Colors.red),
      Container(width: 40, height: 40, color: Colors.green),
      Container(width: 40, height: 40, color: Colors.blue),
    ];
  }

  List<Widget> _buildManyItems() {
    return List.generate(
      12,
      (index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.primaries[index % Colors.primaries.length].shade100,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text('项${index + 1}', style: TextStyle(fontSize: 12)),
      ),
    );
  }

  List<Widget> _buildScrollableItems() {
    return List.generate(
      15,
      (index) => ListTile(
        dense: true,
        leading: CircleAvatar(child: Text('${index + 1}')),
        title: Text('列表项 ${index + 1}'),
        subtitle: const Text('副标题'),
      ),
    );
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
