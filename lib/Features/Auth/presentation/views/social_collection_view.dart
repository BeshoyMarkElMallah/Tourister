import 'package:flutter/material.dart';
import 'package:tourister/Features/Auth/presentation/views/widgets/social_collection_body.dart';

class SocialCollectionView extends StatelessWidget {
  const SocialCollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SocialCollectionBody(),
      ),
    );
  }
}
