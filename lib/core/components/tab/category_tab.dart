import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.transparent, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: FazColors.blue[600],
              indicatorPadding: const EdgeInsets.only(left: 5),
              labelColor: FazColors.blue[600],
              unselectedLabelColor: FazColors.gray[500],
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: FazColors.blue[600], fontSize: 14, fontWeight: FontWeight.w500),
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: FazColors.blue[600], fontSize: 14, fontWeight: FontWeight.w600),
              isScrollable: false,
              onTap: (index) {},
              tabs: const [
                Tab(
                  text: 'Makanan',
                ),
                Tab(
                  text: 'Minuman',
                ),
                Tab(
                  text: 'Lainnya',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
