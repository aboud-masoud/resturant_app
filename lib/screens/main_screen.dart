import 'package:flutter/material.dart';
import 'package:resturant_app/models/product_model.dart';
import 'package:resturant_app/screens/product_details_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen();

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedIndex = 0;

  List<ProductModel> listContent = [
    ProductModel(productName: "watermelon", productPrice: "55.00 JD", viewBackgroundColor: Colors.red, productImageUrl: "Assets/images/product1.png"),
    ProductModel(productName: "mango", productPrice: "55.00 JD", viewBackgroundColor: Colors.orange, productImageUrl: "Assets/images/product2.png"),
    ProductModel(
        productName: "watermelon", productPrice: "55.00 JD", viewBackgroundColor: Colors.amber, productImageUrl: "Assets/images/product1.png"),
    ProductModel(productName: "mango", productPrice: "55.00 JD", viewBackgroundColor: Colors.blue, productImageUrl: "Assets/images/product2.png"),
    ProductModel(
        productName: "watermelon", productPrice: "55.00 JD", viewBackgroundColor: Colors.brown, productImageUrl: "Assets/images/product1.png"),
    ProductModel(productName: "abed", productPrice: "100.00 JD", viewBackgroundColor: Colors.pink, productImageUrl: "Assets/images/product2.png"),
    ProductModel(
        productName: "watermelon", productPrice: "55.00 JD", viewBackgroundColor: Colors.cyan, productImageUrl: "Assets/images/product1.png"),
    ProductModel(productName: "mango", productPrice: "55.00 JD", viewBackgroundColor: Colors.grey, productImageUrl: "Assets/images/product2.png"),
    ProductModel(productName: "watermelon", productPrice: "55.00 JD", viewBackgroundColor: Colors.red, productImageUrl: "Assets/images/product1.png"),
    ProductModel(productName: "mango", productPrice: "55.00 JD", viewBackgroundColor: Colors.orange, productImageUrl: "Assets/images/product2.png"),
    ProductModel(productName: "watermelon", productPrice: "55.00 JD", viewBackgroundColor: Colors.red, productImageUrl: "Assets/images/product1.png"),
    ProductModel(productName: "abed", productPrice: "100.00 JD", viewBackgroundColor: Colors.pink, productImageUrl: "Assets/images/product2.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(),
      body: selectedTab(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFA7BBDB),
        showSelectedLabels: true,
        iconSize: 30,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }

  Widget selectedTab() {
    if (selectedIndex == 0) {
      return Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: ListView.builder(
          itemCount: listContent.length,
          itemBuilder: (context, index) {
            return smoothiesWidget(listContent[index]);
          },
        ),
        // child: Column(
        //   children: [
        //     smoothiesWidget(listContent[0]),
        //     smoothiesWidget(listContent[1]),
        //     smoothiesWidget(listContent[2]),
        //     smoothiesWidget(listContent[3]),
        //     smoothiesWidget(listContent[4]),
        //     smoothiesWidget(listContent[5]),
        //   ],
        // ),
      );
    } else if (selectedIndex == 1) {
      return Container();
    } else {
      return Container();
    }
  }

  Widget smoothiesWidget(ProductModel content) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                      product: content,
                      allProduct: listContent,
                    )));
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(37.5), color: content.viewBackgroundColor),
                  height: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text(content.productName, style: TextStyle(color: Colors.white)),
                        Expanded(child: Container()),
                        Text(content.productPrice, style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                width: 50,
                height: 50,
                child: Image.asset(content.productImageUrl),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      toolbarHeight: 75,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        "Home",
        style: TextStyle(color: Colors.grey),
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications, color: Colors.grey)),
      ],
    );
  }
}
