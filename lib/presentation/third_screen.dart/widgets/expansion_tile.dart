import 'package:flutter/material.dart';
import 'package:test_zadanie/core/typography.dart';
import 'package:test_zadanie/presentation/widgets/app_textfield.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({
    required this.label,
    required this.fkey,
    this.fillColor,
    super.key,
  });

  final String label;
  final Color? fillColor;
  final GlobalKey fkey;

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  final List<Item> _data = generateItems(1);
  final List controllers = List.generate(6, (index) => TextEditingController());
  final List<String> labels = [
    'Имя',
    'Фамилия',
    'Дата рождения',
    'Гражданство',
    'Номер загранпаспорта',
    'Срок действия загранпаспорта',
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      elevation: 0,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: AppTypography.headerStyle,
                ),
              ],
            );
          },
          body: Form(
            key: widget.fkey,
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => AppTextField(
                      label: labels[index],
                      controller: controllers[index],
                      fillColor: widget.fillColor,
                    ),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: labels.length),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
