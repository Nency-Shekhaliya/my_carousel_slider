import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/staggerd_utils.dart';

class My_Carosuel_page extends StatefulWidget {
  String img1;
  String img2;
  String img3;
  My_Carosuel_page(
      {Key? key, required this.img1, required this.img2, required this.img3})
      : super(key: key);

  @override
  State<My_Carosuel_page> createState() => _My_Carosuel_pageState();
}

class _My_Carosuel_pageState extends State<My_Carosuel_page> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Myimage(Images: widget.img1),
                Myimage(Images: widget.img2),
                Myimage(Images: widget.img3),
              ],
              options: CarouselOptions(
                  onPageChanged: (i, result) {
                    setState(() {
                      currentindex = i;
                    });
                  },
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  autoPlayInterval: const Duration(seconds: 3)),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    height: 8,
                    width: currentindex == index ? 25 : 8,
                    decoration: BoxDecoration(
                      color: currentindex == index
                          ? Colors.white
                          : Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Myimage({required String Images}) => Container(
        height: 300,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.white, style: BorderStyle.solid, width: 1),
            image: DecorationImage(
                image: AssetImage(
                  Imagepath + Images,
                ),
                fit: BoxFit.cover)),
      );
}
