import 'package:flutter/material.dart';
import 'package:resturant_app/models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductModel product;
  List<ProductModel> allProduct;

  ProductDetailsScreen({required this.product, required this.allProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: _buildCarousel(context, 0),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return SizedBox(
      height: 350.0,
      child: PageView.builder(
        itemCount: allProduct.length,
        controller: PageController(viewportFraction: 0.8),
        itemBuilder: (BuildContext context, int itemIndex) {
          return _boxCard(context, carouselIndex, itemIndex);
        },
      ),
    );
  }

  Widget _boxCard(BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: allProduct[itemIndex].viewBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 63,
            ),
            Image.asset(
              allProduct[itemIndex].productImageUrl,
              scale: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                allProduct[itemIndex].productName,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("Assets/images/successIcon.png"),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "200 ml, 1x",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    allProduct[itemIndex].productPrice,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Container(
                height: 1,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 0, right: 0),
                            onPressed: () {},
                            icon: Icon(Icons.remove_circle, color: Colors.white)),
                        Text("2", style: TextStyle(color: Colors.white, fontSize: 22)),
                        IconButton(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(left: 0, right: 0),
                            onPressed: () {},
                            icon: Icon(Icons.add_circle, color: Colors.white)),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Text("100 JD", style: TextStyle(color: Colors.white, fontSize: 22))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 75,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        product.productName,
        style: TextStyle(color: Colors.grey),
      ),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications, color: Colors.grey)),
      ],
    );
  }
}
