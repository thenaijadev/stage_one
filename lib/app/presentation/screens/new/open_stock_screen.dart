import 'package:flutter/material.dart';
import 'package:nethive/app/data/models/sku_open_stock.dart';
import 'package:nethive/app/presentation/screens/new/today_details.dart';
import 'package:nethive/app/presentation/widgets/new/drop_down_widget.dart';
import 'package:nethive/app/presentation/widgets/new/input_field_widget.dart';
import 'package:nethive/app/presentation/widgets/title_text.dart';
import 'package:nethive/utilities/lists.dart';

class OpenStock extends StatefulWidget {
  const OpenStock({super.key});

  @override
  State<OpenStock> createState() => _OpenStockState();
}

class _OpenStockState extends State<OpenStock> {
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
      body: SafeArea(
          child: SingleChildScrollView(
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
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .93,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: TextWidget(
                          text: "Opening stock",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Transform.scale(
                    scaleY: .9,
                    child: InputFieldWidget(
                      contentPadding:
                          const EdgeInsets.only(left: 15, top: 30, bottom: 0),
                      label: "Select Period:",
                      hintText: "July 2023",
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
                    scaleX: 0.9,
                    child: DropDownInput(
                        enableSearch: true,
                        key: formfieldkey_3,
                        hintText: "Select product",
                        onChanged: (val) {
                          setState(() {
                            product = val.value;
                          });
                        },
                        label: "Opening Stock Product:",
                        options: skus()),
                  ),
                  Transform.scale(
                    scaleY: .9,
                    child: InputFieldWidget(
                      contentPadding:
                          const EdgeInsets.only(left: 25, top: 0, bottom: 0),
                      label: "Opening Stock Qty (Bottles):",
                      hintText: "Enter quantity",
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
                  GestureDetector(
                    onTap: () {
                      final sku = SkuOpenStock(
                          period: formfieldkey_1.currentState?.value,
                          product: product!,
                          quantity:
                              int.parse(formfieldkey_2.currentState?.value));

                      list.add(sku);

                      formkey.currentState?.reset();

                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          color: const Color(0xff205EA4),
                          borderRadius: BorderRadius.circular(3)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          ),
                          TextWidget(
                            text: "ADD",
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 200,
                      child: SkuTable(
                        list: list,
                      )),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 190,
                    height: 30,
                    decoration: BoxDecoration(
                        color: const Color(0xff205EA4),
                        borderRadius: BorderRadius.circular(3)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: "SUBMIT THESE SKUS",
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
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
        ),
      )),
    );
  }
}

class SkuTable extends StatefulWidget {
  const SkuTable({super.key, required this.list});
  final List<SkuOpenStock> list;
  @override
  State<SkuTable> createState() => _SkuTableState();
}

class _SkuTableState extends State<SkuTable> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextWidget(
            text: "Table with the SKUs to submit.",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const DataRowWidget(
            labelFontWeight: FontWeight.bold,
            label: "Opening Stock Product",
            value: "Opening Stock Quantity(Bottles)"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            height: 2,
            decoration: const BoxDecoration(color: Color(0xffDEDEDE)),
          ),
        ),
        SizedBox(
          height: 100,
          child: widget.list.isEmpty
              ? const Center(child: TextWidget(text: "Add a new item"))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return SKUItem(
                      onTap: () {
                        widget.list.removeAt(index);
                        setState(() {});
                      },
                      quantity: widget.list[index].quantity,
                      product: widget.list[index].product,
                    );
                  },
                  itemCount: widget.list.length,
                ),
        )
      ],
    );
  }
}

class SKUItem extends StatelessWidget {
  const SKUItem(
      {super.key,
      required this.product,
      required this.quantity,
      required this.onTap});
  final String product;
  final int quantity;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 26,
            ),
            Wrap(children: [
              SizedBox(
                width: 115,
                child: TextWidget(
                  text: product,
                  fontSize: 14,
                ),
              ),
            ]),
            Wrap(children: [
              const SizedBox(
                width: 40,
              ),
              SizedBox(
                width: 125,
                child: TextWidget(
                  text: quantity.toString(),
                  fontSize: 14,
                ),
              ),
            ]),
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color(0xffDB534E),
                    borderRadius: BorderRadius.circular(3)),
                child: const Center(
                  child: TextWidget(
                    text: "DELETE",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            height: 2,
            decoration: const BoxDecoration(color: Color(0xffDEDEDE)),
          ),
        ),
      ],
    );
  }
}
