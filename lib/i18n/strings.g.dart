/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 46
///
/// Built on 2025-03-11 at 02:18 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  en(languageCode: 'en', build: Translations.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, Translations> build;

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  // Translations
  late final _StringsIntroductionScreenEn introductionScreen =
      _StringsIntroductionScreenEn._(_root);
  late final _StringsCardsScreenEn cardsScreen = _StringsCardsScreenEn._(_root);
  late final _StringsMessageAnalyzerScreenEn messageAnalyzerScreen =
      _StringsMessageAnalyzerScreenEn._(_root);
}

// Path: introductionScreen
class _StringsIntroductionScreenEn {
  _StringsIntroductionScreenEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  List<dynamic> get page => [
        _StringsIntroductionScreen$page$0i0$En._(_root),
        _StringsIntroductionScreen$page$0i1$En._(_root),
        _StringsIntroductionScreen$page$0i2$En._(_root),
        _StringsIntroductionScreen$page$0i3$En._(_root),
      ];
}

// Path: cardsScreen
class _StringsCardsScreenEn {
  _StringsCardsScreenEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Golpes Comuns';
  List<dynamic> get details => [
        _StringsCardsScreen$details$0i0$En._(_root),
        _StringsCardsScreen$details$0i1$En._(_root),
        _StringsCardsScreen$details$0i2$En._(_root),
        _StringsCardsScreen$details$0i3$En._(_root),
      ];
}

// Path: messageAnalyzerScreen
class _StringsMessageAnalyzerScreenEn {
  _StringsMessageAnalyzerScreenEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Análise de Mensagens';
}

// Path: introductionScreen.page.0
class _StringsIntroductionScreen$page$0i0$En {
  _StringsIntroductionScreen$page$0i0$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Bem-vindo(a) ao app do Protetor digital!';
  String get body =>
      'Aprenda os melhores métodos de prevenção contra os golpistas de forma simples e remota com nosso app.';
}

// Path: introductionScreen.page.1
class _StringsIntroductionScreen$page$0i1$En {
  _StringsIntroductionScreen$page$0i1$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Como funciona?\n\nCartilha de segurança';
  String get body =>
      'Descubra tutoriais e informações simples sobre temas como fraudes, phishing, senhas seguras e muito mais. Todo o conteúdo é fácil de entender e feito para  guiar você em um passo a passo.';
}

// Path: introductionScreen.page.2
class _StringsIntroductionScreen$page$0i2$En {
  _StringsIntroductionScreen$page$0i2$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Como funciona?\n\nLista de checagem de segurança';
  String get body =>
      'Aplique o que aprendeu com listas de tarefas simples e organizadas por temas. Desde identificar e-mails suspeitos até manter suas redes sociais protegidas, você terá tudo o que precisa.';
}

// Path: introductionScreen.page.3
class _StringsIntroductionScreen$page$0i3$En {
  _StringsIntroductionScreen$page$0i3$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Como funciona?\n\nAnálise de mensagens suspeitas';
  String get body =>
      'Recebeu uma mensagem que parece estranha? Cole o texto aqui e deixe nosso sistema verificar o nível de segurança. Vamos te orientar sobre o que fazer para se proteger.';
}

// Path: cardsScreen.details.0
class _StringsCardsScreen$details$0i0$En {
  _StringsCardsScreen$details$0i0$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Perfil falso no WhatsApp';
  List<dynamic> get text => [
        _StringsCardsScreen$details$0i0$$text$0i0$En._(_root),
        _StringsCardsScreen$details$0i0$$text$0i1$En._(_root),
        _StringsCardsScreen$details$0i0$$text$0i2$En._(_root),
      ];
}

// Path: cardsScreen.details.1
class _StringsCardsScreen$details$0i1$En {
  _StringsCardsScreen$details$0i1$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Golpe do voucher/cupom de descontos em restaurante';
  List<dynamic> get text => [
        _StringsCardsScreen$details$0i1$$text$0i0$En._(_root),
        _StringsCardsScreen$details$0i1$$text$0i1$En._(_root),
      ];
}

// Path: cardsScreen.details.2
class _StringsCardsScreen$details$0i2$En {
  _StringsCardsScreen$details$0i2$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Golpe de investimentos';
  List<dynamic> get text => [
        _StringsCardsScreen$details$0i2$$text$0i0$En._(_root),
        _StringsCardsScreen$details$0i2$$text$0i1$En._(_root),
      ];
}

// Path: cardsScreen.details.3
class _StringsCardsScreen$details$0i3$En {
  _StringsCardsScreen$details$0i3$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Golpe do motoboy de banco';
  List<dynamic> get text => [
        _StringsCardsScreen$details$0i3$$text$0i0$En._(_root),
        _StringsCardsScreen$details$0i3$$text$0i1$En._(_root),
      ];
}

