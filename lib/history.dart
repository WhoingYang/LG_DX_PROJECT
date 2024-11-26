import 'package:flutter/material.dart';
import 'mysmell.dart';
import 'edit_scent.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final Map<String, bool> _expandedState = {
    '퇴근 후': true,
    '세레니티': false,
    '포근한 이불향': false,
    '상쾌한 향': false,
  };

  final List<Map<String, dynamic>> _historyData = [
    {
      'title': '퇴근 후',
      'date': '2024-11-22',
      'ingredients': [
        {'color': Color(0xFFFF7570), 'label': '로즈마리', 'percentage': 35},
        {'color': Color(0xFFc8bc9c), 'label': '파출리', 'percentage': 20},
        {'color': Color(0xFF5f4327), 'label': '시더우드', 'percentage': 15},
        {'color': Color(0xFFf596ff), 'label': '라벤더', 'percentage': 30},
      ],
    },
    {
      'title': '세레니티',
      'date': '2024-11-16',
      'ingredients': [
        {'color': Color(0xFFf596ff), 'label': '라벤더', 'percentage': 40},
        {'color': Color(0xFFfeffcd), 'label': '베르가못', 'percentage': 20},
        {'color': Color(0xFFffd2a5), 'label': '샌달우드', 'percentage': 30},
        {'color': Color(0xFFd5d7df), 'label': '화이트 머스크', 'percentage': 10},
      ],
    },
    {
      'title': '포근한 이불향',
      'date': '2024-11-13',
      'ingredients': [
        {'color': Color(0xffdcc4ff), 'label': '아이리스', 'percentage': 20},
        {'color': Color(0xFFcdf5ff), 'label': '코튼 플라워', 'percentage': 10},
        {'color': Color(0xFFffd2a5), 'label': '샌달우드', 'percentage': 30},
        {'color': Color(0xFFd5d7df), 'label': '화이트 머스크', 'percentage': 40},
      ],
    },
    {
      'title': '상쾌한 향',
      'date': '2024-08-12',
      'ingredients': [
        {'color': Color(0xFFfff980), 'label': '레몬', 'percentage': 35},
        {'color': Color(0xFFb7ffb7), 'label': '그린티', 'percentage': 25},
        {'color': Color(0xFF87d2fa), 'label': '유칼립투스', 'percentage': 20},
        {'color': Color(0xFFd5d7df), 'label': '화이트 머스크', 'percentage': 20},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeff0f4),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0, // Title을 왼쪽으로 붙이기
        title: const Text(
          '조향 히스토리',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print("Alignment icon clicked");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Image.asset(
                'assets/img/alignment_icon.png',
                width: 18,
                height: 18,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Option icon clicked");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(
                'assets/img/option_icon.png',
                width: 18,
                height: 18,
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xFFeff0f4),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: ListView(
          children: _historyData.map((data) {
            return HistoryBox(
              title: data['title'],
              date: data['date'],
              ingredients: data['ingredients'],
              isExpanded: _expandedState[data['title']]!,
              onToggle: () {
                setState(() {
                  _expandedState[data['title']] =
                      !_expandedState[data['title']]!;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class HistoryBox extends StatelessWidget {
  final String title;
  final String date;
  final List<Map<String, dynamic>> ingredients;
  final bool isExpanded;
  final VoidCallback onToggle;

  const HistoryBox({
    Key? key,
    required this.title,
    required this.date,
    required this.ingredients,
    required this.isExpanded,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: isExpanded ? 18 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      if (isExpanded)
                        Text(
                          date,
                          style: const TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF6B7684),
                          ),
                        ),
                      const SizedBox(width: 8),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 24,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isExpanded)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children:
                          List.generate(ingredients.length ~/ 2, (rowIndex) {
                        int startIndex = rowIndex * 2;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // 첫 번째 원료
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          color: ingredients[startIndex]
                                              ['color'],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 8), // 동그라미와 텍스트 간격
                                      Text(
                                        ingredients[startIndex]['label'],
                                        style: const TextStyle(
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8), // 퍼센트 오른쪽 패딩
                                    child: Text(
                                      "${ingredients[startIndex]['percentage']}%",
                                      style: const TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16), // 두 원료 사이 간격

                            // 두 번째 원료
                            if (startIndex + 1 < ingredients.length)
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            color: ingredients[startIndex + 1]
                                                ['color'],
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(
                                            width: 8), // 동그라미와 텍스트 간격
                                        Text(
                                          ingredients[startIndex + 1]['label'],
                                          style: const TextStyle(
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8), // 퍼센트 오른쪽 패딩
                                      child: Text(
                                        "${ingredients[startIndex + 1]['percentage']}%",
                                        style: const TextStyle(
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 4, bottom: 12),
                    child: Column(
                      // Row를 감싸는 Column으로 수정
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditScent(
                                        title: title,
                                        colors: ingredients
                                            .map((e) => e['color'] as Color)
                                            .toList(),
                                        labels: ingredients
                                            .map((e) => e['label'] as String)
                                            .toList(),
                                        percentages: ingredients
                                            .map((e) => (e['percentage'] as int)
                                                .toDouble()) // 명시적으로 double 변환
                                            .toList(),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFeff0f4),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "레시피 수정하기",
                                      style: TextStyle(
                                          fontFamily: 'Pretendard',
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF405474),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    "조향하기",
                                    style: TextStyle(
                                        fontFamily: 'Pretendard',
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12), // 버튼 아래에 공백 추가
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
      {required Color color, required String label, required int percentage}) {
    return Expanded(
      child: Row(
        children: [
          Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 8),
          Text("$label $percentage%"),
        ],
      ),
    );
  }
}
