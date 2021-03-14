
import 'package:travelui/models/activity_model.dart';
class Destination{
  String image;
  String description;
  String country;
  String city;
  List<Activity> activities;

  Destination({
  this.image,
  this.country,
  this.city,
  this.description,
  this.activities
  });
}

List<Activity> activities = [
  Activity(
  image:'assests/images/dubai6 (2).jpg',
  name:'Hiking',
  type: 'Sight seeing tour',
  price: 30,
  rating: 5,
  startimes:['9:00am' , '11:00am'],
  ),
  Activity(
 image:'assests/images/Flickr (1).jpg',
  name:'Biking on Mountains top',
  type: 'Sight seeing tour',
  price: 60,
  rating: 5,
  startimes: ['11:00am ', '12:00pm'],
  ),
Activity(
  image:'assests/images/dubai5.jpg',
  name:'Walking tour',
  type: 'Sight seeing tour',
  price: 100,
  rating: 5,
  startimes: ['12:00am' ,' 2:00pm'], 
)
  
];

List<Destination> destination = [
  Destination(
    image: 'assests/images/dubai-mall.jpg',
    country: 'Dubai',
    city:'Viank',
    description: 'kjkfvmnvbnbvkgv',
    activities: activities,
  ),
   Destination(
    image: 'assests/images/duba3.jpg',
    country: 'Philipines',
    city:'Viank',
    description: 'kjkfvmnvbnbvkgv',
    activities: activities,
  ),
   Destination(
    image: 'assests/images/Dubai.jpg',
    country: 'South Africa',
    city:'Viank',
    description: 'kjkfvmnvbnbvkgv',
    activities: activities,
  ),
  Destination(
    image: 'assests/images/dubai2.jpg',
    country: 'South Africa',
    city:'Viank',
    description: 'kjkfvmnvbnbvkgv',
    activities: activities,
  ),
  Destination(
    image: 'assests/images/dubai6.jpg',
    country: 'South Africa',
    city:'Viank',
    description: 'kjkfvmnvbnbvkgv',
    activities: activities,
  ),
];