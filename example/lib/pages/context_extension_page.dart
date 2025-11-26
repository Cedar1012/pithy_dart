import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class ContextExtensionPage extends StatelessWidget {
  const ContextExtensionPage({super.key});

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
        title: 'screenWidth',
        description: '屏幕宽度',
        code: 'context.screenWidth',
        detailCode: '''// 获取屏幕宽度
double width = context.screenWidth;

// 使用示例
Container(
  width: context.screenWidth * 0.8,
  child: Text('80% 宽度'),
)

// 响应式布局
if (context.screenWidth > 600) {
  // 平板或桌面布局
} else {
  // 手机布局
}''',
        builder: (context) => _buildInfoCard(
          '屏幕宽度',
          '${context.screenWidth.toStringAsFixed(0)} px',
          Icons.width_full,
        ),
      ),
      _ExampleItem(
        title: 'screenHeight',
        description: '屏幕高度',
        code: 'context.screenHeight',
        detailCode: '''// 获取屏幕高度
double height = context.screenHeight;

// 使用示例
Container(
  height: context.screenHeight * 0.5,
  child: Text('50% 高度'),
)

// 全屏高度
SizedBox(height: context.screenHeight)''',
        builder: (context) => _buildInfoCard(
          '屏幕高度',
          '${context.screenHeight.toStringAsFixed(0)} px',
          Icons.height,
        ),
      ),
      _ExampleItem(
        title: 'statusBarHeight',
        description: '状态栏高度',
        code: 'context.statusBarHeight',
        detailCode: '''// 获取状态栏高度
double statusBar = context.statusBarHeight;

// 使用示例
Container(
  padding: EdgeInsets.only(
    top: context.statusBarHeight,
  ),
  child: ...,
)

// 添加安全区域
SafeArea(
  child: ...,
)''',
        builder: (context) => _buildInfoCard(
          '状态栏',
          '${context.statusBarHeight.toStringAsFixed(1)} px',
          Icons.phone_android,
        ),
      ),
      _ExampleItem(
        title: 'bottomBarHeight',
        description: '底部导航栏高度',
        code: 'context.bottomBarHeight',
        detailCode: '''// 获取底部导航栏高度
double bottomBar = context.bottomBarHeight;

// 使用示例
Padding(
  padding: EdgeInsets.only(
    bottom: context.bottomBarHeight,
  ),
  child: ...,
)''',
        builder: (context) => _buildInfoCard(
          '底部栏',
          '${context.bottomBarHeight.toStringAsFixed(1)} px',
          Icons.navigation,
        ),
      ),
      _ExampleItem(
        title: 'scaleWidth',
        description: '宽度缩放因子',
        code: 'context.scaleWidth',
        detailCode: '''// 获取宽度缩放因子
double scaleW = context.scaleWidth;

// 使用示例（基于设计稿750px）
double adaptiveWidth = 100 * context.scaleWidth;

// 结合使用
Container(
  width: 200 * context.scaleWidth,
  child: ...,
)''',
        builder: (context) => _buildInfoCard(
          '宽度因子',
          context.scaleWidth.toStringAsFixed(4),
          Icons.sync_alt,
        ),
      ),
      _ExampleItem(
        title: 'scaleHeight',
        description: '高度缩放因子',
        code: 'context.scaleHeight',
        detailCode: '''// 获取高度缩放因子
double scaleH = context.scaleHeight;

// 使用示例
double adaptiveHeight = 100 * context.scaleHeight;

// 响应式间距
SizedBox(
  height: 20 * context.scaleHeight,
)''',
        builder: (context) => _buildInfoCard(
          '高度因子',
          context.scaleHeight.toStringAsFixed(4),
          Icons.swap_vert,
        ),
      ),
      _ExampleItem(
        title: 'isPortrait',
        description: '是否为竖屏',
        code: 'context.isPortrait',
        detailCode: '''// 判断是否为竖屏
bool portrait = context.isPortrait;

// 根据方向显示不同布局
if (context.isPortrait) {
  return Column(children: [...]);
} else {
  return Row(children: [...]);
}

// 条件渲染
context.isPortrait 
  ? PortraitWidget() 
  : LandscapeWidget()''',
        builder: (context) => _buildBoolCard(
          '竖屏',
          context.isPortrait,
          Icons.phone_android,
        ),
      ),
      _ExampleItem(
        title: 'isLandscape',
        description: '是否为横屏',
        code: 'context.isLandscape',
        detailCode: '''// 判断是否为横屏
bool landscape = context.isLandscape;

// 使用示例
if (context.isLandscape) {
  // 横屏特定逻辑
  return WideLayout();
}''',
        builder: (context) => _buildBoolCard(
          '横屏',
          context.isLandscape,
          Icons.stay_current_landscape,
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Context 扩展'),
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

  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400]!, Colors.blue[600]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
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

  Widget _buildBoolCard(String label, bool value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: value ? Colors.green[50] : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: value ? Colors.green : Colors.grey[300]!,
          width: 3,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 48,
            color: value ? Colors.green[700] : Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: value ? Colors.green[700] : Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: value ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              value ? 'True ✓' : 'False',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
