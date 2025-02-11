import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/profile/profile_bloc.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context)
        .add(const ProfileEvent.getProfileDetails());
    return Column(
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
        ),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Text(
              state.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
        ),
      ],
    );
  }
}
