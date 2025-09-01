import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:protetor_digital_prototipo/features/cards/cards_screen.dart';
import 'package:protetor_digital_prototipo/features/message_analyzer/message_analyzer_screen.dart';
import 'package:protetor_digital_prototipo/features/useful_links/useful_links_screen.dart';
import 'package:protetor_digital_prototipo/features/checklists/checklist_screen.dart';

void main() => runApp(const App());

const Color primaryColor = Color(0xFF1A365D); // hsl(222.2 47.4% 11.2%)
const Color secondaryColor = Color(0xFFE2E8F0); // hsl(210 40% 96.1%)

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Protetor Digital',
      debugShowCheckedModeBanner: false,
      home: const OnBoardingPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: secondaryColor,
          background: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 22.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: 'Proteção Contra Golpes',
          body: 'Aprenda a reconhecer e evitar golpes online',
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Listas de Segurança',
          body: 'Confira se você está protegido seguindo dicas simples',
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Análise de Mensagens',
          body: 'Descubra se uma mensagem pode ser perigosa',
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Ajuda Rápida',
          body: 'Encontre onde pedir ajuda quando precisar',
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      baseBtnStyle: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: primaryColor),
      next: const Text("Próximo", style: TextStyle(fontSize: 18.0)),
      done: const Text('Vamos começar!',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Protetor Digital', style: TextStyle(fontSize: 22.0)),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const Text(
                  'Segurança online',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Aprenda a se proteger de golpes digitais',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9), fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  _buildFeatureCard(
                    context,
                    Icons.article,
                    'Cartões Educativos',
                    () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const CardsScreen())),
                  ),
                  _buildFeatureCard(
                    context,
                    Icons.checklist,
                    'Listas de Proteção',
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ChecklistScreen())),
                  ),
                  _buildFeatureCard(
                    context,
                    Icons.analytics,
                    'Verificador de Mensagens',
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MessageAnalyzerScreen())),
                  ),
                  _buildFeatureCard(
                    context,
                    Icons.link,
                    'Contatos Úteis',
                    () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UsefulLinksScreen())),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        hoverColor: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 44, color: Theme.of(context).primaryColor),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                _getDescription(title),
                style: TextStyle(
                    fontSize: 16, color: Colors.grey[600], height: 1.3),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDescription(String title) {
    switch (title) {
      case 'Cartões Educativos':
        return 'Conheça os golpes mais comuns';
      case 'Listas de Proteção':
        return 'Veja se você está seguindo as dicas de segurança';
      case 'Verificador de Mensagens':
        return 'Descubra se uma mensagem pode ser um golpe';
      case 'Contatos Úteis':
        return 'Obtenha ajuda quando necessário';
      default:
        return '';
    }
  }
}
