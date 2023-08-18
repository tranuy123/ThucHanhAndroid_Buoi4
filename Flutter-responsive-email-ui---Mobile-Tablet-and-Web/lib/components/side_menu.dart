import 'package:flutter/material.dart';
import 'package:outlook/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';
import '../extensions.dart';
import 'side_menu_item.dart';
import 'tags.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/Logo Outlook.png",
                    width: 46,
                  ),
                  Spacer(),
                  // We don't want to show this close button on Desktop mood
                  if (!Responsive.isDesktop(context)) CloseButton(),
                ],
              ),
              SizedBox(height: kDefaultPadding),
              IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WebsafeSvg.asset("assets/Icons/Edit.svg", width: 16),
                ),
                color: kPrimaryColor,
                iconSize: 16,
              ).addNeumorphism(
                topShadowColor: Colors.white,
                bottomShadowColor: Color(0xFF234395).withOpacity(0.2),
              ),
              SizedBox(height: kDefaultPadding),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WebsafeSvg.asset("assets/Icons/Download.svg", width: 16),
                ),
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Get messages",
                    style: TextStyle(color: kTextColor),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, kDefaultPadding * 2), backgroundColor: kBgDarkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ).addNeumorphism(),
              SizedBox(height: kDefaultPadding * 2),
              // Menu Items
              SideMenuItem(
                press: () {},
                title: "Inbox",
                iconSrc: "assets/Icons/Inbox.svg",
                isActive: true,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: "Sent",
                iconSrc: "assets/Icons/Send.svg",
                isActive: false, itemCount: 1,
              ),
              SideMenuItem(
                press: () {},
                title: "Drafts",
                iconSrc: "assets/Icons/File.svg",
                isActive: false, itemCount: 1,
              ),
              SideMenuItem(
                press: () {},
                title: "Deleted",
                iconSrc: "assets/Icons/Trash.svg",
                isActive: false,
                showBorder: false, itemCount: 1,
              ),

              SizedBox(height: kDefaultPadding * 2),
              // Tags
              Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
