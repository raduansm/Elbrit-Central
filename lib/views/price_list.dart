import 'package:elbrit_central/components/search_bar.dart';
import 'package:elbrit_central/controllers/app_bar.dart';
import 'package:elbrit_central/controllers/price_list_tile.dart';
import 'package:elbrit_central/models/price_info.dart';
import 'package:elbrit_central/services/api.dart';

import 'package:elbrit_central/views/profile.dart';

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PriceListPage extends StatefulWidget {
  PriceListPage({Key? key}) : super(key: key);

  @override
  State<PriceListPage> createState() => _PriceListPageState();
}

class _PriceListPageState extends State<PriceListPage> {
  List<PriceModel> priceModels = [];

  @override
  void initState() {
    super.initState();
    getPriceInfo();
  }

  Future<void> getPriceInfo() async {
    priceModels = await Api().getPriceData();

    print('productModels: ${priceModels.length}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 3,
          flexibleSpace: SafeArea(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: NewAppBar(),
              ),
            ),
          ),
        ),
        body: Container(
          color: const Color(0xffF8FAFC),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xffE9EEF3), width: 1),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffE9EEF3),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: IconButton(
                      icon: const Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.search)),
                      onPressed: () {
                        showSearch(
                            context: context, delegate: CustomSearchDelegate());
                      },
                    ),
                  ),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: priceModels.length,
                    itemBuilder: (context, index) {
                      return PriceListTile(
                        title: priceModels[index].productName!,
                        textRate: priceModels[index].mrp!,
                        pack: priceModels[index].pack!,
                        mrp: priceModels[index].mrp!,
                        prt: priceModels[index].ptr!,
                        prs: priceModels[index].pts!,
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
