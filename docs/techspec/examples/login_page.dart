// 패턴 1: 일반 상태를 사용하는 Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'login_page_vm.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginPageNotifierProvider.notifier);
    final state = ref.watch(loginPageNotifierProvider);

    // 로그인 성공 시 홈으로 이동
    ref.listen(loginPageNotifierProvider, (previous, next) {
      if (next.isSuccess) {
        // 홈 화면으로 이동
        context.go('/home');
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Stack(
        children: [
          LoginForm(
            onSubmit: notifier.login,
            errorMessage: state.errorMessage,
          ),
          if (state.isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final Future<void> Function(String email, String password) onSubmit;
  final String? errorMessage;

  const LoginForm({
    super.key,
    required this.onSubmit,
    this.errorMessage,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.errorMessage != null)
            Text(
              widget.errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: '이메일'),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: '비밀번호'),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => widget.onSubmit(
              _emailController.text,
              _passwordController.text,
            ),
            child: const Text('로그인'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
