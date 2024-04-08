import 'dart:typed_data';

class RestModel {
  Uint8List? restImage;
  String restName;
  String restLocation;
  String orderTime;
  String? restId;

  RestModel({
    this.restImage,
    this.restId,
    required this.restName,
    required this.restLocation,
    required this.orderTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'restName': restName,
      'restLocation': restLocation,
      'orderTime': orderTime,
    };
  }

// HomeModel fromMap(Map<String, dynamic> data) {
//   return HomeModel(
//     restImage: data['restImage'],
//     restName: data['restName'],
//     restLocation: data['restLocation'],
//     orderTime: data['orderTime'],
//   );
// }
}
