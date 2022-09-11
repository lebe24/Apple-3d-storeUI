import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'HeroPage.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _current = 0;
  dynamic _selectedIndex = {};

  CarouselController _carouselController = new CarouselController();

  final List<dynamic> _products = [
    {
      'title': 'Iphone 14 ',
      'image': 'assets/iphone/iphone.png',
      'model': 'assets/iphone/iphone_14.glb',
      'description': 'Limited Edition',
      'desc' :'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae '
    },
    {
      'title': 'Apple Mac ',
      'image': 'assets/mac/mac.png',
      'model': 'assets/mac/apple.glb',
      'description': 'Limited collection',
      'desc' :'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae '

    },
    {
      'title': 'Apple Watch ',
      'image': 'assets/watch/watch.png',
      'model': 'assets/watch/watch.glb',
      'description': 'Limited collection',
      'desc' :'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae '

    },
    {
      'title': 'Apple Mac ',
      'image': 'assets/appmac/appmac.png',
      'model': 'assets/appmac/appmac.glb',
      'description': 'Limited collection',
      'desc' :'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedIndex.length > 0
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.arrow_forward_ios),
            )
          : null,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'Apple Store',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
                height: 450.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.70,
                enlargeCenterPage: true,
                pageSnapping: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: _products.map((movie) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_selectedIndex == movie) {
                          _selectedIndex = {};
                        } else {
                          _selectedIndex = movie;
                        }
                      });
                    },
                    onDoubleTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductViewPage(
                                    product: movie,
                                  )));
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(
                      //   body:Image.network(movie['image'])
                      // )));
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: _selectedIndex == movie
                              ? Border.all(
                                  color: Colors.blue.shade500, width: 3)
                              : null,
                          boxShadow: _selectedIndex == movie
                              ? [
                                  BoxShadow(
                                      color: Colors.blue.shade100,
                                      blurRadius: 30,
                                      offset: Offset(0, 10))
                                ]
                              : [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 20,
                                      offset: Offset(0, 5))
                                ]),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 320,
                              margin: EdgeInsets.only(top: 10),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(movie['image'],
                                  fit: BoxFit.cover),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              movie['title'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              movie['description'],
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList()),
      ),
    );
  }
}
