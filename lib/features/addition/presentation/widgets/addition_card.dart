import 'package:fazmenu/core/components/button/button_edit.dart';
import 'package:fazmenu/features/addition/data/models/addition.dart';
import 'package:fazmenu/features/addition/presentation/widgets/addition_chip.dart';
import 'package:flutter/material.dart';

class AdditionCard extends StatelessWidget {
  const AdditionCard({
    super.key,
    this.title,
    this.list,
  });

  final String? title;
  final List<AdditionOptional?>? list;

  @override
  Widget build(BuildContext context) {
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
                  title ?? '',
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
                ...List.generate(list?.length ?? 0, (index) {
                  var name = list?[index]?.name;
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: AdditionChip(text: name),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
