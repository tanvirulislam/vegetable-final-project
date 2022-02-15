import 'package:flutter/material.dart';

class SingleVegetable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Stack(
                overflow: Overflow.visible,
                // clipBehavior: ,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(90),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.pink,
                          Colors.purpleAccent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Men Shoe',
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              new Text(
                                "4.5",
                                style: TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 20,
                                  color: Color(0xffffffff),
                                ),
                              )
                            ],
                          ),
                          Text(
                            'Size - 9',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'Brand : Adidas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    child: Card(
                      elevation: 23,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: -20,
                    child: Image.asset(
                      "assets/shoe.png",
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 34,
                      ),
                    ),
                    Text(
                        'opiuytrasdtuiop pouiyutrter\rzxrc poiuyas poiyutrae o8iuyteryu oiuytert poiu ytr to iyutyoiuy'),
                    Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 34,
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.black,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.black,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 34,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              // color: Colors.grey,
              child: Stack(
                children: [
                  Text(
                    'TK 1500',
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/new');
                      },
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.black,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
