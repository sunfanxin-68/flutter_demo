import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  const StepperDemo({super.key});

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
   int _currentStep = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
              primaryColor: Colors.blueGrey,),
             child: Stepper(
              currentStep: _currentStep,
              onStepTapped: (int value) {
                setState(() {
                  _currentStep = value;
                });
              },
              onStepContinue: () {
                  setState(() {
                    _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  }
                  );
                  
            },
              steps:  [
                 Step(
                  title: Text('ログイン'),
                  subtitle: Text('ログインファースト'),
                  content: Text('手順１はメールアドレスを入力'),
                  isActive: _currentStep == 0,
                   ),
                    Step(
                  title: Text('プランを選ぶ'),
                  subtitle: Text('あなたのしたいプランを選択'),
                  content: Text('プランの紹介なオドなどなど'),
                  isActive: _currentStep == 1,
                   ),
                    Step(
                  title: Text('支払い方法'),
                  subtitle: Text('支払い方法を選択する'),
                  content: Text('電子マネーかバーコード決済とクレジッドカードなど'),
                  isActive: _currentStep == 2,
                   ),
              ],
              ),
            ),
          ],
        ),
      )
    );
  }
}