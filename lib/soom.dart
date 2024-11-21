// lib/soom.dart
import 'package:flutter/material.dart';
import 'useful_features_page.dart';
import 'chatsoom.dart'; // ChatThinqPage를 사용하기 위해 import
import 'main.dart';
import 'christmas_smell.dart';
import 'winter_smell.dart';
import 'aroma_smell.dart';
import 'diffuser_state.dart'; // DiffuserState 클래스 import
import 'package:provider/provider.dart'; // Provider 패키지 추가

class SoomPage extends StatefulWidget {
  const SoomPage({Key? key}) : super(key: key);

  @override
  State<SoomPage> createState() => _SoomPageState();
}

class _SoomPageState extends State<SoomPage> {
  // 발향 세기 상태 관련 변수
  final List<String> intensityLevels = ["자동", "약", "중", "강", "터보"];
  int currentIntensityIndex = 0; // 초기값: "자동"

  // 발향력 값을 반환하는 함수
  String getIntensityLevelText() {
    switch (intensityLevels[currentIntensityIndex]) {
      case "약":
        return "발향력    30%";
      case "중":
        return "발향력    50%";
      case "강":
        return "발향력    70%";
      case "터보":
        return "발향력    100%";
      case "자동":
      default:
        return "발향력    자동";
    }
  }

// 발향 세기 증가 함수
  void _increaseIntensity() {
    setState(() {
      currentIntensityIndex =
          (currentIntensityIndex + 1) % intensityLevels.length;
    });
  }

// 발향 세기 감소 함수
  void _decreaseIntensity() {
    setState(() {
      currentIntensityIndex =
          (currentIntensityIndex - 1 + intensityLevels.length) %
              intensityLevels.length;
    });
  }

