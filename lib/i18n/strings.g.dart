/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 10
///
/// Built on 2025-02-03 at 21:15 UTC

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

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
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
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
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
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
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
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsIntroductionScreenEn introductionScreen = _StringsIntroductionScreenEn._(_root);
	late final _StringsCardsScreenEn cardsScreen = _StringsCardsScreenEn._(_root);
	late final _StringsMessageAnalyzerScreenEn messageAnalyzerScreen = _StringsMessageAnalyzerScreenEn._(_root);
}

// Path: introductionScreen
class _StringsIntroductionScreenEn {
	_StringsIntroductionScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	List<String> get title => [
		'Bem-vindo(a) ao app do Protetor digital!',
		'Como funciona?\n\nLista de checagem de segurança',
		'Como funciona?\n\nCartilha de segurança',
		'Como funciona?\n\nAnálise de mensagens suspeitas',
	];
	List<String> get body => [
		'Aprenda os melhores métodos de prevenção contra os golpistas de forma simples e remota com nosso app.',
		'Aplique o que aprendeu com listas de tarefas simples e organizadas por temas. Desde identificar e-mails suspeitos até manter suas redes sociais protegidas, você terá tudo o que precisa.',
		'Descubra tutoriais e informações simples sobre temas como fraudes, phishing, senhas seguras e muito mais. Todo o conteúdo é fácil de entender e feito para  guiar você em um passo a passo.',
		'Recebeu uma mensagem que parece estranha? Cole o texto aqui e deixe nosso sistema verificar o nível de segurança. Vamos te orientar sobre o que fazer para se proteger.',
	];
}

// Path: cardsScreen
class _StringsCardsScreenEn {
	_StringsCardsScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Golpes Comuns';
}

// Path: messageAnalyzerScreen
class _StringsMessageAnalyzerScreenEn {
	_StringsMessageAnalyzerScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Análise de Mensagens';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'introductionScreen.title.0': return 'Bem-vindo(a) ao app do Protetor digital!';
			case 'introductionScreen.title.1': return 'Como funciona?\n\nLista de checagem de segurança';
			case 'introductionScreen.title.2': return 'Como funciona?\n\nCartilha de segurança';
			case 'introductionScreen.title.3': return 'Como funciona?\n\nAnálise de mensagens suspeitas';
			case 'introductionScreen.body.0': return 'Aprenda os melhores métodos de prevenção contra os golpistas de forma simples e remota com nosso app.';
			case 'introductionScreen.body.1': return 'Aplique o que aprendeu com listas de tarefas simples e organizadas por temas. Desde identificar e-mails suspeitos até manter suas redes sociais protegidas, você terá tudo o que precisa.';
			case 'introductionScreen.body.2': return 'Descubra tutoriais e informações simples sobre temas como fraudes, phishing, senhas seguras e muito mais. Todo o conteúdo é fácil de entender e feito para  guiar você em um passo a passo.';
			case 'introductionScreen.body.3': return 'Recebeu uma mensagem que parece estranha? Cole o texto aqui e deixe nosso sistema verificar o nível de segurança. Vamos te orientar sobre o que fazer para se proteger.';
			case 'cardsScreen.title': return 'Golpes Comuns';
			case 'messageAnalyzerScreen.title': return 'Análise de Mensagens';
			default: return null;
		}
	}
}
