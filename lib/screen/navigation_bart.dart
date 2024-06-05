// import 'package:flutter/material.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({Key? key}) : super(key: key);

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   List halaman = [
//     const Home(),
//     const MenanamScreen(),
//     const Pengingat(),
//     const Riwayat(),
//   ];

//   int selectedIndex = 0;

//   void selectPage(int index){
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage(NavBarImageIcon.home_NavbarIcon),
//             ),
//             label: 'Beranda',
//           ),

//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage(NavBarImageIcon.tanaman_NavbarIcon),
//             ),
//             label: 'Tanaman',
//           ),

//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage(NavBarImageIcon.pengingat_NavbarIcon)
//             ),
//             label: 'Pengingat',
//           ),

//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage(
//                   NavBarImageIcon.riwayat_NavbarIcon),
//             ),
//             label: 'Riwayat',
//           ),
//         ],
//         currentIndex: selectedIndex,
//         // selectedIconTheme: IconThemeData(color: Color(0xff448E75)),
//         selectedItemColor: const Color(0xff448E75),
//         type: BottomNavigationBarType.fixed,
//         onTap: selectPage,
//       ),
//       body: halaman.elementAt(selectedIndex),
//     );
//   }
// }