import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class GlossyContainerPage extends StatelessWidget {
  const GlossyContainerPage({super.key});

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
        title: '基础毛玻璃',
        description: '简单的毛玻璃效果',
        code: 'GlossyContainer(child: Text("内容"))',
        detailCode: '''// 基本用法
GlossyContainer(
  child: Text('毛玻璃内容'),
)

// 设置大小
GlossyContainer(
  width: 200,
  height: 100,
  child: Text('内容'),
)''',
        builder: (context) => GlossyContainer(
          width: 200,
          height: 100,
          child: Center(
            child: Text(
              '毛玻璃效果',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      _ExampleItem(
        title: '带内边距',
        description: '设置内边距',
        code: 'GlossyContainer(padding: EdgeInsets.all(20))',
        detailCode: '''// 设置内边距
GlossyContainer(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(20),
  child: Text('内容'),
)

// 不同方向的内边距
GlossyContainer(
  width: 200,
  height: 100,
  padding: EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 10,
  ),
  child: Text('内容'),
)''',
        builder: (context) => GlossyContainer(
          width: 180,
          height: 90,
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(
              '带内边距',
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      _ExampleItem(
        title: '颜色背景',
        description: '添加背景色',
        code: 'GlossyContainer(color: Colors.blue)',
        detailCode: '''// 设置背景颜色
GlossyContainer(
  width: 200,
  height: 100,
  color: Colors.blue.withOpacity(0.3),
  child: Text('内容'),
)

// 不同颜色
GlossyContainer(
  width: 200,
  height: 100,
  color: Colors.purple.withOpacity(0.3),
  child: Text('内容'),
)''',
        builder: (context) => GlossyContainer(
          width: 200,
          height: 100,
          color: Colors.blue.withOpacity(0.3),
          child: Center(
            child: Text(
              '蓝色毛玻璃',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      _ExampleItem(
        title: '圆角边框',
        description: '自定义圆角和边框',
        code: 'GlossyContainer(borderRadius: BorderRadius.circular(20))',
        detailCode: '''// 设置圆角
GlossyContainer(
  width: 150,
  height: 150,
  borderRadius: BorderRadius.circular(20),
  child: ...,
)

// 添加边框
GlossyContainer(
  width: 150,
  height: 150,
  borderRadius: BorderRadius.circular(20),
  border: Border.all(
    color: Colors.white.withOpacity(0.3),
    width: 2,
  ),
  child: ...,
)

// 圆形
GlossyContainer(
  width: 150,
  height: 150,
  borderRadius: BorderRadius.circular(75),
  child: ...,
)''',
        builder: (context) => GlossyContainer(
          width: 150,
          height: 150,
          borderRadius: BorderRadius.circular(75),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 3,
          ),
          child: Center(
            child: Icon(
              Icons.favorite,
              size: 48,
              color: Colors.white,
            ),
          ),
        ),
      ),
      _ExampleItem(
        title: '阴影效果',
        description: '添加阴影',
        code: 'GlossyContainer(boxShadow: [BoxShadow(...)])',
        detailCode: '''// 添加阴影
GlossyContainer(
  width: 180,
  height: 100,
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 20,
      offset: Offset(0, 10),
    ),
  ],
  child: ...,
)

// 多重阴影
GlossyContainer(
  width: 180,
  height: 100,
  boxShadow: [
    BoxShadow(
      color: Colors.blue.withOpacity(0.5),
      blurRadius: 30,
    ),
    BoxShadow(
      color: Colors.purple.withOpacity(0.3),
      blurRadius: 50,
    ),
  ],
  child: ...,
)''',
        builder: (context) => GlossyContainer(
          width: 180,
          height: 100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
          child: Center(
            child: Text(
              '带阴影',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      _ExampleItem(
        title: '综合示例',
        description: '完整配置的毛玻璃',
        code: 'GlossyContainer(全部配置)',
        detailCode: '''// 综合使用
GlossyContainer(
  width: 220,
  height: 120,
  color: Colors.blue.withOpacity(0.3),
  borderRadius: BorderRadius.circular(20),
  border: Border.all(
    color: Colors.white.withOpacity(0.3),
    width: 2,
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 30,
      offset: Offset(0, 10),
    ),
  ],
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('标题', style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )),
      SizedBox(height: 8),
      Text('描述文字', style: TextStyle(
        fontSize: 14,
        color: Colors.white70,
      )),
    ],
  ),
)''',
        builder: (context) => GlossyContainer(
          width: 220,
          height: 120,
          color: Colors.blue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '完整示例',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '毛玻璃卡片',
                style: TextStyle(
                  fontSize: 14,
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
        title: const Text('GlossyContainer'),
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.all(24),
            height: 220,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[300]!, Colors.purple[300]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!, width: 1),
            ),
            child: Center(
              child: item.builder(context),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCodeBlock(
                  title: '简单调用',
                  code: item.code,
                  onCopy: () => _copyToClipboard(item.code, context),
                ),
                SizedBox(height: 16),
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
                        Icon(Icons.copy, size: 16, color: Colors.white),
                        SizedBox(width: 6),
                        Text('复制', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
