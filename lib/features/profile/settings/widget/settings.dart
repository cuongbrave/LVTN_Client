


import 'package:b2004772/common/routes/app_routes_name.dart';
import 'package:b2004772/common/utils/constants.dart';
import 'package:b2004772/common/utils/image_res.dart';
import 'package:b2004772/common/widgets/app_bar.dart';
import 'package:b2004772/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGlobalAppbar(tilte: "Settings"),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm logout"),
                        content: const Text("Confirm logout."),
                        actions: [
                          TextButton(
                            child: Text("Cancel"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text("Confirm"),
                            onPressed: () {
                              Global.storageService
                                  .remove(AppConstants.STORAGE_USER_PROFILE_KEY);
                              Global.storageService
                                  .remove(AppConstants.STORAGE_USER_TOKEN_KEY);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoutesNames.SIGN_IN, (Route<dynamic> route) => false);
                            },
                          )
                        ],
                      );

                    });
              },
              child: Container(
                height: 100.h,
                decoration:  const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageRes.logOut), fit: BoxFit.fitHeight)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutesNames.CHANGE_PASS);
              },
              child: Container(
                height: 100.h,
                decoration:  const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageRes.changePassword), fit: BoxFit.fitHeight)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}