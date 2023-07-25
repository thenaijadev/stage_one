import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nethive/app/data/models/logs.dart';
import 'package:nethive/app/presentation/widgets/new/drop_down_widget.dart';
import 'package:nethive/app/presentation/widgets/new/input_field_widget.dart';
import 'package:nethive/app/presentation/widgets/title_text.dart';
import 'package:nethive/utilities/constants.dart/app_colors.dart';
import 'package:nethive/utilities/image_helper.dart';
import 'package:nethive/utilities/lists.dart';

class LogRecord extends StatefulWidget {
  const LogRecord({super.key});

  @override
  State<LogRecord> createState() => _LogRecordState();
}

class _LogRecordState extends State<LogRecord> {
  bool isMenuOpen = false;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  String? imageAsString;
  Image? image;
  String category = "";
  String product = "";

  String brand = "";
  int height = 250;
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formkey = GlobalKey<FormState>();
  List<Log> list = [];
  String? type;
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
                    padding: const EdgeInsets.only(top: 12.0, left: 12),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .93,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: TextWidget(
                          text: "Add New Log Record",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .93,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: TextWidget(
                          text:
                              "(Validation of information to be completed upon upload of appropriate invoice.)",
                          color: Colors.red,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  Transform.scale(
                    scaleX: 0.9,
                    child: DropDownInput(
                        hintText: "Select a type",
                        onChanged: (val) {
                          setState(() {
                            type = val.value;
                          });
                        },
                        label: "Type:",
                        options: skus()),
                  ),
                  Transform.scale(
                    scaleY: .9,
                    child: InputFieldWidget(
                      contentPadding:
                          const EdgeInsets.only(left: 15, top: 30, bottom: 0),
                      label: "Select Period:",
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
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 20),
                    child: TextWidget(
                      text: "For purchase,please upload an image of invoice",
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          imageAsString =
                              await ImageHelper.pickImage(ImageSource.gallery);
                          image = ImageHelper.decodeImage(imageAsString!);
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xffECECEC),
                              borderRadius: BorderRadius.circular(3)),
                          child: const Center(
                            child: TextWidget(
                              text: "Choose File",
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                        ),
                      ),
                      image != null
                          ? TextButton(
                              onPressed: () async {
                                await showImageAlertDialog(context, image);
                              },
                              child: const TextWidget(text: "View Image"),
                            )
                          : const Text("No File Chosen")
                    ],
                  ),
                  Transform.scale(
                    scaleX: 0.9,
                    child: DropDownInput(
                        hintText: "Select a category",
                        onChanged: (val) {
                          setState(() {
                            category = val.value;
                          });
                        },
                        label: "Category:",
                        options: categories),
                  ),
                  Transform.scale(
                    scaleX: 0.9,
                    child: DropDownInput(
                        hintText: "Select a brand",
                        onChanged: (val) {
                          setState(() {
                            brand = val.value;
                          });
                        },
                        label: "Brand:",
                        options: brandsDropdownList()),
                  ),
                  Transform.scale(
                    scaleX: 0.9,
                    child: DropDownInput(
                        hintText: "Select a product",
                        onChanged: (val) {
                          setState(() {
                            product = val.value;
                          });
                        },
                        label: "Product:",
                        options: products),
                  ),
                  Transform.scale(
                    scaleY: .9,
                    child: InputFieldWidget(
                      contentPadding:
                          const EdgeInsets.only(left: 25, top: 0, bottom: 0),
                      label: "Qty (Bottles):",
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
                      final log = Log(
                          category: category,
                          brand: brand,
                          product: product,
                          quantity:
                              int.parse(formfieldkey_2.currentState?.value));

                      list.add(log);

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
                      child: LogsTable(
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

class LogsTable extends StatefulWidget {
  const LogsTable({super.key, required this.list});
  final List<Log> list;
  @override
  State<LogsTable> createState() => _LogsTableState();
}

class _LogsTableState extends State<LogsTable> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextWidget(
            text: "Table with the SKUs to submit.",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Category',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Brand',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Product',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Quantity(Bottles)',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                    rows: widget.list.map((item) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(item.category)),
                          DataCell(Text(item.brand)),
                          DataCell(Text(item.product)),
                          DataCell(Text(item.quantity.toString())),
                        ],
                      );
                    }).toList()),
              ),
            ],
          ),
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

showImageAlertDialog(BuildContext context, image) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              image!,
              const SizedBox(height: 10),
            ],
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 30),
              child: Container(
                width: 272,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.inputBorder),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 0, 44, 139),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: const TextWidget(
                      text: "Close",
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}
