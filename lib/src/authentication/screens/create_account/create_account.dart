import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/create_account/create_account_bloc.dart';
import '../../bloc/create_account/page_controller/create_account_page_controller_cubit.dart';

import 'personal_dtl_screen.dart';
import 'login_dtl_screen.dart';
import 'data_privacy_screen.dart';
import 'finalize_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  final pageController = PageController(
    initialPage: 0,
    keepPage: false,
  );

  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double kProgressWidth = 180;

    List<Widget> pageViews = [
      PersonalDtlScreen(
        pageController: pageController,
        firstNameController: firstNameController,
        lastNameController: lastNameController,
        emailController: emailController,
      ),
      LoginDtlScreen(
        pageController: pageController,
        emailController: emailController,
        passwordController: passwordController,
      ),
      DataPrivacyScreen(
        pageController: pageController,
      ),
      FinalizeScreen(
        firstNameController: firstNameController,
        lastNameController: lastNameController,
        emailController: emailController,
        phoneNumberController: phoneNumberController,
      ),
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CreateAccountPageControllerCubit()),
        BlocProvider(create: (context) => CreateAccountBloc()),
      ],
      child: BlocListener<CreateAccountBloc, CreateAccountState>(
        listener: (context, state) {},
        child: BlocBuilder<CreateAccountPageControllerCubit, int>(
          builder: (context, index) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).colorScheme.background,
                foregroundColor: Theme.of(context).colorScheme.onBackground,
                leading: IconButton(
                  onPressed: () {
                    if (index == 0) {
                      Navigator.pop(context);
                      return;
                    }

                    BlocProvider.of<CreateAccountPageControllerCubit>(context)
                        .togglePage(context, pageController, index, index - 1);
                  },
                  icon: const Icon(FontAwesomeIcons.arrowLeft),
                ),
                elevation: 0.0,
                title: Stack(
                  children: [
                    Container(
                      height: 2.0,
                      width: kProgressWidth,
                      color: const Color.fromARGB(255, 186, 186, 186),
                    ),
                    Positioned(
                      left: 0,
                      child: Container(
                        height: 2.0,
                        width: kProgressWidth * 0.25 * (index + 1),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        '${index + 1}/4',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  )
                ],
              ),
              body: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                itemCount: pageViews.length,
                itemBuilder: (context, index) {
                  return pageViews[index];
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
