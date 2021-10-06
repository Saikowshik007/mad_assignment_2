import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_assignment_2/authentication.dart';
import 'package:otp_text_field/style.dart';
import 'package:transparent_image/transparent_image.dart';

import 'details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _instance=Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Home"),
        actions: [IconButton(

          padding: EdgeInsets.only(right: 20.0),
         icon: Icon(Icons.logout), onPressed: () {_instance.signout();  },
        ),
        ]
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Authentication().collectionStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap:(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Details( userData: snapshot.data!.docs[index])));
                }),
                child:Card(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10),
                        Container(
                            child: Row(
                              children:[
                               InkWell(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 45.0,
                                  child: CircleAvatar(
                                    radius: 43.0,
                                      child: ClipOval(
                                        child:FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: snapshot.data!.docs[index]['Imageurl'], width: 100, height: 100, fit: BoxFit.cover) ),
                                    backgroundColor: Colors.white,

                                  ),
                                ),
                              ),
                               SizedBox(width: 20),
                               Column(
                                 children:[
                                   Container(
                                     child:Text("Username :"+snapshot.data!.docs[index]['First name']+" " + snapshot.data!.docs[index]['Last name']),
                                 ),
                                SizedBox(height: 20,),
                                Container(
                                    child: Text("Date Joined: "+snapshot.data!.docs[index]['Date']+" At:  " + snapshot.data!.docs[index]['Time'])
                                )
                                   ]
                               )

                              ],


                            )

                        ),
                        SizedBox(height: 20),
                      ]
                  ),
                )
                );
              }
    );
    }
    ),

    );
  }
}
