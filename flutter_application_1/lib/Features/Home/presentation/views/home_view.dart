import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Home/presentation/views/manager/HomeCubit/cubit/home_cubit.dart';
import 'package:flutter_application_1/Features/Home/presentation/widgets/home_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<HomeCubit>(context).emitProducts();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return const HomeViewBody();
  }
}
