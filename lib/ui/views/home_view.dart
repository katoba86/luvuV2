import 'package:flutter/material.dart';
import '../../viewmodels/home_view_model.dart';
import '../../painter/default_paint.dart';
import 'package:stacked/stacked.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) =>
            Scaffold(

                body: CustomPaint(
                    painter: DefaultPaint(),
                    child: Stack(
                        children: <Widget>[

                          Text(model.currentUser!.email)
                        ]
                    )
                )
            )
    );
  }
}