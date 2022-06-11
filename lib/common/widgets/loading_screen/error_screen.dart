import 'package:flutter/material.dart';
import 'package:idttest/common/app_colors.dart';

///[LoadingScreen] is the is widget shown when when Screen is fetching data from API
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.kPrimary),
    );
  }
}
