import 'package:gas_sale/data/models/food.dart';
import 'package:gas_sale/views/home/home_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final FoodController foodController = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cylinder Categories",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<CylinderModel>>(
          future: foodController.getCategories(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              List<CylinderModel> categories = snapshot.data!;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                ), 
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      boxShadow: [
                        const BoxShadow(
                          offset: Offset(-4, -4),
                          color: Colors.white,
                          blurRadius: 8,
                        ),
                        BoxShadow(
                          offset: const Offset(4, 4),
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CachedNetworkImage(
                            imageUrl: categories[index].imageUrl,
                            placeholder: (context, url) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height * .12,
                                child: const Center(
                                  child: Text("Loading..."),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Center(
                            child: Text(
                              categories[index].name,
                              style: GoogleFonts.ubuntu(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else if(!snapshot.hasData) {
              return Skeletonizer(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                  ), 
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          const BoxShadow(
                            offset: Offset(-4, -4),
                            color: Colors.white,
                            blurRadius: 8,
                          ),
                          BoxShadow(
                            offset: const Offset(4, 4),
                            color: Colors.grey.shade300,
                            blurRadius: 8,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "An error occured while processing"
                ),
              );
            }
          }
        ),
      ),
    );
  }
}
