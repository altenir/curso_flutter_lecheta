import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/hello_listview.dart';
import 'package:flutter_hello/utils/nav.dart';
import 'package:flutter_hello/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'drawer_list.dart';
import 'pages/hello_page2.dart';
import 'pages/hello_page3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Hello Flutter"),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "TAB 1",
              ),
              Tab(
                text: "TAB 2",
              ),
              Tab(
                text: "TAB 3",
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          _body(context),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.deepPurple,
          )
        ]),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _onClickFab();
              },
            ),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _onClickFab() {
    print('Adicionar');
  }

  _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 250,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlueButton(
                'LisView',
                onPressed: () => _onClickNavigator(context, HelloListView()),
                color: Colors.red,
              ),
              BlueButton('Page 2',
                  onPressed: () => _onClickNavigator(context, HelloPage2())),
              BlueButton('Page 3,',
                  onPressed: () => _onClickNavigator(context, HelloPage3())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlueButton(
                'Snack',
                onPressed: () => _onClickSnak(context),
              ),
              BlueButton(
                'Dialog',
                onPressed: () => _onClickDialog(context),
              ),
              BlueButton(
                'Toast',
                onPressed: () => _onClickToast(),
              ),
            ],
          )
        ],
      );
    });
  }

  // _button(String text, Function onPressed) {
  //   return BlueButton(text, onPressed);
  // }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print('>>> $s');
  }

  _img(img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "Cachorrada",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 25,
        fontWeight: FontWeight.normal,
        // fontStyle: FontStyle.italic,
        // decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        // decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

  _onClickSnak(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Awesome Snackbar!'),
        duration: Duration(seconds: 6),
        action: SnackBarAction(
          label: 'Action',
          onPressed: () {
            print('OK');
          },
        ),
      ),
    );
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text('Flutter é muito legal!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: 'Flutter é muito legal!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
