import 'package:flutter/material.dart';
import 'package:pithy_dart/pithy_dart.dart';

/// 响应式适配扩展
/// Web/平板（宽度>600）使用固定值，移动端使用 ScreenUtil
extension ResponsiveNum on num {
  /// 响应式宽度：Web 用固定值，移动端用 .w
  double get rw {
    // 获取屏幕宽度，如果 > 600 认为是 Web/平板
    try {
      final window = WidgetsBinding.instance.platformDispatcher.views.first;
      final width = window.physicalSize.width / window.devicePixelRatio;
      return width > 600 ? toDouble() : w;
    } catch (e) {
      // 如果获取失败，默认使用固定值（适合 Web）
      return toDouble();
    }
  }

  /// 响应式高度：Web 用固定值，移动端用 .h
  double get rh {
    try {
      final window = WidgetsBinding.instance.platformDispatcher.views.first;
      final width = window.physicalSize.width / window.devicePixelRatio;
      return width > 600 ? toDouble() : h;
    } catch (e) {
      return toDouble();
    }
  }

  /// 响应式字体：Web 用固定值，移动端用 .sp
  double get rsp {
    try {
      final window = WidgetsBinding.instance.platformDispatcher.views.first;
      final width = window.physicalSize.width / window.devicePixelRatio;
      return width > 600 ? toDouble() : sp;
    } catch (e) {
      return toDouble();
    }
  }

  /// 响应式圆角：Web 用固定值，移动端用 .r
  double get rr {
    try {
      final window = WidgetsBinding.instance.platformDispatcher.views.first;
      final width = window.physicalSize.width / window.devicePixelRatio;
      return width > 600 ? toDouble() : r;
    } catch (e) {
      return toDouble();
    }
  }
}

