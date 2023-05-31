import 'package:fazmenu/core/components/button/custom_elevated.dart';
import 'package:fazmenu/core/components/checkbox/custom_checkbox_tile.dart';
import 'package:fazmenu/core/components/chip/custom_chip.dart';
import 'package:fazmenu/core/components/dropdown/dropdown_standard.dart';
import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/radio/radio_tile_no_border.dart';
import 'package:fazmenu/core/components/switch/custom_switch_tile.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/discount/domain/controllers/discount_insert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscountInsert extends GetView<DiscountInsertController> {
  const DiscountInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Diskon'),
        leading: IconButton(
          onPressed: () {
            controller.previousPage();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey.value,
          child: Column(
            children: [
              Obx(() => LinearProgressIndicator(
                    value: ((controller.currentPage.value + 1) * 33.33) / 100,
                    color: FazColors.amber[400],
                  )),
              Expanded(
                child: PageView(
                  controller: controller.pageController.value,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _firstPage(),
                    _secondPage(),
                    _thirdPage(context),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Obx(() => ElevatedButton(
                      onPressed: () {
                        controller.nextButton();
                      },
                      child: controller.currentPage.value == 2
                          ? const Text('Buat Kupon')
                          : const Text('Lanjutkan'),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  ListView _thirdPage(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
          child: Column(
            children: const [
              TitleListTile(
                title: 'Limitasi Penggunaan',
                subTitle: 'Atur kuota dan penggunanan setiap pelanggan',
                icon: Icons.person,
                isNeeded: true,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
          child: Column(
            children: [
              const TitleListTile(
                title: 'Tipe Pelanggan',
              ),
              Row(
                children: const [
                  Expanded(
                    child: RadioTileNoBorder(isSelected: true, title: 'Semua Pelanggan'),
                  ),
                  Expanded(
                    child: RadioTileNoBorder(isSelected: false, title: 'Pelanggan Baru'),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
          child: Column(
            children: [
              const TitleListTile(
                title: 'Batas penggunaan / pelanggan',
                subTitle: 'Tentukan batas penggunanan promo untuk setiap pelanggan',
              ),
              Row(
                children: const [
                  Expanded(
                    child: RadioTileNoBorder(isSelected: true, title: 'Tidak Terbatas'),
                  ),
                  Expanded(
                    child: RadioTileNoBorder(isSelected: false, title: 'Terbatas'),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
          child: Column(
            children: [
              const TitleListTile(
                title: 'Kuota',
                subTitle: 'Tentukan batas penggunanan promosi ini secara keseluruhan',
              ),
              Row(
                children: const [
                  Expanded(
                    child: RadioTileNoBorder(isSelected: true, title: 'Tidak Terbatas'),
                  ),
                  Expanded(
                    child: RadioTileNoBorder(isSelected: false, title: 'Terbatas'),
                  ),
                ],
              )
            ],
          ),
        ),
        Divider(thickness: 10, color: FazColors.slate[200]),
        Obx(() => CustomSwitchTile(
              icon: Icons.settings,
              title: const Text('Pengaturan Tambahan'),
              subTitle: const Text('Set tipe pembayaran dan tipe pesanan'),
              onChanged: controller.toggleAdditionSetting,
              value: controller.additionSetting.value,
            )),
        GetX<DiscountInsertController>(
          builder: (_) {
            return Visibility(
              visible: controller.additionSetting.value,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        const TitleListTile(
                          title: 'Kuota',
                          isNeeded: true,
                        ),
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 5,
                          children: RxList.generate(controller.paymentList.length, (index) {
                            var day = controller.paymentList[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: CustomCheckboxTile(
                                title: day.tittle,
                                value: day.status!.value,
                                onChanged: (value) {
                                  controller.updateStatusPayment(index, value);
                                },
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        const TitleListTile(
                          title: 'Pilih Tipe Pesanan',
                          isNeeded: true,
                        ),
                        GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 5,
                          children: RxList.generate(controller.orderList.length, (index) {
                            var day = controller.orderList[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: CustomCheckboxTile(
                                title: day.tittle,
                                value: day.status!.value,
                                onChanged: (value) {
                                  controller.updateOrder(index, value);
                                },
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                  Divider(thickness: 10, color: FazColors.slate[200]),
                  CustomSwitchTile(
                    icon: Icons.settings,
                    title: Row(
                      children: [
                        Text(
                          'Tampilkan pada list kupon',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const CustomChip(
                          text: 'Baru',
                        )
                      ],
                    ),
                    subTitle: const Text('Pelajari lebih lanjut mengenai fitur ini'),
                    onChanged: (p0) {},
                    value: false,
                  ),
                ],
              ),
            );
          },
        ),
        Divider(thickness: 10, color: FazColors.slate[200]),
      ],
    );
  }

  ListView _secondPage() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 20),
          child: Column(
            children: const [
              TitleListTile(
                title: 'Tanggal Berlaku',
                isNeeded: true,
              ),
              SingleLineField(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 20),
          child: Column(
            children: [
              const TitleListTile(
                title: 'Berlaku Pada',
                isNeeded: true,
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 5,
                children: RxList.generate(controller.dayList.length, (index) {
                  var day = controller.dayList[index];
                  return Obx(() => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: CustomCheckboxTile(
                          title: day.tittle,
                          value: day.status!.value,
                          onChanged: (value) {
                            controller.updateStatus(index, value);
                          },
                        ),
                      ));
                }),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 20),
          child: Column(
            children: const [
              TitleListTile(
                title: 'Jam',
                isNeeded: true,
              ),
              SingleLineField(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _firstPage() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 20),
          child: Column(
            children: const [
              TitleListTile(
                title: 'Nama',
                isNeeded: true,
              ),
              SingleLineField(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
          child: Column(
            children: [
              const TitleListTile(
                title: 'Nama Promo',
                isNeeded: true,
              ),
              Row(
                children: [
                  const Flexible(
                    flex: 2,
                    child: SingleLineField(),
                  ),
                  const SizedBox(width: 10),
                  CustomElevated(
                    height: 35,
                    onTap: () {},
                    text: 'Kode Promo',
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(thickness: 10, color: FazColors.slate[200]),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 20),
          child: Column(
            children: [
              const TitleListTile(
                title: 'Jenis Promo',
                isNeeded: true,
              ),
              Obx(
                () => DropdownStandard(
                  items: Constants.promoList,
                  valueData: controller.dropdownValue.value.isEmpty
                      ? null
                      : controller.dropdownValue.value,
                  onChange: (p0) {
                    controller.updateDropdown(p0);
                  },
                  hint: 'Pilih tipe promo',
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => Visibility(
            visible: controller.dropdownValue.isNotEmpty,
            child: _mainDiscount(),
          ),
        ),
      ],
    );
  }

  Column _mainDiscount() {
    return Column(
      children: [
        Obx(
          () => _discountDrop(controller.dropdownValue.value),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
          child: Column(
            children: const [
              TitleListTile(
                title: 'Minimum Pembelian',
                isNeeded: true,
              ),
              SingleLineField(),
            ],
          ),
        ),
        Obx(() => Visibility(
              visible: controller.dropdownValue.value == 'Diskon %',
              child: _discountOnlyBottom(),
            )),
      ],
    );
  }

  Widget _discountDrop(String value) {
    switch (value) {
      case 'Diskon Rupiah':
        return _discountRupiah();
      case 'Diskon %':
        return _discountOnly();
      case 'Gratis Produk':
        return _freeProduct();

      default:
    }
    return const SizedBox();
  }

  Padding _discountRupiah() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
      child: Column(
        children: const [
          TitleListTile(
            title: 'Jumlah Diskon Rupiah',
            isNeeded: true,
          ),
          SingleLineField(),
        ],
      ),
    );
  }

  Padding _discountOnly() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
      child: Column(
        children: const [
          TitleListTile(
            title: 'Diskon',
            isNeeded: true,
          ),
          SingleLineField(),
        ],
      ),
    );
  }

  Column _discountOnlyBottom() {
    return Column(
      children: [
        Divider(thickness: 10, color: FazColors.slate[200]),
        CustomSwitchTile(
          value: false,
          onChanged: (p0) {},
          title: const Text('Memiliki Maksimum Diskon'),
          subTitle: const Text('Atur Maksimum Diskon'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
          child: Column(
            children: const [
              TitleListTile(
                title: 'Maksimum Diskon',
                isNeeded: true,
              ),
              SingleLineField(),
            ],
          ),
        ),
      ],
    );
  }

  Column _freeProduct() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
          child: Column(
            children: const [
              TitleListTile(
                title: 'Produk',
                isNeeded: true,
              ),
              SingleLineField(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
          child: Column(
            children: const [
              TitleListTile(
                title: 'Jumlah',
                isNeeded: true,
              ),
              SingleLineField(),
            ],
          ),
        ),
      ],
    );
  }
}
