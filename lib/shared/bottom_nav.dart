import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.graduationCap,
            size: 20,
          ),
          label: 'Topics',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.bolt,
            size: 20,
          ),
          label: 'About',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.circleUser,
            size: 20,
          ),
          label: 'Profile',
        ),
        
      ],    
      fixedColor: Colors.deepPurple[200],
      onTap: (int idx){
        if (idx == 0) {
          // do nothing for now
          //Navigator.pushNamed(context, '/topics');
        } else if (idx == 1) {
          Navigator.pushNamed(context, '/about');
        } else if (idx == 2) {
          Navigator.pushNamed(context, '/profile');
        }
      },  
    );
  }
}