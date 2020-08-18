import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          ),
                          radius: 50,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: IconButton(
                            onPressed: () {
                              showTheBottomModel(context);
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.blue,
                              size: 35,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Your Username"),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.history,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.wrap_text,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.payment,
                              color: Colors.orange,
                            )
                          ],
                        )
                      ],
                    ),
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.orange,
                      size: 30,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                        radius: 50,
                      ),
                      Column(
                        children: <Widget>[
                          Text("Your Friend Username"),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.card_giftcard,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.delete,
                                color: Colors.orange,
                              )
                            ],
                          )
                        ],
                      ),
                      Icon(
                        Icons.person_pin,
                        color: Colors.orange,
                        size: 30,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                        radius: 50,
                      ),
                      Column(
                        children: <Widget>[
                          Text("Your Friend Username"),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.card_giftcard,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.delete,
                                color: Colors.orange,
                              )
                            ],
                          )
                        ],
                      ),
                      Icon(
                        Icons.person_pin,
                        color: Colors.orange,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showTheBottomModel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.transparent,
                    elevation: 0,
                    child: Text("Camera"),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.transparent,
                    elevation: 0,
                    child: Text("Gallery"),
                  )
                ],
              ),
            ));
  }
}
