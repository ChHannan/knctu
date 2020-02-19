import 'package:knctu/models/user_model.dart';

class Message1 {
  final User sender;
  final String time; //DateTime or Timestamp
  final String text;
  final bool unread; 

Message1({
  this.sender,
  this.time,
  this.text,
  this.unread,

});

}

// current user
final User currentUser = User(
id: 0,
name: 'Current User',
imageUrl:'assets/images/customer-1.jpg'
);
//database
// other Users
final User sara = User(
  id: 1,
  name:'Sara',
  imageUrl:'assets/images/customer-2.jpg'
  );

final User tayyab = User(
  id: 2,
  name:'Tayyab',
  imageUrl: 'assets/images/customer-3.jpg'

);

final User kenna = User(
  id:3,
  name: 'Kenna',
  imageUrl: 'assets/images/customer-1.jpg'
  );

// Fav Contacts
List<User> favorites = [sara,tayyab,kenna,sara,tayyab,kenna];

// TEXT chat on home screen

List<Message1> chats= [
  Message1(
    sender:kenna,
    time: '5:30 PM',
    text: "I'll check into it, just give me some more information",
    unread:false,

  ),
  Message1(
    sender: sara,
    time:'4:30 PM',
    text: "That'll be great, thankyou",
    unread:false,
  ),
  Message1(
    sender: tayyab,
    time:'3:00 PM',
    text:'Where did you apply?',
    unread: true,


  ),
   Message1(
    sender:kenna,
    time: '3:00 PM',
    text: "Check these links I have provided",
    unread:false,

  ),
  Message1(
    sender: sara,
    time:'2:30 PM',
    text: 'okay',
    unread:true,
  ),
  /*Message1(
    sender: tayyab,
    time:'2:00 PM',
    text:' elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    unread: false,


  )*/
];


// Messages on an individual chat screen

List<Message1> messages = [

 /* Message1(
    sender: currentUser,
    time:'4:30 PM',
    text: 'consectetur adipiscing Ut enim ad minim veniam, qui',
    unread:true,
  ),*/
    Message1(
    sender:currentUser,
    time: '4:30 PM',
    text: "That'll be great, thankyou",
    unread:false,

  ),
  Message1(
    sender: sara,
    time:'3:27 PM',
    text:"Sure, I could give you all the information you need on NUST and could refer you to a friend of mine who could guide you better related to FAST",
    unread: false,


  ),
  Message1(
    sender: currentUser,
    time:'3:00 PM',
    text:'Its been alright, I was wondering if you could give me some insight on the pros and cons of CS in FAST and in NUST',
    unread: false,


  ),
   
  Message1(
    sender: sara,
    time:'2:00 PM',
    text: "It's been great and yours?" ,
    unread:false,
  ),
  Message1(
    sender: currentUser,
    time:'2:00 PM',
    text:'Hey!!! how has your day been?',
    unread: false,


  )

];