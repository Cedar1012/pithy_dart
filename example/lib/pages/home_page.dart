import 'package:flutter/material.dart';
import 'package:pithy_dart/pithy_dart.dart';
import '../utils/responsive.dart';
import 'widget_extension_page.dart';
import 'text_extension_page.dart';
import 'list_extension_page.dart';
import 'string_extension_page.dart';
import 'context_extension_page.dart';
import 'screen_util_page.dart';
import 'duration_extension_page.dart';
import 'padding_extension_page.dart';
import 'navigator_extension_page.dart';
import 'colors_extension_page.dart';
import 'platform_extension_page.dart';
import 'glossy_container_page.dart';
import 'icon_extension_page.dart';
import 'media_query_extension_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final examples = [
      ExtensionExample(
        title: 'Widget 扩展',
        subtitle: '链式调用布局、样式、动画等',
        icon: Icons.widgets,
        color: Colors.blue,
        page: const WidgetExtensionPage(),
      ),
      ExtensionExample(
        title: 'Text 扩展',
        subtitle: '文本样式、颜色、阴影等',
        icon: Icons.text_fields,
        color: Colors.purple,
        page: const TextExtensionPage(),
      ),
      ExtensionExample(
        title: 'List 扩展',
        subtitle: '列表转布局：Column、Row、Stack 等',
        icon: Icons.list,
        color: Colors.green,
        page: const ListExtensionPage(),
      ),
      ExtensionExample(
        title: 'String 扩展',
        subtitle: '字符串处理、类型转换、颜色生成',
        icon: Icons.text_format,
        color: Colors.orange,
        page: const StringExtensionPage(),
      ),
      ExtensionExample(
        title: 'Context 扩展',
        subtitle: '便捷访问屏幕信息、导航、状态',
        icon: Icons.phone_android,
        color: Colors.teal,
        page: const ContextExtensionPage(),
      ),
      ExtensionExample(
        title: 'ScreenUtil 屏幕适配',
        subtitle: '响应式尺寸适配：.w .h .sp .r',
        icon: Icons.screen_lock_portrait,
        color: Colors.indigo,
        page: const ScreenUtilPage(),
      ),
      ExtensionExample(
        title: 'Duration 扩展',
        subtitle: '时间单位转换和延迟执行',
        icon: Icons.access_time,
        color: Colors.pink,
        page: const DurationExtensionPage(),
      ),
      ExtensionExample(
        title: 'Padding 扩展',
        subtitle: '数字快速转 EdgeInsets',
        icon: Icons.space_bar,
        color: Colors.cyan,
        page: const PaddingExtensionPage(),
      ),
      ExtensionExample(
        title: 'Navigator 扩展',
        subtitle: '增强的路由导航功能',
        icon: Icons.navigation,
        color: Colors.deepOrange,
        page: const NavigatorExtensionPage(),
      ),
      ExtensionExample(
        title: 'Colors 扩展',
        subtitle: '主题颜色快速访问',
        icon: Icons.color_lens,
        color: Colors.red,
        page: const ColorsExtensionPage(),
      ),
      ExtensionExample(
        title: 'Platform 扩展',
        subtitle: '平台判断：iOS、Android 等',
        icon: Icons.devices,
        color: Colors.brown,
        page: const PlatformExtensionPage(),
      ),
      ExtensionExample(
        title: 'Icon 扩展',
        subtitle: 'Icon 属性修改和动画',
        icon: Icons.emoji_emotions,
        color: Colors.amber,
        page: const IconExtensionPage(),
      ),
      ExtensionExample(
        title: 'MediaQuery 扩展',
        subtitle: '媒体查询信息访问',
        icon: Icons.info,
        color: Colors.blueGrey,
        page: const MediaQueryExtensionPage(),
      ),
      ExtensionExample(
        title: 'GlossyContainer',
        subtitle: '毛玻璃效果容器',
        icon: Icons.blur_on,
        color: Colors.lightBlue,
        page: const GlossyContainerPage(),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Pithy Dart 扩展示例'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 根据屏幕宽度计算列数
          int crossAxisCount;
          double childAspectRatio;

          if (constraints.maxWidth > 1600) {
            crossAxisCount = 7;
            childAspectRatio = 1.2;
          } else if (constraints.maxWidth > 1400) {
            crossAxisCount = 6;
            childAspectRatio = 1.2;
          } else if (constraints.maxWidth > 1100) {
            crossAxisCount = 5;
            childAspectRatio = 1.15;
          } else if (constraints.maxWidth > 900) {
            crossAxisCount = 4;
            childAspectRatio = 1.1;
          } else if (constraints.maxWidth > 700) {
            crossAxisCount = 3;
            childAspectRatio = 1.1;
          } else if (constraints.maxWidth > 500) {
            crossAxisCount = 2;
            childAspectRatio = 1.0;
          } else {
            crossAxisCount = 1;
            childAspectRatio = 1.3;
          }

          return GridView.builder(
            padding: EdgeInsets.all(20.rw),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
              crossAxisSpacing: 16.rw,
              mainAxisSpacing: 16.rh,
            ),
            itemCount: examples.length,
            itemBuilder: (context, index) {
              final example = examples[index];
              return _buildExampleCard(context, example);
            },
          );
        },
      ),
    );
  }

  Widget _buildExampleCard(BuildContext context, ExtensionExample example) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.rr),
        elevation: 1,
        shadowColor: example.color.withOpacity(0.2),
        child: InkWell(
          onTap: () {
            context.navigator.pushMaterial(example.page);
          },
          borderRadius: BorderRadius.circular(12.rr),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(12.rw),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80.rw,
                    height: 80.rw,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [example.color.withOpacity(0.8), example.color],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16.rr),
                      boxShadow: [
                        BoxShadow(
                          color: example.color.withOpacity(0.25),
                          blurRadius: 8.rr,
                          offset: Offset(0, 3.rh),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        example.icon,
                        color: Colors.white,
                        size: 30.rsp,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.rh),
                  Text(
                    example.title,
                    style: TextStyle(
                      fontSize: 30.rsp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.rh),
                  Text(
                    example.subtitle,
                    style: TextStyle(
                      fontSize: 15.rsp,
                      color: Colors.grey[600],
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.rh),
                  Icon(Icons.arrow_forward, size: 30.rsp, color: example.color),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExtensionExample {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget page;

  ExtensionExample({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.page,
  });
}
