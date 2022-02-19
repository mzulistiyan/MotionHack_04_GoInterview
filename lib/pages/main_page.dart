import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/auth_cubit.dart';
import 'package:flutter_application_motionhack/cubit/page_cubit.dart';
import 'package:flutter_application_motionhack/pages/home_page.dart';
import 'package:flutter_application_motionhack/pages/interviewer_list_page.dart';
import 'package:flutter_application_motionhack/pages/order_status_page.dart';
import 'package:flutter_application_motionhack/pages/profile_page.dart';
import 'package:flutter_application_motionhack/pages/widget/custom_bottom_nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return InterviewerListPage();
          break;
        case 2:
          return OrderStatusPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    Widget CustomButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            color: Color(0xff0353A4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNav(
                index: 0,
                imageUrl: 'assets/home.png',
              ),
              CustomBottomNav(
                index: 1,
                imageUrl: 'assets/list.png',
              ),
              CustomBottomNav(
                index: 2,
                imageUrl: 'assets/clipboard.png',
              ),
              CustomBottomNav(
                index: 3,
                imageUrl: 'assets/user.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              buildContent(currentIndex),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess && state.user.level == 2) {
                    return SizedBox();
                  }
                  return CustomButtonNavigation();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
