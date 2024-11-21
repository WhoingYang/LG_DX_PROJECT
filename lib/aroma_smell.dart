import 'package:flutter/material.dart';

class AromaSmellPage extends StatelessWidget {
  const AromaSmellPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('아로마 향기'),
        centerTitle: true,
        backgroundColor: const Color(0xFF4CAF50), // 아로마 테마 색상
      ),
      body: Center(
        child: const Text(
          '아로마 향기 페이지입니다. 마사지 받는거 좋아요. 아로마 마사지가 좋아하긴 하거든요?근데 아로마는 비싸...스포츠는 아파...나 마사지 좋아하는거 맞나 흠',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
