import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_app_ui_kit/core/router_generator.dart';
import 'package:login_register_app_ui_kit/core/state_manager/theme_bloc.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return const ApplicationWithTheme();
  }
}

class ApplicationWithTheme extends StatelessWidget {
  const ApplicationWithTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: "FruzzDigital",
            theme: theme,
            debugShowCheckedModeBanner: false,
            initialRoute: RouterGenerator.splashRoute,
            navigatorObservers: [routeObserver],
            onGenerateRoute: (RouteSettings setting) {
              return RouterGenerator.navigate(setting);
            },
          );
        },
      ),
    );
  }
}
