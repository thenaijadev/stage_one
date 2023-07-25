import 'package:flutter/material.dart';
import 'package:nethive/app/presentation/widgets/title_text.dart';
import 'package:nethive/utilities/router/routes.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  bool isMenuOpen = false;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  int height = 250;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xff272A4F), width: 6),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      child: TextWidget(
                        text: "GDN NIGERIA LTD",
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffDADADA),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: IconButton(
                            onPressed: () {
                              toggleMenu();
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Color(0xff898989),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .93,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xffE3E4E6), width: 3),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: TextWidget(
                      text: "Welcome to GDN Portal",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              OptionContainer(
                title: "Open Stock",
                subTitle: "Capture opening stock",
                onTap: () {
                  Navigator.pushNamed(context, Routes.openStock);
                },
              ),
              OptionContainer(
                title: "Log Record",
                subTitle: "Capture all transactions for the month",
                onTap: () {
                  Navigator.pushNamed(context, Routes.logs);
                },
              ),
              OptionContainer(
                title: "View Logs",
                subTitle: "View entries history",
                onTap: () {
                  Navigator.pushNamed(context, Routes.viewSales);
                },
              ),
              OptionContainer(
                title: "Feedback",
                subTitle: "Provide feedback",
                onTap: () {},
              )
            ],
          ),
          Positioned(
            top: 75,
            child: SizedBox(
              width: 390,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                height: isMenuOpen ? 250 : 0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(
                            width: isMenuOpen ? 2 : 0,
                            color: const Color(0xffE2E3E0)))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(children: const [
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(text: "Home"),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(text: "Opening Stock"),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(text: "New Log"),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(text: "View Log"),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(text: "View Feedbacks"),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class OptionContainer extends StatelessWidget {
  const OptionContainer(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onTap});
  final String title;
  final String subTitle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffDBEDF9),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xffE1E7EC), width: 3),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: title,
                          fontWeight: FontWeight.bold,
                        ),
                        const Icon(
                          Icons.shopping_cart,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextWidget(
                    text: subTitle,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
