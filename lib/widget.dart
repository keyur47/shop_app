import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customTextField({
  TextEditingController? controller,
  required String name,
  bool? readOnly,
  InputBorder? focusedBorder,
  List<TextInputFormatter>? InputFormatters,
  TextInputType? textInputType
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
    child: TextFormField(
      readOnly: readOnly ?? false,
      showCursor: false,
      enabled: true,
      controller: controller,
      inputFormatters: InputFormatters,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        // Added this
        border: InputBorder.none,
        focusedBorder: focusedBorder,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        hintText: name,
        filled: true,
        isDense: true,
        // Added this
        fillColor: Colors.grey.withOpacity(0.5),
      ),
    ),
  );
}



Widget customSubmitButton({String? text,Color? color,GestureTapCallback? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 13, left: 15, right: 15,bottom: 13),
          child: Text("$text",style: TextStyle(fontSize: 16),),
        ),
      ),
    ),
  );
}
