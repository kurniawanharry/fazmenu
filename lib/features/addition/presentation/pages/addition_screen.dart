import 'package:fazmenu/core/components/button/button_menu.dart';
import 'package:fazmenu/core/util/switchs.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/addition/domain/controllers/addition_controller.dart';
import 'package:fazmenu/features/addition/presentation/widgets/addition_card.dart';
import 'package:fazmenu/features/home/presentation/pages/drawer_navigation.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AdditionScreen extends GetView<AdditionController> {
  const AdditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > Constants.maxWidth) {
      return SplitViewWidget(
        widget: Scaffold(
          appBar: AppBar(
            title: const Text('Tambahan'),
          ),
          body: _body(),
          floatingActionButton: _floatingButton(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Tambahan'),
          leading: kIsWeb ? null : const ButtonMenu(),
        ),
        drawer: kIsWeb ? const DrawerNavigation() : null,
        body: _body(),
        floatingActionButton: _floatingButton(),
      );
    }
  }

  Widget _floatingButton() {
    return Obx(() => Visibility(
          visible: !controller.isLoading.value,
          child: FloatingActionButton(
            onPressed: controller.goToInsertAddition,
            child: const Icon(Icons.add),
          ),
        ));
  }

  Widget _body() {
    return SafeArea(
      child: Obx(() {
        if (controller.isLoading.value) {
          return progressIndicator(ProgressIndicatorType.circle);
        } else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: controller.additionList.length,
            itemBuilder: (context, index) {
              var addition = controller.additionList[index];
              return AdditionCard(
                title: addition.additionName,
                list: addition.optional,
              );
            },
          );
        }
      }),
    );
  }
}
