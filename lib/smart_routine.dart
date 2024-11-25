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
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xFF868F9D)), // + 아이콘
            onPressed: () {
              print("추가 버튼 클릭됨");
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert,
                color: Color(0xFF868F9D)), // 더보기 아이콘
            onPressed: () {
              print("더보기 버튼 클릭됨");
            },
          ),
          const SizedBox(width: 8), // 오른쪽 여백
        ],
      ),
      body: Column(
        children: [
          // "나의 루틴" 구역
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "나의 루틴" 텍스트
                Align(
                  alignment: const Alignment(-0.52, 0.0), // 화면의 1/4 위치로 이동
                  child: const Padding(
                    padding:
                        EdgeInsets.only(right: 20, top: 10), // 텍스트와 디바이더 사이 여백
                    child: Text(
                      "나의 루틴", // 굵게 표시할 텍스트
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 16, // 글자 크기
                        fontWeight: FontWeight.w600, // Bold
                      ),
                    ),
                  ),
                ),
                // 얇은 디바이더와 굵은 디바이더
                Stack(
                  children: [
                    // 얇은 디바이더
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0), // 디바이더 상단 여백
                      child: Divider(
                        thickness: 1, // 얇은 선
                        color: Color(0xffcad0dd), // 선 색상
                      ),
                    ),
                    // 굵은 디바이더 (얇은 디바이더의 절반 길이)
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 18), // 겹치는 위치 조정
                      child: Container(
                        width:
                            MediaQuery.of(context).size.width * 0.45, // 화면의 50%
                        height: 2, // 굵은 선 두께
                        color: Colors.black, // 선 색상
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // "자동 실행" 텍스트와 화살표
          Padding(
            padding: const EdgeInsets.only(
                top: 8, bottom: 12, left: 16, right: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "자동 실행", // 좌측 텍스트
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("화살표 클릭됨");
                    },
                    child: Image.asset(
                      "assets/img/arrow_up_ios.png", // 화살표 이미지
                      width: 16,
                      height: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CardPage1()),
                    ),
                    child: Image.asset(
                      "assets/img/card1.png",
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CardPage2()),
                    ),
                    child: Image.asset(
                      "assets/img/card2.png",
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12), // 두 행 간격
              Padding(
                padding: const EdgeInsets.only(left: 12.0), // 왼쪽 패딩 적용
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CardPage3()),
                      ),
                      child: Image.asset(
                        "assets/img/card3.png",
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width * 0.45,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// 각 페이지 클래스 정의
class CardPage1 extends StatelessWidget {
  const CardPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Image.asset(
            "assets/img/card1_detail.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
    );
  }
}

class CardPage2 extends StatelessWidget {
  const CardPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Image.asset(
            "assets/img/card2_detail.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
    );
  }
}

class CardPage3 extends StatelessWidget {
  const CardPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Image.asset(
            "assets/img/card3_detail.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
    );
  }
}
