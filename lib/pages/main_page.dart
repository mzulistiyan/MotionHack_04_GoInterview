// import 'package:flutter/material.dart';
// import 'package:flutter_application_motionhack/cubit/page_cubit.dart';
// import 'package:flutter_application_motionhack/pages/widget/custom_bottom_nav.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Widget buildContent(int currentIndex) {
//       switch (currentIndex) {
//         case 0:
//           return HomePage();
//           break;
//         case 1:
//           return TransactionPage();
//           break;
//         case 2:
//           return WalletPage();
//           break;
//         case 3:
//           return SettingPage();
//           break;
//         default:
//           return HomePage();
//       }
//     }

//     Widget CustomButtonNavigation() {
//       return Align(
//         alignment: Alignment.bottomCenter,
//         child: Container(
//           width: double.infinity,
//           height: 60,
//           margin: EdgeInsets.only(
//               bottom: 30, left: 12, right: 12, top: 30),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               CustomBottomNav(
//                 index: 0,
//                 imageUrl: 'assets/icon_home.png',
//               ),
//               CustomBottomNav(
//                 index: 1,
//                 imageUrl: 'assets/icon_booking.png',
//               ),
//               CustomBottomNav(
//                 index: 2,
//                 imageUrl: 'assets/icon_card.png',
//               ),
//               CustomBottomNav(
//                 index: 3,
//                 imageUrl: 'assets/icon_settings.png',
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     return BlocBuilder<PageCubit, int>(
//       builder: (context, currentIndex) {
//         return Scaffold(
//           backgroundColor: Colors.w,
//           body: Stack(
//             children: [
//               buildContent(currentIndex),
//               CustomButtonNavigation(),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
