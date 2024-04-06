import 'package:shop_app/cubits/register_cubit/register_cubit.dart';
import 'package:shop_app/cubits/register_cubit/register_state.dart';
import 'package:shop_app/helper/cached_helper.dart';
import 'package:shop_app/layouts/home_layout.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/widgets/custom_material_button.dart';
import 'package:shop_app/widgets/custom_text_form_field.dart';
import 'package:shop_app/shared/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.loginModel.status) {
              CachedHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                token = state.loginModel.data!.token;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeLayout();
                    },
                  ),
                  (route) {
                    return false;
                  },
                );
              }).catchError((error) {
                debugPrint('There was an error when save token');
              });
            } else {
              showSnackBar(context, state.loginModel.message!);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Text(
                          'Login Now to browse our hot offers.',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          labelText: 'Name',
                          hintText: 'Enter your name',
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                          prefix: Icons.person_2_outlined,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Email';
                            }
                            return null;
                          },
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                          isVisible: RegisterCubit.get(context).isVisible,
                          prefix: Icons.lock_outline,
                          suffix: RegisterCubit.get(context).suffix,
                          onSuffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordSuffixIcon();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          labelText: 'Phone',
                          hintText: 'Enter your phone number',
                          controller: phoneController,
                          type: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Number';
                            }
                            return null;
                          },
                          prefix: Icons.phone_android_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        state is! RegisterLoadingState
                            ? CustomMaterialButton(
                                title: 'REGISTER',
                                onPress: () {
                                  if (formKey.currentState!.validate()) {
                                    RegisterCubit.get(context).userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
