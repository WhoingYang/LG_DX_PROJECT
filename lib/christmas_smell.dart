import 'package:flutter/material.dart';

class ChristmasSmellPage extends StatelessWidget {
  const ChristmasSmellPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('크리스마스 향기'),
        centerTitle: true,
        backgroundColor: const Color(0xFFB71C1C), // 크리스마스 테마 색상
      ),
      body: Center(
        child: const Text(
          '크리스마스에는 당신도 솔로 이래도 크리스마스 향기가 좋으십니까 우씨따씨?',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
