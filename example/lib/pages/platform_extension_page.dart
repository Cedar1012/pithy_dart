import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class PlatformExtensionPage extends StatelessWidget {
  const PlatformExtensionPage({super.key});

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
        title: 'isIOS',
        description: '判断是否为iOS平台',
        code: 'context.isIOS',
        detailCode: '''// 判断是否为iOS平台
if (context.isIOS) {
  // iOS特定代码
  return CupertinoButton(...);
}

// 使用示例
Widget buildButton() {
  return context.isIOS 
    ? CupertinoButton(...) 
    : ElevatedButton(...);
}''',
        builder: (context) => _buildPlatformCard(
          'iOS',
          Icons.apple,
          context.isIOS,
          'context.isIOS',
        ),
      ),
      _ExampleItem(
        title: 'isAndroid',
        description: '判断是否为Android平台',
        code: 'context.isAndroid',
        detailCode: '''// 判断是否为Android平台
if (context.isAndroid) {
  // Android特定代码
  return MaterialApp(...);
}

// 根据平台显示不同图标
Icon(context.isAndroid ? Icons.android : Icons.phone_iphone)''',
        builder: (context) => _buildPlatformCard(
          'Android',
          Icons.android,
          context.isAndroid,
          'context.isAndroid',
        ),
      ),
      _ExampleItem(
        title: 'isMacOS',
        description: '判断是否为macOS平台',
        code: 'context.isMacOS',
        detailCode: '''// 判断是否为macOS平台
if (context.isMacOS) {
  // macOS特定代码
}

// 桌面端判断
bool isDesktop = context.isMacOS || 
                 context.isWindows || 
                 context.isLinux;''',
        builder: (context) => _buildPlatformCard(
          'macOS',
          Icons.laptop_mac,
          context.isMacOS,
          'context.isMacOS',
        ),
      ),
      _ExampleItem(
        title: 'isWindows',
        description: '判断是否为Windows平台',
        code: 'context.isWindows',
        detailCode: '''// 判断是否为Windows平台
if (context.isWindows) {
  // Windows特定代码
}

// 显示平台特定消息
String msg = context.isWindows 
  ? 'Windows系统' 
  : '其他系统';''',
        builder: (context) => _buildPlatformCard(
          'Windows',
          Icons.desktop_windows,
          context.isWindows,
          'context.isWindows',
        ),
      ),
      _ExampleItem(
        title: 'isLinux',
        description: '判断是否为Linux平台',
        code: 'context.isLinux',
        detailCode: '''// 判断是否为Linux平台
if (context.isLinux) {
  // Linux特定代码
}''',
        builder: (context) => _buildPlatformCard(
          'Linux',
          Icons.computer,
          context.isLinux,
          'context.isLinux',
        ),
      ),
      _ExampleItem(
        title: 'platform',
        description: '获取当前平台',
        code: 'context.platform',
        detailCode: '''// 获取当前平台
TargetPlatform platform = context.platform;

// 多平台判断
switch (context.platform) {
  case TargetPlatform.iOS:
    // iOS代码
    break;
  case TargetPlatform.android:
    // Android代码
    break;
  case TargetPlatform.macOS:
    // macOS代码
    break;
  default:
    // 其他平台
}''',
        builder: (context) => Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue[200]!, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '当前平台',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 12),
              Text(
                context.platform.toString().split('.').last.toUpperCase(),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
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
        title: const Text('Platform 扩展'),
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

  Widget _buildPlatformCard(String name, IconData icon, bool isCurrent, String code) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isCurrent ? Colors.green[50] : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCurrent ? Colors.green : Colors.grey[300]!,
          width: 3,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 60,
            color: isCurrent ? Colors.green[700] : Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            name,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isCurrent ? Colors.green[700] : Colors.grey[700],
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isCurrent ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              isCurrent ? '当前平台 ✓' : '非当前',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
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
