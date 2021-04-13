import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                print('Lista');
              }),
          IconButton(
              icon: Icon(Icons.grid_on),
              onPressed: () {
                print('Grid');
              }),
        ],
      ),
      body: _body(context),
    );
  }

  _body(context) {
    List<Dog> dogs = [
      new Dog("Jack Russel", "assets/images/dog1.png"),
      new Dog("Labrador", "assets/images/dog2.png"),
      new Dog("Pug", "assets/images/dog3.png"),
      new Dog("Rottwailer", "assets/images/dog4.png"),
      new Dog("Pastor", "assets/images/dog5.png"),
    ];

    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: dogs.length,
      itemBuilder: (BuildContext context, int index) {
        Dog dog = dogs[index];
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(dog.foto),
            Container(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  dog.nome,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
    /*
    return ListView.builder(
      // padding: const EdgeInsets.all(8),
      itemCount: dogs.length,
      itemExtent: 200,
      itemBuilder: (BuildContext context, int index) {
        Dog dog = dogs[index];
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(dog.foto),
            Container(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  dog.nome,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
    */
  }

  _img(img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
