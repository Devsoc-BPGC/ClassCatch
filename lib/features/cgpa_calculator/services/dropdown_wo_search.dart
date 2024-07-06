import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownWoSearch extends StatefulWidget {
  final List<String> list;
   final String text;
  const DropdownWoSearch({super.key, required this.list,required this.text});

  @override
  State<DropdownWoSearch> createState() => _DropdownWoSearchState(list: list,text: text);
}

class _DropdownWoSearchState extends State<DropdownWoSearch> {
  List<String> list;
  String text;
  _DropdownWoSearchState({required this.list,required this.text});

  String? _selectedvalue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
          child: Text(text,
            style: GoogleFonts.lexend(
                fontSize: 12,
                color: Colors.white
            ),),
        ),
        items: list.map((String item)=> DropdownMenuItem(
          value: item,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(item,style: GoogleFonts.lexend(fontSize: 12,color: Colors.white),),
          ),
        )).toList(),
        value: _selectedvalue,
        onChanged: (String? value){
          setState(() {
            _selectedvalue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
            height: 40,
            width: 310,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 35, 35, 35),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    color: const Color.fromARGB(255, 53, 53, 53)
                )
            ),
            elevation: 4
        ),
        iconStyleData: const IconStyleData(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.keyboard_arrow_down_sharp,
              ),
            ),
            iconSize: 20
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          width: 310,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: const Color(0xFF232323),
              border: Border.all(
                  color: const Color(0xFF353535),
                  width: 2
              )

          ),
          scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(30),
              thickness: WidgetStateProperty.all(3),
              thumbVisibility: WidgetStateProperty.all(true)
          ),

        ),
        menuItemStyleData: const MenuItemStyleData(
            height: 40
        ),
      ),
    );
  }
}
