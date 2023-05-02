import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    required this.errorMessage,
    required this.onPressed,
    super.key,
  });

  final String errorMessage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(
              Icons.error,
              color: Color(0xffed1c24),
              size: 100.0,
            ),
            const SizedBox(height: 20.0),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                  onPressed: onPressed, child: const Text("Retry")),
            )
          ],
        ),
      ),
    );
  }
}
