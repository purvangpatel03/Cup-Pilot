class ItemModel{
  String? itemName;
  int? itemPrice;
  String? itemImage;
  String? itemId;
  String? restId;

  ItemModel({this.itemImage, this.itemName, this.itemPrice, this.itemId, this.restId});

  Map<String, dynamic> toMap(){
    return {
      'itemName': itemName,
      'itemPrice': itemPrice,
      'itemImage': itemImage,
      'restId': restId,
    };
  }

}