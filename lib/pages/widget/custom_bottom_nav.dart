import 'package:flutter/material.dart';
import 'package:flutter_application_motionhack/cubit/page_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNav extends StatelessWidget {
  final int index;
  final String imageUrl;

  const CustomBottomNav({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
                color: context.read<PageCubit>().state == index
                    ? Color(0xff7BAFFE)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12)),
          ),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? Colors.white
                : Colors.white,
          ),
          SizedBox()
        ],
      ),
    );
  }
}
