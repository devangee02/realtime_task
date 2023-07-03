import '../../res/import/import.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String? val)? validator;
  final String? label;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String? val)? onchanged;
  final Function(String? val)? onsaved;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? titleText;
  final TextStyle? textStyle;
  final int? maxLength;
  final int? maxLines;
  final fillColor;
  final double? height;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final textAlign;
  bool obscureText = false;
  bool readonly = false;

  CustomTextFormField(
      {Key? key,
      this.validator,
      this.label,
      this.controller,
      this.textInputType,
      required this.obscureText,
      this.onchanged,
      this.onsaved,
      this.textInputAction,
      this.hintText,
      this.titleText,
      this.textStyle,
      this.maxLength,
      this.maxLines,
      this.height,
      this.textInputFormatter,
      required this.readonly,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.fillColor,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: textInputType,
        textAlign: textAlign ?? TextAlign.start,
        inputFormatters: textInputFormatter,
        textInputAction: textInputAction,
        validator: validator,
        onChanged: onchanged,
        onSaved: onsaved,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        readOnly: readonly,
        onTap: onTap,
        style: textStyle ??
            TextStyle(
                fontFamily: "Helvetica Neue",
                fontWeight: FontWeight.w500,
                color: realtimetaskBlack,
                fontSize: 16.0),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: realtimetaskHintTextColor),
          fillColor: fillColor ?? Colors.transparent,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD9D9D9),
              ),
              borderRadius: BorderRadius.circular(3)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(3)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: realtimetaskPrimaryColor),
              borderRadius: BorderRadius.circular(3)),
          labelStyle: TextStyle(
              color: realtimetaskPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w700),
          prefixIcon: prefixIcon,
          suffix: suffixIcon,
          prefixIconConstraints: BoxConstraints(
            minWidth: 13,
          ),
        ),
      ),
    );
  }
}

Widget inputFieldTitle(title, {Color? color}) => Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Text(title,
          style: TextStyle(
              fontSize: 18,
              color: color ?? realtimetaskBlack,
              fontWeight: FontWeight.w600)),
    );

class HomeScreenCustomTextFormField extends StatelessWidget {
  final String? Function(String? val)? validator;
  final String? label;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String? val)? onchanged;
  final Function(String? val)? onsaved;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? titleText;
  final TextStyle? textStyle;
  final int? maxLength;
  final int? maxLines;
  final double? height;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  bool obscureText = false;
  bool readonly = false;

  HomeScreenCustomTextFormField(
      {Key? key,
      this.validator,
      this.label,
      this.controller,
      this.textInputType,
      required this.obscureText,
      this.onchanged,
      this.onsaved,
      this.textInputAction,
      this.hintText,
      this.titleText,
      this.textStyle,
      this.maxLength,
      this.maxLines,
      this.height,
      this.onTap,
      this.textInputFormatter,
      this.suffixIcon,
      required this.readonly,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: textInputType,
        inputFormatters: textInputFormatter,
        textInputAction: textInputAction,
        validator: validator,
        onChanged: onchanged,
        onSaved: onsaved,
        maxLength: maxLength,
        readOnly: readonly,
        onTap: onTap,
        style: textStyle ??
            TextStyle(
                fontFamily: "Helvetica Neue",
                fontWeight: FontWeight.w500,
                color: realtimetaskTextColor,
                fontSize: 16.0),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: label,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: realtimetaskHintTextColor),
          fillColor: realtimetaskBackgroundColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD9D9D9),
              ),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: realtimetaskPrimaryColor),
              borderRadius: BorderRadius.circular(10)),
          labelStyle: TextStyle(
              color: realtimetaskPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w700),
          prefixIcon: prefixIcon,
          suffix: suffixIcon,
          prefixIconConstraints: BoxConstraints(
            minWidth: 13,
          ),
        ),
      ),
    );
  }
}

