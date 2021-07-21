import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
 var details;
   ServiceCard({Key? key,
     required this.details,
   }) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 90,
      child: Row(
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(
                  widget.details['spaImage']
                ),
                // AssetImage('assets/images/publish_image.jpg',
                // ),
                fit: BoxFit.fill
              )
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(widget.details['spaName'],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(
                  height: 10,
                ),
            Text('${widget.details['openTime']} ${widget.details['openMeridiem']} - ${widget.details['closeTime']} ${widget.details['closeMeridiem']} ',
              style: TextStyle(
                  fontSize: 12,
              color: Colors.green,
                fontWeight: FontWeight.w500
              ),
            ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on_sharp,color: Colors.black,size: 15,),
                          Text('${widget.details['distance']} ${widget.details['distanceUnit']}',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: Center(
                          child: Text('View',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
