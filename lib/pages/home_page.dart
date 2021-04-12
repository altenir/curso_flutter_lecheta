import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/hello_page1.dart';
import 'package:flutter_hello/widgets/blue_button.dart';

import 'hello_page2.dart';
import 'hello_page3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Hello Flutter"),
        ),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
      height: 300,
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlueButton('LisView',
                onPressed: () => _onClickNavigator(context, HelloPage1())),
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
              onPressed: () => _onClickSnak(),
            ),
            BlueButton(
              'Dialog',
              onPressed: () => _onClickDialog(),
            ),
            BlueButton(
              'Toast',
              onPressed: () => _onClickToast(),
            ),
          ],
        )
      ],
    );
  }

  // _button(String text, Function onPressed) {
  //   return BlueButton(text, onPressed);
  // }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));

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
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  Function _onClickSnak() {
    print('_onClickSnak');
  }

  Function _onClickDialog() {
    print('_onClickDialog');
  }

  Function _onClickToast() {
    print('_onClickToast');
  }
}
