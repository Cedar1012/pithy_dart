# Pithy Dart Example

这是 `pithy_dart` 包的示例应用，用于演示和测试包的功能。

## 运行示例

```bash
cd example
fvm flutter run
```

## 开发说明

这个示例应用通过 `path` 依赖引用父目录的 `pithy_dart` 包：

```yaml
dependencies:
  pithy_dart:
    path: ../
```

这意味着：
- 对父目录包代码的任何修改都会立即反映在示例应用中
- 可以直接在示例应用中调试包的代码
- 支持热重载（Hot Reload）和断点调试

## 在 Cursor/VSCode 中调试

1. 打开 Run and Debug 面板（Cmd/Ctrl + Shift + D）
2. 选择 "Example App" 配置
3. 点击运行按钮或按 F5
4. 在包代码中设置断点即可调试
