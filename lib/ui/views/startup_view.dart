import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../viewmodels/startup_view_model.dart';


class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return ViewModelBuilder<StartUpViewModel>.reactive(
        viewModelBuilder: () => StartUpViewModel(),
        onModelReady: (model)=> model.handleStartupLogic(),
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: <Widget>[
                  SizedBox(
                    width: 300,
                    height: 100,
                    child: Image.asset("assets/images/gift.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:40.0),
                    child: CircularProgressIndicator(strokeWidth: 8,valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),),
                  )
                ],
              ),
            )));
  }
}
