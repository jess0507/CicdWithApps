import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String url;
  const Avatar({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 圓形白邊
        Center(
          child: Container(
            width: 38, // 調整大小以適應您的需求
            height: 38, // 調整大小以適應您的需求
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // 白色邊框
                width: 2.0, // 邊框寬度
              ),
            ),
            child: ClipOval(
              child: Image.network(
                url,
                fit: BoxFit.cover,
                cacheHeight: 36,
                cacheWidth: 36,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
