import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_app/pages/crops_search.dart';

import 'blocs/crops/crops_bloc.dart';
import 'blocs/crops/crops_event.dart';
import 'blocs/crops/crops_repository.dart';
import 'blocs/filtered_crops/filtered_crops_bloc.dart';

void main() {
  // We can set a Bloc's observer to an instance of `SimpleBlocObserver`.
  // This will allow us to handle all transitions and errors in SimpleBlocObserver.
  //Bloc.observer = SimpleBlocObserver();
  runApp(BlocProvider(
    create: (context) => CropsBloc(CropsRepository())..add(CropsLoaded()),
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'sample App',
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FilteredCropsBloc(
                  cropsBloc: BlocProvider.of<CropsBloc>(context)),
            ),

          ],
          child: CropSearchPage(),
        ));
  }
}
