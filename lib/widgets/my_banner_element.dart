import 'package:flutter/material.dart';

class MyBannerElement extends StatefulWidget {
  String bannerImage;
  String bannerContent;
  MyBannerElement({@required this.bannerImage,@required this.bannerContent});
  @override
  _MyBannerElementState createState() => _MyBannerElementState();
}

class _MyBannerElementState extends State<MyBannerElement> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage(widget.bannerImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              color: Colors.orange,
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.bannerContent,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )),
      ],
    );
  }
}
