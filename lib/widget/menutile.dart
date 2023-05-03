import 'package:flutter/material.dart';

class dailogBox extends StatelessWidget {
  VoidCallback onCancel;
  dailogBox({
    Key? key,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 250,
      child: SimpleDialog(
        backgroundColor: Colors.yellow[200],
        title: const Text('Company Details'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(" \n \n\n "),
                Row(
                  children: const [
                    Text(
                        'Company: Geeksynergy Technologies Pvt Ltd.\nAddress:Sanjayanagar, Bengaluru-56.\nPhone: XXXXXXXXX09.\nEmail: XXXXXX@gmail.com.'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: onCancel,
                      child: Text(
                        'GOT IT',
                        selectionColor: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // AlertDialog(
    //   backgroundColor: Colors.yellow[200],
    //   content: Container(
    //     height: 120,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Row(
    //           children: const [
    //             Text(
    //               "Company:",
    //               softWrap: true,
    //               style: TextStyle(fontWeight: FontWeight.w700),
    //             ),
    //             Text(
    //               " Geeksynergy Technologies Pvt Ltd.",
    //               softWrap: true,
    //             ),
    //           ],
    //         ),

    //         //buttons -> cancel
    //         // Row(
    //         //   mainAxisAlignment: MainAxisAlignment.end,
    //         //   children: [
    //         //     //save button
    //         //     const SizedBox(
    //         //       width: 8,
    //         //     ),
    //         //     //cancel button.
    //         //     TextButton(
    //         //       onPressed: onCancel,
    //         //       child: Text('GOT IT'),
    //         //     ),
    //         //   ],
    //         // )
    //       ],
    //     ),
    //   ),
    // );
  }
}
