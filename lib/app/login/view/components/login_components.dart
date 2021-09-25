part of '../login_view.dart';

extension SnackBarWidget on LoginView {
  ScaffoldFeatureController buildSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }
}

extension TextFieldWidget on LoginView {
  Widget buildTextField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: validator,
    );
  }

  String? validator(value) {
    if (value == null || value.isEmpty) {
      return 'Enter a value';
    } else {
      return null;
    }
  }
}

extension LoginButton on LoginView {
  Widget buildButton(BuildContext context, LoginState state) {
    return ElevatedButton(
      onPressed: () => buildOnPressed(context),
      child: buildChild(state),
    );
  }

  Future<void> buildOnPressed(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      context
          .read<LoginCubit>()
          .onPressedLogin(emailController, passwordController);
    }
  }

  Widget buildChild(LoginState state) {
    return state is LoginLoading
        ? CircularProgressIndicator.adaptive()
        : Text('Login');
  }
}
