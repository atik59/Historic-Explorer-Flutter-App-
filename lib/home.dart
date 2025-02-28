import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final List<String> sliderImages = [
    'assets/images/place1.jpg',
    'assets/images/place2.jpg',
    'assets/images/place3.jpg',
  ];

  final List<Map<String, String>> places = [
    {"name": "Lalbagh Fort", "image": "assets/images/lalbagh.jpg"},
    {"name": "Ahsan Manzil", "image": "assets/images/ahsan.jpg"},
    {"name": "Shaheed Minar", "image": "assets/images/shaheed.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Your City"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Slider
            CarouselSlider(
              options: CarouselOptions(height: 200.0, autoPlay: true),
              items: sliderImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search places...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Popular Places List
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Popular Places",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to details page
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(places[index]['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          color: Colors.black54,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            places[index]['name']!,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
