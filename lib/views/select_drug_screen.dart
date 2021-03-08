import 'package:dro/model/drug_data.dart';
import 'package:dro/utils/colors.dart';
import 'package:dro/utils/margins.dart';
import 'package:dro/utils/strings.dart';
import 'package:dro/vm/home_vm.dart';
import 'package:dro/widgets/app_bar.dart';
import 'package:dro/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class SelectADrug extends StatefulWidget {
  final Drugs drugs;

  const SelectADrug({Key? key, required this.drugs}) : super(key: key);
  @override
  _SelectADrugState createState() => _SelectADrugState();
}

class _SelectADrugState extends State<SelectADrug> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
      builder: (context, model, _) => Scaffold(
        backgroundColor: white,
        appBar: appBar(
          title: "",
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () {},
                child: Center(
                    child: Row(
                  children: [
                    ImageIcon(AssetImage("images/bag.png")),
                    horizontalSpaceSmall,
                    Text(
                      "${model.pillAmount}",
                      style: TextStyle(
                          fontFamily: AppStrings.regular,
                          fontSize: 16,
                          color: white),
                    )
                  ],
                ),),
                style: ButtonStyle(
                  // shape: MaterialStateProperty.all(4),
                  elevation: MaterialStateProperty.all(0.5),
                  backgroundColor: MaterialStateProperty.all(droPurple),
                  foregroundColor: MaterialStateProperty.all(white),
                ),
              ),
            ),
          ],
          leading: IconButton(
            icon: ImageIcon(
              AssetImage(
                'images/arrow.png',
              ),
              color: black,
              size: 15,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(widget.drugs.image)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.drugs.drugName,
                    style:
                        TextStyle(fontFamily: AppStrings.regular, fontSize: 30),
                  ),
                  Text(
                    "${widget.drugs.drugForm} - ${widget.drugs.mass}",
                    style:
                        TextStyle(fontFamily: AppStrings.regular, fontSize: 16),
                  ),
                ],
              ),
            ),
            verticalSpaceSmall,
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: grey,
              ),
              title: Text(
                "SOLD BY",
                style: TextStyle(
                    fontFamily: AppStrings.regular, fontSize: 14, color: grey),
              ),
              subtitle: Text(
                "Emzor Pharmaceticals",
                style: TextStyle(
                    fontFamily: AppStrings.bold, fontSize: 12, color: grey),
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: grey,
                              style: BorderStyle.solid,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: ()=> model.decreaseNumberOfPills(),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontFamily: AppStrings.regular,
                                      fontSize: 30,
                                      color: grey),
                                ),
                              ),
                            ),
                            Text(
                              "${model.pillAmount}",
                              style: TextStyle(
                                  fontFamily: AppStrings.regular,
                                  fontSize: 25,
                                  color: grey),
                            ),
                            InkWell(
                              onTap: () => model.increaseNumberOfPills(),
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontFamily: AppStrings.regular,
                                    fontSize: 25,
                                    color: grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        "Pack(s)",
                        style: TextStyle(
                            fontFamily: AppStrings.regular,
                            fontSize: 15,
                            color: grey),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${AppStrings.nairaSymbol}",
                        style: TextStyle(
                            fontFamily: AppStrings.regular,
                            fontSize: 12,
                            color: black),
                      ),
                      Text(
                        "${widget.drugs.price * model.pillAmount}",
                        style: TextStyle(
                            fontFamily: AppStrings.regular,
                            fontSize: 20,
                            color: black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpaceSmall,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceTiny,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "PRODUCT DETAILS",
                    style: TextStyle(
                        fontFamily: AppStrings.regular,
                        fontSize: 14,
                        color: grey),
                  ),
                ),
                // verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Image.asset(
                          "images/twoPills.png",
                          scale: 1.5,
                          color: droPurple,
                        ),
                        title: Text(
                          "PACK SIZE",
                          style: TextStyle(
                              fontFamily: AppStrings.regular,
                              fontSize: 12,
                              color: grey),
                        ),
                        subtitle: Text(
                          "3x10",
                          style: TextStyle(
                              fontFamily: AppStrings.bold,
                              fontSize: 10,
                              color: black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Image.asset(
                          "images/qr-code.png",
                          scale: 1.5,
                          color: droPurple,
                        ),
                        title: Text(
                          "PRODUCT ID",
                          style: TextStyle(
                              fontFamily: AppStrings.regular,
                              fontSize: 12,
                              color: grey),
                        ),
                        subtitle: Text(
                          "PROBRYVPW1",
                          style: TextStyle(
                              fontFamily: AppStrings.bold,
                              fontSize: 10,
                              color: black),
                        ),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: Image.asset(
                    "images/pill.png",
                    scale: 1.5,
                    color: droPurple,
                  ),
                  title: Text(
                    "COSNTITUENTS",
                    style: TextStyle(
                        fontFamily: AppStrings.regular,
                        fontSize: 12,
                        color: grey),
                  ),
                  subtitle: Text(
                    "Garlic Oil",
                    style: TextStyle(
                        fontFamily: AppStrings.bold,
                        fontSize: 10,
                        color: black),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    "images/medicinepack.png",
                    scale: 1.5,
                    color: droPurple,
                  ),
                  title: Text(
                    "DISPENSED IN",
                    style: TextStyle(
                        fontFamily: AppStrings.regular,
                        fontSize: 12,
                        color: grey),
                  ),
                  subtitle: Text(
                    "Packs",
                    style: TextStyle(
                        fontFamily: AppStrings.bold,
                        fontSize: 10,
                        color: black),
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            Column(
              children: [
                button(
                  onTapped: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20,
                                    top: 45 + 20,
                                    right: 20,
                                    bottom: 20),
                                margin: EdgeInsets.only(top: 45),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(0, 10),
                                          blurRadius: 10),
                                    ]),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "widget.title",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "widget.descriptions",
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 22,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: dialogButton(
                                        buttonColor: droTurqois,
                                        // image: "images/addbag.png",
                                        text: "View Bag",
                                        onTapped: () {},
                                      ),
                                    ),
                                    verticalSpaceSmall,
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: dialogButton(
                                        buttonColor: droTurqois,
                                        // image: "images/addbag.png",
                                        text: "Done",
                                        onTapped: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 20,
                                right: 20,
                                child: CircleAvatar(
                                  backgroundColor: droTurqois,
                                  radius: 30,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(45)),
                                    child: Icon(
                                      Icons.check,
                                      color: white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  image: "images/addbag.png",
                  text: "Add to Bag",
                ),
              ],
            ),
            verticalSpaceMedium
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
