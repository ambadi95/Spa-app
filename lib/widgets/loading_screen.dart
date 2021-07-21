import 'package:flutter/material.dart';
import 'package:test_ware/widgets/shimmer_loading_servicelist.dart';

class LoadingHomePage extends StatelessWidget {
  const LoadingHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: height / 5,
            color: Colors.blueGrey,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 150,
            height: 10,
            color: Colors.blueGrey,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120,
                height: 30,
                  color: Colors.blueGrey,
              ),
              Container(
                width: 70,
                height: 30,
                color: Colors.blueGrey,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ServiceLoader(),
          SizedBox(
            height: 10,
          ),
          ServiceLoader(),
          SizedBox(
            height: 10,
          ),
          ServiceLoader()
        ],
      ),
    );
  }
}
