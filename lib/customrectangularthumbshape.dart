import 'package:flutter/material.dart';

class CustomRectangularThumbShape extends SliderComponentShape {
  final double thumbHeight;
  final double thumbWidth;

  CustomRectangularThumbShape({
    this.thumbHeight = 50.0,
    this.thumbWidth = 50.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbWidth, thumbHeight);
  }

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
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.white
      ..style = PaintingStyle.fill;

    final Rect thumbRect = Rect.fromCenter(
      center: center,
      width: thumbWidth,
      height: thumbHeight,
    );

    final RRect roundedThumbRect = RRect.fromRectAndRadius(
      thumbRect,
      Radius.circular(10), // 둥근 모서리 설정
    );

    canvas.drawRRect(roundedThumbRect, paint);
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
    // 트랙의 높이 및 위치를 부모 박스 전체로 확장
    final double trackHeight = sliderTheme.trackHeight ?? 2.0;
    return Rect.fromLTWH(
      0, // 트랙 시작점 (좌측 끝)
      (parentBox.size.height - trackHeight) / 2.0, // 수직 가운데 정렬
      parentBox.size.width, // 트랙 너비를 부모 박스 너비로 설정
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
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Paint activeTrackPaint = Paint()
      ..color = sliderTheme.activeTrackColor!;
    final Paint inactiveTrackPaint = Paint()
      ..color = sliderTheme.inactiveTrackColor!;

    // 활성 트랙
    context.canvas.drawRect(
      Rect.fromLTRB(
          trackRect.left, trackRect.top, thumbCenter.dx, trackRect.bottom),
      activeTrackPaint,
    );

    // 비활성 트랙
    context.canvas.drawRect(
      Rect.fromLTRB(
          thumbCenter.dx, trackRect.top, trackRect.right, trackRect.bottom),
      inactiveTrackPaint,
    );
  }
}

class MySliderPage extends StatefulWidget {
  @override
  _MySliderPageState createState() => _MySliderPageState();
}

class _MySliderPageState extends State<MySliderPage> {
  double sliderValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Slider')),
      body: Center(
        child: RotatedBox(
          quarterTurns: -1, // 슬라이더를 수직으로 회전
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 50.0, // 트랙 높이
              activeTrackColor: Colors.grey[600], // 활성화된 트랙 색상
              inactiveTrackColor: Colors.grey[300], // 비활성화된 트랙 색상
              thumbColor: Colors.white, // 슬라이더 thumb 색상
              thumbShape: CustomRectangularThumbShape(
                thumbHeight: 50.0,
                thumbWidth: 50.0,
              ),
              trackShape: CustomSliderTrackShape(), // 사용자 정의 트랙
            ),
            child: Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
