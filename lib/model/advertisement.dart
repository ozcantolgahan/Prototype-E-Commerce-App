import 'package:flutter/cupertino.dart';

class Advertisement {
  String advertisementId;
  String advertisementContent;
  String advertisementImage;

  Advertisement(
      {@required this.advertisementId,
      this.advertisementContent,
      this.advertisementImage});
  Advertisement.fromMap(Map<String,dynamic> map){
   advertisementId= map["advertisementId"];
   advertisementContent= map["advertisementContent"];
   advertisementImage= map["advertisementImage"];



  }
}
