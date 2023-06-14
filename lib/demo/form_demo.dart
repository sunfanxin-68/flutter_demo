import 'package:flutter/material.dart';

// フォームのデモ
class FormDemo extends StatelessWidget {
  const FormDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffoldはウィジェットツリーの一部として表示される
    return Scaffold(
      body: Theme(
        data: ThemeData(
          primaryColor: Colors.green, // 主題の色を緑に設定
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0), // コンテナのパディングを16.0に設定
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center, // 子ウィジェットを中央に配置
            children: <Widget>[
              RegisterForm(), // 登録フォームウィジェットを挿入
            ],
          ),
        ),
      ),
    );
  }
}

// 登録フォームウィジェット
class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  RegisterFormState createState() => RegisterFormState(); // 状態を管理するための新しいStateオブジェクトを作成
}

class RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>(); // フォームのキー
  String username = '', password = ''; // ユーザーネームとパスワードの初期値を設定
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled; // 自動バリデーションを無効に設定

  // 登録フォームを送信する関数
  void submitRegisterForm() {
    if (registerFormKey.currentState!.validate()) { // フォームのすべてのフィールドを検証
      registerFormKey.currentState!.save(); // フォームの各フィールドを保存
      debugPrint('username: $username');
      debugPrint('password: $password');

      // ログイン中のスナックバーを表示
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('ログイン中...'),
      ));
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always; // フォームの検証に失敗したら、自動検証を有効に設定
      });
    }
  }

  // ユーザーネームを検証する関数
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'ユーザー名は空欄にできません'; // ユーザーネームが空の場合、エラーメッセージを返す
    }
    return null;
  }

  // パスワードを検証する関数
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードは空欄にできません'; // パスワードが空の場合、エラーメッセージを返す
    }
    return null;
  }

  // フォームを描画する関数
  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey, // フォームのキーを設定
      autovalidateMode: autovalidateMode, // 自動検証モードを設定
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
            validator: validateUsername, // ユーザーネームの検証関数を設定
          ),
          TextFormField(
            obscureText: true, // パスワードを隠すために設定
            decoration: const InputDecoration(
              labelText: 'パスワード',
              helperText: '',
            ),
            onSaved: (value) {
              password = value!;
            },
            validator: validatePassword, // パスワードの検証関数を設定
          ),
          const SizedBox(
            height: 32.0, // 高さを32.0に設定
          ),
          SizedBox(
            width: double.infinity, // 横幅を無限に設定
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.secondary), // ボタンの背景色を設定
              ),
              onPressed: submitRegisterForm, // ボタンを押したときに登録フォームを送信する関数を設定
              child: const Text('送信', style: TextStyle(color: Colors.white)), // ボタンのラベルを設定
            ),
          ),
        ],
      ),
    );
  }
}

