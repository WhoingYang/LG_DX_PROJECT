import 'package:flutter/material.dart';
import 'customrectangularthumbshape.dart';

class MySmellPage extends StatefulWidget {
  const MySmellPage({Key? key}) : super(key: key);

  @override
  _MySmellPageState createState() => _MySmellPageState();
}

class _MySmellPageState extends State<MySmellPage> {
  final List<double> ratios = [25.0, 25.0, 25.0, 25.0]; // 슬라이더 비율
  final List<Color> sliderColors = [
    const Color(0xffb9b9b9),
    const Color(0xffb9b9b9),
    const Color(0xffb9b9b9),
    const Color(0xffb9b9b9)
  ]; // 초기 슬라이더 색상
  final List<bool> sliderModified = [
    false,
    false,
    false,
    false
  ]; // 각 슬라이더 수정 여부
  final List<Color> tagColors = [
    Color(0xffff7570),
    Color(0xffffd260),
    Color(0xfff4eae0),
    Color(0xffffd2a5),
    Color(0xffd6ffa5),
    Color(0xffa5dcff),
  ]; // 태그 색상

  final List<String> tagLabels = ["메롱", "자몽", "어쩌고", "저쩌고", "저쩌고", "저쩌고"];
  final List<String> sliderLabels = ["향1", "향2", "향3", "향4"]; // 슬라이더 텍스트

  // 비율 계산 함수 (전체 100% 유지)
  void _updateRatios(int index, double value) {
    setState(() {
      double adjustment = (value - ratios[index]); // 변경된 값만큼 조정
      ratios[index] = value; // 현재 슬라이더 값 변경

      for (int i = 0; i < ratios.length; i++) {
        if (i != index && adjustment != 0) {
          ratios[i] -= adjustment / (ratios.length - 1);
          ratios[i] = ratios[i].clamp(0.0, 100.0); // 0~100 범위 제한
        }
      }
    });
  }

  // 태그 클릭 시 슬라이더 색상 및 텍스트 반영
  void _onTagPressed(int tagIndex) {
    setState(() {
      for (int i = 0; i < sliderColors.length; i++) {
        if (!sliderModified[i]) {
          sliderColors[i] = tagColors[tagIndex]; // 선택한 색상을 슬라이더에 반영
          sliderLabels[i] = tagLabels[tagIndex]; // 슬라이더 텍스트 변경
          sliderModified[i] = true; // 해당 슬라이더를 수정 상태로 변경
          break;
        }
      }
    });
  }

  // 슬라이더 초기화
  void _resetSlider(int index) {
    setState(() {
      sliderColors[index] = const Color(0xffb9b9b9); // 초기 색상
      sliderLabels[index] = "향${index + 1}"; // 초기 텍스트
      sliderModified[index] = false; // 수정 상태 초기화
    });
  }

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
          '나만의 향 조향',
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
      body: Column(
        children: [
          // 앱바 바로 아래 박스들 배치
          Container(
            height: MediaQuery.of(context).size.height * 0.70, // 화면의 70% 높이로 설정
            child: Column(
              children: [
                const SizedBox(height: 5),
                // 박스 1
                Expanded(
                  flex: 31,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 16.0), // 간격 설정
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "향 이름을 설정해주세요",
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff8b95a1),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(4, (index) {
                              return GestureDetector(
                                onTap: () => _resetSlider(index), // 슬라이더 초기화
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // 슬라이더
                                    Expanded(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffeff0f4),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          RotatedBox(
                                            quarterTurns: -1, // 슬라이더를 수직으로 회전
                                            child: SliderTheme(
                                              data: SliderTheme.of(context)
                                                  .copyWith(
                                                trackHeight: 8.0, // 슬라이더 폭
                                                activeTrackColor: sliderColors[
                                                    index], // 활성화된 트랙 색상
                                                inactiveTrackColor: Colors
                                                    .grey[300], // 비활성화된 트랙 색상
                                                thumbColor:
                                                    Colors.white, // 핸들 색상
                                                thumbShape:
                                                    CustomRectangularThumbShape(
                                                  thumbHeight: 16.0, // 핸들 높이
                                                  thumbWidth: 8.0, // 핸들 폭
                                                ),
                                              ),
                                              child: Slider(
                                                value: ratios[index],
                                                min: 0,
                                                max: 100,
                                                onChanged: (value) =>
                                                    _updateRatios(index, value),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      sliderLabels[index], // 텍스트 변경 적용
                                      style: const TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // 기존 텍스트
                                        Text(
                                          "${ratios[index].toStringAsFixed(0)}%",
                                          style: const TextStyle(
                                            fontFamily: 'Pretendard',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff6b7684),
                                          ),
                                        ),
                                        // 공백 추가
                                        const SizedBox(
                                            height: 24.0), // 원하는 높이의 공백 추가
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // 박스 2
                Expanded(
                  flex: 15, // 두 번째 박스
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 16.0, bottom: 16, left: 20),
                          child: Text(
                            "자주 사용한 원료",
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: List.generate(
                                (tagColors.length / 3).ceil(), // 줄 개수 계산
                                (rowIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0), // 행 간격
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start, // 왼쪽 정렬
                                      children: List.generate(3, (colIndex) {
                                        int index = rowIndex * 3 + colIndex;
                                        if (index >= tagColors.length) {
                                          return const SizedBox(); // 빈 공간은 비워둠
                                        }
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12.0), // 요소 간 간격
                                          child: GestureDetector(
                                            onTap: () =>
                                                _onTagPressed(index), // 태그 클릭
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF9FAFD),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                mainAxisSize:
                                                    MainAxisSize.min, // 크기 유동적
                                                children: [
                                                  Container(
                                                    width: 16,
                                                    height: 16,
                                                    decoration: BoxDecoration(
                                                      color: tagColors[index],
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    tagLabels[
                                                        index], // 기존 텍스트 유지
                                                    style: const TextStyle(
                                                      fontFamily: 'Pretendard',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 4),
                // 박스 3
                Expanded(
                  flex: 6, // 세 번째 박스
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10), // 부드러운 테두리
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 16), // 좌측 간격
                            Image.asset(
                              'assets/img/have_smell_icon.png', // 아이콘 이미지
                              width: 20, // 아이콘 너비
                              height: 20, // 아이콘 높이
                            ),
                            const SizedBox(width: 20), // 아이콘과 텍스트 간격
                            const Text(
                              "보유한 원료",
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 16), // 우측 간격
                          child: Icon(
                            Icons.arrow_forward_ios, // 우측 화살표 아이콘
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 태그 목록 생성 함수
  List<Widget> _buildTags() {
    final colors = [
      Color(0xffff7570),
      Color(0xffffd260),
      Color(0xfff4eae0),
      Color(0xffffd2a5),
      Color(0xffd6ffa5),
      Color(0xffa5dcff),
    ];
    final labels = ["메롱", "자몽", "어쩌고", "저쩌고", "저쩌고", "저쩌고"];

    return List.generate(
      labels.length,
      (index) => _buildTagBox(labels[index], colors[index]),
    );
  }

  // 태그 박스 생성 함수
  Widget _buildTagBox(String label, Color color) {
    return Container(
      padding: const EdgeInsets.only(left: 6.0, right: 10, top: 5.0, bottom: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFD), // 배경색 f9fafd로 설정
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
