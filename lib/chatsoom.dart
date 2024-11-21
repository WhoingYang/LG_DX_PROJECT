import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:soom/models/message.dart';

class ChatSoomPage extends StatefulWidget {
  ChatSoomPage({super.key});

  @override
  State<ChatSoomPage> createState() => _ChatSoomPageState();
}

class _ChatSoomPageState extends State<ChatSoomPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  bool _canSendMessage = false;
  ChatRoom _room = ChatRoom(chats: [], createdAt: DateTime.now());
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Gemini.init(apiKey: "//"); // 여기에 실제 API 키 입력
    _sendInitialMessage(); // 앱이 시작될 때 자동으로 질문
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // 뒤로가기 아이콘
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 기능
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Chat Soom",
              style: TextStyle(
                color: Colors.black,
                fontSize: 21.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/Chat ThinQ.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 120, bottom: 80),
            child: Column(
              children: [
                for (var chat in _room.chats)
                  chat.isMe
                      ? _buildMyChatBubble(chat)
                      : _buildGptChatBubble(chat),
                if (_isLoading) _buildLoadingBubble(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildTextField(),
          ),
        ],
      ),
    );
  }

  Widget _buildGptChatBubble(ChatMessage chat) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, top: 5),
          child: Image.asset(
            "assets/img/ChatSoomMark.png",
            width: 20,
            height: 20,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(maxWidth: 300),
            margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              chat.text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMyChatBubble(ChatMessage chat) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: 250),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          chat.text,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingBubble() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 250),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 10),
            Text(
              "음답 대기 중...",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        onSubmitted: (text) {
          if (text.trim().isNotEmpty) {
            _sendMessage(); // 메세지 전송
          }
        },
        onChanged: (text) {
          setState(() {
            _canSendMessage = text.isNotEmpty;
          });
        },
        decoration: InputDecoration(
          hintText: "메시지를 입력하세요",
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 15, left: 20, right: 20),
          alignLabelWithHint: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 35, left: 10),
            child: IconButton(
              icon: Container(
                  width: 30,
                  height: 30,
                  child: Icon(
                    Icons.mic,
                    color: Color(0xFF626A7D),
                  )),
              onPressed: () {
                print("마이크 버튼 클릭");
              },
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 35, right: 10),
            child: IconButton(
              icon: Container(
                width: 30,
                height: 30,
                child: Icon(
                  Icons.send,
                  color: Color(0xFF626A7D),
                ),
              ),
              onPressed: () {
                _sendMessage();
              },
            ),
          ),
        ),
        style: TextStyle(fontSize: 16),
        maxLines: null,
        keyboardType: TextInputType.multiline,
      ),
    );
  }

  // 사용자가 메시지를 보낼 때
  void _sendMessage() {
    _focusNode.unfocus();

    if (_controller.text.trim().isEmpty) {
      return;
    }

    final ChatMessage chat = ChatMessage(
      isMe: true,
      text: _controller.text.trim(),
      sentAt: DateTime.now(),
    );

    setState(() {
      _room.chats.add(chat);
      _canSendMessage = false;
      _isLoading = true;
    });

    String question = _controller.text.trim();

    Gemini.instance.streamGenerateContent(question).listen((event) {
      setState(() {
        if (_room.chats.last.isMe == false) {
          _room.chats.last.text += (event.output ?? "");
        } else {
          _room.chats.add(ChatMessage(
            isMe: false,
            text: event.output ?? "",
            sentAt: DateTime.now(),
          ));
        }
        _isLoading = false;
      });
    }).onError((error) {
      setState(() {
        _room.chats.add(ChatMessage(
          isMe: false,
          text: "응답을 가져오는 데 실패했습니다. 다시 시도해 주세요.",
          sentAt: DateTime.now(),
        ));
        _isLoading = false;
      });
    });

    _controller.clear();
  }

  // 초기 질문 함수
  void _sendInitialMessage() {
    String initialMessage = "은호님, 오늘 기분이 어떠신가요?";

    setState(() {
      _room.chats.add(ChatMessage(
        isMe: false,
        text: initialMessage,
        sentAt: DateTime.now(),
      ));
    });
  }
}
