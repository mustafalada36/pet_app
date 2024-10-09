import 'package:flutter/material.dart';
import 'package:pet_app/constants.dart';

class DotWithLabel extends StatefulWidget {
  @override
  _DotWithLabelState createState() => _DotWithLabelState();
}

class _DotWithLabelState extends State<DotWithLabel> {
  String selectedValue =
      ""; // Define selectedValue to track the selected radio button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dot with Label"),
      ),
      body: Center(
        child: Column(
          children: [
            CustomRadioButton(
              value: "COD",
              groupValue: selectedValue,
              // Use selectedValue to keep track
              onChange: (value) {
                setState(() {
                  selectedValue =
                      value; // Update selectedValue when radio button is selected
                });
              },
              text: "Cash on Delivery (COD)",
            ),
            CustomRadioButton(
              value: "online",
              groupValue: selectedValue, // Use selectedValue to keep track
              onChange: (value) {
                setState(() {
                  selectedValue =
                      value; // Update selectedValue when radio button is selected
                });
              },
              text: "Online ",
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String) onChange;
  final String text;
  final Color? backgroundColor;

  CustomRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChange,
    required this.text,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(value); // Handle on change when tapped
      },
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor, // Background color for the button
          borderRadius: BorderRadius.circular(12),

          border: Border.all(
            color: primaryColor,
            width: 2,
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: groupValue,
              // Set the group value to the current selection
              onChanged: (value) {
                if (value != null) {
                  onChange(value); // Trigger the onChange callback
                }
              },
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
