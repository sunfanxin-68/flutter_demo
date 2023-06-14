import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  const FormDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('FormDemo'),
      //   elevation: 0.0,
      // ),
      body: Theme(
        data: ThemeData(
          primaryColor: Colors.green,
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username = '', password = '';
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void submitRegisterForm() {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      debugPrint('username: $username');
      debugPrint('password: $password');

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
       content: Text('ログイン中...'),
      )
      );

    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'ユーザー名は空欄にできません';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードは空欄にできません';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'ユーザーネーム',
              helperText: '',
            ),
            onSaved: (value) {
              username = value!;
            },
            validator: validateUsername,
            //autovalidateMode: AutovalidateMode.disabled,
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'パスワード',
              helperText: '',
            ),
            onSaved: (value) {
              password = value!;
            },
            validator: validatePassword,
          ),
          const SizedBox(
            height: 32.0,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.secondary),
              ),
              onPressed: submitRegisterForm,
              child: const Text('送信', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('input: ${textEditingController.text}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,

        //  onChanged: (value) {
        //   debugPrint('input: $value');
        // },
        //    onSubmitted: (value) {
        //   debugPrint('submit: $value');
        // },
        decoration: const InputDecoration(
          icon: Icon(Icons.subject),
          labelText: '标签',
          hintText: '提示输入',
          // border: InputBorder.none,
          border: OutlineInputBorder(), //边框效果
          filled: true,
        ));
  }
}

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
