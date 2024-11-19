import 'package:flutter/material.dart';

class SmartRoutinePage extends StatelessWidget {
  const SmartRoutinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // 전체 배경 색상 설정
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // <- 모양의 아이콘
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 기능
          },
        ),
        title: const Text(
          '스마트 루틴', // 제목 변경
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 22,
            fontWeight: FontWeight.w600, // SemiBold에 해당
          ),
        ),
        centerTitle: false, // 왼쪽 정렬
        backgroundColor: Colors.transparent, // 앱바 배경 투명 설정
        elevation: 0, // 그림자 제거
      ),

      body: const Center(
        child: Text(
          'Smart Routine 페이지 내용은 여기에 추가됩니다.',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
