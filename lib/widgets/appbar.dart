import 'package:flutter/material.dart';

 class MyappBar extends StatelessWidget {
   final String title;
   final GlobalKey<ScaffoldState> scaffoldKey;
    final VoidCallback onNotificationTap;
    final VoidCallback onLoginTap;
    MyappBar({
    required this.title,
      required this.scaffoldKey,
      required this.onNotificationTap,
      required this.onLoginTap
 });




   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text(
           title,
             textAlign: TextAlign.center
         ),
         backgroundColor: Colors.white60,
         leading: IconButton(
           icon: Icon(Icons.person_off_rounded, color: Colors.deepOrange,),
        onPressed: (){
             scaffoldKey.currentState?.openDrawer();
        },
         ),
          actions: <Widget> [
            IconButton(onPressed: onNotificationTap,
                icon: Icon(
                  Icons.doorbell_rounded,
                  color: Colors.yellowAccent,
                )),
            TextButton(onPressed: onLoginTap,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                child: Text('Login',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ))

          ],


       ),
     );
   }
 }

