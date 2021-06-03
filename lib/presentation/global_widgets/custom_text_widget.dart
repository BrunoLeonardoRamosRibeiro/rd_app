import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  final ValueChanged<String> onChanged;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextInputAction textInputAction;
  final FormFieldValidator<String> validator;
  final Widget suffixIcon;

  CustomTextWidget({
    this.controller,
    this.focusNode,
    this.onChanged,
    this.inputFormatters,
    this.keyboardType,
    this.textAlign,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.textInputAction,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextFormField(
        obscureText: obscureText?? false,
        focusNode: focusNode,
        textInputAction: textInputAction,
        textAlign: textAlign?? TextAlign.start,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText ?? '',
          labelText: labelText ?? '',
          suffixIcon: suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomMemoWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  final ValueChanged<String> onChanged;
  final List<TextInputFormatter> inputFormatters;
  final TextAlign textAlign;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextInputAction textInputAction;
  final FormFieldValidator<String> validator;
  final Widget suffixIcon;

  CustomMemoWidget({
    this.controller,
    this.focusNode,
    this.onChanged,
    this.inputFormatters,
    this.textAlign,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.textInputAction,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextFormField(
        maxLines: 20,
        obscureText: obscureText?? false,
        focusNode: focusNode,
        textInputAction: textInputAction,
        textAlign: textAlign?? TextAlign.start,
        controller: controller,
        keyboardType: TextInputType.multiline,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText ?? '',
          labelText: labelText ?? '',
          suffixIcon: suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}