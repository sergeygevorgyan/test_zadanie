import 'package:flutter/material.dart';
import 'package:test_zadanie/core/typography.dart';

class MaskedTextField extends StatefulWidget {
  const MaskedTextField({super.key});

  @override
  _MaskedTextFieldState createState() => _MaskedTextFieldState();
}

class _MaskedTextFieldState extends State<MaskedTextField> {
  TextEditingController controller = TextEditingController();
  String mask = '+7 (***) ***-**-**';

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        mask = updateMask(controller.text);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String updateMask(String text) {
    String updatedMask = '+7 (***) ***-**-**';
    for (int i = 0; i < text.length; i++) {
      updatedMask = updatedMask.replaceFirst('*', text[i]);
    }
    return updatedMask;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        cursorColor: Colors.transparent,
        controller: controller,
        keyboardType: TextInputType.number,
        style: AppTypography.style1640019.copyWith(color: Colors.transparent),
        decoration: InputDecoration(
          fillColor: const Color(
            0xFFF6F6F9,
          ),
          filled: true,
          prefixText: mask,
          prefixStyle: AppTypography.style1640019,
          border: InputBorder.none,
          label: const Text('Номер телефона'),
          labelStyle: AppTypography.style1740020.copyWith(
            color: const Color(0xFFA9ABB7),
          ),
        ),
      ),
    );
  }
}
