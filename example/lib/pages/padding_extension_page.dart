import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class PaddingExtensionPage extends StatelessWidget {
  const PaddingExtensionPage({super.key});

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
        title: 'paddingAll',
        description: '全方向内边距',
        code: '20.paddingAll()',
        detailCode: '''// 快速创建所有方向相同的内边距
EdgeInsets padding = 20.paddingAll();
// 等同于: EdgeInsets.all(20)

// 使用示例
Container(
  padding: 20.paddingAll(),
  child: Text('内容'),
)''',
        builder: (context) => Container(
          width: double.infinity,
          color: Colors.blue.shade100,
          child: Container(
            padding: 20.paddingAll(),
            color: Colors.white,
            child: const Text(
              'padding: 20.paddingAll()',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
      _ExampleItem(
        title: 'paddingHorizontal',
        description: '水平内边距',
        code: '30.paddingHorizontal()',
        detailCode: '''// 左右方向的内边距
30.paddingHorizontal()
// 等同于: EdgeInsets.symmetric(horizontal: 30)

// 只有左右有边距
Container(
  padding: 30.paddingHorizontal(),
  child: Text('内容'),
)''',
        builder: (context) => Container(
          width: double.infinity,
          color: Colors.green.shade100,
          child: Container(
            padding: 30.paddingHorizontal(),
            color: Colors.white,
            child: const Text(
              'padding: 30.paddingHorizontal()',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
      _ExampleItem(
        title: 'paddingVertical',
        description: '垂直内边距',
        code: '30.paddingVertical()',
        detailCode: '''// 上下方向的内边距
30.paddingVertical()
// 等同于: EdgeInsets.symmetric(vertical: 30)

// 只有上下有边距
Container(
  padding: 30.paddingVertical(),
  child: Text('内容'),
)''',
        builder: (context) => Container(
          width: double.infinity,
          color: Colors.orange.shade100,
          child: Container(
            padding: 30.paddingVertical(),
            color: Colors.white,
            child: const Text(
              'padding: 30.paddingVertical()',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
      _ExampleItem(
        title: 'paddingTop / Left / Right / Bottom',
        description: '单方向内边距',
        code: '20.paddingTop()',
        detailCode: '''// 只设置指定方向的内边距
20.paddingTop()    // EdgeInsets.only(top: 20)
15.paddingLeft()   // EdgeInsets.only(left: 15)
15.paddingRight()  // EdgeInsets.only(right: 15)
10.paddingBottom() // EdgeInsets.only(bottom: 10)

// 使用示例
Container(
  padding: 20.paddingTop(),
  child: Text('内容'),
)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: 20.paddingTop(),
              color: Colors.purple.shade100,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: const Text('paddingTop()', textAlign: TextAlign.center),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: 25.paddingLeft(),
              color: Colors.pink.shade100,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: const Text('paddingLeft()', textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
      _ExampleItem(
        title: '组合示例',
        description: '多种padding组合',
        code: 'EdgeInsets padding = ...',
        detailCode: '''// 常见组合
// 卡片内边距
16.paddingAll()

// 列表项内边距
EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 12,
)

// 按钮内边距
EdgeInsets.symmetric(
  horizontal: 24,
  vertical: 12,
)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: 16.paddingAll(),
              color: Colors.blue[50],
              child: const Text('卡片 - 16.paddingAll()'),
            ),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12.h),
              color: Colors.green[50],
              child: const Text('列表项 - symmetric(h:16, v:12)'),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12.h),
              color: Colors.orange[50],
              child: const Text('按钮 - symmetric(h:24, v:12)'),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Padding 扩展'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Wrap(
          spacing: 20.w,
          runSpacing: 20.h,
          children: examples.asMap().entries.map((entry) {
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
            child: Center(
              child: item.builder(context),
            ),
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
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.copy,
                          size: 16.sp,
                          color: Colors.white,
                        ),
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
