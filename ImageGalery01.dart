import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'designs/AlertMesages.dart';

class Photo {
  String id;
  String name;
  String age;
  String city;
  String state;
  String cowntry;
  String description;
  String level;
  String username;
  String website;
  String image;
  String email;
  String skype;
  String watsapp;
  String facebook;
  String active;

  Photo(
      {this.id,
      this.name,
      this.age,
      this.city,
      this.state,
      this.cowntry,
      this.description,
      this.level,
      this.username,
      this.website,
      this.image,
      this.email,
      this.skype,
      this.watsapp,
      this.facebook,
      this.active});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    age = json['Age'];
    city = json['City'];
    state = json['State'];
    cowntry = json['Cowntry'];
    description = json['Description'];
    level = json['Level'];
    username = json['Username'];
    website = json['Website'];
    image = json['Image'];
    email = json['Email'];
    skype = json['Skype'];
    watsapp = json['Watsapp'];
    facebook = json['Facebook'];
    active = json['Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Age'] = this.age;
    data['City'] = this.city;
    data['State'] = this.state;
    data['Cowntry'] = this.cowntry;
    data['Description'] = this.description;
    data['Level'] = this.level;
    data['Username'] = this.username;
    data['Website'] = this.website;
    data['Image'] = this.image;
    data['Email'] = this.email;
    data['Skype'] = this.skype;
    data['Watsapp'] = this.watsapp;
    data['Facebook'] = this.facebook;
    data['Active'] = this.active;
    return data;
  }
}
int countTimes = 1;
 

// avatar
String startID = "" + countTimes.toString();
String startName = "Adriano Souza";
String startImage = 'http://busqe.com/ximages/busqe/user/default/ico_user_tb.jpg';
final String pathItens = 'http://busqe.com/lab/json/users/6';
// button

int starticon = 0xe88f; // 0xe88e 0xe88f
String startText = "Tentar denovo";
String startMessage = "Ops, erro ao carregar itens!";

bool startJoin = true;
bool startChange = true;

// layouts



Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(pathItens);
  print('#fetchPhotos ' + countTimes.toString());
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  print('#parsePhotos ' + countTimes.toString());
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Usuarios';


    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: buildFutureBuilder(),
    );
  }

  Function executeAction() {
    countTimes += 1;
    print('#executeActionXX ' + countTimes.toString());
    buildFutureBuilder();

    return null;
  }

  FutureBuilder<List<Photo>> buildFutureBuilder() {
    return FutureBuilder<List<Photo>>(
      future: fetchPhotos(http.Client()),
      builder: (context, snapshot) {

        countTimes += 1;
        print('------ FutureBuilderX' + countTimes.toString());

        if (snapshot.hasData) {
          return PhotosList(photos: snapshot.data);
        } else if (snapshot.hasError) {
          return Center(
              child: AlertMessgeInfo(
                  actionExecute: executeAction,
                  userID: startID,
                  itemText: startText,
                  itemMessage: startMessage,
                  itemIcon: starticon,
                  itemShow: startChange));
        } else {
          String errorSnap = snapshot.error.toString();
          print('#errorSnap = ' + errorSnap);
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Theme(
                  data: Theme.of(context)
                      .copyWith(accentColor: Colors.orangeAccent),
                  child: new CircularProgressIndicator(
                    strokeWidth: 5,
                    backgroundColor: Colors.black,
                  ),
                ),
              
              ]));
        }
      },
    );
  }
}

class PhotosList extends StatefulWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  _PhotosListState createState() => _PhotosListState();
}

class _PhotosListState extends State<PhotosList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: widget.photos.length,
      itemBuilder: (context, index) {
        return Image.network(widget.photos[index].image);
      },
    );
  }
}


class AlertMessgeInfo extends StatefulWidget {
  final Function actionExecute;
  final String userID;
  final String itemText;
  final String itemMessage;
  final int itemIcon;
  final bool itemShow;

   //itemShow = icon:Icon;

  const AlertMessgeInfo({
    Key key,
    this.actionExecute,
    this.userID,
    this.itemText,
    this.itemMessage,
    this.itemIcon,
    this.itemShow,
  }) : super(key: key);

  @override
  _AlertMessgeInfoState createState() => _AlertMessgeInfoState(
      userAction: actionExecute,
      userID: userID,
      buttonText: itemText,
      alertMessage: itemMessage,
      alertIcon: itemIcon,
      buttonShow: itemShow);
} 

class _AlertMessgeInfoState extends State<AlertMessgeInfo> {
  final Function userAction;
  final String userID;
  final String buttonText;
  final String alertMessage;
  final int alertIcon;
  final bool buttonShow;

  // String valor = ( buttonText == null )  ? "SIM" : "NAO";

  _AlertMessgeInfoState({
    Key key,
    this.userAction,
    this.userID,
    this.buttonText,
    this.alertMessage,
    this.alertIcon,
    this.buttonShow,
  });

  @override
  Widget build(BuildContext context) {
    print(' ------- _AlertMessgeInfoStat');
    print(' userID = ' + userID);
    print(' buttonText = ' + buttonText);
    print(' alertMessage = ' + alertMessage);
    print(' buttonShow = ' + buttonShow.toString());

    return Container(
        height: 300,
        // color: Colors.brown,
        child: Visibility(
          visible: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                IconData(alertIcon, fontFamily: 'MaterialIcons'),
                size: 100,
                color: Colors.blue[200],
              ),
              Text(
               alertMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    height: 2
                    // backgroundColor: Colors.red
                    ),
              ),
              SizedBox(
                  //width: double.infinity,
                  width: 200,
                  child: FlatButton(
                    color: Colors.black12,
                    textColor: Colors.black,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(16.0),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      
                    setState(() {  });
                           userAction();

                        print(' ------- AlertMessgeInfo');
                        print(' userID = ' + userID);
                        print(' buttonText = ' + buttonText);
                        print(' alertMessage = ' + alertMessage);
                        print(' buttonShow = ' + buttonShow.toString());

                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      buttonText,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ))
            ],
          ),
        ));
  }
}


