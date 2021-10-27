import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_api1/bloc/WeatherBloc.dart';
import 'package:flutter_app_bloc_api1/bloc/WeatherEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/WeatherState.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(WeatherEvent.FETCH_WEATHER);
    return Scaffold(
      body: SafeArea(child: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherSuccessState) {
              var successState = state as WeatherSuccessState;
              return Image.network(successState
                  .weatherSuccessResponse!.current!.weather_icons![0]);
            } else if (state is WeatherErrorState) {
              var errorState = state;
              return Text(errorState.weatherErrorResponse!.error!.info!);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      )),
    );
  }
}