// Path: cardsScreen.details.0.text.0
class _StringsCardsScreen$details$0i0$$text$0i0$En {
  _StringsCardsScreen$details$0i0$$text$0i0$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Como acontece o golpe:';
  List<String> get body => [
        'Os criminosos vinculam a fotografia da vítima, normalmente retirada do próprio WhatsApp ou de redes sociais, a um número telefônico. Se passando por ela, eles solicitam dinheiro e/ou outras vantagens para os conhecidos da vítima.',
      ];
}

// Path: cardsScreen.details.0.text.1
class _StringsCardsScreen$details$0i0$$text$0i1$En {
  _StringsCardsScreen$details$0i0$$text$0i1$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'O que fazer caso tenha sido vítima:';
  List<String> get body => [
        'Denunciar o perfil falso no aplicativo WhatsApp usando o suporte@whatsapp.com ou clicar no número que enviou a mensagem e, no campo “dados do contato” clicar em denunciar.',
      ];
}

// Path: cardsScreen.details.0.text.2
class _StringsCardsScreen$details$0i0$$text$0i2$En {
  _StringsCardsScreen$details$0i0$$text$0i2$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Como se prevenir:';
  List<String> get body => [
        'Fique atento às mensagens de solicitação de dinheiro por conhecidos.',
        'Desconfie se a fotografia do perfil do WhatsApp estiver vinculada a uma linha de telefônica que não esteja cadastrada nos seus contatos.',
        'Se a conta bancária informada para depósito de valores estiver em nome de terceiro, a chance de ser fraude é ainda maior.',
      ];
}

// Path: cardsScreen.details.1.text.0
class _StringsCardsScreen$details$0i1$$text$0i0$En {
  _StringsCardsScreen$details$0i1$$text$0i0$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Como acontece o golpe:';
  List<String> get body => [
        'O criminoso entra em contato com a vítima via direct no Instagram se passando por representante de um restaurante de sua preferência',
        'Após breve conversa, um link malicioso contendo um suposto voucher/cupom de desconto é enviado para a vítima.',
        'Esse link, se acessado, pode coletar os dados constantes no seu celular.',
      ];
}

// Path: cardsScreen.details.1.text.1
class _StringsCardsScreen$details$0i1$$text$0i1$En {
  _StringsCardsScreen$details$0i1$$text$0i1$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Como se prevenir:';
  List<String> get body => [
        'Suspeite de contatos que oferecem voucher/cupom de descontos de restaurantes a serem utilizados em plataformas de delivery.',
        'Não clique no link fornecido nessas conversas antes de confirmar diretamente com o restaurante a veracidade do desconto.',
      ];
}

// Path: cardsScreen.details.2.text.0
class _StringsCardsScreen$details$0i2$$text$0i0$En {
  _StringsCardsScreen$details$0i2$$text$0i0$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Como acontece o golpe:';
  List<String> get body => [
        'Os criminosos usam pessoas jurídicas com aparente credibilidade para oferecer investimentos pessoais com ganhos e taxas de juros acima dos comumente praticados no mercado. Eles alegam que atuam no mercado de ações ou que possuem algum produto de grande valia.',
        'As vítimas fazem aportes de dinheiro, em diversos níveis e momentos distintos, e com esses valores os criminosos pagam investimentos daqueles que entraram antes, apresentando uma suposta credibilidade no modelo de negócio.',
        'Assim, os primeiros investidores, animados com seus ganhos, acabam trazendo outros que também fazem aportes. Dessa forma, fazem girar o sistema financeiro criado pelos criminosos, até o momento em que estes “quebram” o esquema, desviando milhares de reais dos investidores.',
        'Não se trata da conhecida “pirâmide financeira”, pois não há o recrutamento voluntário progressivo que caracteriza esta modalidade de sistema como forma de auferir ganhos. O golpe de investimento independe de qualquer recrutamento a ser feito pelo investidor.',
      ];
}

// Path: cardsScreen.details.2.text.1
class _StringsCardsScreen$details$0i2$$text$0i1$En {
  _StringsCardsScreen$details$0i2$$text$0i1$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Como se prevenir:';
  List<String> get body => [
        'Sempre suspeitar de ofertas de investimentos com ganhos acima daqueles praticados pelo mercado bancário regular, ainda que apresentados por empresas com aparente credibilidade, ou por pessoas conhecidas e familiares, que podem estar na base do sistema e por isso receberam algum “rendimento”, os fazendo crer na rentabilidade do negócio.',
        'Verificar se existe autorização do Banco Central e fiscalização do Conselho de Valores Mobiliários.',
        'Lembre-se, esse esquema a qualquer momento pode ser interrompido e quebrado, deixando inúmeras vítimas.',
      ];
}

