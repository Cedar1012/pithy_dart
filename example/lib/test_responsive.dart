import 'package:flutter/material.dart';
import 'utils/responsive.dart';

/// 测试响应式适配效果的页面
class TestResponsivePage extends StatelessWidget {
  const TestResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = screenWidth > 600;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('响应式适配测试'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.rw),
          margin: EdgeInsets.all(20.rw),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12.rr),
            border: Border.all(color: Colors.blue, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '📊 响应式适配测试',
                style: TextStyle(
                  fontSize: 24.rsp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 20.rh),
              
              _buildInfo('屏幕宽度', '${screenWidth.toStringAsFixed(0)} px'),
              _buildInfo('设备类型', isWeb ? 'Web/平板 (>600px)' : '移动端 (≤600px)'),
              _buildInfo('使用的适配', isWeb ? '固定值' : 'ScreenUtil'),
              
              SizedBox(height: 20.rh),
              
              Text(
                '🧪 测试值对比:',
                style: TextStyle(
                  fontSize: 18.rsp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: 10.rh),
              
              _buildValueTest('100.rw', 100.rw),
              _buildValueTest('100.rh', 100.rh),
              _buildValueTest('16.rsp', 16.rsp),
              _buildValueTest('8.rr', 8.rr),
              
              SizedBox(height: 20.rh),
              
              Container(
                padding: EdgeInsets.all(12.rw),
                decoration: BoxDecoration(
                  color: isWeb ? Colors.green[100] : Colors.orange[100],
                  borderRadius: BorderRadius.circular(8.rr),
                ),
                child: Text(
                  isWeb
                      ? '✅ Web 端：使用固定值，布局稳定'
                      : '📱 移动端：使用 ScreenUtil，自适应屏幕',
                  style: TextStyle(
                    fontSize: 14.rsp,
                    color: isWeb ? Colors.green[900] : Colors.orange[900],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildInfo(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.rh),
      child: Row(
        children: [
          SizedBox(
            width: 100.rw,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 14.rsp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.rsp,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildValueTest(String code, double result) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.rh),
      child: Row(
        children: [
          SizedBox(
            width: 80.rw,
            child: Text(
              code,
              style: TextStyle(
                fontSize: 12.rsp,
                fontFamily: 'monospace',
                color: Colors.purple[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            '→ ${result.toStringAsFixed(1)} px',
            style: TextStyle(
              fontSize: 12.rsp,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

