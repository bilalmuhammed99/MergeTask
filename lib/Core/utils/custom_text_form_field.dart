import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.controller,
    this.label,
    this.isPassword,
    this.keyboardType,
    this.onTap,
    this.validate,
    this.preffix,
    this.suffix,
    this.labelStyle,
    this.maxLines,
    this.readOnly,
    this.labelWidget,
    this.isFilled,
    this.fillColor,
    this.borderSide,
    this.onChange,
  });

  final TextEditingController? controller;
  final String? label;
  final TextInputType? keyboardType;
  bool? isPassword;
  Function()? onTap;
  String? Function(String? value)? validate;
  Widget? suffix;
  Widget? preffix;
  TextStyle? labelStyle;
  int? maxLines;
  bool? readOnly;
   Function(String value)? onChange;
  Widget? labelWidget;
  bool? isFilled;
  Color? fillColor;
  BorderSide? borderSide;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: TextFormField(
        readOnly: readOnly ?? false,
        obscureText: isPassword ?? false,
        keyboardType: keyboardType,
        controller: controller,
        validator: validate,
        maxLines: maxLines ?? 1,
        onTap: onTap,
        onChanged: onChange,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: isFilled,
          fillColor: fillColor,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),

          // labelStyle: labelStyle,
          hintText: label,
          suffixIcon: suffix,
          isDense: true,
          prefixIcon: preffix,
          // label: Text(label??"")  ,
          enabledBorder: OutlineInputBorder(
            borderSide: borderSide ??
                BorderSide(
                  color: const Color(0xff707070).withOpacity(.5),
                  width: 1,
                ),
            borderRadius: BorderRadius.circular(10),
          ),

          label: labelWidget,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
