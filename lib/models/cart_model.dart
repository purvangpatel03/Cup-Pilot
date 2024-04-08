class CartModel {
  String? itemName;
  String? itemLocation;
  String? orderTime;
  int? itemPrice;
  String? itemImage;
  String? itemId;
  int? quantity;
  String? uid;
  String? docId;

  CartModel({
    this.itemImage,
    this.itemPrice,
    this.orderTime,
    this.itemLocation,
    this.itemName,
    this.itemId,
    this.quantity,
    this.docId,
    this.uid,
  });

  Map<String, dynamic> toMap(){
    return {
      'itemId': itemId,
      'itemName': itemName,
      'itemLocation': itemLocation,
      'orderTime': orderTime,
      'itemPrice': itemPrice,
      'itemImage': itemImage,
      'quantity': quantity,
      'uid': uid,
    };
  }

}
