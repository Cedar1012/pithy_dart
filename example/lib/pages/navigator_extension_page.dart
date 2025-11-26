import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pithy_dart/pithy_dart.dart';

class NavigatorExtensionPage extends StatelessWidget {
  const NavigatorExtensionPage({super.key});

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
        title: 'pushMaterial',
        description: 'Material路由跳转',
        code: 'context.navigator.pushMaterial(NewPage())',
        detailCode: '''// 使用 MaterialPageRoute 跳转
context.navigator.pushMaterial(
  const NextPage(),
)

// 等同于
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => NextPage(),
  ),
)''',
        builder: (context) => ElevatedButton(
          onPressed: () {
            context.navigator.pushMaterial(
              const _DemoPage(title: 'Material 路由'),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12.h),
          ),
          child: const Text('跳转测试', style: TextStyle(fontSize: 16)),
        ),
      ),
      _ExampleItem(
        title: 'pushCupertino',
        description: 'iOS风格路由',
        code: 'context.navigator.pushCupertino(NewPage())',
        detailCode: '''// 使用 CupertinoPageRoute 跳转
context.navigator.pushCupertino(
  const NextPage(),
)

// iOS 风格的侧滑返回动画
// 适用于 iOS 风格的应用''',
        builder: (context) => ElevatedButton(
          onPressed: () {
            context.navigator.pushCupertino(
              const _DemoPage(title: 'Cupertino 路由'),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12.h),
          ),
          child: const Text('iOS风格跳转', style: TextStyle(fontSize: 16)),
        ),
      ),
      _ExampleItem(
        title: 'pop',
        description: '返回上一页',
        code: 'context.navigator.pop()',
        detailCode: '''// 返回上一页
context.navigator.pop();

// 返回并传递结果
context.navigator.pop(result);

// 带类型的返回
context.navigator.pop<String>('返回值');

// 使用示例
ElevatedButton(
  onPressed: () => context.navigator.pop(),
  child: Text('返回'),
)''',
        builder: (context) => Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: const Text(
            '在新页面中\n使用 context.navigator.pop()\n返回',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
      _ExampleItem(
        title: 'maybePop',
        description: '安全返回',
        code: 'context.navigator.maybePop()',
        detailCode: '''// 如果可以返回则返回，否则不操作
context.navigator.maybePop();

// 适用于不确定是否有上一页的场景
// 如果是应用的第一个页面，不会退出应用

// 使用示例
WillPopScope(
  onWillPop: () async {
    return context.navigator.maybePop();
  },
  child: ...,
)''',
        builder: (context) => Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.orange, width: 2.w),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.safety_check, size: 32.sp, color: Colors.orange),
              SizedBox(height: 8.h),
              Text(
                '安全返回',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '如果可以返回则返回',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      _ExampleItem(
        title: 'popUntil',
        description: '返回到指定页面',
        code: 'context.navigator.popUntil((route) => ...)',
        detailCode: '''// 返回到符合条件的页面
context.navigator.popUntil(
  (route) => route.isFirst,
);

// 返回到首页
context.navigator.popUntil(
  ModalRoute.withName('/'),
);

// 返回到指定命名路由
context.navigator.popUntil(
  ModalRoute.withName('/home'),
);''',
        builder: (context) => Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.layers_clear, size: 32.sp, color: Colors.blue),
              SizedBox(height: 8.h),
              Text(
                '返回到指定页面',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      _ExampleItem(
        title: 'canPop',
        description: '判断是否可返回',
        code: 'context.navigator.canPop()',
        detailCode: '''// 判断是否可以返回
bool canGoBack = context.navigator.canPop();

if (context.navigator.canPop()) {
  // 可以返回，显示返回按钮
  IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () => context.navigator.pop(),
  )
} else {
  // 不可返回，隐藏返回按钮
  SizedBox.shrink()
}''',
        builder: (context) => Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: context.navigator.canPop() ? Colors.green[50] : Colors.red[50],
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: context.navigator.canPop() ? Colors.green : Colors.red,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                context.navigator.canPop() ? Icons.check_circle : Icons.cancel,
                size: 32.sp,
                color: context.navigator.canPop() ? Colors.green : Colors.red,
              ),
              SizedBox(height: 8.h),
              Text(
                context.navigator.canPop() ? '可以返回' : '不可返回',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: context.navigator.canPop() ? Colors.green[700] : Colors.red[700],
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
        title: const Text('Navigator 扩展'),
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
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCodeBlock(
                  title: '简单调用',
                  code: item.code,
                  onCopy: () => _copyToClipboard(item.code, context),
                ),
                SizedBox(height: 16.h),
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
                        Icon(Icons.copy, size: 16.sp, color: Colors.white),
                        SizedBox(width: 6.w),
                        Text('复制', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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

class _DemoPage extends StatelessWidget {
  final String title;
  
  const _DemoPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.navigator.pop(),
              child: const Text('返回'),
            ),
          ],
        ),
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
