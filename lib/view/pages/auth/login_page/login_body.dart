import 'package:flutter/material.dart';
import 'package:flutter_riverpod_blog_start/core/utils/validator_util.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_elevated_button.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_text_form_field.dart';

class LoginBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            child: const Text(
              "로그인 페이지",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _loginForm(context), // 추가
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {}
            },
          ),
          TextButton(
            onPressed: () {},
            child: const Text("아직 회원가입이 안되어 있나요?"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("홈페이지 로그인 없이 가보는 테스트"),
          ),
        ],
      ),
    );
  }
}
