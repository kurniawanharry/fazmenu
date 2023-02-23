import 'package:cached_network_image/cached_network_image.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class CoverMenuScreen extends StatelessWidget {
  const CoverMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cover Menu - Preview'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.info,
                color: FazColors.yellow[400],
              ),
              minLeadingWidth: 0,
              tileColor: FazColors.yellow[50],
              visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              title: Text(
                'Ini adalah pratinjau halaman cover kamu',
                style:
                    Theme.of(context).textTheme.titleSmall?.copyWith(color: FazColors.yellow[400]),
              ),
            ),
            SizedBox(
              height: size.height / 3,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {},
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: (size.height / 3) - 50,
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://noticias.animeonegai.com/wp-content/uploads/2022/12/Bocchi-the-Rock-Nijika-Ijichi.jpg',
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: const DecorationImage(
                                image: CachedNetworkImageProvider(
                                    'https://i.pinimg.com/564x/35/20/bb/3520bb45c416038b371f515b9050f3eb.jpg'),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FazColors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: FazColors.blue[300],
                              ),
                              child: Icon(Icons.edit),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: FazColors.blue[300],
                        ),
                        child: Icon(Icons.edit),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Nijika Ijichi',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                overflow: TextOverflow.fade,
                maxLines: 2,
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {},
                child: const Text('Pesan Sekarang!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
