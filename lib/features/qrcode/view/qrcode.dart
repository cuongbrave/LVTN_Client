import 'dart:io';
import 'package:b2004772/common/widgets/app_bar.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:b2004772/features/search/view/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img; // Thêm thư viện image
import 'package:zxing2/qrcode.dart';
import 'package:b2004772/features/search/controller/search_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Qrcode extends ConsumerStatefulWidget {
  const Qrcode({super.key});

  @override
  _QrcodeState createState() => _QrcodeState();
}

class _QrcodeState extends ConsumerState<Qrcode> {
  String _scanResult = "No data available";
  final ImagePicker _picker = ImagePicker();

  Future<void> scanQRCode() async {
    try {
      final scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.QR,
      );
      if (scanResult != "-1") {
        setState(() {
          _scanResult = scanResult;
        });

        // Disable default state and search by QR code result
        ref.read(testSearchControllerProvider.notifier).disableDefaultState();
        await ref.read(testSearchControllerProvider.notifier).searchData(scanResult);
      }else{
        setState(() {
          _scanResult = "Scan cancelled";
        });
      }


    } catch (e) {
      setState(() {
        _scanResult = "Failed to scan QR code: $e";
      });
    }
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final file = File(image.path);

        // Kiểm tra tệp có tồn tại hay không
        if (!file.existsSync()) {
          setState(() {
            _scanResult = "File không tồn tại.";
          });
          return;
        }

        // Quét mã QR từ ảnh đã chọn
        final qrCodeResult = await scanQRCodeFromImage(file);
        if (qrCodeResult != null) {
          setState(() {
            _scanResult = qrCodeResult;
          });

          // Disable default state and search by QR code result
          ref.read(testSearchControllerProvider.notifier).disableDefaultState();
          await ref.read(testSearchControllerProvider.notifier).searchData(qrCodeResult);
        } else {
          setState(() {
            _scanResult = "Không tìm thấy mã QR trong hình ảnh.";
          });
        }
      }
    } catch (e) {
      setState(() {
        _scanResult = "Lỗi khi chọn ảnh: $e";
      });
    }
  }

  Future<String?> scanQRCodeFromImage(File file) async {
    try {
      // Đọc dữ liệu hình ảnh
      final imageBytes = file.readAsBytesSync();
      final image = img.decodeImage(imageBytes);

      if (image == null) {
        return "Unable to decode image.";
      }

      // Chuyển đổi ảnh sang mảng pixel kiểu Int32List
      final pixels = image.data.buffer.asInt32List();

      // Sử dụng RGBLuminanceSource từ thư viện zxing2
      final source = RGBLuminanceSource(image.width, image.height, pixels);
      final bitmap = BinaryBitmap(HybridBinarizer(source));

      // Giải mã mã QR
      final reader = QRCodeReader();
      final result = reader.decode(bitmap);

      return result.text; // Trả về nội dung mã QR
    } catch (e) {
      print("Error scanning QR code: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = ref.watch(testSearchControllerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildGlobalAppbar(tilte: "Tìm kiếm với QR code"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(

            children: [
              Center(
                child: const Text16Normal(
                  text: "Giữ QR code vào trong khung hình",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: const Text13Normal(
                  text: "Mã QR sẽ hiển thị bài thi tương ứng, click vào để truy cập.",
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: scanQRCode,
                  child: const Text("Quét mã QR"),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: pickImage,
                  child: const Text("Chọn ảnh từ thiết bị"),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _scanResult,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // Container(
              //   color: Colors.green,
              //   height: 100,
              // ),
              // const SizedBox(height: 20),
              // Container(
              //   color: Colors.yellow,
              //   height: 100,
              // ),

              if (_scanResult != "No data available") ...[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: switch (searchProvider) {
                    AsyncData(:final value) => value!.isEmpty
                        ? const Center(child: Text("Không tìm thấy dữ liệu."))
                        : TestSearchWidgets(value: value),
                    AsyncError(:final error) => Text('Error: $error'),
                    _ => const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        strokeWidth: 2,
                      ),
                    ),
                  },
                ),
              ],

            ],
          ),
        ),
      ),
    );
  }


}
