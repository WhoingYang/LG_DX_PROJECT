import 'package:flutter/material.dart';
import 'soom.dart'; // SoomPage를 사용하기 위해 import

class UsefulFeaturesPage extends StatelessWidget {
  const UsefulFeaturesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // 전체 배경 색상 설정
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // 뒤로가기 아이콘 추가
          onPressed: () {
            Navigator.pop(context); // 이전 페이지로 돌아가기
          },
        ),
        title: const Text(
          '숨 (미정)',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 22,
            fontWeight: FontWeight.w600, // SemiBold에 해당
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFFF5F5F5), // 배경색을 Scaffold와 동일하게 설정
        elevation: 0, // 그림자 제거
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0), // 오른쪽 간격 추가
            child: GestureDetector(
              onTap: () {
                print("옵션 아이콘 클릭됨");
              },
              child: Image.asset(
                'assets/img/option_icon.png', // 옵션 아이콘 이미지 경로
                width: 16, // 아이콘 너비
                height: 16, // 아이콘 높이
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // 본문 내용
          Center(
            child: const Text(
              '어때요 유용하죵?! ㅎㅋㅎㅋ',
              style: TextStyle(fontSize: 18),
            ),
          ),
          // 하단 고정된 버튼 영역
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Column의 높이를 내용 크기로 제한
              children: [
                Divider(
                  thickness: 1,
                  color: Colors.white, // 원하는 색상
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  color: const Color(0xFFF5F5F5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 버튼들이 포함된 네모 상자
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.6, // 화면 너비의 60%
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            // "제품" 버튼
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SoomPage(),
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    '제품',
                                    style: TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff405474)), // 약간 흐리게
                                  ),
                                ),
                              ),
                            ),
                            // "유용한 기능" 버튼
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  print("유용한 기능 버튼 클릭됨");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF405474),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  '유용한 기능',
                                  style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
