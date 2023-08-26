import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showInternetDialog(BuildContext context, String err) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text(err),
            content: const Text('Please check your internet connectivity'),
            actions: [
              TextButton(
                onPressed: () async {
                  GoRouter.of(context).pop();
                },
                child: const Text('ok'),
              ),
            ],
          ));
}
