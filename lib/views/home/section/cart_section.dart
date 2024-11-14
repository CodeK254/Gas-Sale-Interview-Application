import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gas_sale/data/models/cylinder_model.dart';
import 'package:gas_sale/utils/widgets/space.dart';
import 'package:gas_sale/utils/widgets/spacing.dart';
import 'package:gas_sale/views/home/cylinder_view_model.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartSection extends StatelessWidget {
  const CartSection({super.key, required this.cylinderViewModel});
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
      ),
      body: ListView.builder(
        itemCount: cylinderViewModel.cartItems.length,
        itemBuilder: (context, index) {
          CylinderModel cylinder = cylinderViewModel.cartItems.toList()[index];
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: CustomDisplayTile(
              leading: CachedNetworkImage(
                height: MediaQuery.sizeOf(context).height * .08,
                width: MediaQuery.sizeOf(context).width * .25,
                fit: BoxFit.cover,
                placeholder: (context, url) => Skeletonizer(
                  child: SizedBox(
                    height: 75,
                    width: 75,
                  ),
                ),
                imageUrl: cylinder.imageUrl,
              ),
              title: Text(
                cylinder.name,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${cylinder.currency} ${cylinder.price} /=",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Icon(
                Icons.delete,
                color: Colors.red.withOpacity(.75),
              ),
              onTap: (){
                Get.dialog(
                  AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              height: verticalSpace(context, .25),
                              width: horizontalSpace(context, .3),
                              image: CachedNetworkImageProvider(cylinder.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            CustomSpacing(width: .02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  cylinder.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                                CustomSpacing(height: .012),
                                Text(
                                  cylinder.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  )
                );
              },
            ),
          );
        }
      ),
    );
  }
}

class CustomDisplayTile extends StatelessWidget {
  const CustomDisplayTile({super.key, required this.leading, required this.title, this.subtitle, this.trailing, this.onTap});
  final Widget leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leading,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      title,
                      subtitle ?? Container(),
                    ],
                  ),
                ],
              ),
              trailing ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}