import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nethive/app/presentation/widgets/title_text.dart';
import 'package:nethive/utilities/constants.dart/app_colors.dart';
import 'package:nethive/utilities/router/routes.dart';

class TodayDetails extends StatefulWidget {
  const TodayDetails({super.key});

  @override
  State<TodayDetails> createState() => _TodayDetailsState();
}

class _TodayDetailsState extends State<TodayDetails> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    String date = DateFormat.yMMMMd().format(now);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 30,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const TextWidget(
                      text: "Retail Census App",
                      color: Color.fromARGB(255, 0, 44, 139),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: AppColors.hintColor,
                          ),
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 0, 44, 139),
                          ),
                        ),
                        Container(
                          height: 5,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: AppColors.hintColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const HorizontalDivider(width: 500),
                    DataRowWidget(
                      label: "Date:",
                      value: date,
                    ),
                    const HorizontalDivider(width: 500),
                    const DataRowWidget(
                      label: "Outlets captured today:",
                      value: "0",
                    ),
                    const HorizontalDivider(width: 500),
                    const DataRowWidget(
                      label: "Total for June:",
                      value: "0",
                    ),
                    const HorizontalDivider(width: 500),
                    const SizedBox(
                      height: 90,
                    ),
                    const HorizontalDivider(width: 500),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWidget(
                            text: "Register new outlet",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          const Color.fromARGB(
                                              255, 0, 44, 139))),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.dataCapture);
                              },
                              child: const TextWidget(
                                text: "Start",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                    const HorizontalDivider(width: 500),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 1,
      decoration: const BoxDecoration(color: AppColors.inputBorder),
    );
  }
}

class DataRowWidget extends StatelessWidget {
  const DataRowWidget(
      {super.key,
      required this.label,
      required this.value,
      this.labelFontWeight});
  final String? label;
  final String? value;
  final FontWeight? labelFontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: SingleChildScrollView(
              child: TextWidget(
                text: label!,
                fontWeight: labelFontWeight ?? FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            width: 150,
            child: TextWidget(
              text: value!,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
