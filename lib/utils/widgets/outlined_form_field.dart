import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/dimens.dart';

class OutlinedFormField extends StatelessWidget {
  OutlinedFormField({

    required this.label,
    required this.hintText,
    this.textEditingController,
    this.validator,
    this.onChange,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.inputFormatters,
    this.keyboardType,
    this.autofillHints,
    this.initialValue,
    this.boarderRadius = 0,
  });
  final String label;
  final String? initialValue;
  final String hintText;
  final TextEditingController? textEditingController;
  final String? Function(String? value)? validator;
  final Function(String value)? onChange;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final double? boarderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          height: Dimens.spacing.small,
        ),
        TextFormField(
            controller: textEditingController,
            validator: validator,
            initialValue: initialValue,
            autofillHints: autofillHints,
            keyboardType: keyboardType,
            onChanged: onChange,
            obscureText: obscureText ?? false,
            inputFormatters: inputFormatters,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              hintText: hintText,
              //prefix: prefixIcon,
              suffix: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                    boarderRadius ?? Dimens.borderRadius.normal)),
              ),
            ))
      ],
    );
  }
}
