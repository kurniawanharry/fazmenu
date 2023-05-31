import 'package:fazmenu/core/components/button/button_menu.dart';
import 'package:fazmenu/core/components/no_image_product.dart';
import 'package:fazmenu/core/util/extension.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/analytic/domain/controllers/analytic_controller.dart';
import 'package:fazmenu/features/home/presentation/pages/drawer_navigation.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > Constants.maxWidth) {
      return SplitViewWidget(
        widget: Scaffold(
          appBar: AppBar(
            title: const Text('Analitik'),
          ),
          body: _body(context),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Analitik'),
          leading: kIsWeb ? null : const ButtonMenu(),
        ),
        drawer: kIsWeb ? const DrawerNavigation() : null,
        body: _body(context),
      );
    }
  }

  Widget _body(BuildContext context) {
    return GetBuilder<AnalyticController>(
      init: Get.find<AnalyticController>(),
      builder: (get) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _mainBody(context, get),
            ],
          ),
        );
      },
    );
  }

  Widget _tabs(AnalyticController get) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: get.customTab().length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final tab = get.customTab()[index];
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                get.updateTab(int.parse(tab['id'].toString()));
              },
              borderRadius: BorderRadius.circular(5),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: FazColors.slate[400]!,
                    width: 1,
                    strokeAlign: 0,
                  ),
                  color: get.tabIndex == int.parse(tab['id'].toString())
                      ? FazColors.amber[400]
                      : FazColors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  tab['title'].toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: get.tabIndex == int.parse(tab['id'].toString())
                            ? FazColors.white
                            : FazColors.slate[600],
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _mainBody(BuildContext context, AnalyticController get) {
    return Expanded(
      child: ListView(
        shrinkWrap: false,
        children: [
          _topMainBody(context, get),
          Divider(height: 5, color: FazColors.slate[200], thickness: 10),
          _bottomMainBody(context)
        ],
      ),
    );
  }

  Widget _topMainBody(BuildContext context, AnalyticController get) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: FazColors.blue[600],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _tabs(get),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Data Penjualan',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: FazColors.white),
                ),
                Text(
                  'Terbaru 13:34',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: FazColors.slate[200],
                      ),
                ),
              ],
            ),
          ),
          Text(
            'Total Penjualan(Rp)',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: FazColors.slate[200],
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              formatCurrency(35000),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: FazColors.white,
                    fontSize: 30,
                  ),
            ),
          ),
          Text(
            'Total Pesanan',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: FazColors.slate[200],
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '2',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: FazColors.white,
                    fontSize: 30,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomMainBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: FazColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Metode Pembayaran',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Jumlah Penjualan', style: Theme.of(context).textTheme.bodyMedium),
                Text('Pesanan', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          ...List.generate(
            5,
            (index) => const AnalyticPaymentCard(),
          ),
          Text(
            'Produk Terlaris',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
          ),
          ...List.generate(
            5,
            (index) => const AnalyticFavoriteCard(),
          ),
        ],
      ),
    );
  }
}

class AnalyticFavoriteCard extends StatelessWidget {
  const AnalyticFavoriteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: FazColors.amber[400]!),
            child: Text(
              '1',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: FazColors.white,
                  ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: SizedBox(
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Visibility(
                    child: NoImageProduct(size: 80),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    'test'.toUpperCamelCase(),
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: FazColors.slate[600],
                                          fontWeight: FontWeight.w600,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    formatCurrency(1000),
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: FazColors.slate[600], fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: FazColors.slate[600],
                                      fontWeight: FontWeight.w600,
                                    ),
                                children: [
                                  TextSpan(
                                    text: '1',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: FazColors.slate[600],
                                          fontWeight: FontWeight.w600,
                                          fontSize: 25,
                                        ),
                                  ),
                                  const TextSpan(text: ' Produk'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnalyticPaymentCard extends StatelessWidget {
  const AnalyticPaymentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/payments/ewallet/gopay.png',
                  width: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text('GoPay'),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatCurrency(23000),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                      ),
                ),
                Text(
                  '1',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
