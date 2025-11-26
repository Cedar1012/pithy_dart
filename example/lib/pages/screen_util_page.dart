import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class ScreenUtilPage extends StatelessWidget {
  const ScreenUtilPage({super.key});

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
        title: '.w',
        description: '宽度适配',
        code: 'Container(width: 100.w)',
        detailCode: '''// 根据设计稿宽度进行适配
Container(width: 50.w)
Container(width: 100.w)
Container(width: 200.w.w)

// 使用示例（设计稿宽750）
Container(
  width: 375.w,  // 屏幕一半宽度
  child: Text('内容'),
)''',
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBox(50.w, '50.w'),
            _buildBox(100.w, '100.w'),
            _buildBox(150.w, '150.w'),
          ],
        ),
      ),
      _ExampleItem(
        title: '.h',
        description: '高度适配',
        code: 'Container(height: 100.h.h)',
        detailCode: '''// 根据设计稿高度进行适配
Container(height: 50.h)
Container(height: 100.h.h)
Container(height: 200.h)

// 使用示例
SizedBox(height: 20.h)  // 间距适配
Container(
  height: 200.h,
  child: ...,
)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHBar(50.h, '50.h'),
            SizedBox(height: 8.h),
            _buildHBar(80.h, '80.h'),
            SizedBox(height: 8.h),
            _buildHBar(100.h, '100.h'),
          ],
        ),
      ),
      _ExampleItem(
        title: '.sp',
        description: '字体适配',
        code: 'TextStyle(fontSize: 16.sp)',
        detailCode: '''// 字体大小适配
Text('标题', style: TextStyle(fontSize: 24.sp))
Text('正文', style: TextStyle(fontSize: 16.sp))
Text('小字', style: TextStyle(fontSize: 12.sp))

// 保持可读性
Text(
  '内容',
  style: TextStyle(fontSize: 14.sp),
)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('12.sp 字体', style: TextStyle(fontSize: 12.sp)),
            SizedBox(height: 4.h),
            Text('16.sp 字体', style: TextStyle(fontSize: 16.sp)),
            SizedBox(height: 4.h),
            Text('20.sp 字体', style: TextStyle(fontSize: 20.sp)),
            SizedBox(height: 4.h),
            Text('24.sp 字体', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      _ExampleItem(
        title: '.r',
        description: '圆角适配',
        code: 'BorderRadius.circular(12.r)',
        detailCode: '''// 圆角半径适配
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8.r),
  ),
)

Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16.r),
  ),
)

// 圆形
ClipRRect(
  borderRadius: BorderRadius.circular(50.r),
  child: Image(...),
)''',
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 60.w,
              height: 60.h.w,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.r),
              ),
              alignment: Alignment.center,
              child: Text('8.r', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
            ),
            Container(
              width: 60.w,
              height: 60.h.w,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16.r),
              ),
              alignment: Alignment.center,
              child: Text('16.r', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
            ),
            Container(
              width: 60.w,
              height: 60.h.w,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30.r),
              ),
              alignment: Alignment.center,
              child: Text('30.r', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
            ),
          ],
        ),
      ),
      _ExampleItem(
        title: '综合使用',
        description: '组合多种适配',
        code: 'Container(width: 200.w.w, height: 100.h.h)',
        detailCode: '''// 综合使用多种适配
Container(
  width: 200.w.w,
  height: 100.h.h,
  padding: EdgeInsets.all(16.w),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12.r),
  ),
  child: Text(
    '适配卡片',
    style: TextStyle(
      fontSize: 16.sp,
      color: Colors.white,
    ),
  ),
)

// 间距适配
SizedBox(width: 16.w, height: 16.h)''',
        builder: (context) => Container(
          width: 200.w.w,
          height: 100.h.h,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '适配卡片',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '200.w × 100.h',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('ScreenUtil 屏幕适配'),
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

  Widget _buildBox(double width, String label) {
    return Container(
      width: width,
      height: 60.h.h,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildHBar(double height, String label) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(4.r),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
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
