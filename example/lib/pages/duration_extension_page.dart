import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class DurationExtensionPage extends StatefulWidget {
  const DurationExtensionPage({super.key});

  @override
  State<DurationExtensionPage> createState() => _DurationExtensionPageState();
}

class _DurationExtensionPageState extends State<DurationExtensionPage> {
  String _delayResult = '等待中...';

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
        title: 'seconds',
        description: '秒转Duration',
        code: '5.seconds',
        detailCode: '''// 数字转换为秒
1.seconds
5.seconds
30.seconds

// 结果是 Duration 对象
Duration(seconds: 5)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDurationDisplay('1 秒', 1.seconds),
            SizedBox(height: 8.h),
            _buildDurationDisplay('5 秒', 5.seconds),
            SizedBox(height: 8.h),
            _buildDurationDisplay('30 秒', 30.seconds),
          ],
        ),
      ),
      _ExampleItem(
        title: 'milliseconds',
        description: '毫秒转Duration',
        code: '500.milliseconds',
        detailCode: '''// 数字转换为毫秒
100.milliseconds
500.milliseconds
1000.milliseconds

// 结果是 Duration 对象
Duration(milliseconds: 500)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDurationDisplay('100 毫秒', 100.milliseconds),
            SizedBox(height: 8.h),
            _buildDurationDisplay('500 毫秒', 500.milliseconds),
            SizedBox(height: 8.h),
            _buildDurationDisplay('1000 毫秒', 1000.milliseconds),
          ],
        ),
      ),
      _ExampleItem(
        title: 'minutes',
        description: '分钟转Duration',
        code: '2.minutes',
        detailCode: '''// 数字转换为分钟
1.minutes
2.minutes
30.minutes

// 结果是 Duration 对象
Duration(minutes: 2)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDurationDisplay('1 分钟', 1.minutes),
            SizedBox(height: 8.h),
            _buildDurationDisplay('2 分钟', 2.minutes),
            SizedBox(height: 8.h),
            _buildDurationDisplay('30 分钟', 30.minutes),
          ],
        ),
      ),
      _ExampleItem(
        title: 'hours',
        description: '小时转Duration',
        code: '2.hours',
        detailCode: '''// 数字转换为小时
1.hours
2.hours
24.hours

// 结果是 Duration 对象
Duration(hours: 2)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDurationDisplay('1 小时', 1.hours),
            SizedBox(height: 8.h),
            _buildDurationDisplay('2 小时', 2.hours),
            SizedBox(height: 8.h),
            _buildDurationDisplay('24 小时', 24.hours),
          ],
        ),
      ),
      _ExampleItem(
        title: 'days',
        description: '天数转Duration',
        code: '7.days',
        detailCode: '''// 数字转换为天数
1.days
7.days
30.days

// 结果是 Duration 对象
Duration(days: 7)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDurationDisplay('1 天', 1.days),
            SizedBox(height: 8.h),
            _buildDurationDisplay('7 天', 7.days),
            SizedBox(height: 8.h),
            _buildDurationDisplay('30 天', 30.days),
          ],
        ),
      ),
      _ExampleItem(
        title: 'future',
        description: '延迟执行',
        code: '2.seconds.future(() => ...)',
        detailCode: '''// 延迟执行代码
2.seconds.future(() {
  print('2秒后执行');
});

// 异步等待
await 3.seconds.future(() {
  return '结果';
});

// 常用于动画延迟
await 500.milliseconds.future(() {});''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_delayResult, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _delayResult = '等待中...';
                });
                await 2.seconds.future(() {
                  setState(() {
                    _delayResult = '2秒后执行完成！';
                  });
                });
              },
              child: const Text('测试延迟 2 秒'),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Duration 扩展'),
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

  Widget _buildDurationDisplay(String label, Duration duration) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.blue[200]!, width: 2.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            duration.toString(),
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.blue[700],
              fontFamily: 'monospace',
            ),
          ),
        ],
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
