import 'package:flutter/material.dart';

class CarosuelCard extends StatefulWidget {
  String image;

  CarosuelCard({Key? key,required this.image}) : super(key: key);

  @override
  _CarosuelCardState createState() => _CarosuelCardState();
}

class _CarosuelCardState extends State<CarosuelCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    widget.image
                  ),
                  fit: BoxFit.fill
              )
          ),
        ),
        Container(
          child: Column(
            children: [
              Expanded(child: SizedBox()),
              Container(
                height: 80,
                color: Colors.white.withOpacity(0.7),
                child: Center(
                  child: RichText(
                    text: new TextSpan(
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Get ',style: TextStyle(
                          fontSize: height / 45,
                          fontWeight: FontWeight.bold
                        )),
                        new TextSpan(text: '2% ', style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: height / 20,
                          color: Colors.pink
                        )),
                        new TextSpan(text: 'Discount for Salon', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height / 45,
                        )),
                      ],
                    ),
                  )
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