// Path: cardsScreen.details.3.text.0
class _StringsCardsScreen$details$0i3$$text$0i0$En {
  _StringsCardsScreen$details$0i3$$text$0i0$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Como acontece o golpe:';
  List<String> get body => [
        'A vítima recebe ligação telefônica supostamente da área de segurança do banco e é questionada sobre uma compra realizada com seu cartão de crédito.',
        'Diante da resposta negativa, o interlocutor confirma alguns dados pessoais, informa que o cartão de crédito foi clonado, mas que já está cancelado. Explica que, para comodidade do cliente, um funcionário da agência, devidamente identificado com crachá, irá comparecer à residência da vítima para pegar o cartão de crédito cancelado e também uma declaração de não reconhecimento de compra.',
        'Na posse do cartão, o criminoso realiza saques e diversas compras em nome da vítima.',
      ];
}

// Path: cardsScreen.details.3.text.1
class _StringsCardsScreen$details$0i3$$text$0i1$En {
  _StringsCardsScreen$details$0i3$$text$0i1$En._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get header => 'Como se prevenir:';
  List<String> get body => [
        'Suspeite de ligações telefônicas que questionem compras realizadas com o cartão de crédito.',
        'Não forneça por telefone dados pessoais tais como endereço e senha de cartão bancário.',
        'Os bancos não dispõem de serviço delivery, ou seja, não enviam funcionários a residências de clientes para pegar documentos e cartões.',
      ];
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'introductionScreen.page.0.title':
        return 'Bem-vindo(a) ao app do Protetor digital!';
      case 'introductionScreen.page.0.body':
        return 'Aprenda os melhores métodos de prevenção contra os golpistas de forma simples e remota com nosso app.';
      case 'introductionScreen.page.1.title':
        return 'Como funciona?\n\nCartilha de segurança';
      case 'introductionScreen.page.1.body':
        return 'Descubra tutoriais e informações simples sobre temas como fraudes, phishing, senhas seguras e muito mais. Todo o conteúdo é fácil de entender e feito para  guiar você em um passo a passo.';
      case 'introductionScreen.page.2.title':
        return 'Como funciona?\n\nLista de checagem de segurança';
      case 'introductionScreen.page.2.body':
        return 'Aplique o que aprendeu com listas de tarefas simples e organizadas por temas. Desde identificar e-mails suspeitos até manter suas redes sociais protegidas, você terá tudo o que precisa.';
      case 'introductionScreen.page.3.title':
        return 'Como funciona?\n\nAnálise de mensagens suspeitas';
      case 'introductionScreen.page.3.body':
        return 'Recebeu uma mensagem que parece estranha? Cole o texto aqui e deixe nosso sistema verificar o nível de segurança. Vamos te orientar sobre o que fazer para se proteger.';
      case 'cardsScreen.title':
        return 'Golpes Comuns';
      case 'cardsScreen.details.0.title':
        return 'Perfil falso no WhatsApp';
      case 'cardsScreen.details.0.text.0.header':
        return 'Como acontece o golpe:';
      case 'cardsScreen.details.0.text.0.body.0':
        return 'Os criminosos vinculam a fotografia da vítima, normalmente retirada do próprio WhatsApp ou de redes sociais, a um número telefônico. Se passando por ela, eles solicitam dinheiro e/ou outras vantagens para os conhecidos da vítima.';
      case 'cardsScreen.details.0.text.1.header':
        return 'O que fazer caso tenha sido vítima:';
      case 'cardsScreen.details.0.text.1.body.0':
        return 'Denunciar o perfil falso no aplicativo WhatsApp usando o suporte@whatsapp.com ou clicar no número que enviou a mensagem e, no campo “dados do contato” clicar em denunciar.';
      case 'cardsScreen.details.0.text.2.header':
        return 'Como se prevenir:';
      case 'cardsScreen.details.0.text.2.body.0':
        return 'Fique atento às mensagens de solicitação de dinheiro por conhecidos.';
      case 'cardsScreen.details.0.text.2.body.1':
        return 'Desconfie se a fotografia do perfil do WhatsApp estiver vinculada a uma linha de telefônica que não esteja cadastrada nos seus contatos.';
      case 'cardsScreen.details.0.text.2.body.2':
        return 'Se a conta bancária informada para depósito de valores estiver em nome de terceiro, a chance de ser fraude é ainda maior.';
      case 'cardsScreen.details.1.title':
        return 'Golpe do voucher/cupom de descontos em restaurante';
      case 'cardsScreen.details.1.text.0.header':
        return 'Como acontece o golpe:';
      case 'cardsScreen.details.1.text.0.body.0':
        return 'O criminoso entra em contato com a vítima via direct no Instagram se passando por representante de um restaurante de sua preferência';
      case 'cardsScreen.details.1.text.0.body.1':
        return 'Após breve conversa, um link malicioso contendo um suposto voucher/cupom de desconto é enviado para a vítima.';
      case 'cardsScreen.details.1.text.0.body.2':
        return 'Esse link, se acessado, pode coletar os dados constantes no seu celular.';
      case 'cardsScreen.details.1.text.1.header':
        return 'Como se prevenir:';
      case 'cardsScreen.details.1.text.1.body.0':
        return 'Suspeite de contatos que oferecem voucher/cupom de descontos de restaurantes a serem utilizados em plataformas de delivery.';
      case 'cardsScreen.details.1.text.1.body.1':
        return 'Não clique no link fornecido nessas conversas antes de confirmar diretamente com o restaurante a veracidade do desconto.';
      case 'cardsScreen.details.2.title':
        return 'Golpe de investimentos';
      case 'cardsScreen.details.2.text.0.header':
        return 'Como acontece o golpe:';
      case 'cardsScreen.details.2.text.0.body.0':
        return 'Os criminosos usam pessoas jurídicas com aparente credibilidade para oferecer investimentos pessoais com ganhos e taxas de juros acima dos comumente praticados no mercado. Eles alegam que atuam no mercado de ações ou que possuem algum produto de grande valia.';
      case 'cardsScreen.details.2.text.0.body.1':
        return 'As vítimas fazem aportes de dinheiro, em diversos níveis e momentos distintos, e com esses valores os criminosos pagam investimentos daqueles que entraram antes, apresentando uma suposta credibilidade no modelo de negócio.';
      case 'cardsScreen.details.2.text.0.body.2':
        return 'Assim, os primeiros investidores, animados com seus ganhos, acabam trazendo outros que também fazem aportes. Dessa forma, fazem girar o sistema financeiro criado pelos criminosos, até o momento em que estes “quebram” o esquema, desviando milhares de reais dos investidores.';
      case 'cardsScreen.details.2.text.0.body.3':
        return 'Não se trata da conhecida “pirâmide financeira”, pois não há o recrutamento voluntário progressivo que caracteriza esta modalidade de sistema como forma de auferir ganhos. O golpe de investimento independe de qualquer recrutamento a ser feito pelo investidor.';
      case 'cardsScreen.details.2.text.1.header':
        return 'Como se prevenir:';
      case 'cardsScreen.details.2.text.1.body.0':
        return 'Sempre suspeitar de ofertas de investimentos com ganhos acima daqueles praticados pelo mercado bancário regular, ainda que apresentados por empresas com aparente credibilidade, ou por pessoas conhecidas e familiares, que podem estar na base do sistema e por isso receberam algum “rendimento”, os fazendo crer na rentabilidade do negócio.';
      case 'cardsScreen.details.2.text.1.body.1':
        return 'Verificar se existe autorização do Banco Central e fiscalização do Conselho de Valores Mobiliários.';
      case 'cardsScreen.details.2.text.1.body.2':
        return 'Lembre-se, esse esquema a qualquer momento pode ser interrompido e quebrado, deixando inúmeras vítimas.';
      case 'cardsScreen.details.3.title':
        return 'Golpe do motoboy de banco';
      case 'cardsScreen.details.3.text.0.header':
        return 'Como acontece o golpe:';
      case 'cardsScreen.details.3.text.0.body.0':
        return 'A vítima recebe ligação telefônica supostamente da área de segurança do banco e é questionada sobre uma compra realizada com seu cartão de crédito.';
      case 'cardsScreen.details.3.text.0.body.1':
        return 'Diante da resposta negativa, o interlocutor confirma alguns dados pessoais, informa que o cartão de crédito foi clonado, mas que já está cancelado. Explica que, para comodidade do cliente, um funcionário da agência, devidamente identificado com crachá, irá comparecer à residência da vítima para pegar o cartão de crédito cancelado e também uma declaração de não reconhecimento de compra.';
      case 'cardsScreen.details.3.text.0.body.2':
        return 'Na posse do cartão, o criminoso realiza saques e diversas compras em nome da vítima.';
      case 'cardsScreen.details.3.text.1.header':
        return 'Como se prevenir:';
      case 'cardsScreen.details.3.text.1.body.0':
        return 'Suspeite de ligações telefônicas que questionem compras realizadas com o cartão de crédito.';
      case 'cardsScreen.details.3.text.1.body.1':
        return 'Não forneça por telefone dados pessoais tais como endereço e senha de cartão bancário.';
      case 'cardsScreen.details.3.text.1.body.2':
        return 'Os bancos não dispõem de serviço delivery, ou seja, não enviam funcionários a residências de clientes para pegar documentos e cartões.';
      case 'messageAnalyzerScreen.title':
        return 'Análise de Mensagens';
      default:
        return null;
    }
  }
}
