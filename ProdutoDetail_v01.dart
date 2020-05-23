import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:doqs/designs/ButtonLayouts.dart';
//import 'package:doqs/designs/SlideIcons.dart';
//import 'package:doqs/designs/SlideIcons.dart';
//import 'package:doqs/designs/SlideLayouts.dart';

//
void main() => runApp(ProdutoDetalhe());

class ProdutoDetalhe extends StatelessWidget {
  @override
  String tumb = 'http://busqe.com/ximages/111111/tumb/';
  String load = 'assets/images/load-02.gif';
  String btShare = "Compartilhar";
  String btFavorite = "Favoritos";


  Widget build(BuildContext context) {
    final title = 'Calça de Moleton Masc..';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            SlidePhotos(load: load, tumb: tumb),
            buildContainer(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showToast(message: title, context: context);
            // _showSnackBar(message: title, context: context);
          },
          label: Text('Comprar'),
          icon: Icon(Icons.shopping_cart),
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }

  Theme buildBottomBar(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
        //canvasColor: Theme.of(context).accentColor
        canvasColor: Colors.white,
      ),
      child: new BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              title: Text(
                "Comprar",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: Text(
                "Buscar",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
        ],
      ),
    );
  }

  Container buildContainer() {
    return Container(
        color: Colors.white,
        height: 1200,
        // alignment: Alignment(0.0, 0.0),
        child: Column(children: <Widget>[
          Container(
            height: 50,
            color: Colors.white,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buttonMedium(label:btShare, icon:Icons.share),
                  buttonMedium(label:btFavorite, icon:Icons.favorite),
                  ]),
          ),
          buildColumn2(), // Descricao
          buildColumn3(), // Tamanho - Titulos
          buildColumn4(), // Tamanhos - Botoes
          buildColumn1(), // Retire
          buildColumn8(), // Conjunto
          buildColumn7(), // Troca
        ]));
  }

  Column buildColumn2() {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 32.0, left: 8.0),
              child: Text(
                "Calca de Moleton Masculia Esport Estilo Classica",
                style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  // backgroundColor: Colors.red
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 32.0, left: 8.0),
              child: Text(
                "6x R# 14,99",
                style: new TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  // backgroundColor: Colors.red
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 32.0, left: 8.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.card_giftcard,
                      color: Colors.cyan,
                    ),
                    Text(
                      " no cartao s/juros\n ou  89,99 a vista",
                      style: new TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                        // backgroundColor: Colors.red
                      ),
                    ),
                  ])),
          Padding(
              padding: EdgeInsets.only(top: 32.0, left: 8.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.local_offer,
                      color: Colors.cyan,
                    ),
                    Text(
                      " compre agora\n e acumule pontos",
                      style: new TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                        // backgroundColor: Colors.red
                      ),
                    ),
                  ])),
        ]);
  }

  Column buildColumn1() {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: 32),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.store,
                      color: Colors.black38,
                    ),
                    Text(
                      " Retire na Loja",
                      style: new TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                        // backgroundColor: Colors.red
                      ),
                    ),
                  ])),
          Divider(
            height: 15.0,
            color: Colors.black87,
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.local_shipping,
                      color: Colors.black26,
                    ),
                    Text(
                      " Calcular Frete",
                      style: new TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                        // backgroundColor: Colors.red
                      ),
                    ),
                  ])),
          Divider(
            height: 15.0,
            color: Colors.black87,
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.info_outline,
                      color: Colors.black26,
                    ),
                    Text(
                      " Informacoes do Produto",
                      style: new TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                        // backgroundColor: Colors.red
                      ),
                    ),
                  ])),
          Divider(
            height: 15.0,
            color: Colors.black87,
          ),
        ]);
  }

  Column buildColumn3() {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 32.0, left: 8.0),
                      child: Text(
                        "Tamanho",
                        style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          // backgroundColor: Colors.red
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 32.0, right: 8.0),
                      child: Text(
                        "Guia de Medias",
                        style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                          // backgroundColor: Colors.red
                        ),
                      )),
                ]),
          )
        ]);
  }

  Column buildColumn4() {
    var labels = ['P', 'M', 'G', 'GG', 'XG'];
    final String style = 'estilo';

    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 0.0, left: 8.0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buttonIconMedium(labels: labels[0], style: style),
                  buttonIconMedium(labels: labels[1], style: style),
                  buttonIconMedium(labels: labels[2], style: style),
                  buttonIconMedium(labels: labels[3], style: style),
                  buttonIconMedium(labels: labels[4], style: style),
                ]),
          )
        ]);
  }

  Column buildColumn7() {
    final String title = 'Gostou da nossa Composição?';
    final String text =
        'Aproveite para adquirir todos os itens\n do Look deste Modelo.';

    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: 0.0),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                color: Colors.cyan[50],
                height: 300,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 96,
                        alignment: Alignment(0.0, 0.0),
                        child: new CircleAvatar(
                          backgroundImage: new NetworkImage(tumb),
                          backgroundColor: Colors.cyan[200],
                          radius: 24.0,
                          child: Icon(Icons.sms_failed,
                              size: 32, color: Colors.white),
                        ),
                      ),
                      Container(
                         height: 72,
                        alignment: Alignment(0.0, 0.0),
                        padding: new EdgeInsets.only(left: 8.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Text(
                              "" + title,
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                              ),
                            ),
                            new Text(
                              text,
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 96,
                          child: Visibility(
                            visible: true,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                FlatButton( 
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.all(16.0),
                                  splashColor: Colors.blueAccent,
                                  onPressed: () {
                                    //_showToast({Key key, message, context})
                                  },
                                  child: Text(
                                    "Compre o Look",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ]),
              )),
        ]);
  }

  Column buildColumn8() {
    final String title = 'Troca Facil';
    final String text =
        'Fique Tranquilo, Você pode trocar\ntambém nas nossas lojas.';

    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: 32),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                color: Colors.orange[100],
                height: 72,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 56,
                        alignment: Alignment(0.0, 0.0),
                        child: new CircleAvatar(
                          backgroundImage: new NetworkImage(tumb),
                          backgroundColor: Colors.orange,
                          radius: 24.0,
                          child: Icon(Icons.autorenew,
                              size: 32, color: Colors.white),
                        ),
                      ),
                      VerticalDivider(color: Colors.orange),
                      Expanded(
                        child: new Container(
                          padding: new EdgeInsets.only(left: 8.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              new Text(
                                "" + title,
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                              ),
                              new Text(
                                text,
                                style: new TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          child: Visibility(
                        visible: false,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Text(
                              "msg",
                              style: new TextStyle(
                                  color: Colors.lightGreen, fontSize: 12.0),
                            ),
                            new CircleAvatar(
                              backgroundColor: Colors.lightGreen,
                              radius: 10.0,
                              child: new Text(
                                "0",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                            )
                          ],
                        ),
                      ))
                    ]),
              )),
        ]);
  }

  Row buttonIconMedium({Key key, labels, style}) {
    return Row(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(5.0),
        child: ButtonTheme(
          minWidth: 50.0,
          height: 35.0,
          child: RaisedButton(
            elevation: 1.0,
            shape: Border.all(width: 1.0, color: Colors.black12),
            color: Colors.white,
            onPressed: () {},
            child: Row(
              children: <Widget>[
                Text(
                  labels,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  void _showToast({Key key, message, context}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0);
  }
/*
  void _showSnackBar({Key key, message, context}) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: "Desfazer",
        onPressed: () {
          // Codigo para desfazer alteração
        },
      ),
    );

    Scaffold.of(context).showSnackBar(snackbar);
  }
  */

}


class SlidePhotos extends StatelessWidget {
  const SlidePhotos({
    Key key,
    @required this.load,
    @required this.tumb,
  }) : super(key: key);

  final String load;
  final String tumb;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      color: Colors.white,
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 300.0,
            color: Colors.black12,
            child: Padding(
              padding: EdgeInsets.only(right: 1.0),
              child: FadeInImage.assetNetwork(
                placeholder: load,
                image: tumb + '01-1_tb.jpg',
              ),
            ),
          ),
          Container(
            width: 300.0,
            color: Colors.black12,
            child: Padding(
              padding: EdgeInsets.only(right: 1.0),
              child: FadeInImage.assetNetwork(
                placeholder: load,
                image: tumb + '01-2_tb.jpg',
              ),
            ),
          ),
          Container(
            width: 300.0,
            color: Colors.black12,
            child: Padding(
              padding: EdgeInsets.only(right: 1.0),
              child: FadeInImage.assetNetwork(
                placeholder: load,
                image: tumb + '01-3_tb.jpg',
              ),
            ),
          ),
          Container(
            width: 300.0,
            color: Colors.black12,
            child: Padding(
              padding: EdgeInsets.only(right: 1.0),
              child: FadeInImage.assetNetwork(
                placeholder: load,
                image: tumb + '01-4_tb.jpg',
              ),
            ),
          ),
          Container(
            width: 300.0,
            color: Colors.black12,
            child: Padding(
              padding: EdgeInsets.only(right: 1.0),
              child: FadeInImage.assetNetwork(
                placeholder: load,
                image: tumb + '01-5_tb.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Row buttonMedium({Key key, label, icon:Icon}) {
  return Row(children: <Widget>[
    Padding(
      padding: EdgeInsets.all(5.0),
      child: ButtonTheme(
        minWidth: 140.0,
        height: 35.0,
        child: RaisedButton(
          elevation: 1.0,
          shape: Border.all(width: 1.0, color: Colors.black12),
          color: Colors.white,
          onPressed: () {},
          child: Row(
            children: <Widget>[
              Icon(
                icon ,
                size: 15.0,
                color: Colors.black45,
              ),
              Text(
                label,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    ),
  ]);
}

 






