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
      child: Stack(
        children: [
          Container(
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                  height: 450,
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
                                  image: AssetImage(e), fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Positioned(
            bottom: 30,
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
                            color: Colors.white.withOpacity(
                                _currentPage == entry.key ? 0.9 : 0.4)),
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
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                GetBuilder<ProductController>(builder: (productController) {
                  return GestureDetector(
                    onTap: () {
                      print(widget.clothes.id);
                      print(productController.sizing);
                      // print(productController.modelMap[widget.clothes]);
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => FittingRoomPage()));
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.grey,
                          size: 20,
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
