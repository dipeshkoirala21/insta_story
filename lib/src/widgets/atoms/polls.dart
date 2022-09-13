import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/themes/colors.dart';

class Polls extends StatelessWidget {
  final bool fullWidth;
  const Polls({Key? key, required this.fullWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Is this the product you are looking for?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            margin: const EdgeInsets.all(8),
            width: fullWidth
                ? MediaQuery.of(context).size.width - 32
                : (MediaQuery.of(context).size.width / 2) - 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.green[600],
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  color: AppColors.greyLight,
                  thickness: 1,
                ),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      highlightColor: Colors.red,
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
              ],
            ))
      ],
    );
  }

  void showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
