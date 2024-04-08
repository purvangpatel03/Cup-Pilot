import 'package:coffee/theme/colors.dart';
import 'package:coffee/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeBannerView extends StatefulWidget {
  const HomeBannerView({super.key});

  @override
  State<HomeBannerView> createState() => _HomeBannerViewState();
}

class _HomeBannerViewState extends State<HomeBannerView> {
  final PageController _pageController = PageController(
    viewportFraction: 0.85,
    initialPage: 1,
  );
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 164,
          width: double.maxFinite,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDBA130),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        TextWidget(
                          text: '#PromoToday',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: ThemeColor.lightWhite),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextWidget(
                          text: 'Buy 2 Get 1 Free, for',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: ThemeColor.lightWhite,
                                  fontWeight: FontWeight.w700),
                        ),
                        TextWidget(
                          text: 'Mizara Iced Coffe',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ThemeColor.lightWhite,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 28,
                          child: FilledButton(
                            onPressed: () {},
                            child: TextWidget(
                              text: 'Buy Coffee',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: ThemeColor.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Image(
                      image: NetworkImage(
                          'https://static.vecteezy.com/system/resources/thumbnails/027/145/821/small/iced-coffee-with-cream-milk-perfect-for-drink-catalog-ai-generated-png.png'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                width: _currentPage == index ? 24.0 : 8,
                height: 8.0,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? ThemeColor.textLight
                      : ThemeColor.border,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
