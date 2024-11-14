import 'package:flutter/material.dart';
import 'package:minimal_ecommerse_app/components/list_tiles.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //drawer header
          Column(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
              const SizedBox(
                height: 25,
              ),
              //shop tile
              MyTiles(
                  text: 'Shop',
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context)),
              //cart tile
              MyTiles(
                  text: 'Cart',
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  }),
            ],
          ),
          //exit
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyTiles(
                text: 'Exit',
                icon: Icons.exit_to_app,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/intro_page', (route) => false)),
          )
        ],
      ),
    );
  }
}
