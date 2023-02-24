import 'package:fazmenu/core/components/button/button_edit.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/addition/domain/controllers/addition_controller.dart';
import 'package:fazmenu/features/addition/presentation/widgets/addition_chip.dart';
import 'package:fazmenu/features/home/presentation/widgets/home_drawer.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdditionScreen extends StatelessWidget {
  const AdditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > Constants.maxWidth) {
      return SplitViewWidget(
        navigationPanel: NavigationPanel.addition,
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
        ),
        drawer: const HomeDrawer(
          navigationPanel: NavigationPanel.addition,
        ),
        body: _body(),
        floatingActionButton: _floatingButton(),
      );
    }
  }

  Widget _floatingButton() {
    return GetBuilder<AdditionController>(
      init: AdditionController(),
      builder: (get) {
        return FloatingActionButton(
          onPressed: get.goToInsertAddition,
          child: const Icon(Icons.add),
        );
      },
    );
  }

  Widget _body() {
    return GetBuilder<AdditionController>(
        init: AdditionController(),
        builder: (get) {
          return SafeArea(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Steak Sauce',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            ButtonEdit(
                              onTap: () {},
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: 10,
                          children: [
                            ...List.generate(10, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: AdditionChip(text: 'Text $index'),
                              );
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
