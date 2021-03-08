import 'package:dro/model/drug_data.dart';
import 'package:dro/utils/colors.dart';
import 'package:dro/utils/margins.dart';
import 'package:dro/utils/strings.dart';
import 'package:dro/views/select_drug_screen.dart';
import 'package:dro/vm/home_vm.dart';
import 'package:dro/widgets/app_bar.dart';
import 'package:dro/widgets/card.dart';
import 'package:dro/widgets/icon_button.dart';
import 'package:dro/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var m = Provider.of<HomeViewModel>(context);
    return ViewModelProvider<HomeViewModel>.withConsumer(
      onModelReady: (model) => model.getDrugData(),
      builder: (context, model, _) {
        if (model.busy) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(darkPurple),
              ),
            ),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              backgroundColor: white,
              body: SlidingUpPanel(
                minHeight: 60,
                maxHeight: 725,
                color: darkPurple,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                panel: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    verticalSpaceTiny,
                    Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10),
                          color: white),
                    ),
                    verticalSpaceTiny,
                    Container(
                      // width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage("images/bag.png"),
                                color: white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Bag",
                                style: TextStyle(
                                    color: white,
                                    fontFamily: AppStrings.altLight,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(50),
                                color: white),
                            child: Center(
                              child: Text(
                                m.pillAmount.toString(),
                                style: TextStyle(color: black, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    Container(
                      height: 30,
                      width: 280,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: white),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text(
                            "Tap on an item for add, remove, delete options",
                            style: TextStyle(
                                fontFamily: AppStrings.altBold, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                body: Scaffold(
                  appBar: appBar(
                    title: "${model.drugs.length} item(s)",
                    leading: IconButton(
                      icon: ImageIcon(
                        AssetImage(
                          'images/arrow.png',
                        ),
                        color: black,
                        size: 15,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  body: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 90),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            iconButton(
                              icon: ImageIcon(
                                AssetImage("images/updown.png"),
                                size: 20,
                              ),
                              onPressed: () {},
                            ),
                            Spacer(),
                            iconButton(
                                icon: ImageIcon(
                                  AssetImage("images/filter.png"),
                                  size: 20,
                                ),
                                onPressed: () {}),
                            Spacer(),
                            iconButton(
                              icon: Icon(
                                Icons.search,
                                size: 20,
                              ),
                              onPressed: () {
                                model.onSearchClicked();
                              },
                            ),
                          ],
                        ),
                      ),
                      verticalSpaceSmall,
                      model.isBody ? _body(model.drugs) : _searchBody(context)
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

_body(List<Drugs> drugs) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(bottom: 100),
      child: StaggeredGridView.countBuilder(
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 3 : 2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        crossAxisCount: 2,
        itemBuilder: (context, index) => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: drugs.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectADrug(
                              drugs: drugs[index],
                            ),
                          ),
                        ),
                    child: card(
                        image: drugs[index].image,
                        drugName: drugs[index].drugName,
                        drugContent: drugs[index].drugContent,
                        drugForm: drugs[index].drugForm,
                        mass: drugs[index].mass,
                        price: drugs[index].price)),
                staggeredTileBuilder: (index) =>
                    StaggeredTile.count(2, index.isEven ? 3 : 3),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

_searchBody(BuildContext context) {
  var m = Provider.of<HomeViewModel>(context);
  if (m.busy) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(darkPurple),
        ),
      ),
    );
  } else {
    TextEditingController drugName = TextEditingController();
    return Expanded(
      child: Column(
        children: [
          textField(
            controller: drugName,
            inputType: TextInputType.name,
            action: TextInputAction.search,
            onPressed: () {},
            onCancel: () => m.onSearchClicked(),
          ),
          verticalSpaceLarge,
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 100),
              child: StaggeredGridView.countBuilder(
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 3 : 2),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                crossAxisCount: 2,
                itemBuilder: (context, index) => Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount: m.searchedDrugs.length,
                        itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectADrug(
                                      drugs: m.searchedDrugs[index],
                                    ),
                                  ),
                                ),
                            child: card(
                                image: m.drugs[index].image,
                                drugName: m.drugs[index].drugName,
                                drugContent: m.drugs[index].drugContent,
                                drugForm: m.drugs[index].drugForm,
                                mass: m.drugs[index].mass,
                                price: m.drugs[index].price)),
                        staggeredTileBuilder: (index) =>
                            StaggeredTile.count(2, index.isEven ? 3 : 3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
