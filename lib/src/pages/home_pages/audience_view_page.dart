import 'package:flutter/material.dart';

import '../../models/data.dart';
import '../../widgets/organisms/audience_view.dart';

class AudiencePage extends StatelessWidget {
  static const routeName = 'audience_view';
  const AudiencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AudienceView(stories: stories),
    );
  }
}
