import 'package:flutter/material.dart';
import 'package:nethive/app/presentation/widgets/info_item.dart';
import 'package:nethive/app/presentation/widgets/title_text.dart';
import 'package:nethive/utilities/router/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Color.fromARGB(255, 255, 255, 255),
            child: ListView(
              children: [
                SizedBox(
                  height: 330,
                ),
                InfoItem(
                  icon: Icons.person,
                  label: "Slack name",
                  value: "Chukwuemeka Okwor",
                ),
                InfoItem(
                  icon: Icons.mail_rounded,
                  label: "Email",
                  value: "cokwor23@gmail.com",
                ),
                InfoItem(
                  icon: Icons.phone,
                  label: "Phone",
                  value: "+2349014138731",
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 50, right: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.webView);
                    },
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(500, 50)),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 36, 83, 255),
                        )),
                    child: TextWidget(
                      color: Colors.white,
                      text: "Open GitHub",
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .45,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 36, 83, 255),
                borderRadius: BorderRadius.circular(40)
                    .copyWith(topLeft: Radius.zero, topRight: Radius.zero)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                    ),
                    Container(
                      height: 135,
                      width: 135,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: AssetImage("assets/images/profile.jpeg"),
                            fit: BoxFit.cover),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextWidget(
                  text: "Chukwuemeka Okwor",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                TextWidget(
                  text: "Mobile track intern",
                  color: const Color.fromARGB(255, 217, 217, 217),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
