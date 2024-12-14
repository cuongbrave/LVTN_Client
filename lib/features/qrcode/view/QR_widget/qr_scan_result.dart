import 'package:b2004772/common/widgets/app_bar.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScanResult extends StatelessWidget {
  final String qrData;
  const QrScanResult({super.key, required this.qrData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildGlobalAppbar(tilte: "Tìm kiếm với QR code"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            //show Qrcode

            const Text16Normal(
              text: "Kết quả của mã QR",
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text13Normal(
              text: "Kết quả",
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 48,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {},
                  child: const Text13Normal(
                    text: "Kết quả",
                    fontWeight: FontWeight.normal,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
