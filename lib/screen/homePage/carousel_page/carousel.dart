

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/event_carousel_slider_controller.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final CarouselController carouselController = CarouselController();
  final CarouselImgController _carouselImgController =  Get.put(CarouselImgController());

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
        return CarouselSlider(

          items: _carouselImgController.carouselimgUrls
              .map(
                (carouselImgUrls) => ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: carouselImgUrls,
                fit: BoxFit.cover,
                width: Get.width - 10.0,
                placeholder: (context, url) => const ColoredBox(
                  color: Colors.white,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          )
              .toList(),
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            aspectRatio: 2.5,
            viewportFraction: 1,
            height: 250
          ),
        );
      });
  }
}