  import 'package:flutter/material.dart';

AppBar categoryAppBar(BuildContext context,String category) {
    return AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            category,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        );
  }
