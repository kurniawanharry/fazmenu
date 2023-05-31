import 'package:fazmenu/core/components/button/button_exit.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetAddition extends StatelessWidget {
  const BottomSheetAddition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListTile(
              title: Text(
                'Pilih Tambahan',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: const ButtonExit(),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: Constants.additionDummy.length,
              itemBuilder: (context, index) {
                var name = Constants.additionDummy[index];
                return ListTile(
                  title: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: name == 'Milkshake Option'
                              ? FazColors.slate[300]
                              : FazColors.slate[600],
                        ),
                  ),
                  onTap: () {
                    Get.back();
                    Get.toNamed('/productInsertOption', arguments: false);
                  },
                  trailing: Visibility(
                    visible: name == 'Milkshake Option',
                    child: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: FazColors.green[600]!,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Dipilih',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 0,
                color: FazColors.slate[200],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
