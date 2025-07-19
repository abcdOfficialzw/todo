import 'package:flutter/material.dart';

import '../constants/dimens.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgrounds/landing-page-background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: CircularProgressIndicator(),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Padding(
                          padding: EdgeInsets.all(Dimens.padding.small),
                          child: Image.asset("assets/nrzcpf-logo.png"),
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: Dimens.spacing.large,
            ),
            Text(
              "Loading Claims...",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              height: Dimens.spacing.small,
            ),
            Text(
              "This could take a few seconds. Hang tight",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Colors.white.withAlpha(150)),
            )
          ],
        ),
      ),
    );
  }
}
