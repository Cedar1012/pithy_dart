import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class ColorsExtensionPage extends StatelessWidget {
  const ColorsExtensionPage({super.key});

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
        title: 'primary',
        description: '主色',
        code: 'context.colors.primary',
        detailCode: '''// 获取主题主色
Color primary = context.colors.primary;

// 使用示例
Container(
  color: context.colors.primary,
  child: Text('主色背景'),
)

// 按钮颜色
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: context.colors.primary,
  ),
)''',
        builder: (context) => _buildColorBox(
          '主色',
          context.colors.primary,
        ),
      ),
      _ExampleItem(
        title: 'primaryLight',
        description: '浅主色',
        code: 'context.colors.primaryLight',
        detailCode: '''// 获取浅主色
Color primaryLight = context.colors.primaryLight;

// 使用示例
Container(
  color: context.colors.primaryLight,
  child: Text('浅色背景'),
)''',
        builder: (context) => _buildColorBox(
          '浅主色',
          context.colors.primaryLight,
        ),
      ),
      _ExampleItem(
        title: 'primaryDark',
        description: '深主色',
        code: 'context.colors.primaryDark',
        detailCode: '''// 获取深主色
Color primaryDark = context.colors.primaryDark;

// 使用示例
AppBar(
  backgroundColor: context.colors.primaryDark,
  title: Text('深色AppBar'),
)''',
        builder: (context) => _buildColorBox(
          '深主色',
          context.colors.primaryDark,
        ),
      ),
      _ExampleItem(
        title: 'scaffoldBackground',
        description: '脚手架背景色',
        code: 'context.colors.scaffoldBackground',
        detailCode: '''// 获取脚手架背景色
Color bgColor = context.colors.scaffoldBackground;

// 使用示例
Scaffold(
  backgroundColor: context.colors.scaffoldBackground,
  body: ...,
)''',
        builder: (context) => _buildColorBox(
          '背景色',
          context.colors.scaffoldBackground,
        ),
      ),
      _ExampleItem(
        title: 'card',
        description: '卡片颜色',
        code: 'context.colors.card',
        detailCode: '''// 获取卡片颜色
Color cardColor = context.colors.card;

// 使用示例
Card(
  color: context.colors.card,
  child: Padding(...),
)

Container(
  color: context.colors.card,
  child: ...,
)''',
        builder: (context) => _buildColorBox(
          '卡片色',
          context.colors.card,
        ),
      ),
      _ExampleItem(
        title: 'divider',
        description: '分割线颜色',
        code: 'context.colors.divider',
        detailCode: '''// 获取分割线颜色
Color dividerColor = context.colors.divider;

// 使用示例
Divider(
  color: context.colors.divider,
)

Container(
  height: 1,
  color: context.colors.divider,
)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 150.w,
              height: 40,
              color: Colors.grey[100],
              alignment: Alignment.center,
              child: const Text('内容上方'),
            ),
            Container(
              height: 3,
              width: 150.w,
              color: context.colors.divider,
            ),
            Container(
              width: 150.w,
              height: 40,
              color: Colors.grey[100],
              alignment: Alignment.center,
              child: const Text('内容下方'),
            ),
          ],
        ),
      ),
      _ExampleItem(
        title: 'hint',
        description: '提示文字颜色',
        code: 'context.colors.hint',
        detailCode: '''// 获取提示文字颜色
Color hintColor = context.colors.hint;

// 使用示例
Text(
  '这是提示文字',
  style: TextStyle(
    color: context.colors.hint,
  ),
)

TextField(
  decoration: InputDecoration(
    hintText: '请输入...',
    hintStyle: TextStyle(
      color: context.colors.hint,
    ),
  ),
)''',
        builder: (context) => Text(
          '这是提示文字',
          style: TextStyle(
            color: context.colors.hint,
            fontSize: 20.sp,
          ),
        ),
      ),
      _ExampleItem(
        title: 'scheme',
        description: '颜色方案',
        code: 'context.colors.scheme',
        detailCode: '''// 访问完整的颜色方案
ColorScheme scheme = context.colors.scheme;

// 使用颜色方案中的颜色
context.colors.scheme.primary
context.colors.scheme.secondary
context.colors.scheme.error
context.colors.scheme.background
context.colors.scheme.surface
context.colors.scheme.onPrimary
context.colors.scheme.onSecondary''',
        builder: (context) => Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          alignment: WrapAlignment.center,
          children: [
            _buildSmallColorBox('primary', context.colors.scheme.primary),
            _buildSmallColorBox('secondary', context.colors.scheme.secondary),
            _buildSmallColorBox('error', context.colors.scheme.error),
            _buildSmallColorBox('surface', context.colors.scheme.surface),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Colors 扩展'),
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

  Widget _buildColorBox(String label, Color color) {
    return Container(
      width: 180.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[300]!, width: 2.w),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _getContrastColor(color),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'monospace',
              color: _getContrastColor(color).withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallColorBox(String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey[300]!, width: 1.w),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Color _getContrastColor(Color color) {
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
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