// class CustomTextField extends StatelessWidget {
//   final String? balance;
//   final String? hintText;
//   final Widget? mainwidget;
//   final EdgeInsetsGeometry? margin;
//   final TextEditingController? controller;
//   final TextInputType? textInputType;
//   final String? Function(String? val)? validator;
//   final Function(String? val)? onchanged;
//   final int? maxLength;
//   final int? maxLines;
//   final List<TextInputFormatter>? textInputFormatter;
//   final TextInputAction? textInputAction;
//   final TextStyle? textStyle;
//   final Widget? suffixIcon;
//   final bool readonly;
//   CustomTextField({
//     Key? key,
//     this.balance,
//     required this.readonly,
//     this.maxLines,
//     this.suffixIcon,
//     this.hintText,
//     this.mainwidget,
//     this.margin,
//     this.controller,
//     this.textInputType,
//     this.validator,
//     this.onchanged,
//     this.maxLength,
//     this.textInputFormatter,
//     this.textInputAction,
//     this.textStyle,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       readOnly: readonly,
//       controller: controller,
//       keyboardType: textInputType,
//       inputFormatters: textInputFormatter,
//       textInputAction: textInputAction,
//       validator: validator,
//       onChanged: onchanged,
//       maxLength: maxLength,
//
//       maxLines: maxLines,
//       style: textStyle ?? TextStyle(),
//       decoration: InputDecoration(
//         hintStyle:
//             TextStyle(fontSize: 16, color: Color(0xff000000).withOpacity(.3)),
//         fillColor: Color(0xffc4c4c4).withOpacity(.21),
//         filled: true,
//         enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Color(0xfff5f5f5),
//             ),
//             borderRadius: BorderRadius.circular(10)),
//         errorBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.red),
//             borderRadius: BorderRadius.circular(10)),
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Zinarihelper.zeenahlightPrimary),
//             borderRadius: BorderRadius.circular(10)),
//         labelStyle: TextStyle(
//             color: Colors.red, fontSize: 16, fontWeight: FontWeight.w400),
//         hintText: hintText,
//         suffixIcon: suffixIcon,
//
//         // prefixIcon: prefixIcon,
//         prefixIconConstraints: BoxConstraints(
//           minWidth: 13,
//         ),
//       ),
//     );
//   }
// }
//
// class CustomText extends StatelessWidget {
//   final String? input;
//
//   CustomText({
//     Key? key,
//     this.input,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       input ?? '',
//       style: TextStyle(
//         color: Colors.grey,
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
// }
//
//
// class CustomTextFormFieldReadOnly extends StatelessWidget {
//   final String? Function(String? val)? validator;
//   final String? label;
//   final TextEditingController? controller;
//   final TextInputType? textInputType;
//   final Function(String? val)? onchanged;
//   final TextInputAction? textInputAction;
//   final String? hintText;
//   final String? titleText;
//   final TextStyle? textStyle;
//   final int? maxLength;
//   final int? maxLines;
//   final double? height;
//   final Function()? ontap;
//   final List<TextInputFormatter>? textInputFormatter;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//    bool obscureText = false;
//
//
//   CustomTextFormFieldReadOnly(
//       {Key? key,
//       this.validator,
//       this.label,
//       this.controller,
//       this.ontap,
//       this.textInputType,
//       required this.obscureText,
//       this.onchanged,
//       this.textInputAction,
//       this.hintText,
//       this.titleText,
//       this.textStyle,
//       this.maxLength,
//       this.maxLines,
//       this.height,
//       this.textInputFormatter,
//       this.suffixIcon,
//       this.prefixIcon})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Consumer<DarkThemeProvider>(
//
//         builder: (context,theme,_){
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               titleText ?? '',
//               style: TextStyle(
//                   fontFamily: "Helvetica Neue",
//
//                   color: Colors.black.withOpacity(.6),
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal),
//             ),
//             SizedBox(
//               height: height == null ? 10 : height,
//             ),
//             TextFormField(
//               obscureText: obscureText,
//               controller: controller,
//               keyboardType: textInputType,
//               inputFormatters: textInputFormatter,
//               textInputAction: textInputAction,
//               validator: validator,
//               onChanged: onchanged,
//               maxLength: maxLength,
//               readOnly: true,
//               style: textStyle ?? TextStyle(
//           fontFamily: "Helvetica Neue",
//           fontWeight: FontWeight.bold,
//           color: theme.darkTheme ? Zinarihelper.zeenahwhite :  Zinarihelper.zeenahblack,
//           fontSize: 17.0),
//               onTap: ontap,
//               decoration: InputDecoration(
//                 suffixIcon: suffixIcon,
//                 hintText: hintText,
//                 hintStyle: TextStyle(
//                     fontSize: 14, color: theme.darkTheme ? Zinarihelper.zeenahwhite :  Zinarihelper.zeenahblack),
//                 fillColor: Color(0xffc4c4c4).withOpacity(.21),
//                 filled: true,
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xfff5f5f5),
//                     ),
//                     borderRadius: BorderRadius.circular(10)),
//                 errorBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red),
//                     borderRadius: BorderRadius.circular(10)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Zinarihelper.zeenahlightPrimary),
//                     borderRadius: BorderRadius.circular(10)),
//                 labelStyle: TextStyle(
//                     color: Colors.red, fontSize: 16, fontWeight: FontWeight.w400),
//                 prefixIcon: prefixIcon,
//
//                 prefixIconConstraints: BoxConstraints(
//                   minWidth: 13,
//                 ),
//               ),
//             ),
//           ],
//         );
//       }
//     );
//   }
// }
//
// // Create an input widget that takes only one digit
// class OtpInput extends StatelessWidget {
//   final TextEditingController controller;
//   final bool autoFocus;
//    bool obscure =true;
//    OtpInput(this.controller, this.autoFocus, {Key? key,required this.obscure,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Consumer<DarkThemeProvider>(
//
//         builder: (context,theme,_){
//         return SizedBox(
//           height: 50,
//           width: 40,
//           child: TextField(
//             autofocus: autoFocus,
//             textAlign: TextAlign.center,
//             keyboardType: TextInputType.number,
//             controller: controller,
//             obscureText: obscure!,
//             maxLength: 1,
//             style: TextStyle(
//                 fontFamily: "Helvetica Neue",
//                 fontWeight: FontWeight.normal,
//                 color: theme.darkTheme ? Zinarihelper.zeenahwhite :  Zinarihelper.zeenahblack,
//                 ),
//             cursorColor: theme.darkTheme ? Zinarihelper.zeenahwhite : Zinarihelper.zeenahlightPrimary,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 enabledBorder: OutlineInputBorder(
//
//                     borderSide: BorderSide(
//                       color: theme.darkTheme ? Zinarihelper.zeenahwhite : Zinarihelper.zeenahlightPrimary,
//                     ),
//                     borderRadius: BorderRadius.circular(10)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: theme.darkTheme ? Zinarihelper.zeenahwhite : Zinarihelper.zeenahdarkPrimary),
//                     borderRadius: BorderRadius.circular(10)),
//                 counterText: '',
//                 hintStyle: TextStyle(color: theme.darkTheme ? Zinarihelper.zeenahwhite : Zinarihelper.zeenahblack, fontSize: 20.0)),
//             onChanged: (value) {
//               if (value.length == 1) {
//                 FocusScope.of(context).nextFocus();
//               }
//             },
//           ),
//         );
//       }
//     );
//   }
// }
