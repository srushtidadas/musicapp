import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicapp/model/item_lists.dart';
import 'package:musicapp/view/cart_scrren.dart';
import 'package:musicapp/view/favorite_screen.dart';
import 'package:musicapp/view/home_scrren.dart';
import 'package:musicapp/view/profile_Scrren.dart';
import 'package:musicapp/view/search_screen.dart';
import 'package:musicapp/view/temp.dart';

class Gallary extends StatefulWidget {
  const Gallary({super.key});
  State createState() => _GallaryState();
}

class _GallaryState extends State {
  int _selectedindex = 2;


  List<StatefulWidget>pages=[

   MusicPlayerPage(songsList:SongsList.favarateSongs, currentSongIndex:0),
    Player(),
    Home_Icon(),
    Cart(),
    Profile(),
  ];
  void onitemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 19, 19, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(19, 19, 19, 1),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: onitemTapped,
        currentIndex: _selectedindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
       body:pages[_selectedindex] ,
       // Center(
        
      //     child: Stack(
      //       children: [
      //         SizedBox(
      //           height: height,
      //           width: width,
      //         ),
      //         Image.asset(
      //           "asset/images/ss.png",
      //         ),
      //         const Positioned(
      //             left: 20,
      //             top: 225,
      //             child: const Text(
      //               "A.L.O.N.E",
      //               style: TextStyle(
      //                   fontSize: 36,
      //                   fontWeight: FontWeight.w600,
      //                   color: Colors.white),
      //             )),
      //         Positioned(
      //           top:280,
      //           left:22,
      //           child: GestureDetector(
      //             child: Container(
      //               width: 127,
      //               height: 37,
      //               decoration: BoxDecoration(
      //                   color: Color.fromRGBO(255, 46, 0, 1),
      //                   borderRadius: BorderRadius.all(Radius.circular(20))),
      //               child: const Center(
      //                   child: Text(
      //                 "Subscribe",
      //                 style: TextStyle(
      //                     color: Color.fromRGBO(19, 19, 19, 1),
      //                     fontWeight: FontWeight.w600,
      //                     fontSize: 20),
      //               )),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
        
      // ),
    );
  }
}
