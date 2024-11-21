import 'package:flutter/material.dart';

class WinterSmellPage extends StatelessWidget {
  const WinterSmellPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('겨울 향기'),
        centerTitle: true,
        backgroundColor: const Color(0xFF0277BD), // 겨울 테마 색상
      ),
      body: Center(
        child: const Text(
          '겨울 향기 페이지입니다. 전 겨울 냄새가 좋아요 코가 시큰시큰 뭔가 꼬숩한 나무냄새와 젖은 바닥 냄새까지 킁카킁카',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
