import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
class Dropdown extends StatefulWidget {
  List<String> list;
  Dropdown({super.key, required this.list});

  @override
  State<Dropdown> createState() => _DropdownState(list: list);
}

class _DropdownState extends State<Dropdown> {
  List<String> list;
  List something = ['1','2','3'];
  _DropdownState({required this.list});
  String? dropdownValue = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: DropdownMenu<String>(
        initialSelection: list.first,
        onSelected: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}
