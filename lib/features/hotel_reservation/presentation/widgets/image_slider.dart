import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends HookWidget {
  const ImageSlider({
    required this.imageUrls,
    super.key,
  });

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CarouselSlider.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index, realIndex) => Image.network(
              imageUrls[index],
              fit: BoxFit.fill,
            ),
            options: CarouselOptions(
              height: 300,
              onPageChanged: (index, reason) {
                currentIndex.value = index;
              },
              animateToClosest: true,
              viewportFraction: 1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: AnimatedSmoothIndicator(
              effect: const ColorTransitionEffect(
                activeDotColor: Colors.black,
                dotHeight: 13,
                dotWidth: 13,
              ),
              activeIndex: currentIndex.value,
              count: imageUrls.length,
            ),
          ),
        ),
      ],
    );
  }
}
