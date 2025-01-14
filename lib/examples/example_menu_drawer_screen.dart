import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jc_module/jc_module.dart';

@RoutePage()
class ExampleMenuDrawerScreen extends StatelessWidget {
  const ExampleMenuDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: JcColors.succ500,
        title: const Text('Example Menu Drawer'),
        actions: [
          JcCardOnline(
            name: 'Online',
            color: JcColors.succ700,
            onPressed: () {},
            backgroundColor: JcColors.succ600,
          ),
        ],
      ),
      drawer: Drawer(
        child: JcMenuDrawer(
          onPressed: () {},
          optionsMenu: [
            OptionMenu(
              iconData: Icons.home,
              label: 'Home',
              subOptionMenu: [
                SubOptionMenu(
                  label: 'Home 1',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: JcMenuDrawer(
          onPressed: () {},
          optionsMenu: [
            OptionMenu(
              iconData: Icons.home,
              label: 'Perfil',
              subOptionMenu: [
                SubOptionMenu(
                  label: 'Mis datos',
                  onPressed: () {},
                ),
                SubOptionMenu(
                  label: 'Aprendizaje',
                  onPressed: () {},
                ),
              ],
            ),
            OptionMenu(
              iconData: Icons.account_circle_rounded,
              label: 'Transferir puntos',
              subOptionMenu: [
                SubOptionMenu(
                  label: 'Home 1',
                  onPressed: () {},
                ),
              ],
            ),
            OptionMenu(
              iconData: Icons.account_circle_rounded,
              label: 'Reporte',
              subOptionMenu: [
                SubOptionMenu(
                  label: 'Home 1',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
