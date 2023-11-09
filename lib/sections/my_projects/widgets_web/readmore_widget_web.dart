import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhd_portfolio_v2/constants/colors.dart';
import 'package:mhd_portfolio_v2/extensions/WidgetExtension/extension_widget.dart';

class ReadMoreTextWeb extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const ReadMoreTextWeb({
    super.key,
    required this.text,
    required this.textStyle,
  });

  void _showFullTextDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 25, 28, 34),
          content: SingleChildScrollView(
            child: Text(text, style: textStyle).paddingAll(25.w),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        ).paddingSymmetric(h: 200.w);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: textStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 7, // Adjust the maximum number of lines to show initially
        ),
        GestureDetector(
          onTap: () {
            _showFullTextDialog(context);
          },
          child: Text(
            'Read More...',
            style: textStyle.copyWith(
                fontWeight: FontWeight.bold, color: blueColor),
          ),
        ),
      ],
    );
  }
}
