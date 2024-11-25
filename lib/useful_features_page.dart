import 'package:flutter/material.dart';
import 'soom.dart'; // SoomPage를 사용하기 위해 import
import 'history.dart';

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
          '스마트 센트',
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
                width: 18, // 아이콘 너비
                height: 18, // 아이콘 높이
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // 본문 내용
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12), // 앱바와 박스 사이 간격
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), // 양쪽 패딩
                child: Column(
                  children: [
                    // 박스 1
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HistoryPage()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.066,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/img/smell_history_icon.png', // 이미지 경로
                                    width: 45,
                                    height: 45,
                                  ),
                                  const SizedBox(width: 12), // 이미지와 텍스트 간격
                                  const Text(
                                    '조향 히스토리',
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10), // 박스 간 거리

// 박스 2
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.066,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/img/have_smell_icon2.png', // 이미지 경로
                                  width: 45,
                                  height: 45,
                                ),
                                const SizedBox(width: 12), // 이미지와 텍스트 간 간격
                                const Text(
                                  '보유한 향료',
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10), // 박스 간 거리

                    // 박스 3
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height *
                          0.264, // 박스 3의 전체 높이
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10), // 부드러운 테두리
                      ),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // Column 내 왼쪽 정렬
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0), // 상단 간격 추가
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0), // 좌측 간격
                                      child: Image.asset(
                                        "assets/img/usingitem_icon.png", // 소모품 정보 아이콘 경로
                                        width: 45, // 아이콘 크기
                                        height: 45,
                                      ),
                                    ),
                                    const SizedBox(width: 12), // 텍스트와 아이콘 간 간격
                                    const Text(
                                      "소모품 정보",
                                      style: TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600, // SemiBold
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 2), // 아이콘과 아래 텍스트 사이 간격
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 24.0), // 좌측 정렬 간격
                                child: const Text(
                                  "내 제품에 필요한 소모품을 확인해보세요.",
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500, // Regular
                                    color: Color(0xFF6B7684), // 약간 흐린 텍스트 색상
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 2, // 1:2 비율의 아래쪽 컨테이너
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal, // 수평 스크롤 가능
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 8.0), // 좌우 간격
                                    child: Image.asset(
                                      "assets/img/diffuser_base.png", // 첫 번째 이미지
                                      width: 300, // 이미지 크기
                                      height: 300, // 이미지 크기
                                      fit: BoxFit.contain, // 이미지 크기 맞춤
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 16.0), // 좌우 간격
                                    child: Image.asset(
                                      "assets/img/sandalwood.png", // 두 번째 이미지
                                      width: 300, // 이미지 크기
                                      height: 300, // 이미지 크기
                                      fit: BoxFit.contain, // 이미지 크기 맞춤
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10), // 박스 간 거리

                    // 박스 4
                    Container(
                      width: double.infinity,
                      height:
                          MediaQuery.of(context).size.height * 0.12, // 기존 박스 비율
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10), // 부드러운 테두리
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0), // 좌우 패딩
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/img/service_plz.png", // 왼쪽 아이콘
                              width: 45,
                              height: 45,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 12), // 아이콘과 텍스트 사이 간격
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "가전세척서비스 신청하기", // 중간 윗줄 텍스트
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600, // SemiBold
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  SizedBox(height: 4), // 텍스트 간 간격
                                  Text(
                                    "LG전자의 전문적인 가전세척 서비스를\n신청하실 수 있어요.", // 아랫줄 텍스트
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500, // Regular
                                      color: Color(0xff6b7684),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios, // 오른쪽 화살표 아이콘
                              size: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10), // 박스 간 거리

                    // 박스 5와 6
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height *
                                0.143, // 박스 높이
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(10), // 부드러운 테두리
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 16, left: 16), // 좌우 패딩
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 맨 윗줄 이미지
                                  Image.asset(
                                    "assets/img/diagnose.png", // 진단 아이콘 경로 (임의로 동일하게 설정)
                                    width: 45,
                                    height: 45,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 4), // 이미지와 텍스트 사이 간격
                                  // 두 번째 줄 텍스트
                                  const Text(
                                    "스마트 진단",
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600, // SemiBold
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  // 세 번째 줄 텍스트
                                  const Text(
                                    "최근 진단 결과 없음",
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500, // Regular
                                      color: Color(0xFF6b7684),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10), // 박스 간 거리
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height *
                                0.143, // 박스 높이
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(10), // 부드러운 테두리
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 16, left: 16), // 좌우 패딩
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 맨 윗줄 이미지
                                  Image.asset(
                                    "assets/img/discription.png", // 진단 아이콘 경로 (임의로 동일하게 설정)
                                    width: 45,
                                    height: 45,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 4), // 이미지와 텍스트 사이 간격
                                  // 두 번째 줄 텍스트
                                  const Text(
                                    "제품 사용설명서",
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600, // SemiBold
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  // 세 번째 줄 텍스트
                                  const Text(
                                    "사용법이 궁금하신가요?",
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500, // Regular
                                      color: Color(0xFF6b7684),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // 하단 고정된 버튼 영역
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Column의 높이를 내용 크기로 제한
              children: [
                Container(
                  height: 1, // Divider와 동일한 두께
                  width: double.infinity,
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
