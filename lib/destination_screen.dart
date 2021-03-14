import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelui/models/destination_model.dart';

import 'models/activity_model.dart';
class DestinationScreen extends StatefulWidget {

  final Destination destinations;
  DestinationScreen({this.destinations});
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
Text _buildRatingStars(int rating){
  String stars = '';
  for(int i = 0 ; i< rating ; i++){
   stars += '* ';
  }
  return Text(stars,style: TextStyle(fontSize:30.0,color:Colors.yellow),);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
          children: <Widget>[
          Stack(
            children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(30.0),
            boxShadow: [BoxShadow(color:Colors.black26,
            offset: Offset(0.0,2.0),
            blurRadius: 6.0,
            ),
          ],
          ) ,
          child: Hero(
            tag: widget.destinations.image,
                      child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: 
                Radius.circular(30.0),
                bottomRight: 
                Radius.circular(30.0)
                ),
                      child: Image(
                        image: AssetImage(widget.destinations.image),
              fit: BoxFit.fill,
              width:MediaQuery.of(context).size.width,
              ),
            ),
          )     
         ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Padding(
                   padding:  EdgeInsets.only(top:20.0),
                   child: IconButton(
                     icon: 
                   Container(
                     
                     width: 70.0,
                     decoration: BoxDecoration(color:Colors.white,borderRadius:BorderRadius.only(
                       topLeft:Radius.circular(10.0),bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0),topRight: Radius.circular(10.0))),
                     child: Icon
                       (
                         Icons.arrow_back,
                         ),
                   ),
                   iconSize: 30.0,
                   color: Colors.black,
                   onPressed: () => Navigator.pop(context),
                   ),
                 ),
                Padding(
                  padding:  EdgeInsets.only(top:20.0),
                  child: Row(
                    
                    children: <Widget>[
                     IconButton(icon: Container(
                       width: 70.0,
                       decoration: BoxDecoration(borderRadius:BorderRadius.circular(10.0),color: Colors.white),
                       child: Icon
                   (Icons.search,),
                     ),
                   iconSize: 30.0,
                   color: Colors.black,
                   onPressed: () => Navigator.pop(context),
                   ),
                   IconButton(icon: Container(
                     width: 70.0,
                     decoration: BoxDecoration(borderRadius:BorderRadius.circular(10.0),color: Colors.white),
                     child: Icon
                     (Icons.sort,),
                   ),
                   iconSize: 30.0,
                   color: Colors.black,
                   onPressed: () => Navigator.pop(context),
                   ),
                  ],
                  ),
                ),
               ],
             ),
                       Positioned(
                         left:20.0,
                         bottom: 20.0,
                                                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(widget.destinations.city,
                   style: TextStyle(fontSize:35.0,
                  fontWeight:FontWeight.w600,
                  color: Colors.white
                  ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 20.0,color: Colors.white70,
                            ),
                      Text(widget.destinations.country,
                      style: TextStyle(
                            color:Colors.white70,fontSize:25.0),
                            ),
                            
                    ],
                  ),
                 
                ],
                ),
                       ),
                        Positioned(
                           bottom: 20.0,
                         left: 340.0,
                         child:  Icon(
                           Icons.location_on,color: Colors.white,),
                         ),
                       
                      ],
                     ),
                     Expanded(
                                            child: ListView.builder(
                                              padding: EdgeInsets.only(top:10.0),
                                              scrollDirection: Axis.vertical,
                                              itemCount:widget.destinations.activities.length,
                       itemBuilder:(BuildContext context, int index){
                         Activity activity = widget.destinations.activities[index];
                         return
                       Stack(
                             children: <Widget>[
                               Container(margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                               height: 170.0,
                               width: double.infinity,
                               decoration: BoxDecoration(
                                 color:Colors.white,
                                 borderRadius: BorderRadius.circular(20.0),
                               ),
                               child: Padding(
                                 padding:  EdgeInsets.fromLTRB(100.0,20.0,20.0,20.0),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: <Widget>[
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: <Widget>[
                                       Container(
                                         width: 120.0,
                                         child: Text(activity.name,
                                         style:TextStyle(
                                           fontWeight:
                                           FontWeight.w600,
                                         fontSize: 18.0,color: Colors.black,
                                         ),
                                         overflow: TextOverflow.ellipsis,
                                         maxLines: 2,
                                         ),
                                       ),
                                       Column(
                                         children: <Widget>[
                                           Text('\$${activity.price}',style: 
                                           TextStyle(
                                             fontSize: 22.0,
                                           fontWeight: 
                                           FontWeight.w600,color: Colors.black,
                                           )
                                           ),
                                           Text('Per Pax',style: 
                                           TextStyle(
                                             color: Colors.grey,
                                           )
                                           ),
                                         ],
                                       ),
                                     ],
                                     ),
                                     Text(activity.type,
                                     style: TextStyle(color: Colors.grey),),
                                     _buildRatingStars(activity.rating),
                                     Row( 
                                       children: <Widget>[
                                         Container(
                                           width:70.00,
                                           padding: EdgeInsets.all(5.0),
                                           decoration:BoxDecoration(
                                             color:Theme.of(context).accentColor,
                                             borderRadius: BorderRadius.circular(10.0)
                                             ),
                                             alignment: Alignment.center,
                                             child: Text(activity.startimes[0],
                                             )
                                         ),
                                         SizedBox(width: 10.0,),
                                         Container(
                                           width:70.00,
                                           padding: EdgeInsets.all(5.0),
                                           decoration:BoxDecoration(
                                             color:Theme.of(context).accentColor,
                                             borderRadius: BorderRadius.circular(10.0)
                                             ),
                                             alignment: Alignment.center,
                                             child: Text(activity.startimes[1],
                                             ) ,
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                               ),
                               ),
                               Positioned(
                                 top:15.0,
                                 left: 20.0,
                                 bottom: 15.0,
                                                                child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
                                 child: Image(width: 110.0,
                                 image: AssetImage(
                                   activity.image),
                                 ),
                                 ),
                               ),
                             ],
                       );
                       }
                     ),
                     ),
                   ],
                  ),  
                 );
  }
}