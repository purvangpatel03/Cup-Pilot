import 'package:coffee/screens/home/widgets/home_balance_view.dart';
import 'package:coffee/screens/home/widgets/home_banner_view.dart';
import 'package:coffee/screens/home/widgets/home_nearby_view.dart';
import 'package:coffee/screens/main/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: 'OJu6GaVKvBzLV51mzqGd',
    //     itemName: 'Chilled Hazelnut Cold Brew',
    //     itemPrice: 230,
    //     itemImage:
    //         'https://www.nickandalicia.com/wp-content/uploads/2017/06/Vanilla-Hazelnut-Iced-Coffee-2694.jpg',
    //   ),
    // );
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: 'OJu6GaVKvBzLV51mzqGd',
    //     itemName: 'Cinnamon Dolce Latte',
    //     itemPrice: 280,
    //     itemImage:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmkK8T8qlnrKB1wN91jo4SFpmfvJvOg-RTtXe8VsGk3Q&s',
    //   ),
    // );
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: 'OJu6GaVKvBzLV51mzqGd',
    //     itemName: 'Peppermint Mocha',
    //     itemPrice: 190,
    //     itemImage:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXm-9HjcB3ggcgBxO0DBrZBeQjFNv1wBqkBYuZu_UXYQ&s',
    //   ),
    // );
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: 'pzttxBRGDO0Wsx7SJ5jR',
    //     itemName: 'Sweet Chocolate Mocha Chocolate',
    //     itemPrice: 160,
    //     itemImage:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3-3j5-cFLh5ySLcaH3loIufakGWzt9WJJGuErGjtqog&s',
    //   ),
    // );
    //
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: 'pzttxBRGDO0Wsx7SJ5jR',
    //     itemName: 'White Chocolate Raspberry Mocha',
    //     itemPrice: 220,
    //     itemImage:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUxO-QFQDizUaWmbwLc_5piaokFSYik0RD4Urt5ocJcg&s',
    //   ),
    // );
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: 'pzttxBRGDO0Wsx7SJ5jR',
    //     itemName: 'Pumpkin Spice Latte',
    //     itemPrice: 310,
    //     itemImage:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmlepHi7GHM_BnRVTJG8_6dBgNRiAhaIeOg6u8NtZqsQ&s',
    //   ),
    // );
    //
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: 'FQxvd1ZoBHxJTVXCuYn3',
    //     itemName: 'Aromatic Caramel Espresso Vanilla',
    //     itemPrice: 130,
    //     itemImage:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRljLpauduKpHFs__eS7sf4O9OB1g4GxRebE5T5QC-AsA&s',
    //   ),
    // );
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: 'FQxvd1ZoBHxJTVXCuYn3',
    //     itemName: 'Iced Caramel Macchlato',
    //     itemPrice: 320,
    //     itemImage:
    //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCn1Q7um2uaN1nnY4Z8Jr-EDhCOLbYRLdKMLNyurEehw&s',
    //   ),
    // );
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: 'FQxvd1ZoBHxJTVXCuYn3',
    //     itemName: 'Irish Cream Cold Brew',
    //     itemPrice: 270,
    //     itemImage:
    //         'https://masalaandchai.com/wp-content/uploads/2021/10/Cold-Brew-with-Irish-Cream-Syrup.jpg',
    //   ),
    // );
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: '5PDWuKYkWG7CPSJp1O7D',
    //     itemName: 'Toasty Hazelnut Mocha',
    //     itemPrice: 250,
    //     itemImage:
    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNEQOrVP6ZraE93CkfeSZUSZ-xPf6P9a07uGtgweWoqw&s',
    //   ),
    // );
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: '5PDWuKYkWG7CPSJp1O7D',
    //     itemName: 'Warm Caramel Latte',
    //     itemPrice: 210,
    //     itemImage:
    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ7JZ2-hWojw-9RByBcF5bb9Ojox_9R1_VseJFcr06Yw&s',
    //   ),
    // );
    // FirebaseHelper().insertItem(
    //   ItemModel(
    //     restId: '5PDWuKYkWG7CPSJp1O7D',
    //     itemName: 'Honey Lavender Latte',
    //     itemPrice: 200,
    //     itemImage:
    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNCGQazLvomnsXl1fqymnu4x-y4Es0Xbj-k2jKw1yqxA&s',
    //   ),
    // );

    // FirebaseHelper().insertRest(
    //   RestModel(
    //     items: [
    //       ItemModel(
    //         itemName: 'Chilled Hazelnut Cold Brew',
    //         itemPrice: 230,
    //         itemImage:
    //             'https://www.nickandalicia.com/wp-content/uploads/2017/06/Vanilla-Hazelnut-Iced-Coffee-2694.jpg',
    //       ),
    //       ItemModel(
    //         itemName: 'Cinnamon Dolce Latte',
    //         itemPrice: 280,
    //         itemImage:
    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmkK8T8qlnrKB1wN91jo4SFpmfvJvOg-RTtXe8VsGk3Q&s',
    //       ),
    //       ItemModel(
    //         itemName: 'Peppermint Mocha',
    //         itemPrice: 190,
    //         itemImage:
    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXm-9HjcB3ggcgBxO0DBrZBeQjFNv1wBqkBYuZu_UXYQ&s',
    //       ),
    //     ],
    //     restName: 'Bean Bliss Retreat',
    //     restLocation: 'Sunflower Lane',
    //     orderTime: '15 Minutes',
    //   ),
    // );
    // FirebaseHelper().insertRest(
    //   RestModel(
    //     items: [
    //       ItemModel(
    //         itemName: 'Sweet Chocolate Mocha Chocolate',
    //         itemPrice: 160,
    //         itemImage:
    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3-3j5-cFLh5ySLcaH3loIufakGWzt9WJJGuErGjtqog&s',
    //       ),
    //       ItemModel(
    //         itemName: 'White Chocolate Raspberry Mocha',
    //         itemPrice: 220,
    //         itemImage:
    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUxO-QFQDizUaWmbwLc_5piaokFSYik0RD4Urt5ocJcg&s',
    //       ),
    //       ItemModel(
    //         itemName: 'Pumpkin Spice Latte',
    //         itemPrice: 310,
    //         itemImage:
    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmlepHi7GHM_BnRVTJG8_6dBgNRiAhaIeOg6u8NtZqsQ&s',
    //       ),
    //     ],
    //     restName: 'Perk & Relax',
    //     restLocation: 'Mapel Avenue',
    //     orderTime: '16 Minutes',
    //   ),
    // );
    // FirebaseHelper().insertRest(
    //   RestModel(
    //     items: [
    //       ItemModel(
    //         itemName: 'Aromatic Caramel Espresso Vanilla',
    //         itemPrice: 130,
    //         itemImage:
    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRljLpauduKpHFs__eS7sf4O9OB1g4GxRebE5T5QC-AsA&s',
    //       ),
    //       ItemModel(
    //         itemName: 'Iced Caramel Macchlato',
    //         itemPrice: 320,
    //         itemImage:
    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCn1Q7um2uaN1nnY4Z8Jr-EDhCOLbYRLdKMLNyurEehw&s',
    //       ),
    //       ItemModel(
    //         itemName: 'Irish Cream Cold Brew',
    //         itemPrice: 270,
    //         itemImage:
    //             'https://masalaandchai.com/wp-content/uploads/2021/10/Cold-Brew-with-Irish-Cream-Syrup.jpg',
    //       ),
    //     ],
    //     restName: 'Coffee Paradise',
    //     restLocation: 'Sunflower Lane',
    //     orderTime: '20 Minutes',
    //   ),
    // );
    // FirebaseHelper().insertRest(
    //   RestModel(
    //     items: [
    //       ItemModel(
    //         itemName: 'Toasty Hazelnut Mocha',
    //         itemPrice: 250,
    //         itemImage:
    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNEQOrVP6ZraE93CkfeSZUSZ-xPf6P9a07uGtgweWoqw&s',
    //       ),
    //       ItemModel(
    //         itemName: 'Warm Caramel Latte',
    //         itemPrice: 210,
    //         itemImage:
    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ7JZ2-hWojw-9RByBcF5bb9Ojox_9R1_VseJFcr06Yw&s',
    //       ),
    //       ItemModel(
    //         itemName: 'Honey Lavender Latte',
    //         itemPrice: 200,
    //         itemImage:
    //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNCGQazLvomnsXl1fqymnu4x-y4Es0Xbj-k2jKw1yqxA&s',
    //       ),
    //     ],
    //     restName: 'The Coffee Beans',
    //     restLocation: 'Mapel Avenue',
    //     orderTime: '18 Minutes',
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MainAppbar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                HomeBalanceView(),
                HomeBannerView(),
                HomeNearbyView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