  bool isLightOn = false; // 발향 표시등 상태
  bool isDiffuserOn = true; // 초기 상태

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5), // 전체 배경 색상 설정
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), // <- 모양의 아이콘
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyApp(), // main.dart의 첫 번째 위젯
                ),
              );
            },
          ),
          title: const Text(
            '숨 (미정)', // 제목 변경
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
            SingleChildScrollView(
              child: Column(
                children: [
                  // 상단 30% 영역
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        // 이미지
                        Image.asset(
                          "assets/img/airconditioner.png",
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 16),
                        // 발향력 박스와 파워 버튼을 포함한 Stack
                        Stack(
                          children: [
                            // 발향력 박스 (중앙 정렬)
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 24),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF23A46B), // 박스 배경색
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  getIntensityLevelText(), // 발향력 동적 변경
                                  style: const TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                            // 파워 버튼 (오른쪽 정렬)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Consumer<DiffuserState>(
                                  builder: (context, diffuserState, child) {
                                    return GestureDetector(
                                      onTap: () {
                                        diffuserState.toggleDiffuser(); // 상태 토글
                                      },
                                      child: Image.asset(
                                        diffuserState.isDiffuserOn
                                            ? "assets/img/home_power_icon.png" // 켜짐 상태
                                            : "assets/img/home_power_off_icon.png", // 꺼짐 상태
                                        width: 50,
                                        height: 50,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        // 조향된 향 텍스트
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.circle,
                                color: Color(0xFF23A46B), size: 10),
                            const SizedBox(width: 4),
                            const Text(
                              "조향된 향 18ml 남음",
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // 상단 45% 영역
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      children: [
                        // 위쪽 3 부분
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              // 위쪽 3 부분을 다시 위아래 2:1로 나누기
                              Expanded(
                                flex: 2, // 위 2 부분
                                child: Row(
                                  children: [
                                    // 박스 1
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 20.0,
                                            right: 6.0,
                                            bottom: 6.0), // 간격 설정
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center, // 내용 중앙 정렬
                                          children: [
                                            Image.asset(
                                              'assets/img/smell_detail_controll_icon.png', // 아이콘 이미지
                                              width: 50, // 이미지 너비
                                              height: 50, // 이미지 높이
                                            ),
                                            const SizedBox(
                                                height: 12), // 이미지와 텍스트 사이 간격
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 6.0), // 내부 여백
                                              decoration: BoxDecoration(
                                                color: const Color(
                                                    0xfff5f5f5), // 회색 박스 색상
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20), // 모서리 둥글게
                                              ),
                                              child: const Text(
                                                "   향 미세 조정   ", // 텍스트
                                                style: TextStyle(
                                                  fontFamily: 'Pretendard',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black, // 텍스트 색상
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                                    // 박스 2
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 6.0,
                                            right: 20,
                                            bottom: 6), // 간격 설정
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          // border: Border.all(
                                          //     color: Colors.grey, width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/img/smell_power_icon.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                            const SizedBox(height: 2),
                                            const Text(
                                              "발향 세기",
                                              style: TextStyle(
                                                fontFamily: 'Pretendard',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween, // 아이콘을 양끝으로 배치
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      left:
                                                          22.0), // 왼쪽 벽과 화살표 사이 간격
                                                  child: GestureDetector(
                                                    onTap:
                                                        _decreaseIntensity, // 왼쪽 화살표 클릭 이벤트
                                                    child: const Icon(
                                                        Icons.arrow_back_ios,
                                                        size: 16,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Text(
                                                  intensityLevels[
                                                      currentIntensityIndex], // 현재 발향 세기
                                                  style: const TextStyle(
                                                    color: Color(0xff267488),
                                                    fontFamily: 'Pretendard',
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      right:
                                                          22.0), // 오른쪽 벽과 화살표 사이 간격
                                                  child: GestureDetector(
                                                    onTap:
                                                        _increaseIntensity, // 오른쪽 화살표 클릭 이벤트
                                                    child: const Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 16,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // 박스 3
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChatSoomPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 20.0),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(width: 16),
                                            Image.asset(
                                              'assets/img/make_smell_icon.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "새로운 향 조향하기",
                                              style: TextStyle(
                                                fontFamily: 'Pretendard',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 16),
                                          child: Icon(Icons.arrow_forward_ios,
                                              size: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 박스 3과 박스 4 사이 간격 늘리기
                        const SizedBox(height: 20),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 20.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              // border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                // 위쪽 영역
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(width: 16),
                                          Image.asset(
                                            'assets/img/resv_icon.png',
                                            width: 45,
                                            height: 45,
                                          ),
                                          const SizedBox(width: 8),
                                          const Text(
                                            "예약",
                                            style: TextStyle(
                                              fontFamily: 'Pretendard',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 16),
                                        child: Icon(Icons.arrow_forward_ios,
                                            size: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 65, right: 20.0), // Divider 길이 조정
                                  child: Divider(
                                      thickness: 1,
                                      color: const Color(0xffE5E7EE)),
                                ),
                                // 아래쪽 영역
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(width: 16),
                                          Image.asset(
                                            'assets/img/light_icon.png',
                                            width: 45,
                                            height: 45,
                                          ),
                                          const SizedBox(width: 8),
                                          const Text(
                                            "발향 표시등",
                                            style: TextStyle(
                                              fontFamily: 'Pretendard',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Switch(
                                          value: isLightOn,
                                          onChanged: (value) {
                                            setState(() {
                                              isLightOn = value;
                                            });
                                          },
                                          activeColor:
                                              Colors.white, // 버튼 색상: 하얀색
                                          activeTrackColor: const Color(
                                              0xff3291ab), // 트랙 색상: 청록색
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // 16px 높이만큼의 빈 줄 삽입
                  // 테마별 향기 추천 섹션
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 16, bottom: 8), // 적당한 간격 설정
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "테마별 향기 추천",
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Column(
                      children: [
                        // 이미지 1 (크리스마스 향기)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ChristmasSmellPage(),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/img/christmas_smell.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // 이미지 2 (겨울 향기)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WinterSmellPage(),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/img/winter_smell.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // 이미지 3 (아로마 향기)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AromaSmellPage(),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/img/aroma_smell.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 90), // 16px 높이만큼의 빈 줄 삽입
                      ],
                    ),
                  ),
                ],
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
                                  child: ElevatedButton(
                                    onPressed: () {
                                      print("제품 버튼 클릭됨");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF405474),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: const Text(
                                      '  제품  ',
                                      style: TextStyle(
                                          fontFamily: 'Pretendard',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                // "유용한 기능" 버튼
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const UsefulFeaturesPage(),
                                        ),
                                      );
                                    },
                                    child: Center(
                                      child: Text(
                                        '유용한 기능',
                                        style: TextStyle(
                                            fontFamily: 'Pretendard',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff405474)), // 약간 흐리게
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            )
          ],
        ));
  }
}
