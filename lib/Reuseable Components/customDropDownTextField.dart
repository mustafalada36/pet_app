import 'package:flutter/material.dart';

class customDropDownButton extends StatefulWidget {
  final double width;
  final double height;
  final String hintText;
  final List<String> dropdownItems;
  final TextStyle hintStyle;

  customDropDownButton({
    required this.width,
    required this.height,
    this.hintText = 'Select an option', // Default hint text
    required this.dropdownItems, // List of items for the dropdown
    TextStyle? hintStyle, // Accept hintStyle as optional
  }) : hintStyle = hintStyle ??
            const TextStyle(
              color: Colors.grey, // Default hint text color
              fontSize: 16, // Default hint text size
            );

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<customDropDownButton> {
  String? selectedValue; // Store the selected value from the dropdown

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerLeft,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintStyle: widget.hintStyle, // Set hint style
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: const Color(0xFF267E1E), // Green border color
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: Color(0xFF267E1E),
              width: 2.0,
            ),
          ),
        ),
        // Remove suffixIcon here
        hint: Text(widget.hintText, style: widget.hintStyle),
        // Hint text
        value: selectedValue,
        // Set the currently selected value
        items: widget.dropdownItems
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue; // Update selected value
          });
        },
        dropdownColor: Colors.white,
        // Dropdown color (optional)
        isExpanded: true, // Ensure dropdown takes available space
      ),
    );
  }
}
