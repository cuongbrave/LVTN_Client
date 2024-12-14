

import 'package:b2004772/common/widgets/app_bar.dart';
import 'package:b2004772/features/profile/view/profile_widget/profile_list_item.dart';

import 'package:b2004772/features/profile/view/profile_widget/profile_widgets.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildGlobalAppbar(tilte: "Trang cá nhân"),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,  //phai cung cấp kích thước mới dùng đuọc --> cho column vào 1 sizebox
            children: [
              ProfileImageWidgets(),
              ProfileNameWidgets(),
              ProfileDescriptionWidget(),
              ProfileListItem(),
            ],
          ),
        ),
      ),
    );
  }
}
