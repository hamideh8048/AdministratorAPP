
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'get_persian_date.dart';


Future<void> openQRDialog(BuildContext context, String qr) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.38,
            child:
            SizedBox(
              width: 120,
              height: 120,
              child:
                  Center(child:
              QrImage(
                data:qr,
                version: QrVersions.auto,
                size: 170,
                backgroundColor: Colors.white,
                gapless: false,
               )),
            )
            // GetPersianDate(dateChangeListener: (String date) {
            //   setState2(() {
            //     _controller.text = date;
            //   });
            // })
        ),
      );
    },
  );
}
