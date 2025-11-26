import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class TextExtensionPage extends StatelessWidget {
  const TextExtensionPage({super.key});

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
        title: 'fontSize',
        description: '字体大小',
        code: 'Text("文本").fontSize(24)',
        detailCode: '''// 设置字体大小
Text("文本").fontSize(24)

// 响应式字体大小
Text("文本").fontSize(24)

// 链式调用
Text("文本").fontSize(20).bold()''',
        builder: (context) => Text('字体大小 24', style: TextStyle(fontSize: 24)),
      ),
      _ExampleItem(
        title: 'bold',
        description: '粗体',
        code: 'Text("文本").bold()',
        detailCode: '''// 设置为粗体
Text("文本").bold()

// 组合使用
Text("文本").bold().fontSize(20)''',
        builder: (context) => Text('粗体文本', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      _ExampleItem(
        title: 'italic',
        description: '斜体',
        code: 'Text("文本").italic()',
        detailCode: '''// 设置为斜体
Text("文本").italic()

// 粗斜体
Text("文本").bold().italic()''',
        builder: (context) => Text('斜体文本', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18)),
      ),
      _ExampleItem(
        title: 'textColor',
        description: '文本颜色',
        code: 'Text("文本").textColor(Colors.blue)',
        detailCode: '''// 设置文本颜色
Text("文本").textColor(Colors.blue)

// 使用自定义颜色
Text("文本").textColor(Color(0xFF42A5F5))

// 组合使用
Text("文本").textColor(Colors.blue).bold()''',
        builder: (context) => Text('彩色文本', style: TextStyle(color: Colors.blue, fontSize: 20)),
      ),
      _ExampleItem(
        title: 'fontWeight',
        description: '字体粗细',
        code: 'Text("文本").fontWeight(FontWeight.w500)',
        detailCode: '''// 不同的字体粗细
Text("文本").fontWeight(FontWeight.w300)  // 细
Text("文本").fontWeight(FontWeight.w500)  // 中等
Text("文本").fontWeight(FontWeight.w700)  // 粗
Text("文本").fontWeight(FontWeight.w900)  // 超粗''',
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('w300', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16)),
            SizedBox(height: 4),
            Text('w500', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            SizedBox(height: 4),
            Text('w700', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            SizedBox(height: 4),
            Text('w900', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
          ],
        ),
      ),
      _ExampleItem(
        title: 'letterSpacing',
        description: '字母间距',
        code: 'Text("文本").letterSpacing(3.0)',
        detailCode: '''// 调整字母间距
Text("文本").letterSpacing(3.0)

// 不同的间距效果
Text("文本").letterSpacing(1.0)  // 小间距
Text("文本").letterSpacing(5.0)  // 大间距''',
        builder: (context) => Text('L E T T E R', style: TextStyle(letterSpacing: 5.0, fontSize: 18)),
      ),
      _ExampleItem(
        title: 'wordSpacing',
        description: '单词间距',
        code: 'Text("文本").wordSpacing(8.0)',
        detailCode: '''// 调整单词间距
Text("文本").wordSpacing(8.0)

// 不同的间距
Text("文本").wordSpacing(4.0)   // 小间距
Text("文本").wordSpacing(12.0)  // 大间距''',
        builder: (context) => Text('Word Spacing Example', style: TextStyle(wordSpacing: 10.0, fontSize: 16)),
      ),
      _ExampleItem(
        title: 'textShadow',
        description: '文字阴影',
        code: 'Text("文本").textShadow(...)',
        detailCode: '''// 添加文字阴影
Text("文本").textShadow(
  color: Colors.blue.withOpacity(0.5),
  blurRadius: 8,
  offset: Offset(3, 3),
)

// 多重阴影效果
Text("文本").textShadow(
  color: Colors.black26,
  blurRadius: 10,
  offset: Offset(5, 5),
)''',
        builder: (context) => Text(
          '阴影文字',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.blue.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(3, 3),
              ),
            ],
          ),
        ),
      ),
      _ExampleItem(
        title: 'textAlignment',
        description: '文本对齐',
        code: 'Text("文本").textAlignment(TextAlign.center)',
        detailCode: '''// 不同的对齐方式
Text("文本").textAlignment(TextAlign.left)
Text("文本").textAlignment(TextAlign.center)
Text("文本").textAlignment(TextAlign.right)
Text("文本").textAlignment(TextAlign.justify)''',
        builder: (context) => Container(
          width: 200,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text('左对齐', textAlign: TextAlign.left),
              SizedBox(height: 6),
              Text('居中对齐', textAlign: TextAlign.center),
              SizedBox(height: 6),
              Text('右对齐', textAlign: TextAlign.right),
            ],
          ),
        ),
      ),
      _ExampleItem(
        title: '组合使用',
        description: '多个扩展链式调用',
        code: 'Text("文本").fontSize(20).bold().textColor(Colors.purple)',
        detailCode: '''// 链式调用多个样式
Text("组合效果")
  .fontSize(20)
  .bold()
  .textColor(Colors.purple)
  .letterSpacing(2.0)
  
// 更复杂的组合
Text("高级样式")
  .fontSize(24)
  .fontWeight(FontWeight.w600)
  .textColor(Colors.deepPurple)
  .letterSpacing(1.5)
  .textShadow(
    color: Colors.purple.withOpacity(0.3),
    blurRadius: 4,
  )''',
        builder: (context) => Text(
          '组合效果',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            letterSpacing: 2.0,
            shadows: [
              Shadow(
                color: Colors.purple.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Text 扩展'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: examples.asMap().entries.map((entry) {
            return _buildExampleCard(entry.value, entry.key, context);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildExampleCard(_ExampleItem item, int index, BuildContext context) {
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
            child: Center(
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
