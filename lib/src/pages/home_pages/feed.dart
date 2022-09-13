import 'package:flutter/material.dart';

import '../../widgets/molecules/page_header.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageHeader(),
      body: Center(
        child: Column(
          children: const [
            Text('Feed Screen'),
          ],
        ),
      ),
    );
  }
}
