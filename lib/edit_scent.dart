import 'package:flutter/material.dart';

class EditScent extends StatefulWidget {
  final String? title; // 전달받은 제목
  final List<Color>? colors; // 전달받은 색상 리스트
  final List<String>? labels; // 전달받은 레이블 리스트
  final List<double>? percentages; // 전달받은 퍼센트 리스트

  const EditScent({
    Key? key,
    this.title,
    this.colors,
    this.labels,
    this.percentages,
  }) : super(key: key);

  @override
  _EditScentPageState createState() => _EditScentPageState();
}

class _EditScentPageState extends State<EditScent> {
  late List<double> ratios;
  late List<Color> sliderColors;
  late List<String> sliderLabels;
  String title = "향 이름을 설정해주세요";
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    // 히스토리에서 데이터가 전달되었는지 확인
    ratios = widget.percentages ?? [25.0, 25.0, 25.0, 25.0];
    sliderColors = widget.colors ??
        [
          const Color(0xffb9b9b9),
          const Color(0xffb9b9b9),
          const Color(0xffb9b9b9),
          const Color(0xffb9b9b9)
        ];
    sliderLabels = widget.labels ?? ["향1", "향2", "향3", "향4"];
    title = widget.title ?? "향 이름을 설정해주세요";
  }

  // 태그 클릭 시 슬라이더 업데이트
// 태그 클릭 시 슬라이더 업데이트 (토글 기능 추가)
  void _updateSliderWithTag(Color color, String label) {
    setState(() {
      for (int i = 0; i < sliderColors.length; i++) {
        // 이미 해당 태그가 슬라이더에 존재하면 원상복귀
        if (sliderColors[i] == color && sliderLabels[i] == label) {
          sliderColors[i] = const Color(0xffb9b9b9);
          sliderLabels[i] = "향${i + 1}";
          return;
        }
      }

      // 슬라이더에 빈 슬롯을 찾아 태그 추가
      for (int i = 0; i < sliderColors.length; i++) {
        if (sliderColors[i] == const Color(0xffb9b9b9)) {
          sliderColors[i] = color; // 태그 색상 적용
          sliderLabels[i] = label; // 태그 레이블 적용
          return;
        }
      }
    });
  }

