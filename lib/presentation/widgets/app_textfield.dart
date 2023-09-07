import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_zadanie/core/typography.dart';

class AppTextField extends HookWidget {
  const AppTextField({
    super.key,
    this.label,
    this.validator,
    this.onEditingComplete,
    this.controller,
    this.fillColor,
  });

  final String? label;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final isEmpty = useState(false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        controller: controller,
        onEditingComplete: onEditingComplete,
        validator: (p) {
          if (p!.isEmpty) {
            isEmpty.value = true;
            return 'Please fill this field';
          }
          return null;
        },
        style: AppTypography.style1640019,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isEmpty.value
                  ? Color.fromRGBO(235, 87, 87, 1)
                  : Colors.transparent,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isEmpty.value
                  ? Color.fromRGBO(235, 87, 87, 1)
                  : Colors.transparent,
            ),
          ),
          border: InputBorder.none,
          label: label != null ? Text(label!) : null,
          labelStyle: AppTypography.style1740020.copyWith(
            color: const Color(0xFFA9ABB7),
          ),
          fillColor: fillColor ??
              const Color(
                0xFFF6F6F9,
              ),
          filled: true,
        ),
      ),
    );
  }
}
