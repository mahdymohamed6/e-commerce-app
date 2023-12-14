import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FORGOT',
                style: TextStyle(color: Colors.white60, fontSize: 19),
              ),
              Text(
                'PASSWORD',
                style: TextStyle(color: Colors.white60, fontSize: 19),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push('/SignUp');
            },
            child: const Text(
              'SIGN UP',
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
