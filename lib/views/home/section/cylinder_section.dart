import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gas_sale/data/models/cylinder_model.dart';
import 'package:gas_sale/views/home/cylinder_view_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CylinderSection extends StatelessWidget {
  const CylinderSection({super.key, required this.cylinderViewModel});
  final CylinderViewModel cylinderViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cylinder Categories",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade700,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sponsored',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.sizeOf(context).height * .225,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      autoPlayInterval: Duration(seconds: 2),
                      viewportFraction: .95
                    ),
                    items: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.225,
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
                            image: DecorationImage(
                              image: CachedNetworkImageProvider("https://www.assureshift.in/sites/default/files/images/blog/lpg-connection-booking-bangalore.jpg"),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              FutureBuilder<List<CylinderModel>>(
                future: cylinderViewModel.getCategories(),
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
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) => Container(
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
                              Stack(
                                children: [
                                  CachedNetworkImage(
                                    height: MediaQuery.sizeOf(context).height * .14,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    imageUrl: categories[index].imageUrl,
                                    placeholder: (context, url) {
                                      return Skeletonizer(
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context).height * .12,
                                          child: const Center(
                                            child: Text("Loading..."),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(6)
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.favorite_outline,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                              Center(
                                child: Text(
                                  categories[index].name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
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
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
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
            ],
          ),
        ),
      ),
    );
  }
}