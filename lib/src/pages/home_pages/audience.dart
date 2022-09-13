import 'package:flutter/material.dart';

import '../../widgets/molecules/page_header.dart';
import '../../widgets/organisms/audience_view.dart';

class AudienceScreen extends StatefulWidget {
  const AudienceScreen({Key? key}) : super(key: key);

  @override
  State<AudienceScreen> createState() => _AudienceScreenState();
}

class _AudienceScreenState extends State<AudienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "audience_view");
          },
          child: Container(
            width: 200.0,
            height: 100.0,
            decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "View stories",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
