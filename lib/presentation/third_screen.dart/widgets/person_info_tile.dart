import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_zadanie/core/typography.dart';
import 'package:test_zadanie/gen/assets.gen.dart';

import 'expansion_tile.dart';

class PersonInfoTile extends HookWidget {
  const PersonInfoTile({required this.fkey, super.key});

  final List<GlobalKey> fkey;

  @override
  Widget build(BuildContext context) {
    final numberOfTiles = useState(1);
    final labels = [
      'Первый турист',
      'Второй турист',
      'Третий турист',
      'Четвертый турист',
      'Пятый турист',
      'Шестой турист',
      'Седьмой турист',
      'Восьмой турист',
      'Девятый турист',
      'Десяатый турист',
    ];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            children: List.generate(
              numberOfTiles.value,
              (index) => ExpansionPanelListExample(
                label: labels[index],
                fkey: fkey[index],
                // fillColor: formKey.currentState != null &&
                //         formKey.currentState!.validate()
                //     ? null
                //     : const Color.fromRGBO(235, 87, 87, 1),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Добавить туриста',
                style: AppTypography.headerStyle,
              ),
              InkWell(
                onTap: () {
                  if (numberOfTiles.value <= 9) {
                    numberOfTiles.value++;
                  }
                },
                child: Image.asset(
                  Assets.icons.icons.path,
                  height: 32,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
