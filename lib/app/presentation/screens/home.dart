import 'package:flutter/material.dart';
import 'package:nethive/app/presentation/widgets/new/input_field_widget.dart';
import 'package:nethive/app/presentation/widgets/new/outlined_container.dart';
import 'package:nethive/app/presentation/widgets/title_text.dart';
import 'package:nethive/utilities/router/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  bool? checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
          child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100.0, left: 15, right: 15, bottom: 50),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TextWidget(
                      text: "GDN NIGERIA LTD",
                      color: Color(0xff201C50),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 20),

                    OutlinedContainer(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Center(
                              child: TextWidget(
                                text: "Login to GDN Portal!",
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Center(
                              child: TextWidget(
                                text: "Enter your email and password to login",
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Stack(
                            children: [
                              Transform.scale(
                                scaleY: .9,
                                child: InputFieldWidget(
                                  contentPadding: const EdgeInsets.only(
                                      left: 65, top: 0, bottom: 0),
                                  enabledBorderRadius: 10,
                                  fontWeight: FontWeight.normal,
                                  label: "Email Address",
                                  hintText: "",
                                  onChanged: (value) {
                                    formfieldkey_1.currentState?.validate();
                                  },
                                  textFieldkey: formfieldkey_1,
                                  validator: (value) {
                                    return null;

                                    // String emailError = Validator.validateEmail(
                                    //     formfieldkey_1.currentState?.value)!;
                                    // return emailError;
                                  },
                                ),
                              ),
                              Positioned(
                                top: 42.7,
                                left: 17,
                                child: Transform.scale(
                                  scale: 1.02,
                                  child: Container(
                                    height: 40,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(9),
                                            bottomLeft: Radius.circular(9)),
                                        color: Color(0xffE8ECEE)),
                                    child: const Center(
                                        child: TextWidget(text: "@")),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Transform.scale(
                            scaleY: .9,
                            child: InputFieldWidget(
                              contentPadding: const EdgeInsets.only(
                                  left: 25, top: 0, bottom: 0),
                              label: "Password",
                              hintText: "•••••••••",
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
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.options);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17.0),
                              child: Center(
                                  child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color(0xff1F5AA2),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: TextWidget(
                                      text: "Login",
                                      color: Color(0xffE4F8F9),
                                    ),
                                  ),
                                ),
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.registerNewOutlet);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17.0),
                              child: Center(
                                  child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color(0xff6C747E),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: TextWidget(
                                      text: "Register New Outlet",
                                      color: Color(0xffE4F8F9),
                                    ),
                                  ),
                                ),
                              )),
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
                              const TextWidget(
                                text: "Remember me",
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 0, 0),
                              )
                            ],
                          ),
                          Transform.translate(
                            offset: const Offset(0, -15),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, bottom: 20),
                              child: TextButton(
                                onPressed: () {},
                                child: const TextWidget(
                                  text: "Forgot Password?",
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  color: Color(0xff1463D9),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ButtonStyle(
                    //       backgroundColor: MaterialStateColor.resolveWith(
                    //           (states) => const Color(0xff6C757D))),
                    //   child: const Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 60.0),
                    //     child: TextWidget(
                    //       text: "Register New Outlet",
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
