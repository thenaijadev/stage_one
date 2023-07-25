import 'package:flutter/material.dart';
import 'package:nethive/app/data/models/sku_open_stock.dart';
import 'package:nethive/app/presentation/widgets/new/drop_down_widget.dart';
import 'package:nethive/app/presentation/widgets/new/input_field_widget.dart';
import 'package:nethive/app/presentation/widgets/new/outlined_container.dart';
import 'package:nethive/app/presentation/widgets/title_text.dart';
import 'package:nethive/utilities/lists.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  bool isMenuOpen = false;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  int height = 250;
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();

  final formkey = GlobalKey<FormState>();
  List<SkuOpenStock> list = [];
  String? product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Form(
            key: formkey,
            child: Column(
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 40),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .93,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: TextWidget(
                        text: "Welcome to GDN Portal",
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: OutlinedContainer(
                      borderRadius: 0,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scaleX: .9,
                              child: DropDownInput(
                                  hintText: "",
                                  onChanged: (val) {
                                    setState(() {
                                      product = val.value;
                                    });
                                  },
                                  label: "SKU:",
                                  options: skus()),
                            ),
                            Transform.scale(
                              scaleX: 1,
                              scaleY: 0.9,
                              child: InputFieldWidget(
                                contentPadding: const EdgeInsets.only(
                                    left: 15, top: 0, bottom: 0),
                                label: "Product:",
                                hintText: "",
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
                              scaleX: .9,
                              child: DropDownInput(
                                  hintText: "Type",
                                  onChanged: (val) {
                                    setState(() {
                                      product = val.value;
                                    });
                                  },
                                  label: "Opening Stock Product:",
                                  options: skus()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff2657A1),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.refresh,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      TextWidget(
                                        text: "Refresh",
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 150,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  DataTable(
                                    dataRowColor:
                                        const MaterialStatePropertyAll(
                                            Color(0xffF4F4F4)),
                                    columns: const <DataColumn>[
                                      DataColumn(
                                        label: Expanded(
                                            child: TextWidget(
                                          text: "SKU",
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                            child: TextWidget(
                                          text: "Qty(Bottles)",
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                            child: TextWidget(
                                          text: "Period",
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                            child: TextWidget(
                                          text: "Type",
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )),
                                      ),
                                    ],
                                    rows: const [
                                      DataRow(cells: <DataCell>[
                                        DataCell(
                                          TextWidget(
                                            text: "Moet nectar imperial(74cl)",
                                            fontSize: 11,
                                          ),
                                        ),
                                        DataCell(Text("32")),
                                        DataCell(Text("June 2023")),
                                        DataCell(Text("Wine")),
                                      ]),
                                      DataRow(cells: <DataCell>[
                                        DataCell(
                                          TextWidget(
                                            text: "Moet nectar imperial(74cl)",
                                            fontSize: 11,
                                          ),
                                        ),
                                        DataCell(Text("32")),
                                        DataCell(Text("June 2023")),
                                        DataCell(Text("Wine")),
                                      ])
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              child: Transform.scale(
                                scaleY: .8,
                                child: InputFieldWidget(
                                    label: "Search",
                                    hintText: "",
                                    contentPadding:
                                        const EdgeInsets.symmetric(vertical: 0),
                                    onChanged: (val) {},
                                    textFieldkey: formfieldkey_3),
                              ),
                            ),
                            Row(
                              children: [
                                Transform.translate(
                                  offset: const Offset(0, -20),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: SizedBox(
                                      width: 100,
                                      child: Transform.scale(
                                          scaleY: .8,
                                          child: DropDownInput(
                                            hintText: "",
                                            label: "Show",
                                            onChanged: (val) {},
                                            options: const [],
                                          )),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: TextWidget(text: "entries"),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: TextWidget(
                                text: "Showing 1 to 2 of 2 entries",
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 10),
                              child: Row(
                                children: [
                                  const TextWidget(
                                    text: "Previous",
                                    fontSize: 12,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 7),
                                    decoration: const BoxDecoration(
                                        color: Color(0xff479DCC)),
                                    child: const TextWidget(
                                      text: "1",
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const TextWidget(
                                    text: "Next",
                                    fontSize: 12,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
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
          ),
        ],
      )),
    );
  }
}
