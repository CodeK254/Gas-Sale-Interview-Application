import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gas_sale/data/models/cylinder_model.dart';
import 'package:gas_sale/utils/services/generate_list.dart';
import 'package:gas_sale/utils/widgets/label_and_divider.dart';
import 'package:gas_sale/utils/widgets/space.dart';
import 'package:gas_sale/utils/widgets/spacing.dart';
import 'package:gas_sale/views/home/cylinder_view_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CylinderSection extends StatelessWidget {
  const CylinderSection({super.key, required this.cylinderViewModel});
  final CylinderViewModel cylinderViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: (() async {
          cylinderViewModel.toggleSelected(cylinderViewModel.selected);
        }),
        child: Padding(
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
                        autoPlay: false,
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        autoPlayInterval: Duration(seconds: 10),
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
                CustomSpacing(height: .012),        
                FutureBuilder<List<CylinderModel>>(
                  future: cylinderViewModel.getCategories(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      List<CylinderModel> categories = snapshot.data!;
                      List<CylinderModel> allCategories = GenerateList.generateAllCylinderList(categories);
                      return Column(
                        children: [
                          CustomLabelAndDivider(label: "3KG Gas Cylinders"),
                          CustomHorizontalList(categories: GenerateList.generate3KGCylinderList(categories), cylinderViewModel: cylinderViewModel),
                          CustomLabelAndDivider(label: "6KG Gas Cylinders"),
                          CustomHorizontalList(categories: GenerateList.generate6KGCylinderList(categories), cylinderViewModel: cylinderViewModel),
                          CustomLabelAndDivider(label: "12KG Gas Cylinders"),
                          CustomHorizontalList(categories: GenerateList.generate12KGCylinderList(categories), cylinderViewModel: cylinderViewModel),
                          CustomSpacing(height: .015),
                          CustomLabelAndDivider(label: "All Category List"),
                          GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1,
                            ),
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: allCategories.length,
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
                                          imageUrl: allCategories[index].imageUrl,
                                          placeholder: (context, url) {
                                            return Skeletonizer(
                                              child: Container(
                                                height: MediaQuery.sizeOf(context).height * .12,
                                                width: double.infinity,
                                                color: Colors.orange,
                                              ),
                                            );
                                          },
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: (){
                                              if(cylinderViewModel.exists(allCategories[index])){
                                                cylinderViewModel.removeFromCart(allCategories[index]);
                                              } else {
                                                cylinderViewModel.addToCart(allCategories[index]);
                                              }
                                            },
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius: BorderRadius.circular(6)
                                              ),
                                              child: Align(
                                                alignment: Alignment.topCenter,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Icon(
                                                    !cylinderViewModel.exists(allCategories[index]) ? Icons.bookmark_border : Icons.bookmark,
                                                    color: Colors.pink,
                                                  ),
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
                                        allCategories[index].name,
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
                          ),
                        ],
                      );
                    } else if(!snapshot.hasError) {
                      return GridView.builder(
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
                          child: Skeletonizer(
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
                                    Stack(
                                      children: [
                                        Skeletonizer(
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context).height * .12,
                                            child: Center(
                                              child: Container(
                                                height: verticalSpace(context, .12),
                                                width: double.infinity,
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),                                          
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
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons.bookmark_border,
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
                                        "Item name is here",
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
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: verticalSpace(context, .12)
                          ),
                          child: Column(
                            children: [
                              Text(
                                "An error occured while processing, please check your internet connection and try again.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomSpacing(height: .05),
                              Image(
                                image: AssetImage('assets/no_network.png'),
                                height: 150,
                                width: 150,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomHorizontalList extends StatelessWidget {
  const CustomHorizontalList({
    super.key,
    required this.categories,
    required this.cylinderViewModel,
  });

  final List<CylinderModel> categories;
  final CylinderViewModel cylinderViewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSpacing(height: .012),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: horizontalSpace(context, .4),
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
                                    child: Container(
                                      height: MediaQuery.sizeOf(context).height * .12,
                                      width: double.infinity,
                                      color: Colors.orange,
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                right: 0,
                                child: GestureDetector(
                                  onTap: (){
                                    if(cylinderViewModel.exists(categories[index])){
                                      cylinderViewModel.removeFromCart(categories[index]);
                                    } else {
                                      cylinderViewModel.addToCart(categories[index]);
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          !cylinderViewModel.exists(categories[index]) ? Icons.bookmark_border : Icons.bookmark,
                                          color: Colors.pink,
                                        ),
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
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}