import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/utils/constants/dimens.dart';
import 'package:todo/utils/widgets/expanded_primary_button.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Dimens.padding.medium)
                .copyWith(top: Dimens.padding.veryLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/todo-logo.png",
                      width: 50,
                    ),
                    Text(
                      "2do",
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
                SizedBox(
                  height: Dimens.spacing.medium,
                ),
                Image.asset(
                  "assets/undraw_completed-tasks_1j9z 1.png",
                  width: 400,
                ),
                SizedBox(
                  height: Dimens.spacing.medium,
                ),
                Text(
                  "Remember everything, do anything with 2do!",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Dimens.spacing.extremeSpacing,
                ),
                ExpandedPrimaryButton(
                  "Continue",
                  onPressed: () {
                    context.goNamed("home");
                  },
                ),

                // Terms of Service and Privacy Policy
                SizedBox(
                  height: Dimens.spacing.medium,
                ),
                Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        text: "By continuing, you agree to our ",
                        children: [
                          TextSpan(
                              text: "Terms of Service",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      decoration: TextDecoration.underline)),
                          const TextSpan(text: " and "),
                          TextSpan(
                              text: "Privacy Policy",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      decoration: TextDecoration.underline)),
                        ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
