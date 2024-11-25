import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeff0f4), // 배경 색상 설정
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // 뒤로가기 아이콘
          onPressed: () {
            Navigator.pop(context); // 이전 페이지로 돌아가기
          },
        ),
        title: const Text(
          '조향 히스토리', // 앱바 제목
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 22,
            fontWeight: FontWeight.w600, // SemiBold
          ),
        ),
        centerTitle: false, // 왼쪽 정렬
        backgroundColor: const Color(0xFFeff0f4), // 앱바 배경색 설정
        elevation: 0, // 그림자 제거
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0), // 오른쪽 간격 설정
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print("Alignment icon clicked");
                  },
                  child: Image.asset(
                    'assets/img/alignment_icon.png', // alignment 아이콘 경로
                    width: 18,
                    height: 18,
                  ),
                ),
                const SizedBox(width: 30), // 아이콘 간 간격
                GestureDetector(
                  onTap: () {
                    print("Option icon clicked");
                  },
                  child: Image.asset(
                    'assets/img/option_icon.png', // option 아이콘 경로
                    width: 18,
                    height: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: Column(
          children: [
            // 박스 1
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.24, // 24% 비율
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // 부드러운 테두리
              ),
              child: Column(
                children: [
                  // 박스 1-1 (상단)
                  Expanded(
                    flex: 4, // 4 비율
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ), // 상단 모서리 둥글게
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0), // 좌우 여백
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // 좌우 배치
                          children: const [
                            Text(
                              '퇴근 후',
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 18,
                                fontWeight: FontWeight.w600, // SemiBold
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '2024-11-22',
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 16,
                                fontWeight: FontWeight.w500, // Regular
                                color: Color(0xFF6B7684),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // 박스 1-2 (중간)
                  Expanded(
                    flex: 3, // 줄어든 비율
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20), // 내부 여백
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildGridItem(
                                  color: const Color(0xFFFF7570), // 분홍색
                                  label: "로즈마리",
                                  percentage: "35%",
                                ),
                                _buildGridItem(
                                  color: const Color(0xFFc8bc9c), // 갈색
                                  label: "파출리",
                                  percentage: "20%",
                                ),
                              ],
                            ),
                            const SizedBox(height: 8), // 상하 간격
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildGridItem(
                                  color: const Color(0xFFaa9c80), // 고동색
                                  label: "시더우드",
                                  percentage: "15%",
                                ),
                                _buildGridItem(
                                  color: const Color(0xFFf596ff), // 보라색
                                  label: "라벤더",
                                  percentage: "30%",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // 박스 1-3 (하단)
                  Expanded(
                    flex: 5, // 증가된 비율
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 22.0), // 내부 여백
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween, // 박스 간 간격
                          children: [
                            // 첫 번째 버튼
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8.0), // 좌우 간격
                                decoration: BoxDecoration(
                                  color: const Color(0xFFeff0f4), // 회색 배경
                                  borderRadius:
                                      BorderRadius.circular(30), // 둥근 모서리
                                ),
                                child: const Center(
                                  child: Text(
                                    "레시피 수정하기",
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600, // SemiBold
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10), // 두 박스 간 간격
                            // 두 번째 버튼
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8.0), // 좌우 간격
                                decoration: BoxDecoration(
                                  color: const Color(0xFFeff0f4), // 회색 배경
                                  borderRadius:
                                      BorderRadius.circular(30), // 둥근 모서리
                                ),
                                child: const Center(
                                  child: Text(
                                    "조향하기",
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600, // SemiBold
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0), // 박스 간 간격

            // 박스 2
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.066, // 3% 비율
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // 부드러운 테두리
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // 좌우 간격
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "세레니티", // 박스 2 텍스트
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(
                      'assets/img/arrow_drop_ios2.png', // 화살표 이미지 경로
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0), // 박스 간 간격

            // 박스 3
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.066, // 3% 비율
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // 부드러운 테두리
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // 좌우 간격
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "포근한 이불향", // 박스 3 텍스트
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(
                      'assets/img/arrow_drop_ios2.png', // 화살표 이미지 경로
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0), // 박스 간 간격

            // 박스 4
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.066, // 3% 비율
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // 부드러운 테두리
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // 좌우 간격
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "상쾌한 향", // 박스 4 텍스트
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(
                      'assets/img/arrow_drop_ios2.png', // 화살표 이미지 경로
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// _buildGridItem 함수 수정
Widget _buildGridItem({
  required Color color,
  required String label,
  required String percentage,
}) {
  return Row(
    children: [
      // 동그라미 색상 아이콘
      Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      const SizedBox(width: 16), // 동그라미와 텍스트 간격
      // 텍스트 라벨과 퍼센트 나란히 배치
      Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 32), // 라벨과 퍼센트 간격
          Text(
            percentage,
            style: const TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              fontWeight: FontWeight.w500, // Regular
              color: Color.fromARGB(255, 0, 0, 0), // 회색 텍스트
            ),
          ),
        ],
      ),
    ],
  );
}
