import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:seekr/bloc/theme_bloc.dart';
import 'package:seekr/ui/pages/pages.dart';

import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: null,
      child: MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (_) => PageBloc(),
          // ),
          // BlocProvider(
          //   create: (_) => UserBloc(),
          // ),
          BlocProvider(
            create: (_) => ThemeBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) => MaterialApp(
              theme: themeState.themeData,
              debugShowCheckedModeBanner: false,
              home: SplashPage()),
        ),
      ),
    );
  }
}
