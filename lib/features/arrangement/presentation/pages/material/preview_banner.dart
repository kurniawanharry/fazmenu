import 'package:carousel_slider/carousel_slider.dart';
import 'package:fazmenu/core/components/image_url.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/arrangement/domain/controllers/banner_controller.dart';
import 'package:fazmenu/features/arrangement/presentation/widgets/preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PreviewBanner extends GetView<BannerController> {
  const PreviewBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pratinjau'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const PreviewWidget(
              title: 'Ini adalah pratinjau halaman cover kamu',
            ),
            ListTile(
              tileColor: FazColors.blue,
              title: Text(
                'Nama Toko',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: FazColors.white),
              ),
              trailing: const Icon(
                Icons.person_outline_sharp,
                size: 30,
                color: FazColors.white,
              ),
            ),
            _banner(context),
            _tabs(),
            ...List.generate(
              4,
              (index) => Card(
                margin: const EdgeInsets.only(left: 10, right: 20, top: 10),
                elevation: 0,
                color: FazColors.slate[200],
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          width: 200,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Produk ${index + 1}'),
                          Text(
                            'Perkenalan produk',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Spacer(),
                          Text(
                            formatCurrency(0000),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _tabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Text('Tab 1'),
                    Container(
                      width: 20,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: FazColors.blue, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text('Tab 2'),
                const Text('Tab 3'),
                const Text('Tab 4'),
              ],
            ),
          ),
          const Flexible(
            fit: FlexFit.loose,
            child: Icon(
              Icons.search,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _banner(BuildContext context) {
    return GetX<BannerController>(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CarouselSlider.builder(
                carouselController: controller.carouselController.value,
                options: CarouselOptions(
                  pageSnapping: true,
                  aspectRatio: 4 / 1,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  scrollPhysics: const BouncingScrollPhysics(),
                  onPageChanged: (index, reason) {
                    controller.changeIndex(index);
                  },
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (context, index, realIndex) {
                  var image = Constants.bannerDummy[index];
                  return ImageUrl(
                    url: image,
                    fit: BoxFit.cover,
                  );
                },
                itemCount: Constants.bannerDummy.length,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                alignment: Alignment.center,
                child: AnimatedSmoothIndicator(
                  activeIndex: controller.activeIndex.value,
                  count: Constants.bannerDummy.length,
                  effect: WormEffect(
                    activeDotColor: FazColors.blue[600]!,
                    dotColor: FazColors.slate[200]!,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
