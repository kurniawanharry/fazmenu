import 'package:carousel_slider/carousel_slider.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/features/auth/presentation/domain/controllers/boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Boarding extends StatelessWidget {
  const Boarding({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: GetBuilder<BoardingController>(
        init: BoardingController(),
        builder: (get) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: _banner(context, get),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          get.goToAuth(true);
                        },
                        child: const Text('Masuk'),
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Belum punya akun? Daftar dulu'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _banner(BuildContext context, BoardingController get) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: get.carouselController,
          options: CarouselOptions(
            pageSnapping: true,
            height: double.infinity,
            autoPlay: false,
            enableInfiniteScroll: false,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            scrollPhysics: const BouncingScrollPhysics(),
            onPageChanged: (index, reason) {
              get.changeIndex(index);
            },
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, index, realIndex) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Splash $index'),
                ],
              ),
            );
          },
          itemCount: 5,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedSmoothIndicator(
            activeIndex: get.activeIndex,
            count: 5,
            effect:
                WormEffect(activeDotColor: FazColors.blue[600]!, dotColor: FazColors.slate[200]!),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Fazmenu',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: FazColors.black,
                      letterSpacing: 5,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
