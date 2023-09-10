import 'package:flutter/material.dart';
import 'package:nethive/app/presentation/widgets/title_text.dart';

class InfoItem extends StatelessWidget {
  const InfoItem(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});
  final IconData icon;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
          child: Row(
            children: [
              Icon(
                icon,
                color: Color.fromARGB(255, 36, 83, 255),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: label,
                    fontSize: 14,
                    color: Color.fromARGB(255, 31, 31, 31),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  TextWidget(
                    text: value,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
