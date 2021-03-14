import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelui/destination_screen.dart';
import 'package:travelui/models/destination_model.dart';
import 'destination_carousel.dart';

class App extends StatefulWidget {
  
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedindex = 0;
  int _currentTab = 0;
  List<IconData> _list = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _iconBuilder(int index){
    return GestureDetector(
      onTap:(){
        setState(() {
          _selectedindex = index;
        });
       
      },
          child: Container(
        height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        color: _selectedindex == index ? Theme.of(context).accentColor: Colors.white60,
        borderRadius:BorderRadius.circular(30.0)
        ),
        child:  Icon(
          _list[index],
          size: 25.0,
          color:_selectedindex == index ? Theme.of(context).primaryColor : Colors.grey
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
     child:ListView(
       padding: EdgeInsets.symmetric(vertical:30.0),
       children: <Widget>[
       Padding(
         padding:  EdgeInsets.only (left:20.0,right:120.0,),
         child: Text('What would you like to find?',
         style: TextStyle(
           fontWeight:FontWeight.bold,
      fontSize:30.0
      ),
      ),
       ),
SizedBox(height:20.0),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: _list.asMap()
  .entries.
  map((MapEntry map)
   => _iconBuilder(map.key)
   )
   .toList(),
   ),
   Column(
     children: <Widget>[
       Row(children: <Widget>[
         Padding(
           padding:  EdgeInsets.only(left: 20.0,top: 20.0),
           child: Text('Top Destinations',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18.0)
           ),
         ),
         Padding(
           padding:  EdgeInsets.only(top: 20.0,left: 168.0),
           child: Text('See All',style: TextStyle(letterSpacing:1.5, fontWeight: FontWeight.bold,color: Colors.lightBlue)
           ,),
         ),
       ],
       ),
     ],
   ),
   Column(children: <Widget>[
     Container(
       
     height: 300.0,
     child:ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount:destination.length,
     itemBuilder:(BuildContext context,int index){
       Destination destinations = destination[index];
      return GestureDetector(
        onTap: () => Navigator.push(context, 
        MaterialPageRoute(builder: (_) => DestinationScreen(destinations: destinations,),
        ),
        ),
        
              child: Container(
          margin: EdgeInsets.all(10.0),
          width:210.0,
           
          child: Stack(
            alignment: Alignment.topCenter,
            children:<Widget> [
            Positioned(
              bottom: 15.0,
                        child: Container(
                height: 120.0,
                width: 210.0,
              decoration:BoxDecoration( 
                color: Colors.white,
                borderRadius:BorderRadius.circular(10.0),),
                 child:Padding(
                   padding:  EdgeInsets.all(10.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                     Text('${destinations.activities.length} activities',
                     style: TextStyle(fontSize:22.0,fontWeight:FontWeight.w600),
                     ),
                     Text(destinations.description,style: TextStyle(color: Colors.grey,
                     fontSize: 22.0,fontWeight: FontWeight.w600),
                     ),
                   ],
                   ),
                 ),
              ),
            ),
             Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color:Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0
                ),
                ],
            ),
            child:Stack(
              children: <Widget>[
              Hero(
                tag:destinations.image,
                              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                    height: 180.0,
                  width: 180.0,
                  image:AssetImage(destinations.image),
                  fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                bottom: 10.0,
                            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(destinations.city, style: TextStyle(fontSize:24.0,
                  fontWeight:FontWeight.w600,
                  color: Colors.white
                  ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 10.0,color: Colors.white,
                        ),
                      Text(destinations.country,
                      style: TextStyle(
                        color:Colors.white),
                        ),
                    ],
                  )
                ],
                ),
              )
            ],
            ),
            ),
          ],
          ),       
        ),
      );
     },
     ),
     ),
   ],
   ),
   SizedBox(height: 20.0,),
   Carousel(),
     ],
     ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value){
          setState(() {
            _currentTab = value;
          });
        },
        items: [
        BottomNavigationBarItem(
          icon:
          Icon( 
            Icons.search
            ,size: 30.0,
            ),
            title: SizedBox.shrink(),
        ) , 
        BottomNavigationBarItem(
          icon:
          Icon( 
            Icons.local_pizza
            ,size: 30.0
            ),
            title: SizedBox.shrink()
        ) ,      
        BottomNavigationBarItem(
          icon:CircleAvatar(
            radius:15.0,
            backgroundImage:AssetImage('assests/images/dubai10.jpg'),
          ),
            title: SizedBox.shrink()
        ) ,                
      ],
      ),
  );
  }
}