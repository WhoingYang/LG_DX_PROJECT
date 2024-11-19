import 'package:flutter/material.dart';

class UsefulFeaturesPage extends StatelessWidget {
  const UsefulFeaturesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('유용한 기능'),
        centerTitle: true,
      ),
      body: Center(
        child: const Text(
          '유용한 기능 페이지 내용',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
