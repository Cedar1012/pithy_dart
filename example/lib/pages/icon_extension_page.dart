import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class IconExtensionPage extends StatelessWidget {
  const IconExtensionPage({super.key});

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
        title: 'iconSize',
        description: '设置图标大小',
        code: 'Icon(Icons.star).iconSize(48)',
        detailCode: '''// 快速修改图标尺寸
Icon(Icons.star).iconSize(24)
Icon(Icons.star).iconSize(32)
Icon(Icons.star).iconSize(48)

// 响应式尺寸
Icon(Icons.star).iconSize(48.sp)''',
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.star).iconSize(30),
            const Icon(Icons.star).iconSize(40),
            const Icon(Icons.star).iconSize(50),
            const Icon(Icons.star).iconSize(60),
          ],
        ),
      ),
      _ExampleItem(
        title: 'iconColor',
        description: '设置图标颜色',
        code: 'Icon(Icons.favorite).iconColor(Colors.red)',
        detailCode: '''// 修改图标颜色
Icon(Icons.favorite).iconColor(Colors.red)
Icon(Icons.favorite).iconColor(Colors.pink)
Icon(Icons.favorite).iconColor(Colors.purple)

// 组合使用
Icon(Icons.favorite)
  .iconSize(48)
  .iconColor(Colors.red)''',
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.favorite).iconSize(50).iconColor(Colors.red),
            const Icon(Icons.favorite).iconSize(50).iconColor(Colors.pink),
            const Icon(Icons.favorite).iconSize(50).iconColor(Colors.purple),
            const Icon(Icons.favorite).iconSize(50).iconColor(Colors.blue),
          ],
        ),
      ),
      _ExampleItem(
        title: 'copyWith',
        description: '复制并修改图标',
        code: 'icon.copyWith(size: 50, color: Colors.orange)',
        detailCode: '''// 复制图标并修改多个属性
const Icon(Icons.circle, size: 30, color: Colors.blue)
  .copyWith(color: Colors.green)

const Icon(Icons.circle, size: 30, color: Colors.blue)
  .copyWith(size: 50)

const Icon(Icons.circle, size: 30, color: Colors.blue)
  .copyWith(size: 50, color: Colors.orange)''',
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.circle, size: 35, color: Colors.blue)
                .copyWith(color: Colors.green),
            const Icon(Icons.circle, size: 35, color: Colors.blue)
                .copyWith(size: 55),
            const Icon(Icons.circle, size: 35, color: Colors.blue)
                .copyWith(size: 55, color: Colors.orange),
          ],
        ),
      ),
      _ExampleItem(
        title: '组合使用',
        description: '链式调用多个扩展',
        code: 'Icon(Icons.star).iconSize(48).iconColor(Colors.amber)',
        detailCode: '''// 链式调用多个扩展方法
Icon(Icons.star_border)
  .iconSize(48)
  .iconColor(Colors.amber)

Icon(Icons.favorite_border)
  .iconSize(48)
  .iconColor(Colors.red)

Icon(Icons.thumb_up_outlined)
  .iconSize(48)
  .iconColor(Colors.blue)''',
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.star_border)
                .iconSize(55)
                .iconColor(Colors.amber),
            const Icon(Icons.favorite_border)
                .iconSize(55)
                .iconColor(Colors.red),
            const Icon(Icons.thumb_up_outlined)
                .iconSize(55)
                .iconColor(Colors.blue),
          ],
        ),
      ),
      _ExampleItem(
        title: '评分系统',
        description: '使用图标创建星级评分',
        code: 'Icon(rating ? Icons.star : Icons.star_border).iconSize(32)',
        detailCode: '''// 创建评分系统
Row(
  children: List.generate(5, (index) {
    return Icon(
      index < rating ? Icons.star : Icons.star_border,
    ).iconSize(32).iconColor(Colors.amber);
  }),
)

// 半星评分
Icon(Icons.star_half).iconSize(32).iconColor(Colors.amber)''',
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Icon(
              index < 4 ? Icons.star : Icons.star_border,
            ).iconSize(40).iconColor(Colors.amber).padding(horizontal: 4);
          }),
        ),
      ),
      _ExampleItem(
        title: '状态指示',
        description: '使用不同颜色表示状态',
        code: 'Icon(Icons.check_circle).iconColor(Colors.green)',
        detailCode: '''// 成功状态
Icon(Icons.check_circle)
  .iconSize(40)
  .iconColor(Colors.green)

// 警告状态
Icon(Icons.warning)
  .iconSize(40)
  .iconColor(Colors.orange)

// 错误状态
Icon(Icons.error)
  .iconSize(40)
  .iconColor(Colors.red)

// 信息状态
Icon(Icons.info)
  .iconSize(40)
  .iconColor(Colors.blue)''',
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle).iconSize(45).iconColor(Colors.green),
                SizedBox(height: 8.h),
                Text('成功', style: TextStyle(fontSize: 14.sp, color: Colors.green)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning).iconSize(45).iconColor(Colors.orange),
                SizedBox(height: 8.h),
                Text('警告', style: TextStyle(fontSize: 14.sp, color: Colors.orange)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error).iconSize(45).iconColor(Colors.red),
                SizedBox(height: 8.h),
                Text('错误', style: TextStyle(fontSize: 14.sp, color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Icon 扩展'),
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
