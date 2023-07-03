import 'package:flutter/cupertino.dart';
import 'package:realtimetask/res/import/import.dart';

Widget SettingsCustomWidget({
  required Widget buttonicon,
  required String buttonname,
}) {
  return Row(
    children: [
      buttonicon,
      SizedBox(width: 10),
      Text(
        buttonname,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Helvetica Neue",
            fontWeight: FontWeight.w500,
            color: realtimetaskTextColor,
            fontSize: 16.0),
      ),
    ],
  );
}

Widget SettingsCustomWidgetWithText({
  required Widget buttonicon,
  required String buttonname,
  required String buttonsubtext,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buttonicon,
      SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              buttonname,
              style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontWeight: FontWeight.w500,
                  color: realtimetaskTextColor,
                  fontSize: 15.0),
            ),
          ),
          SizedBox(height: 15),
          Text(
            buttonsubtext,
            style: TextStyle(
                fontFamily: "Helvetica Neue",
                fontWeight: FontWeight.w500,
                color: realtimetaskTextColor,
                fontSize: 11.0),
          ),
        ],
      ),
    ],
  );
}

Widget AccountWidget({
  required Widget buttonicon,
  required String widgettitle,
  required String widgetvalue,
  required Function() onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 0, top: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widgettitle,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: "Helvetica Neue",
              fontWeight: FontWeight.w500,
              color: realtimetaskBlack,
              fontSize: 16.0),
        ),
        SizedBox(width: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 145,
              child: Text(
                widgetvalue,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: "Helvetica Neue",
                    fontWeight: FontWeight.w500,
                    color: realtimetaskTextColor,
                    fontSize: 16.0),
              ),
            ),
            GestureDetector(onTap: onTap, child: buttonicon),
          ],
        ),
      ],
    ),
  );
}

Widget AccountWidgetWithoutIcon({
  required String widgettitle,
  required String widgetvalue,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 0, top: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widgettitle,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: "Helvetica Neue",
              fontWeight: FontWeight.w500,
              color: realtimetaskBlack,
              fontSize: 16.0),
        ),
        Text(
          widgetvalue,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: "Helvetica Neue",
              fontWeight: FontWeight.w500,
              color: realtimetaskTextColor,
              fontSize: 16.0),
        ),
      ],
    ),
  );
}