// 태그 리스트 생성
  List<Widget> _buildFrequentlyUsedTags() {
    final tagData = [
      {"label": "로즈마리", "color": const Color(0xFFFF7570)},
      {"label": "자스민", "color": const Color(0xfff4eae0)},
      {"label": "샌달우드", "color": const Color(0xffffd2a5)},
      {"label": "라벤더", "color": const Color(0xfff596ff)},
      {"label": "화이트 머스크", "color": const Color(0xFFd5d7df)},
      {"label": "레몬", "color": const Color(0xfffff980)},
    ];

    return tagData.map((tag) {
      return GestureDetector(
        onTap: () {
          _updateSliderWithTag(tag["color"] as Color, tag["label"] as String);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFD),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: tag["color"] as Color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                tag["label"] as String,
                style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  void _updateRatios(int index, double value) {
    setState(() {
      double adjustment = value - ratios[index];
      ratios[index] = value.clamp(0.0, 100.0);

      for (int i = 0; i < ratios.length; i++) {
        if (i != index) {
          ratios[i] =
              (ratios[i] - adjustment / (ratios.length - 1)).clamp(0.0, 100.0);
        }
      }

      double total = ratios.reduce((a, b) => a + b);

      if (total > 100) {
        double excess = total - 100;
        for (int i = 0; i < ratios.length; i++) {
          if (i != index && excess > 0) {
            double deduction = excess.clamp(0.0, ratios[i]);
            ratios[i] -= deduction;
            excess -= deduction;
          }
        }
      }

      if (total < 100) {
        double deficit = 100 - total;
        for (int i = 0; i < ratios.length; i++) {
          if (i != index && deficit > 0) {
            double addition = deficit.clamp(0.0, 100.0 - ratios[i]);
            ratios[i] += addition;
            deficit -= addition;
          }
        }
      }
    });
  }

  void _resetSlider(int index) {
    setState(() {
      sliderColors[index] = const Color(0xffb9b9b9);
      sliderLabels[index] = "향${index + 1}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '나만의 향 조향',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
      ),
      body: Column(
        children: [
          // 70% 높이 컨테이너
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            child: Column(
              children: [
                // 슬라이더 박스
                Expanded(
                  flex: 30, // 비율 31
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isEditing = true;
                              });
                            },
                            child: isEditing
                                ? TextField(
                                    autofocus: true,
                                    style: const TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black, // 입력 중 텍스트는 검은색
                                    ),
                                    decoration: const InputDecoration(
                                      hintText: "향 이름을 입력해주세요", // 힌트 텍스트
                                      hintStyle: TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff8b95a1), // 힌트 텍스트 색상
                                      ),
                                      border: InputBorder.none,
                                      isCollapsed: true,
                                    ),
                                    textAlign: TextAlign.start,
                                    onSubmitted: (value) {
                                      setState(() {
                                        title = value.isEmpty ? "" : value;
                                        isEditing = false; // 편집 모드 종료
                                      });
                                    },
                                  )
                                : Text(
                                    title,
                                    style: const TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(4, (index) {
                              return GestureDetector(
                                onTap: () => _resetSlider(index),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffeff0f4),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        RotatedBox(
                                          quarterTurns: -1,
                                          child: SliderTheme(
                                            data: SliderTheme.of(context)
                                                .copyWith(
                                              trackHeight: 55.0,
                                              activeTrackColor:
                                                  sliderColors[index],
                                              inactiveTrackColor:
                                                  const Color(0xffeff0f4),
                                              thumbColor: Colors.white,
                                              thumbShape:
                                                  CustomRectangularThumbShape(),
                                              trackShape:
                                                  CustomSliderTrackShape(),
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
                                    const SizedBox(height: 8),
                                    // 슬라이더 레이블 (향1, 향2 등)
                                    Text(
                                      sliderLabels[index],
                                      style: const TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    // 슬라이더 비율 (%)
                                    Text(
                                      "${ratios[index].toStringAsFixed(0)}%",
                                      style: const TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
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
                // 자주 사용한 향료 박스
                Expanded(
                  flex: 15, // 비율 15
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 20.0, bottom: 8), // 가로 고정
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              right: 16.0, left: 20, top: 16.0, bottom: 06.0),
                          child: Text(
                            "자주 사용한 향료",
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
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 4, bottom: 12),
                            child: Wrap(
                              spacing: 18.0, // 태그 간 간격
                              runSpacing: 8.0, // 줄 간 간격
                              children: _buildFrequentlyUsedTags(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 보유한 향료 박스
                Expanded(
                  flex: 6, // 비율 6
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 16),
                            Image.asset(
                              'assets/img/have_smell_icon.png', // 아이콘 경로
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 20),
                            const Text(
                              "보유한 향료",
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
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.arrow_forward_ios, // 화살표 아이콘
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
          // 고정된 하단 버튼
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 45.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFD),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "시향하기",
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff405474),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 44,
                    margin: const EdgeInsets.only(left: 8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xff405474),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "조향하기",
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
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
}

class CustomSliderTrackShape extends SliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    Offset offset = Offset.zero,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 2.0;
    return Rect.fromLTWH(
      0,
      (parentBox.size.height - trackHeight) / 2.0,
      parentBox.size.width,
      trackHeight,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = false,
    required TextDirection textDirection,
  }) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      offset: offset,
    );

    final Paint activeTrackPaint = Paint()
      ..color = sliderTheme.activeTrackColor!;
    final Paint inactiveTrackPaint = Paint()
      ..color = sliderTheme.inactiveTrackColor!;

    context.canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
            trackRect.left, trackRect.top, thumbCenter.dx, trackRect.bottom),
        Radius.circular(10.0),
      ),
      activeTrackPaint,
    );

    context.canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
            thumbCenter.dx, trackRect.top, trackRect.right, trackRect.bottom),
        Radius.circular(10.0),
      ),
      inactiveTrackPaint,
    );
  }
}

class CustomRectangularThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      const Size(16.0, 55.0);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.white
      ..style = PaintingStyle.fill;

    final Rect thumbRect =
        Rect.fromCenter(center: center, width: 16.0, height: 55.0);

    context.canvas.drawRRect(
      RRect.fromRectAndRadius(thumbRect, const Radius.circular(3.0)),
      paint,
    );
  }
}
