import 'package:coffee/screens/menu/menu.dart';
import 'package:coffee/theme/colors.dart';
import 'package:coffee/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../firebase/firebase_helper.dart';

class HomeNearbyView extends StatelessWidget {
  const HomeNearbyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              TextWidget(
                text: 'Coffee Shop Nearby',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ThemeColor.text,
                    ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: TextWidget(
                  text: 'See All',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ThemeColor.primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: FirebaseHelper().getRestData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuScreen(
                              currentIndex: index + 1,
                              restModel: snapshot.data?[index],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: PhysicalModel(
                          color: Colors.white,
                          elevation: 4,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 220,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image(
                                        height: 100,
                                        width: 220,
                                        fit: BoxFit.fitWidth,
                                        image: MemoryImage(
                                          snapshot.data![index].restImage!,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        color: ThemeColor.white,
                                        Icons.favorite_border_outlined,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextWidget(
                                  text: snapshot.data?[index].restName ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: ThemeColor.text,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: ThemeColor.primary,
                                      size: 16,
                                    ),
                                    TextWidget(
                                      text:
                                          snapshot.data?[index].restLocation ??
                                              '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                              color: ThemeColor.textLight),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    TextWidget(
                                      text:
                                          snapshot.data?[index].orderTime ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            color: ThemeColor.textLight,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: PhysicalModel(
                        color: Colors.white,
                        elevation: 4,
                        borderRadius: BorderRadius.circular(12),
                        child: const SizedBox(
                          width: 220,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
