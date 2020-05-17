 import 'package:flutter/material.dart';
/*
barra superior do Flutter com icones que alinham a esquerda e direita
*/

class BasicAppBarSample extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<BasicAppBarSample> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
   
  var screenSize = MediaQuery.of(context).size;
  double width = screenSize.width;
  

  double leftSize = width/0.70;
  double rightSize = width/0.30;

  //int larguraEsq = int.parse(width.toString());
  //larguraEsq = (larguraEsq / 7);

  //double width = screenSize.width;

  final String size = "" + width.toString();


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
              height: 150,
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 100,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _select(choices[0]);
                          },
                        ),
                        Image.asset(
                          'assets/images/logo_48.png',
                          fit: BoxFit.contain,
                          height: 32,
                          width: 32,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 200.0,
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              _select(choices[1]);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                              _select(choices[0]);
                            },
                          ),
             
                        ],
                      )),
                ],
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ChoiceCard(choice: _selectedChoice),
        ),


      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Carrinho', icon: Icons.shopping_cart),
  Choice(title: 'Pesquisar', icon: Icons.search),
  Choice(title: 'Meus Dados', icon: Icons.person),
  Choice(title: 'Ofertas', icon: Icons.local_offer),
  Choice(title: 'Mensagens', icon: Icons.message),
  Choice(title: 'Ajuda', icon: Icons.help),
];


class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 80.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}



// void main() { runApp(BasicAppBarSample());}


void main(){
  runApp(  MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  BasicAppBarSample(),
  ));
}
