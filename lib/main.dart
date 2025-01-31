import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:protetor_digital_prototipo/features/cards/cards_screen.dart';
import 'package:protetor_digital_prototipo/features/message_analyzer/message_analyzer_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const OnBoardingPage(),
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
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
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
          title: "Bem-vindo(a) ao app do Protetor digital!",
          body:
              "Aprenda os melhores métodos de prevenção contra os golpistas de forma simples e remota com nosso app.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Como funciona?\n\nLista de checagem de segurança",
          body:
              "Aplique o que aprendeu com listas de tarefas simples e organizadas por temas. Desde identificar e-mails suspeitos até manter suas redes sociais protegidas, você terá tudo o que precisa.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Como funciona?\n\nCartilha de segurança",
          body:
              "Descubra tutoriais e informações simples sobre temas como fraudes, phishing, senhas seguras e muito mais. Todo o conteúdo é fácil de entender e feito para  guiar você em um passo a passo.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Como funciona?\n\nAnálise de mensagens suspeitas",
          body:
              "Recebeu uma mensagem que parece estranha? Cole o texto aqui e deixe nosso sistema verificar o nível de segurança. Vamos te orientar sobre o que fazer para se proteger.",
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      baseBtnStyle: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.purple),
      next: const Text("Próximo"),
      done: const Text('Vamos começar!',
          style: TextStyle(fontWeight: FontWeight.w600)),
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
        title: const Text('Protetor Digital'),
      ),
      body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CardsScreen()),
            );
          },
          child: const Text('Golpes Comuns'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MessageAnalyzerScreen()),
            );
          },
          child: const Text('Análise de Mensagens'),
        )
      ])),
    );
  }
}
