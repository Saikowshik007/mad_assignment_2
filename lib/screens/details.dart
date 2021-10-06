import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mad_assignment_2/authentication.dart';
import 'package:transparent_image/transparent_image.dart';

class Details extends StatefulWidget {
  final QueryDocumentSnapshot userData;

  const Details({Key? key,required QueryDocumentSnapshot this.userData}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
   List _l=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: BackButton(onPressed: () {  Navigator.pop(context);},

          
        ),
      ),
      body:
          Center(child:
        ListView(
          children: [
            SizedBox(height:20),
            InkWell(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 100.0,
                child: CircleAvatar(
                  radius: 98.0,
                  child: ClipOval(
                      child:FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: widget.userData['Imageurl'], width: 200, height: 200, fit: BoxFit.cover) ),
                  backgroundColor: Colors.white,

                ),
              ),
            ),
            SizedBox(height: 70),

            Card(
              child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
                Container(
                    padding: EdgeInsets.all(10),
                  child: Icon(Icons.person,color: Colors.green)),
                Container(
                    padding: EdgeInsets.all(10),
                    child:Text(widget.userData['First name']+" "+widget.userData['Last name'],style: TextStyle(height: 1, fontSize: 20), ))]
              ),
            ),
            Card(
              child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
                Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.date_range,color: Colors.orange)),
                Container(
                    padding: EdgeInsets.all(10),
                    child:Text(widget.userData['Age'],style: TextStyle(height: 1, fontSize: 20),))]
              ),
            ),
            Card(
              child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
                Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.location_on,color: Colors.blueAccent,)),
                Container(
                    padding: EdgeInsets.all(10),
                    child:Text(widget.userData['Hometown'],style: TextStyle(height: 1, fontSize: 20),))]
              ),
            ),
            Card(child:
            ExpansionTile(title: Text("Bio"),leading: Icon(Icons.info_outline,color: Colors.amber,),subtitle: Text("Click to show"),
            children:[
            SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    scrollDirection: Axis.vertical,
                    child: Text(widget.userData['Bio'],style: TextStyle(height: 1, fontSize: 18),maxLines: null,),
                  ),

]
            )
            )
          ]



        ),
          )
    );
  }
}
