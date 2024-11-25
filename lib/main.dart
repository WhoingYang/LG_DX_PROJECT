import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Provider 패키지 추가
import 'soom.dart';
import 'smart_routine.dart';
import 'diffuser_state.dart'; // DiffuserState 클래스 import
import 'package:flutter_local_notifications/flutter_local_notifications.dart'; // 알림 플러그인 import

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  const InitializationSettings initializationSettings =
      InitializationSettings(iOS: initializationSettingsDarwin);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(
    ChangeNotifierProvider(
      create: (context) => DiffuserState(),
      child: const MyApp(),
    ),
  );
}

Future<void> showNotification() async {
  const DarwinNotificationDetails darwinNotificationDetails =
      DarwinNotificationDetails();

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(iOS: darwinNotificationDetails);

  await flutterLocalNotificationsPlugin.show(
    0,
    '테스트 알림',
    '이것은 iOS 환경에서의 테스트 알림입니다.',
    platformChannelSpecifics,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAirconditionerOn = true; // 초기 상태
  bool isDiffuserOn = true; // 초기 상태

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "지은호 홈 ",
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    "assets/img/arrow_drop_ios.png", // 이미지 경로
                    width: 16, // 이미지 너비
                    height: 16, // 이미지 높이
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.add, color: Color(0xFF868F9D)),
                  SizedBox(width: 16),
                  Icon(Icons.notifications, color: Color(0xFF868F9D)),
                  SizedBox(width: 16),
                  Icon(Icons.more_vert, color: Color(0xFF868F9D)),
                ],
              ),
            ],
          ),
          centerTitle: false,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/ThinQ 메인화면_배경.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: kToolbarHeight + 65),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Builder(
                    builder: (BuildContext builderContext) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            builderContext,
                            MaterialPageRoute(
                              builder: (context) => const SmartRoutinePage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "스마트 루틴",
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.arrow_forward_ios, size: 16),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // 클릭 가능한 "루틴 알아보기" 박스
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft, // 왼쪽 정렬
                    child: Builder(
                      builder: (BuildContext builderContext) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              builderContext,
                              MaterialPageRoute(
                                builder: (context) => const SmartRoutinePage(),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.435,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 250, 246, 246),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start, // 텍스트와 아이콘을 왼쪽 정렬
                                children: [
                                  Image.asset(
                                    "assets/img/main_watch.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "루틴 알아보기",
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // 첫 번째 박스
                          Container(
                            width: MediaQuery.of(context).size.width * 0.435,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 250, 246, 246),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 3.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/img/airconditioner.png",
                                            width: 40,
                                            height: 40,
                                          ),
                                          SizedBox(height: 4),
                                          Text("공기청정기",
                                              style: TextStyle(
                                                fontFamily: 'Pretendard',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              )),
                                          Row(
                                            children: [
                                              Icon(Icons.circle,
                                                  color: Colors.green,
                                                  size: 12),
                                              SizedBox(width: 4),
                                              Text("보통",
                                                  style: TextStyle(
                                                      fontFamily: 'Pretendard',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 3.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isAirconditionerOn =
                                              !isAirconditionerOn; // 상태 반전
                                        });
                                      },
                                      child: Image.asset(
                                        isAirconditionerOn
                                            ? "assets/img/home_power_icon.png" // 켜짐 상태
                                            : "assets/img/home_power_off_icon.png", // 꺼짐 상태
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),

                          // 두 번째 박스 (클릭 가능하게 설정)
                          Builder(
                            // Builder로 context를 제공
                            builder: (context) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SoomPage(),
                                  ),
                                );
                              },
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.435,
                                height: 100,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 250, 246, 246),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/img/smart_scent_icon.png",
                                                width: 40,
                                                height: 40,
                                              ),
                                              SizedBox(height: 4),
                                              Text("스마트 센트",
                                                  style: TextStyle(
                                                      fontFamily: 'Pretendard',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Row(
                                                children: [
                                                  Icon(Icons.circle,
                                                      color: Colors.green,
                                                      size: 12),
                                                  SizedBox(width: 4),
                                                  Text("발향 중",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Pretendard',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 3.0),
                                        child: Consumer<DiffuserState>(
                                          builder:
                                              (context, diffuserState, child) {
                                            return GestureDetector(
                                              onTap: () {
                                                diffuserState
                                                    .toggleDiffuser(); // 상태 토글
                                              },
                                              child: Image.asset(
                                                diffuserState.isDiffuserOn
                                                    ? "assets/img/home_power_icon.png" // 켜짐 상태
                                                    : "assets/img/home_power_off_icon.png", // 꺼짐 상태
                                                width: 25,
                                                height: 25,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/img/home_icon.png"),
                size: 50,
              ),
              label: '', // 라벨을 비워 아이콘만 표시
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/img/discover_icon.png"),
                size: 50,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/img/report_icon.png"),
                size: 50,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/img/menu_icon.png"),
                size: 50,
              ),
              label: '',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
