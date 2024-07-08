import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;


  const CustomBottomNavbar({
    required this.currentIndex,
    required this.onTap

});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.purpleAccent,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.white60,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,

      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_max_sharp,
            color: currentIndex == 0 ? Colors.blueAccent : Colors.red,

          ),label: 'Home'
        ),

        BottomNavigationBarItem(icon: Icon(Icons.travel_explore,
        color: currentIndex == 1 ? Colors.black : Colors.red,
        ),
        label: 'MyTrips'
        ),

        BottomNavigationBarItem(icon: Icon(Icons.wallet_giftcard,
          color: currentIndex == 2 ? Colors.black : Colors.red,
        ),
            label: 'MyWallet'
        ),

        BottomNavigationBarItem(icon: Icon(Icons.headset_mic,
          color: currentIndex == 3 ? Colors.black : Colors.red,
        ),
            label: 'Support'
        ),
      ],
    );
  }
}