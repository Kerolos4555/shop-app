import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop_cubit/shop_cubit.dart';
import 'package:shop_app/cubits/shop_cubit/shop_state.dart';
import 'package:shop_app/helper/cached_helper.dart';
import 'package:shop_app/pages/login_page.dart';
import 'package:shop_app/widgets/custom_material_button.dart';
import 'package:shop_app/widgets/custom_text_form_field.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        nameController.text = ShopCubit.get(context).userModel!.data!.name;
        emailController.text = ShopCubit.get(context).userModel!.data!.email;
        phoneController.text = ShopCubit.get(context).userModel!.data!.phone;
        return ShopCubit.get(context).userModel != null
            ? SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        if (state is ShopUpdateProfileLoadingState)
                          const LinearProgressIndicator(
                            color: Colors.blue,
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          labelText: 'Name',
                          hintText: 'name',
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          prefix: Icons.person_outlined,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          labelText: 'Email',
                          hintText: 'email',
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          labelText: 'Phone',
                          hintText: 'phone',
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone';
                            }
                            return null;
                          },
                          prefix: Icons.phone,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomMaterialButton(
                          title: 'UPDATE',
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              ShopCubit.get(context).updateUserProfile(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomMaterialButton(
                          title: 'LOGOUT',
                          onPress: () {
                            CachedHelper.removeData(key: 'token').then(
                              (value) {
                                if (value) {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const LoginPage();
                                      },
                                    ),
                                    (route) => false,
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
      },
    );
  }
}
