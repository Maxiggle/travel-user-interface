 import 'package:flutter/material.dart';
import 'models/hotel_model.dart';
 class Carousel extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Column(
  children: <Widget>[
        Row(
    
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    
        children: <Widget>[
    
        Padding(
    
          padding:  EdgeInsets.only(right:90.0),
    
          child: Text('Exclusive Sights',style: TextStyle(fontSize:25.0,fontWeight:FontWeight.bold),),
    
        ),
    
        Padding(
    
          padding: EdgeInsets.only(right:8.0),
    
          child: Text('See All',style: TextStyle(letterSpacing:1.0,
    
          color:Colors.lightBlueAccent),
    
          ),
    
        ),
    
      ],
    
      ),
      SizedBox(height:20.0),
      Container(
          height: 300.0,
          
          
          child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: xclusive.length,
             itemBuilder: (BuildContext context,int index){
              Xclusive _list = xclusive[index];  
                return  Container(
                    margin: EdgeInsets.all(5.0),
                   width: 210.0,
                  color: Colors.white,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children:<Widget>[
                      Positioned(
                        
                        top: 140.0,
                                    child: Container(
                           height:140.0,
                           width: 220,
                           decoration: BoxDecoration(color: 
                           Colors.white,
                           borderRadius: 
                           BorderRadius.
                           circular(10.0)
                           ),
                           child:Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: <Widget>[
                               Padding(
                                 padding:EdgeInsets.only(left:20.0),
                                 child: Text(_list.name,
                                 style:TextStyle(
                                   fontSize: 24.0,
                                   fontWeight: 
                                   FontWeight.w600,
                                   ) ,
                                   ),
                               ),
                                Padding(
                                   padding:  EdgeInsets.only(left:20.0),
                                   child: Text('${_list.address}',
                                   style:TextStyle(
                                     fontSize: 24.0,
                                     color: Colors.grey),
                                   ),
                                 ),
                               
                              Padding(
                                   padding:  EdgeInsets.only(left:20.0),
                                   child: Text('\$${_list.price} / night',
                                   style:TextStyle(
                                     fontSize: 18.0,
                                     fontWeight: FontWeight.w600
                                     ),
                                   ),
                               ),
                                
                             ],
                           ),
                        ),
                                          
                      ),
                      Container(
                        decoration: BoxDecoration( 
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(20.0),
                                                child: Image(
                             width: 180.0,
                             height: 180.0,
                             image: AssetImage(_list.imageUrl),
                             fit:BoxFit.cover
                             ),
                         ),
                          ),
                        ],
                      ),
                      ),
                      
                    ],
                  ),
                  );
                
             }
        ),
        ),
  ],
);
   }
 }