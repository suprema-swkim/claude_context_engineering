// 패턴 2: AsyncNotifierProvider를 사용하는 Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'async_login_page_vm.dart';

class AsyncLoginPage extends ConsumerWidget {
  const AsyncLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(asyncLoginPageNotifierProvider.notifier);
    final asyncState = ref.watch(asyncLoginPageNotifierProvider);

    // 로그인 성공 시 홈으로 이동
    ref.listen(asyncLoginPageNotifierProvider, (previous, next) {
      next.whenData((result) {
        if (result.isSuccess) {
          context.go('/home');
        }
      });
    });

    return Scaffold(
      appBar: AppBar(title: const Text('로그인 (Async)')),
      body: asyncState.when(
        data: (result) => AsyncLoginForm(
          onSubmit: notifier.login,
          errorMessage: null,
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => AsyncLoginForm(
          onSubmit: notifier.login,
          errorMessage: error.toString().replaceFirst('Exception: ', ''),
        ),
      ),
    );
  }
}

class AsyncLoginForm extends StatefulWidget {
  final Future<void> Function(String email, String password) onSubmit;
  final String? errorMessage;

  const AsyncLoginForm({
    super.key,
    required this.onSubmit,
    this.errorMessage,
  });

  @override
  State<AsyncLoginForm> createState() => _AsyncLoginFormState();
}

class _AsyncLoginFormState extends State<AsyncLoginForm> {
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
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red.shade700),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.errorMessage!,
                      style: TextStyle(color: Colors.red.shade700),
                    ),
                  ),
                ],
              ),
            ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: '이메일',
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: '비밀번호',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => widget.onSubmit(
                _emailController.text,
                _passwordController.text,
              ),
              child: const Text('로그인'),
            ),
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

