import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class MediaQueryExtensionPage extends StatelessWidget {
  const MediaQueryExtensionPage({super.key});

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
    final sizes = context.sizes;
    
    final examples = [
      _ExampleItem(
        title: 'sizes.width',
        description: '屏幕宽度',
        code: 'context.sizes.width',
        detailCode: '''// 获取屏幕宽度
double width = context.sizes.width;

// 使用示例
Container(
  width: context.sizes.width * 0.9,
  child: Text('90% 宽度'),
)

// 响应式判断
if (context.sizes.width > 600) {
  // 平板布局
}''',
        builder: (context) => _buildInfoCard(
          '宽度',
          '${sizes.width.toStringAsFixed(0)} px',
          Icons.width_normal,
          Colors.blue,
        ),
      ),
      _ExampleItem(
        title: 'sizes.height',
        description: '屏幕高度',
        code: 'context.sizes.height',
        detailCode: '''// 获取屏幕高度
double height = context.sizes.height;

// 使用示例
Container(
  height: context.sizes.height * 0.5,
  child: ListView(...),
)''',
        builder: (context) => _buildInfoCard(
          '高度',
          '${sizes.height.toStringAsFixed(0)} px',
          Icons.height,
          Colors.green,
        ),
      ),
      _ExampleItem(
        title: 'sizes.padding',
        description: '安全区域边距',
        code: 'context.sizes.padding',
        detailCode: '''// 获取安全区域padding
EdgeInsets padding = context.sizes.padding;

// 顶部安全区域
context.sizes.padding.top

// 底部安全区域
context.sizes.padding.bottom

// 使用示例
Container(
  padding: context.sizes.padding,
  child: ...,
)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPaddingItem('Top', sizes.padding.top),
            SizedBox(height: 4),
            _buildPaddingItem('Bottom', sizes.padding.bottom),
            SizedBox(height: 4),
            _buildPaddingItem('Left', sizes.padding.left),
            SizedBox(height: 4),
            _buildPaddingItem('Right', sizes.padding.right),
          ],
        ),
      ),
      _ExampleItem(
        title: 'sizes.devicePixelRatio',
        description: '设备像素比',
        code: 'context.sizes.devicePixelRatio',
        detailCode: '''// 获取设备像素比
double ratio = context.sizes.devicePixelRatio;

// 高分屏适配
// ratio = 1.0  普通屏
// ratio = 2.0  Retina
// ratio = 3.0  超高分屏''',
        builder: (context) => _buildInfoCard(
          '像素比',
          sizes.devicePixelRatio.toStringAsFixed(2),
          Icons.aspect_ratio,
          Colors.orange,
        ),
      ),
      _ExampleItem(
        title: 'sizes.textScaler',
        description: '文字缩放器',
        code: 'context.sizes.textScaler',
        detailCode: '''// 获取文字缩放器
TextScaler scaler = context.sizes.textScaler;

// 用户设置的文字大小偏好
// 用于适配不同文字大小设置

// 使用示例
Text(
  '文本',
  textScaler: context.sizes.textScaler,
)''',
        builder: (context) => _buildInfoCard(
          '文字缩放器',
          sizes.textScaler.toString(),
          Icons.text_fields,
          Colors.purple,
        ),
      ),
      _ExampleItem(
        title: 'sizes.viewInsets',
        description: '视图插入',
        code: 'context.sizes.viewInsets',
        detailCode: '''// 获取视图插入（如键盘高度）
EdgeInsets insets = context.sizes.viewInsets;

// 底部插入（通常是键盘）
double keyboardHeight = context.sizes.viewInsets.bottom;

// 使用示例
Padding(
  padding: context.sizes.viewInsets,
  child: ...,
)''',
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPaddingItem('Top', sizes.viewInsets.top),
            SizedBox(height: 4),
            _buildPaddingItem('Bottom', sizes.viewInsets.bottom),
            SizedBox(height: 4),
            _buildPaddingItem('Left', sizes.viewInsets.left),
            SizedBox(height: 4),
            _buildPaddingItem('Right', sizes.viewInsets.right),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('MediaQuery 扩展'),
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

  Widget _buildInfoCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.7), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: Colors.white),
          SizedBox(height: 16),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaddingItem(String label, double value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[200]!, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '${value.toStringAsFixed(1)} px',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
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
              color: Colors.grey[50],
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
