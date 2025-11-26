import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class StringExtensionPage extends StatelessWidget {
  const StringExtensionPage({super.key});

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
        title: 'capitalize',
        description: '单词首字母大写',
        code: '"hello world".capitalize()',
        detailCode: '''// 将每个单词的首字母转换为大写
"hello world".capitalize()
// 结果: "Hello World"

"flutter is great".capitalize()
// 结果: "Flutter Is Great"''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildExample('输入', 'hello world', 16),
            SizedBox(height: 12.h),
            Icon(Icons.arrow_downward, size: 30, color: Colors.blue),
            SizedBox(height: 12.h),
            _buildExample('输出', 'hello world'.capitalize(), 18),
          ],
        ),
      ),
      _ExampleItem(
        title: 'capitalizeFirst',
        description: '首字母大写',
        code: '"hello world".capitalizeFirst()',
        detailCode: '''// 只将第一个字符转换为大写
"hello world".capitalizeFirst()
// 结果: "Hello world"

"flutter".capitalizeFirst()
// 结果: "Flutter"''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildExample('输入', 'hello world', 16),
            SizedBox(height: 12.h),
            Icon(Icons.arrow_downward, size: 30, color: Colors.blue),
            SizedBox(height: 12.h),
            _buildExample('输出', 'hello world'.capitalizeFirst(), 18),
          ],
        ),
      ),
      _ExampleItem(
        title: 'isNum & toNum',
        description: '数字判断与转换',
        code: '"123".isNum() // true',
        detailCode: '''// 判断字符串是否为数字
"123".isNum()    // true
"abc".isNum()    // false
"3.14".isNum()   // true

// 转换为 num
"123".toNum()    // 123
"3.14".toNum()   // 3.14
"abc".toNum()    // null''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExample('"123".isNum()', '123'.isNum().toString(), 16),
            SizedBox(height: 8.h),
            _buildExample('"abc".isNum()', 'abc'.isNum().toString(), 16),
            SizedBox(height: 8.h),
            _buildExample('"123".toNum()', '123'.toNum().toString(), 16),
          ],
        ),
      ),
      _ExampleItem(
        title: 'isInt & toInt',
        description: '整数判断与转换',
        code: '"456".isInt() // true',
        detailCode: '''// 判断字符串是否为整数
"456".isInt()    // true
"3.14".isInt()   // false

// 转换为 int
"456".toInt()    // 456
"3.14".toInt()   // null''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExample('"456".isInt()', '456'.isInt().toString(), 16),
            SizedBox(height: 8.h),
            _buildExample('"456".toInt()', '456'.toInt().toString(), 16),
          ],
        ),
      ),
      _ExampleItem(
        title: 'toColor',
        description: '转换为颜色',
        code: '"FF5733".toColor',
        detailCode: '''// 将十六进制字符串转换为 Color
"FF5733".toColor
"3498DB".toColor
"2ECC71".toColor

// 支持带 # 的格式
"#FF5733".toColor''',
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildColorBox('FF5733', 'FF5733'.toColor),
            _buildColorBox('3498DB', '3498DB'.toColor),
            _buildColorBox('2ECC71', '2ECC71'.toColor),
          ],
        ),
      ),
      _ExampleItem(
        title: 'removeAllWhitespace',
        description: '移除所有空格',
        code: '"  hello   world  ".removeAllWhitespace()',
        detailCode: '''// 移除字符串中的所有空格
"  hello   world  ".removeAllWhitespace()
// 结果: "helloworld"

" a  b  c ".removeAllWhitespace()
// 结果: "abc"''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildExample('输入', '  hello   world  ', 16),
            SizedBox(height: 12.h),
            Icon(Icons.arrow_downward, size: 30, color: Colors.blue),
            SizedBox(height: 12.h),
            _buildExample('输出', '  hello   world  '.removeAllWhitespace(), 18),
          ],
        ),
      ),
      _ExampleItem(
        title: 'clearHtml',
        description: '清除 HTML 标签',
        code: '"<p>Hello</p>".clearHtml',
        detailCode: '''// 移除字符串中的 HTML 标签
"<p>Hello <b>World</b></p>".clearHtml
// 结果: "Hello World"

"<div>Content</div>".clearHtml
// 结果: "Content"''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildExample('输入', '<p>Hello <b>World</b></p>', 14),
            SizedBox(height: 12.h),
            Icon(Icons.arrow_downward, size: 30, color: Colors.blue),
            SizedBox(height: 12.h),
            _buildExample('输出', '<p>Hello <b>World</b></p>'.clearHtml, 18),
          ],
        ),
      ),
      _ExampleItem(
        title: 'hasMatch',
        description: '正则表达式匹配',
        code: '"email@test.com".hasMatch(r"@")',
        detailCode: '''// 检查字符串是否匹配正则表达式
"email@test.com".hasMatch(r"@")
// 结果: true

"123abc".hasMatch(r"\\d")
// 结果: true

"hello".hasMatch(r"\\d")
// 结果: false''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExample('"email@test.com".hasMatch(r"@")', 
                'email@test.com'.hasMatch(r'@').toString(), 16),
            SizedBox(height: 8.h),
            _buildExample('"123abc".hasMatch(r"\\d")', 
                '123abc'.hasMatch(r'\d').toString(), 16),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('String 扩展'),
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

  Widget _buildExample(String label, String value, double fontSize) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.blue[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorBox(String hex, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 70,
          height: 70.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey[300]!, width: 2.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '#$hex',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
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
