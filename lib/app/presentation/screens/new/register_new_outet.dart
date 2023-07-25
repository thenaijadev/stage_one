import 'package:flutter/material.dart';
import 'package:nethive/app/presentation/widgets/new/drop_down_widget.dart';
import 'package:nethive/app/presentation/widgets/new/input_field_widget.dart';
import 'package:nethive/app/presentation/widgets/new/outlined_container.dart';
import 'package:nethive/app/presentation/widgets/title_text.dart';

class RegisterNewOutlet extends StatefulWidget {
  const RegisterNewOutlet({super.key});

  @override
  State<RegisterNewOutlet> createState() => _RegisterNewOutletState();
}

class _RegisterNewOutletState extends State<RegisterNewOutlet> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();
  final formfieldkey_4 = GlobalKey<FormFieldState>();
  final formfieldkey_5 = GlobalKey<FormFieldState>();
  final formfieldkey_6 = GlobalKey<FormFieldState>();
  final formfieldkey_7 = GlobalKey<FormFieldState>();
  final formfieldkey_8 = GlobalKey<FormFieldState>();
  final formfieldkey_9 = GlobalKey<FormFieldState>();
  final formfieldkey_10 = GlobalKey<FormFieldState>();
  final formfieldkey_11 = GlobalKey<FormFieldState>();
  final formfieldkey_12 = GlobalKey<FormFieldState>();
  bool? checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Column(
              children: [
                const TextWidget(
                  text: "GDN Nigeria LTD",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedContainer(
                  child: Column(
                    children: [
                      const TextWidget(
                          text: "Welcome to GDN Portal",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      const TextWidget(
                        text: "Register a new outlet.",
                        fontSize: 15,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Transform.scale(
                        scaleY: .9,
                        scaleX: 1.15,
                        child: InputFieldWidget(
                          contentPadding: const EdgeInsets.only(
                              left: 15, top: 0, bottom: 0),
                          label: "Company Name:",
                          hintText: "Enter company name",
                          enabledBorderRadius: 10,
                          onChanged: (value) {
                            formfieldkey_1.currentState?.validate();
                          },
                          textFieldkey: formfieldkey_1,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      Transform.scale(
                        scaleY: .9,
                        scaleX: 1.15,
                        child: InputFieldWidget(
                          contentPadding: const EdgeInsets.only(
                              left: 15, top: 0, bottom: 0),
                          label: "Email:",
                          hintText: "Enter email",
                          enabledBorderRadius: 10,
                          onChanged: (value) {
                            formfieldkey_2.currentState?.validate();
                          },
                          textFieldkey: formfieldkey_2,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      Transform.scale(
                        scaleY: .9,
                        scaleX: 1.15,
                        child: InputFieldWidget(
                          contentPadding: const EdgeInsets.only(
                              left: 15, top: 0, bottom: 0),
                          label: "Address:",
                          hintText: "Enter address",
                          enabledBorderRadius: 10,
                          onChanged: (value) {
                            formfieldkey_3.currentState?.validate();
                          },
                          textFieldkey: formfieldkey_3,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      Transform.scale(
                        scaleY: .9,
                        scaleX: 1.15,
                        child: InputFieldWidget(
                          contentPadding: const EdgeInsets.only(
                              left: 15, top: 0, bottom: 0),
                          label: "City:",
                          hintText: "Enter the name of your city",
                          enabledBorderRadius: 10,
                          onChanged: (value) {
                            formfieldkey_4.currentState?.validate();
                          },
                          textFieldkey: formfieldkey_4,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      Transform.scale(
                        scaleY: .9,
                        scaleX: 1.15,
                        child: InputFieldWidget(
                          contentPadding: const EdgeInsets.only(
                              left: 15, top: 0, bottom: 0),
                          label: "Manager Name:",
                          hintText: "Enter manager name",
                          enabledBorderRadius: 10,
                          onChanged: (value) {
                            formfieldkey_5.currentState?.validate();
                          },
                          textFieldkey: formfieldkey_5,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      Transform.scale(
                        scaleY: .9,
                        scaleX: 1.15,
                        child: InputFieldWidget(
                          contentPadding: const EdgeInsets.only(
                              left: 15, top: 0, bottom: 0),
                          label: "Manager Phone Number:",
                          hintText: "Enter manager phone number",
                          enabledBorderRadius: 10,
                          onChanged: (value) {
                            formfieldkey_6.currentState?.validate();
                          },
                          textFieldkey: formfieldkey_6,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      Transform.scale(
                        scaleY: .9,
                        scaleX: 1.15,
                        child: InputFieldWidget(
                          contentPadding: const EdgeInsets.only(
                              left: 15, top: 0, bottom: 0),
                          label: "Manager Second Phone Number:",
                          hintText: "Enter manager second phone number",
                          enabledBorderRadius: 10,
                          onChanged: (value) {
                            formfieldkey_7.currentState?.validate();
                          },
                          textFieldkey: formfieldkey_7,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      Transform.scale(
                        scaleY: .9,
                        scaleX: 1.15,
                        child: InputFieldWidget(
                          contentPadding: const EdgeInsets.only(
                              left: 15, top: 30, bottom: 0),
                          label: "Name(s) of Supplier:",
                          hintText: "Please list all your suppliers here.",
                          enabledBorderRadius: 10,
                          maxLines: 3,
                          onChanged: (value) {
                            formfieldkey_8.currentState?.validate();
                          },
                          textFieldkey: formfieldkey_8,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      DropDownInput(
                          hintText: "Select a Type",
                          onChanged: (cal) {},
                          label: "Business category:",
                          options: const []),
                      Transform.scale(
                        scaleY: .9,
                        scaleX: 1.15,
                        child: InputFieldWidget(
                          contentPadding: const EdgeInsets.only(
                              left: 25, top: 0, bottom: 0),
                          label: "Create New Password",
                          hintText: "Enter password",
                          enabledBorderRadius: 10,
                          onChanged: (value) {
                            formfieldkey_10.currentState?.validate();
                          },
                          textFieldkey: formfieldkey_10,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      Transform.scale(
                        scaleY: .9,
                        scaleX: 1.15,
                        child: InputFieldWidget(
                          contentPadding: const EdgeInsets.only(
                              left: 25, top: 0, bottom: 0),
                          label: "Confirm New Password",
                          hintText: "Enter password again",
                          enabledBorderRadius: 10,
                          onChanged: (value) {
                            formfieldkey_11.currentState?.validate();
                          },
                          textFieldkey: formfieldkey_11,
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              side: const BorderSide(
                                  width: 1, color: Colors.grey),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              value: checkBoxValue,
                              onChanged: (val) {
                                setState(() {
                                  checkBoxValue = val;
                                });
                              }),
                          SizedBox(
                            width: 260,
                            child: Wrap(children: [
                              RichText(
                                text: const TextSpan(
                                  text: 'I agree to the Data Consent Agreement',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          ' (Click here to View The Data Consent Agreement)',
                                      style: TextStyle(
                                        color: Color(0xff569AF6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, Routes.options);
                        },
                        child: Center(
                            child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff1F5AA2),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: TextWidget(
                                text: "Submit",
                                color: Color(0xffE4F8F9),
                              ),
                            ),
                          ),
                        )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Center(
                            child: Container(
                          width: 400,
                          decoration: BoxDecoration(
                              color: const Color(0xff6C747E),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: TextWidget(
                                text: "Return to Login Page",
                                color: Color(0xffE4F8F9),
                              ),
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
