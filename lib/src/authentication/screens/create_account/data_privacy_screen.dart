import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_input_text.dart';
import 'package:maya_clone_app/utils/constants.dart';

import '../../bloc/page_controller/page_controller_cubit.dart';
import '../shared/auth_hidden_text.dart';
import '../shared/auth_primary_btn.dart';

class DataPrivacyScreen extends StatelessWidget {
  final PageController pageController;

  const DataPrivacyScreen({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageControllerCubit, int>(
      builder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Data Privacy',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.circleInfo,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const Text('Learn about our policy'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                  'Before you can use Maya, please make sure to read our Terms and Conditions and Privacy Policy below.',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: 30,
              ),
              const TCCardBox(),
              const Spacer(),
              Text(
                'By continuing, I consent to the above Terms and Conditions and Privacy Policy.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      fontSizeDelta: 1.5,
                    ),
              ),
              const SizedBox(
                height: 15,
              ),
              AuthPrimaryBtn(
                label: 'Continue',
                onTap: () {
                  context
                      .read<PageControllerCubit>()
                      .togglePage(context, pageController, index, index + 1);
                },
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        );
      },
    );
  }
}

class TCCardBox extends StatelessWidget {
  const TCCardBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      width: MediaQuery.of(context).size.width < 768 ? double.infinity : 768,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRaduis),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 236, 231, 231),
            offset: Offset(
              0.5,
              0.5,
            ),
            blurRadius: 5.0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 15.0,
            ),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.fileLines,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Terms and conditions',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                const Icon(
                  FontAwesomeIcons.angleRight,
                  size: 20,
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 15.0,
            ),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.shieldHalved,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Privacy Policy',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                const Icon(
                  FontAwesomeIcons.angleRight,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
