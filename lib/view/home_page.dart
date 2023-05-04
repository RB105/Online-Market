import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:changelang/provider/home_provider.dart';
import 'package:changelang/view/category/laptops_widget.dart';
import 'package:changelang/view/category/phones_widget.dart';
import 'package:changelang/view/category/wearables_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => HomeProvider(),
      builder: (context, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text("search".tr()),
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            actions: [
              Text(context.locale.languageCode.toString(),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              IconButton(
                  onPressed: () async {
                    Provider.of<HomeProvider>(context, listen: false)
                        .changeLang();
                    await context.setLocale(Locale(
                        Provider.of<HomeProvider>(context, listen: false).langs[
                            Provider.of<HomeProvider>(context, listen: false)
                                .currentIndex]));
                  },
                  icon: const Icon(Icons.language))
            ],
            bottom: TabBar(
              controller: _controller,
              tabs: [
              Text("wearable".tr(),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text("laptops".tr(),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text("phones".tr(),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))
            ]),
          ),
          body:  TabBarView(
            controller: _controller,
            children: pagesList), 
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                  onPressed: () {
                    if (AdaptiveTheme.of(context).mode ==
                        AdaptiveThemeMode.dark) {
                      AdaptiveTheme.of(context).setLight();
                    } else {
                      AdaptiveTheme.of(context).setDark();
                    }
                  },
                  label: const Text("Change Theme")),
            ],
          )),
    );
  }

  List<Widget> pagesList = [const WearablesWidget(),const LaptopsWidget(),const PhonesWidget()];
}
