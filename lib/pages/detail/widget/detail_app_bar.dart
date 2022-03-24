import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future/ar/fitting_room_page.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/models/product_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class DetailAppBar extends StatefulWidget {
  final ProductModel clothes;

  const DetailAppBar({Key? key, required this.clothes}) : super(key: key);

  @override
  _DetailAppBarState createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  final CarouselController _controller = CarouselController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Container(
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                  height: 450,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  }),
              items: widget.clothes.pictures!
                  .map((e) => Builder(
                        builder: (context) => Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top,
                              right: 13,
                              left: 13),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: MemoryImage(
                                  base64Decode(
                                      e.split('data:image/png;base64,')[1]),
                                ),
                                fit: BoxFit.fitHeight,
                              ),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Positioned(
            bottom: 2,
            left: 180,
            child: Row(
              children: widget.clothes.pictures!
                  .asMap()
                  .entries
                  .map(
                    (entry) => GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(
                                _currentPage == entry.key ? 0.4 : 0.3)),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 25,
              right: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 19,
                      ),
                    ),
                  ),
                ),
                GetBuilder<ProductController>(builder: (productController) {
                  return GestureDetector(
                    onTap: () {
                      if (productController.arModelExists(widget.clothes.id!) !=
                          true) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FittingRoomPage(
                              model: '',
                              sizingScale: 0.0,
                              positionAdjustment: 0.0,
                            ),
                          ),
                        );
                      } else {
                        var selectedProduct = productController.getARModel(
                            widget.clothes.id!, productController.sizing);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FittingRoomPage(
                              model: selectedProduct.modelURL,
                              sizingScale: selectedProduct.size.sizingScale,
                              positionAdjustment:
                                  selectedProduct.size.positionAdjustment,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.pink,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 21,
                        )),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
