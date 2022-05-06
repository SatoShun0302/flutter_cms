import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cms/features/single_data/view/create_new_article.dart';
import 'package:flutter_cms/utils/screen_env.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_cms/firebase_options.dart';

import 'features/single_data/view/view_article.dart';

void main() async {
  // main関数での非同期処理を可能にする
  WidgetsFlutterBinding.ensureInitialized();
  // 端末の向きを縦で固定する
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /**
   * Firebase
   */
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
    MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'top',
        path: '/',
        builder: (context, state) => const MyHomePage(title: '',),
      ),
      GoRoute(
        name: 'page2',
        path: '/page2',
        builder: (context, state) => const ViewArticle(),
      ),
      GoRoute(
        name: 'page3',
        path: '/page3',
        builder: (context, state) => CreateNewArticle(),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 画面サイズを格納
    ScreenEnv.deviceWidth = MediaQuery.of(context).size.width;
    ScreenEnv.deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FloatingActionButton(
              onPressed: () => {
                context.go('/page2')
            },
              tooltip: '画面遷移',
              heroTag: "hero1",
              child: const Icon(Icons.all_inclusive),
            ),
            FloatingActionButton(
              onPressed: () => {
                context.go('/page3')
              },
              tooltip: '新規作成',
              heroTag: "hero2",
              child: const Icon(Icons.all_inclusive),
            ),
          ],
        ),
      ),

    );
  }
}
