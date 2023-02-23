import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_carousel_slider/screens/My_page.dart';
import 'package:my_carousel_slider/utils/staggerd_utils.dart';

void main() {
  runApp(const My_carosuel_slider());
}

class My_carosuel_slider extends StatefulWidget {
  const My_carosuel_slider({Key? key}) : super(key: key);

  @override
  State<My_carosuel_slider> createState() => _My_carosuel_sliderState();
}

class _My_carosuel_sliderState extends State<My_carosuel_slider> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Carosuel Slider",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              ),
              centerTitle: true,
              backgroundColor: Colors.teal,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1.2,
                          child: MyImagebox(
                              image: "img 1.jpeg",
                              Name: "Fast Food",
                              img1: "pizza.jpeg",
                              img2: "dosha.jpeg",
                              img3: 'manchuriyan.jpeg'),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1.5,
                          child: MyImagebox(
                              image: "Cat.jpg",
                              Name: "Pets",
                              img3: "parrot.jpeg",
                              img2: "fish.jpeg",
                              img1: "dog.jpeg"),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1.5,
                          child: MyImagebox(
                              image: "car.jpeg",
                              Name: "Cars",
                              img1: "car1.jpeg",
                              img2: "car2.jpeg",
                              img3: "car3.jpg"),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1.7,
                          child: MyImagebox(
                              image: "flower2.jpeg",
                              Name: "Flowers",
                              img1: "f1.jpeg",
                              img3: "f2.jpeg",
                              img2: 'f3.jpeg'),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1.7,
                          child: MyImagebox(
                              image: "animal.jpeg",
                              Name: "Animals",
                              img2: 'animal1.jpeg',
                              img3: 'animal2.jpeg',
                              img1: 'animal3.jpeg'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.grey,
          );
        },
      ),
    );
  }

  MyImagebox(
          {required String image,
          required String Name,
          required String img1,
          required String img2,
          required String img3}) =>
      Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    My_Carosuel_page(img1: img1, img2: img2, img3: img3)));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Imagepath + image,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      Name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
