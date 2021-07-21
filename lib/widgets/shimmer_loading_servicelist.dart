import 'package:flutter/material.dart';

class ServiceLoader extends StatelessWidget {
  const ServiceLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 120,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 200,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: 150,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: 100,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
