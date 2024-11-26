import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'soom.dart';
<<<<<<< HEAD
import 'flutter_local_notifications.dart';
=======
>>>>>>> 5b870a1ffa8069647f78f56873df04c533949d49

class SecondModal extends StatefulWidget {
  const SecondModal({Key? key}) : super(key: key);

  @override
  _SecondModalState createState() => _SecondModalState();
}

class _SecondModalState extends State<SecondModal> {
<<<<<<< HEAD
=======
  // Local Notifications 플러그인 인스턴스 생성
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications(); // 알림 초기화
  }

  // 알림 초기화 설정
  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // 안드로이드 아이콘 설정
    const DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings(); // iOS 설정

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _localNotificationsPlugin.initialize(initializationSettings);
  }

>>>>>>> 5b870a1ffa8069647f78f56873df04c533949d49
  // 알림 생성 함수
  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id', // 채널 ID
      '조향 완료 알림', // 채널 이름
      channelDescription: '스마트 센트 조향 완료 알림', // 채널 설명
      importance: Importance.high, // 알림 중요도
      priority: Priority.high, // 알림 우선순위
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

<<<<<<< HEAD
    await flutterLocalNotificationsPlugin.show(
=======
    await _localNotificationsPlugin.show(
>>>>>>> 5b870a1ffa8069647f78f56873df04c533949d49
      0, // 알림 ID
      '조향 완료!', // 알림 제목
      '조향이 성공적으로 완료되었습니다.', // 알림 내용
      notificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22), // 둥근 모서리
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
<<<<<<< HEAD
=======
          // 뒤로가기 버튼 (모달 상단)
>>>>>>> 5b870a1ffa8069647f78f56873df04c533949d49
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop(); // 모달 닫기
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 30, left: 10, right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
<<<<<<< HEAD
=======
                // gif 이미지
>>>>>>> 5b870a1ffa8069647f78f56873df04c533949d49
                Image.asset(
                  'assets/img/perfuming.GIF',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
<<<<<<< HEAD
=======

                // 텍스트 내용
>>>>>>> 5b870a1ffa8069647f78f56873df04c533949d49
                const Text(
                  "조향이 완료되면\n알람을 보내드릴게요!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
<<<<<<< HEAD
=======
                const SizedBox(height: 0),

                // 확인 버튼
>>>>>>> 5b870a1ffa8069647f78f56873df04c533949d49
                ElevatedButton(
                  onPressed: () async {
                    await _showNotification(); // 알림 표시
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SoomPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(202, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xffEFF0F4),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
<<<<<<< HEAD
                  child: const Text(
                    "확인",
                    style: TextStyle(color: Colors.black),
=======
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Text(
                      "확인",
                      style: TextStyle(color: Colors.black),
                    ),
>>>>>>> 5b870a1ffa8069647f78f56873df04c533949d49
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
