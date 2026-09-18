import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sebaka/core/routes/app_routes.dart';
import 'package:sebaka/core/utils/validators.dart';
import 'package:sebaka/core/widgets/app_button.dart';
import 'package:sebaka/core/widgets/app_text_form_field.dart';
import 'package:sebaka/features/signup/data/models/signup_request_model.dart';
import 'package:sebaka/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:sebaka/features/signup/presentation/cubit/signup_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignupPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<SignupCubit>().signup(
            SignupRequestModel(
              name: _nameController.text.trim(),
              email: _emailController.text.trim(),
              password: _passwordController.text,
              passwordConfirmation: _confirmPasswordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          } else if (state is SignupFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Create Account 🍽️',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Join Sebaka and discover amazing restaurants near you.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                  const SizedBox(height: 36),
                  AppTextFormField(
                    label: 'Full Name',
                    controller: _nameController,
                    validator: Validators.name,
                  ),
                  const SizedBox(height: 16),
                  AppTextFormField(
                    label: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email,
                  ),
                  const SizedBox(height: 16),
                  AppTextFormField(
                    label: 'Password',
                    controller: _passwordController,
                    obscureText: !_showPassword,
                    validator: Validators.password,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => _showPassword = !_showPassword),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppTextFormField(
                    label: 'Confirm Password',
                    controller: _confirmPasswordController,
                    obscureText: !_showConfirmPassword,
                    validator: Validators.confirmPassword(_passwordController.text),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () => setState(
                          () => _showConfirmPassword = !_showConfirmPassword),
                    ),
                  ),
                  const SizedBox(height: 36),
                  BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                      return AppButton(
                        label: 'Sign Up',
                        isLoading: state is SignupLoading,
                        onPressed: _onSignupPressed,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
