import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
  ];

  /// The application title shown in the task switcher and app bar.
  ///
  /// In en, this message translates to:
  /// **'inStock'**
  String get appTitle;

  /// Welcome message on the home screen when content is ready.
  ///
  /// In en, this message translates to:
  /// **'Welcome to inStock'**
  String get homeWelcome;

  /// Message shown on the home screen while content is loading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get homeLoading;

  /// Inspirational quote 0 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The best time to plant a tree was twenty years ago. The second best time is now.'**
  String get homeQuote0Text;

  /// Inspirational quote 1 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The way to get started is to quit talking and begin doing.'**
  String get homeQuote1Text;

  /// Inspirational quote 2 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Well done is better than well said.'**
  String get homeQuote2Text;

  /// Inspirational quote 3 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'It always seems impossible until it\'s done.'**
  String get homeQuote3Text;

  /// Inspirational quote 4 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Small deeds done are better than great deeds planned.'**
  String get homeQuote4Text;

  /// Inspirational quote 5 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The secret of getting ahead is getting started.'**
  String get homeQuote5Text;

  /// Inspirational quote 6 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have to be great to start, but you have to start to be great.'**
  String get homeQuote6Text;

  /// Inspirational quote 7 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'It does not matter how slowly you go as long as you do not stop.'**
  String get homeQuote7Text;

  /// Inspirational quote 8 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Fall seven times, stand up eight.'**
  String get homeQuote8Text;

  /// Inspirational quote 9 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The only way out is through.'**
  String get homeQuote9Text;

  /// Inspirational quote 10 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'When you reach the end of your rope, tie a knot in it and hang on.'**
  String get homeQuote10Text;

  /// Inspirational quote 11 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Our greatest glory is not in never falling, but in rising every time we fall.'**
  String get homeQuote11Text;

  /// Inspirational quote 12 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'I have not failed. I\'ve just found 10,000 ways that won\'t work.'**
  String get homeQuote12Text;

  /// Inspirational quote 13 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'It\'s not whether you get knocked down, it\'s whether you get up.'**
  String get homeQuote13Text;

  /// Inspirational quote 14 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Perseverance is not a long race; it is many short races one after the other.'**
  String get homeQuote14Text;

  /// Inspirational quote 15 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Rock bottom became the solid foundation on which I rebuilt my life.'**
  String get homeQuote15Text;

  /// Inspirational quote 16 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'A river cuts through rock, not because of its power, but because of its persistence.'**
  String get homeQuote16Text;

  /// Inspirational quote 17 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'You gain strength, courage, and confidence by every experience in which you really stop to look fear in the face.'**
  String get homeQuote17Text;

  /// Inspirational quote 18 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Courage is not the absence of fear, but the triumph over it.'**
  String get homeQuote18Text;

  /// Inspirational quote 19 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Do one thing every day that scares you.'**
  String get homeQuote19Text;

  /// Inspirational quote 20 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'It takes courage to grow up and become who you really are.'**
  String get homeQuote20Text;

  /// Inspirational quote 21 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Life shrinks or expands in proportion to one\'s courage.'**
  String get homeQuote21Text;

  /// Inspirational quote 22 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'You cannot swim for new horizons until you have courage to lose sight of the shore.'**
  String get homeQuote22Text;

  /// Inspirational quote 23 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Whether you think you can or you think you can\'t, you\'re right.'**
  String get homeQuote23Text;

  /// Inspirational quote 24 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Twenty years from now you will be more disappointed by the things you didn\'t do.'**
  String get homeQuote24Text;

  /// Inspirational quote 25 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The future belongs to those who believe in the beauty of their dreams.'**
  String get homeQuote25Text;

  /// Inspirational quote 26 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'All our dreams can come true if we have the courage to pursue them.'**
  String get homeQuote26Text;

  /// Inspirational quote 27 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Shoot for the moon. Even if you miss, you\'ll land among the stars.'**
  String get homeQuote27Text;

  /// Inspirational quote 28 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The best way to predict the future is to create it.'**
  String get homeQuote28Text;

  /// Inspirational quote 29 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Don\'t watch the clock; do what it does. Keep going.'**
  String get homeQuote29Text;

  /// Inspirational quote 30 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'If you can dream it, you can do it.'**
  String get homeQuote30Text;

  /// Inspirational quote 31 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The bigger the dream, the more important the team.'**
  String get homeQuote31Text;

  /// Inspirational quote 32 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Be the change that you wish to see in the world.'**
  String get homeQuote32Text;

  /// Inspirational quote 33 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The only way to make sense out of change is to plunge into it, move with it, and join the dance.'**
  String get homeQuote33Text;

  /// Inspirational quote 34 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Everything you\'ve ever wanted is on the other side of fear.'**
  String get homeQuote34Text;

  /// Inspirational quote 35 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'In the middle of difficulty lies opportunity.'**
  String get homeQuote35Text;

  /// Inspirational quote 36 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Change your thoughts and you change your world.'**
  String get homeQuote36Text;

  /// Inspirational quote 37 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Believe you can and you\'re halfway there.'**
  String get homeQuote37Text;

  /// Inspirational quote 38 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.'**
  String get homeQuote38Text;

  /// Inspirational quote 39 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'What lies behind us and what lies before us are tiny matters compared to what lies within us.'**
  String get homeQuote39Text;

  /// Inspirational quote 40 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Knowing yourself is the beginning of all wisdom.'**
  String get homeQuote40Text;

  /// Inspirational quote 41 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The only person you are destined to become is the person you decide to be.'**
  String get homeQuote41Text;

  /// Inspirational quote 42 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Trust yourself. You know more than you think you do.'**
  String get homeQuote42Text;

  /// Inspirational quote 43 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The way to get started is to quit talking and begin doing.'**
  String get homeQuote43Text;

  /// Inspirational quote 44 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Success is not final, failure is not fatal: it is the courage to continue that counts.'**
  String get homeQuote44Text;

  /// Inspirational quote 45 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Nothing will work unless you do.'**
  String get homeQuote45Text;

  /// Inspirational quote 46 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Well done is better than well said.'**
  String get homeQuote46Text;

  /// Inspirational quote 47 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Action is the foundational key to all success.'**
  String get homeQuote47Text;

  /// Inspirational quote 48 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'There are no shortcuts to any place worth going.'**
  String get homeQuote48Text;

  /// Inspirational quote 49 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Genius is one percent inspiration and ninety-nine percent perspiration.'**
  String get homeQuote49Text;

  /// Inspirational quote 50 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'No act of kindness, no matter how small, is ever wasted.'**
  String get homeQuote50Text;

  /// Inspirational quote 51 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Carry out a random act of kindness, with no expectation of reward.'**
  String get homeQuote51Text;

  /// Inspirational quote 52 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'We rise by lifting others.'**
  String get homeQuote52Text;

  /// Inspirational quote 53 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'How wonderful it is that nobody need wait a single moment before starting to improve the world.'**
  String get homeQuote53Text;

  /// Inspirational quote 54 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Unless someone like you cares a whole awful lot, nothing is going to get better.'**
  String get homeQuote54Text;

  /// Inspirational quote 55 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The more that you read, the more things you will know.'**
  String get homeQuote55Text;

  /// Inspirational quote 56 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Live as if you were to die tomorrow. Learn as if you were to live forever.'**
  String get homeQuote56Text;

  /// Inspirational quote 57 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The beautiful thing about learning is that no one can take it away from you.'**
  String get homeQuote57Text;

  /// Inspirational quote 58 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'An investment in knowledge pays the best interest.'**
  String get homeQuote58Text;

  /// Inspirational quote 59 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Wisdom begins in wonder.'**
  String get homeQuote59Text;

  /// Inspirational quote 60 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The only true wisdom is in knowing you know nothing.'**
  String get homeQuote60Text;

  /// Inspirational quote 61 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The two most important days in your life are the day you are born and the day you find out why.'**
  String get homeQuote61Text;

  /// Inspirational quote 62 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Yesterday is history, tomorrow is a mystery, today is a gift.'**
  String get homeQuote62Text;

  /// Inspirational quote 63 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Time you enjoy wasting is not wasted time.'**
  String get homeQuote63Text;

  /// Inspirational quote 64 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Lost time is never found again.'**
  String get homeQuote64Text;

  /// Inspirational quote 65 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The way I see it, if you want the rainbow, you gotta put up with the rain.'**
  String get homeQuote65Text;

  /// Inspirational quote 66 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Keep your face always toward the sunshine, and shadows will fall behind you.'**
  String get homeQuote66Text;

  /// Inspirational quote 67 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Attitude is a little thing that makes a big difference.'**
  String get homeQuote67Text;

  /// Inspirational quote 68 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty.'**
  String get homeQuote68Text;

  /// Inspirational quote 69 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Once you replace negative thoughts with positive ones, you\'ll start having positive results.'**
  String get homeQuote69Text;

  /// Inspirational quote 70 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Positive anything is better than negative nothing.'**
  String get homeQuote70Text;

  /// Inspirational quote 71 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Where there is love there is life.'**
  String get homeQuote71Text;

  /// Inspirational quote 72 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The best and most beautiful things in the world cannot be seen or even touched — they must be felt with the heart.'**
  String get homeQuote72Text;

  /// Inspirational quote 73 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Love yourself first and everything else falls into line.'**
  String get homeQuote73Text;

  /// Inspirational quote 74 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'We accept the love we think we deserve.'**
  String get homeQuote74Text;

  /// Inspirational quote 75 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'That which does not kill us makes us stronger.'**
  String get homeQuote75Text;

  /// Inspirational quote 76 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Out of difficulties grow miracles.'**
  String get homeQuote76Text;

  /// Inspirational quote 77 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The gem cannot be polished without friction, nor man perfected without trials.'**
  String get homeQuote77Text;

  /// Inspirational quote 78 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Difficult roads often lead to beautiful destinations.'**
  String get homeQuote78Text;

  /// Inspirational quote 79 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Smooth seas do not make skillful sailors.'**
  String get homeQuote79Text;

  /// Inspirational quote 80 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Always be a first-rate version of yourself, instead of a second-rate version of somebody else.'**
  String get homeQuote80Text;

  /// Inspirational quote 81 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Why fit in when you were born to stand out?'**
  String get homeQuote81Text;

  /// Inspirational quote 82 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'You were born to be real, not to be perfect.'**
  String get homeQuote82Text;

  /// Inspirational quote 83 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'To live is the rarest thing in the world. Most people exist, that is all.'**
  String get homeQuote83Text;

  /// Inspirational quote 84 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Strength does not come from winning. Your struggles develop your strengths.'**
  String get homeQuote84Text;

  /// Inspirational quote 85 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Champions keep playing until they get it right.'**
  String get homeQuote85Text;

  /// Inspirational quote 86 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'You are never too old to set another goal or to dream a new dream.'**
  String get homeQuote86Text;

  /// Inspirational quote 87 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Obstacles are those frightful things you see when you take your eyes off your goal.'**
  String get homeQuote87Text;

  /// Inspirational quote 88 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'It always seems impossible until it\'s done.'**
  String get homeQuote88Text;

  /// Inspirational quote 89 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Peace begins with a smile.'**
  String get homeQuote89Text;

  /// Inspirational quote 90 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Freedom is nothing but a chance to be better.'**
  String get homeQuote90Text;

  /// Inspirational quote 91 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The truth will set you free, but first it will piss you off.'**
  String get homeQuote91Text;

  /// Inspirational quote 92 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The purpose of life is not to be happy. It is to be useful, to be honorable, to be compassionate.'**
  String get homeQuote92Text;

  /// Inspirational quote 93 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'What we do for ourselves dies with us. What we do for others remains and is immortal.'**
  String get homeQuote93Text;

  /// Inspirational quote 94 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Try not to become a man of success, but rather try to become a man of value.'**
  String get homeQuote94Text;

  /// Inspirational quote 95 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The greatest glory in living lies not in never falling, but in rising every time we fall.'**
  String get homeQuote95Text;

  /// Inspirational quote 96 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Imagination is more important than knowledge.'**
  String get homeQuote96Text;

  /// Inspirational quote 97 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Creativity takes courage.'**
  String get homeQuote97Text;

  /// Inspirational quote 98 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Every artist was first an amateur.'**
  String get homeQuote98Text;

  /// Inspirational quote 99 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'You can\'t use up creativity. The more you use, the more you have.'**
  String get homeQuote99Text;

  /// Inspirational quote 100 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Simplicity is the ultimate sophistication.'**
  String get homeQuote100Text;

  /// Inspirational quote 101 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'The present moment is the only time over which we have dominion.'**
  String get homeQuote101Text;

  /// Inspirational quote 102 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Realize deeply that the present moment is all you ever have.'**
  String get homeQuote102Text;

  /// Inspirational quote 103 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Hope is being able to see that there is light despite all of the darkness.'**
  String get homeQuote103Text;

  /// Inspirational quote 104 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Once you choose hope, anything\'s possible.'**
  String get homeQuote104Text;

  /// Inspirational quote 105 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'We must accept finite disappointment, but never lose infinite hope.'**
  String get homeQuote105Text;

  /// Inspirational quote 106 shown on the home screen.
  ///
  /// In en, this message translates to:
  /// **'Where there\'s life, there\'s hope.'**
  String get homeQuote106Text;

  /// Title of the home-screen shopping list for missing materials.
  ///
  /// In en, this message translates to:
  /// **'Shopping list'**
  String get homeShoppingListTitle;

  /// Empty-state message when no materials are missing on the home shopping list.
  ///
  /// In en, this message translates to:
  /// **'Nothing missing — all materials are in stock.'**
  String get homeShoppingListEmpty;

  /// On-hand stock and shortage amount for a missing material on the shopping list.
  ///
  /// In en, this message translates to:
  /// **'{inStock} in Stock with {needed} more needed'**
  String homeShoppingInStockNeeded(String inStock, String needed);

  /// Tooltip for the shopping-bag button that records a purchase.
  ///
  /// In en, this message translates to:
  /// **'Mark as purchased'**
  String get homeShoppingPurchaseTooltip;

  /// Title of the dialog asking how much of a material was bought.
  ///
  /// In en, this message translates to:
  /// **'Bought {title}?'**
  String homeShoppingPurchaseTitle(String title);

  /// Label for the quantity field in the purchase dialog.
  ///
  /// In en, this message translates to:
  /// **'Quantity bought'**
  String get homeShoppingPurchaseQuantity;

  /// Confirm button that adds the purchased quantity to material stock.
  ///
  /// In en, this message translates to:
  /// **'Add to stock'**
  String get homeShoppingPurchaseConfirm;

  /// SnackBar message when adding purchased stock fails.
  ///
  /// In en, this message translates to:
  /// **'Could not update stock.'**
  String get homeShoppingPurchaseFailure;

  /// Title for the database open failure recovery dialog.
  ///
  /// In en, this message translates to:
  /// **'Database error'**
  String get homeDatabaseErrorTitle;

  /// Message explaining database open failure recovery options.
  ///
  /// In en, this message translates to:
  /// **'A database error occurred. You can retry opening the database, or wipe the local database and start fresh.'**
  String get homeDatabaseErrorMessage;

  /// Button that retries opening the local database.
  ///
  /// In en, this message translates to:
  /// **'Retry database'**
  String get homeDatabaseRetry;

  /// Button that starts wiping and recreating the local database.
  ///
  /// In en, this message translates to:
  /// **'Wipe database'**
  String get homeDatabaseWipe;

  /// Title for the wipe database confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Wipe database?'**
  String get homeDatabaseWipeConfirmTitle;

  /// Message for the wipe database confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'This deletes all local inventory data and cannot be undone.'**
  String get homeDatabaseWipeConfirmMessage;

  /// Confirm button that deletes and recreates the database.
  ///
  /// In en, this message translates to:
  /// **'Wipe database'**
  String get homeDatabaseWipeConfirmAction;

  /// Cancel button on the wipe database confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get homeDatabaseCancel;

  /// Bottom navigation label for the home tab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// Bottom navigation label for the inventory tab.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get navInventory;

  /// Bottom navigation label for the products tab.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get navProducts;

  /// Bottom navigation label for the workshop tab.
  ///
  /// In en, this message translates to:
  /// **'Workshop'**
  String get navWorkshop;

  /// Bottom navigation label for the settings tab.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// Screen title for the inventory tab.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventoryTitle;

  /// Placeholder text on the inventory tab.
  ///
  /// In en, this message translates to:
  /// **'Materials and quantities will appear here.'**
  String get inventoryPlaceholder;

  /// Hint text for the inventory search field.
  ///
  /// In en, this message translates to:
  /// **'Search materials…'**
  String get inventorySearchHint;

  /// Title shown when the inventory list is empty.
  ///
  /// In en, this message translates to:
  /// **'No materials yet'**
  String get inventoryEmptyTitle;

  /// Subtitle shown when the inventory list is empty.
  ///
  /// In en, this message translates to:
  /// **'Add your first material to start tracking stock.'**
  String get inventoryEmptySubtitle;

  /// Title shown when search returns no materials.
  ///
  /// In en, this message translates to:
  /// **'No matches'**
  String get inventoryNoResultsTitle;

  /// Subtitle shown when search returns no materials.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term.'**
  String get inventoryNoResultsSubtitle;

  /// Label for adding a new material.
  ///
  /// In en, this message translates to:
  /// **'Add material'**
  String get inventoryAddMaterial;

  /// Title for the material edit sheet.
  ///
  /// In en, this message translates to:
  /// **'Edit material'**
  String get inventoryEditMaterial;

  /// Label for the material name field.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get inventoryMaterialName;

  /// Label for the material description field.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get inventoryMaterialDescription;

  /// Label for the material quantity field.
  ///
  /// In en, this message translates to:
  /// **'Quantity on hand'**
  String get inventoryMaterialQuantity;

  /// Chip label for on-hand quantity on a material card.
  ///
  /// In en, this message translates to:
  /// **'{quantity} on hand'**
  String inventoryOnHand(String quantity);

  /// Chip label for available quantity on a material card.
  ///
  /// In en, this message translates to:
  /// **'{quantity} available'**
  String inventoryAvailable(String quantity);

  /// Right-side stock label on a material card: available vs on-hand quantity.
  ///
  /// In en, this message translates to:
  /// **'{available} available / {inStock} in Stock'**
  String inventoryAvailableInStock(String available, String inStock);

  /// Chip label when stock is reserved on the workbench.
  ///
  /// In en, this message translates to:
  /// **'{quantity} reserved'**
  String inventoryReserved(String quantity);

  /// Chip label when available stock is depleted.
  ///
  /// In en, this message translates to:
  /// **'Low stock'**
  String get inventoryLowStock;

  /// Save button on the material form.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get inventorySave;

  /// Cancel button on dialogs.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get inventoryCancel;

  /// Delete button on the material form.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get inventoryDelete;

  /// Title for the delete material confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Delete material?'**
  String get inventoryDeleteConfirmTitle;

  /// Message for the delete material confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\" from your inventory? This also removes it from product recipes. This cannot be undone.'**
  String inventoryDeleteConfirmMessage(String name);

  /// Snack bar when deleting a material fails because it is reserved on a workbench build.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete a material reserved on the workbench.'**
  String get inventoryDeleteInUse;

  /// Snack bar when loading inventory fails.
  ///
  /// In en, this message translates to:
  /// **'Could not load inventory.'**
  String get inventoryLoadFailure;

  /// Snack bar when saving or deleting a material fails.
  ///
  /// In en, this message translates to:
  /// **'Could not save changes.'**
  String get inventoryActionFailure;

  /// Validation message when material name is empty.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get inventoryNameRequired;

  /// Validation message when material quantity is empty.
  ///
  /// In en, this message translates to:
  /// **'Quantity is required'**
  String get inventoryQuantityRequired;

  /// Validation message when material quantity is invalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid quantity'**
  String get inventoryQuantityInvalid;

  /// Tooltip for the button that picks a material image.
  ///
  /// In en, this message translates to:
  /// **'Change image'**
  String get inventoryEditImage;

  /// Snack bar when the material image picker cannot be opened.
  ///
  /// In en, this message translates to:
  /// **'Could not open the photo library.'**
  String get inventoryImagePickFailure;

  /// Screen title for the products tab.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productsTitle;

  /// Hint text for the products search field.
  ///
  /// In en, this message translates to:
  /// **'Search products…'**
  String get productsSearchHint;

  /// Title shown when the products list is empty.
  ///
  /// In en, this message translates to:
  /// **'No products yet'**
  String get productsEmptyTitle;

  /// Subtitle shown when the products list is empty.
  ///
  /// In en, this message translates to:
  /// **'Add your first preset to define a recipe.'**
  String get productsEmptySubtitle;

  /// Title shown when search returns no products.
  ///
  /// In en, this message translates to:
  /// **'No matches'**
  String get productsNoResultsTitle;

  /// Subtitle shown when search returns no products.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term.'**
  String get productsNoResultsSubtitle;

  /// Label for adding a new preset.
  ///
  /// In en, this message translates to:
  /// **'Add product'**
  String get productsAddPreset;

  /// Default name assigned when creating a preset from the add button.
  ///
  /// In en, this message translates to:
  /// **'New product'**
  String get productsNewPresetDefaultName;

  /// Snack bar when creating a new preset fails.
  ///
  /// In en, this message translates to:
  /// **'Could not create product.'**
  String get productsCreateFailure;

  /// Title for the preset edit sheet.
  ///
  /// In en, this message translates to:
  /// **'Edit product'**
  String get productsEditPreset;

  /// Label for the preset name field.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get productsPresetName;

  /// Label for the preset description field.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get productsPresetDescription;

  /// Label below the material count on a product card.
  ///
  /// In en, this message translates to:
  /// **'materials'**
  String get productsMaterialCountLabel;

  /// Snack bar when loading products fails.
  ///
  /// In en, this message translates to:
  /// **'Could not load products.'**
  String get productsLoadFailure;

  /// Snack bar when saving or deleting a preset fails.
  ///
  /// In en, this message translates to:
  /// **'Could not save changes.'**
  String get productsActionFailure;

  /// Validation message when product name is empty.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get productsNameRequired;

  /// Title for the delete product confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Delete product?'**
  String get productsDeleteConfirmTitle;

  /// Message for the delete product confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\" from your products? This cannot be undone.'**
  String productsDeleteConfirmMessage(String name);

  /// Section heading for preset materials on the detail page.
  ///
  /// In en, this message translates to:
  /// **'Materials'**
  String get productsDetailMaterialsHeading;

  /// Placeholder when a preset has no description.
  ///
  /// In en, this message translates to:
  /// **'No description'**
  String get productsDetailNoDescription;

  /// Snack bar when loading a preset detail fails.
  ///
  /// In en, this message translates to:
  /// **'Could not load product details.'**
  String get productsDetailLoadFailure;

  /// Message when a preset no longer exists.
  ///
  /// In en, this message translates to:
  /// **'Product not found.'**
  String get productsDetailNotFound;

  /// Tag button label to add a material to a preset.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get productsAddMaterial;

  /// Title for the sheet listing materials that can be added.
  ///
  /// In en, this message translates to:
  /// **'Add material'**
  String get productsAddMaterialTitle;

  /// Message when no materials remain to add to a preset.
  ///
  /// In en, this message translates to:
  /// **'All materials are already in this preset.'**
  String get productsAddMaterialEmpty;

  /// Accessibility label for increasing material quantity.
  ///
  /// In en, this message translates to:
  /// **'Increase quantity'**
  String get productsMaterialQuantityIncrease;

  /// Accessibility label for decreasing material quantity.
  ///
  /// In en, this message translates to:
  /// **'Decrease quantity'**
  String get productsMaterialQuantityDecrease;

  /// Button label to leave the preset detail page.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get productsDetailBack;

  /// Button label to create a workbench product from this preset.
  ///
  /// In en, this message translates to:
  /// **'Add to workbench'**
  String get productsDetailCreateProduct;

  /// Snack bar when a product was created from the preset.
  ///
  /// In en, this message translates to:
  /// **'Product added to workbench.'**
  String get productsDetailCreateProductSuccess;

  /// Snack bar when creating a product fails due to insufficient stock.
  ///
  /// In en, this message translates to:
  /// **'Not enough materials in stock.'**
  String get productsDetailCreateProductInsufficientStock;

  /// Tooltip for the button that picks a preset image.
  ///
  /// In en, this message translates to:
  /// **'Change image'**
  String get productsDetailEditImage;

  /// Snack bar when saving preset changes on the detail page fails.
  ///
  /// In en, this message translates to:
  /// **'Could not save changes.'**
  String get productsDetailActionFailure;

  /// Snack bar when the preset image picker cannot be opened.
  ///
  /// In en, this message translates to:
  /// **'Could not open the photo library.'**
  String get productsDetailImagePickFailure;

  /// Screen title for the workshop tab.
  ///
  /// In en, this message translates to:
  /// **'Workshop'**
  String get workshopTitle;

  /// Placeholder text on the workshop tab.
  ///
  /// In en, this message translates to:
  /// **'Active builds will appear here.'**
  String get workshopPlaceholder;

  /// Title when the workshop list has no projects.
  ///
  /// In en, this message translates to:
  /// **'No builds yet'**
  String get workshopEmptyTitle;

  /// Subtitle when the workshop list has no projects.
  ///
  /// In en, this message translates to:
  /// **'Add a product to the workbench to reserve materials and track a build.'**
  String get workshopEmptySubtitle;

  /// Snack bar when loading workshop projects fails.
  ///
  /// In en, this message translates to:
  /// **'Could not load workshop projects.'**
  String get workshopLoadFailure;

  /// Customer name shown on a workshop project card.
  ///
  /// In en, this message translates to:
  /// **'Customer: {name}'**
  String workshopCustomerLabel(String name);

  /// Status label for an active workbench build.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get workshopStatusInProgress;

  /// Status label for a completed workbench build.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get workshopStatusFinished;

  /// Fallback app bar title on the workbench product detail screen.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get workshopProductDetailTitle;

  /// Label for the editable product name on the detail screen.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get workshopProductNameLabel;

  /// Label for the editable product description on the detail screen.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get workshopProductDescriptionLabel;

  /// Label for the editable customer field on the detail screen.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get workshopCustomerFieldLabel;

  /// Placeholder when a workbench product has no customer.
  ///
  /// In en, this message translates to:
  /// **'No customer'**
  String get workshopCustomerPlaceholder;

  /// Shows global reserved quantity versus on-hand stock for a material.
  ///
  /// In en, this message translates to:
  /// **'{reserved} reserved · {onHand} on hand'**
  String workshopMaterialGlobalReserved(String reserved, String onHand);

  /// Label when global reservations exceed on-hand stock for a material.
  ///
  /// In en, this message translates to:
  /// **'Not enough stock'**
  String get workshopMaterialShortage;

  /// Title of the bottom sheet to add a material to a workbench product.
  ///
  /// In en, this message translates to:
  /// **'Add material'**
  String get workshopAddMaterialTitle;

  /// Empty state when every inventory material is already reserved on this product.
  ///
  /// In en, this message translates to:
  /// **'All materials are already on this product.'**
  String get workshopAddMaterialEmpty;

  /// Snack bar when loading a workbench product detail fails.
  ///
  /// In en, this message translates to:
  /// **'Could not load product.'**
  String get workshopDetailLoadFailure;

  /// Snack bar when a workbench product no longer exists.
  ///
  /// In en, this message translates to:
  /// **'Product not found.'**
  String get workshopDetailNotFound;

  /// Snack bar when saving workbench product detail changes fails.
  ///
  /// In en, this message translates to:
  /// **'Could not save changes.'**
  String get workshopDetailActionFailure;

  /// Snack bar when a reservation change exceeds available stock.
  ///
  /// In en, this message translates to:
  /// **'Not enough available stock for this material.'**
  String get workshopInsufficientStock;

  /// Button label to finish a workbench build and consume reserved materials.
  ///
  /// In en, this message translates to:
  /// **'Finish product'**
  String get workshopFinishProduct;

  /// Title of the confirmation dialog before finishing a workbench build.
  ///
  /// In en, this message translates to:
  /// **'Finish product?'**
  String get workshopFinishConfirmTitle;

  /// Body of the confirmation dialog before finishing a workbench build.
  ///
  /// In en, this message translates to:
  /// **'Reserved materials will be subtracted from inventory and this build will be marked as finished.'**
  String get workshopFinishConfirmMessage;

  /// Snack bar shown after a workbench build is finished successfully.
  ///
  /// In en, this message translates to:
  /// **'Product finished.'**
  String get workshopFinishSuccess;

  /// Snack bar when finishing a workbench build fails.
  ///
  /// In en, this message translates to:
  /// **'Could not finish product.'**
  String get workshopFinishFailure;

  /// Button label to remove a workbench build and release reservations.
  ///
  /// In en, this message translates to:
  /// **'Remove product'**
  String get workshopRemoveProduct;

  /// Title of the confirmation dialog before removing a workbench build.
  ///
  /// In en, this message translates to:
  /// **'Remove product?'**
  String get workshopRemoveConfirmTitle;

  /// Body of the confirmation dialog before removing a workbench build.
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\" from the workbench? Reserved materials will be released without subtracting from inventory.'**
  String workshopRemoveConfirmMessage(String name);

  /// Button label to open the finished-products archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get workshopOpenArchive;

  /// Screen title for the finished-products archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archiveTitle;

  /// Label for the archive start date filter.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get archiveStartDateLabel;

  /// Label for the archive end date filter.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get archiveEndDateLabel;

  /// Shows when a product was finished in the archive list.
  ///
  /// In en, this message translates to:
  /// **'Finished on {date}'**
  String archiveFinishedOnLabel(String date);

  /// Title when the archive list is empty for the selected range.
  ///
  /// In en, this message translates to:
  /// **'No finished products'**
  String get archiveEmptyTitle;

  /// Subtitle when the archive list is empty for the selected range.
  ///
  /// In en, this message translates to:
  /// **'Try a different date range or finish a build in the workshop.'**
  String get archiveEmptySubtitle;

  /// Snack bar when loading archived products fails.
  ///
  /// In en, this message translates to:
  /// **'Could not load archived products.'**
  String get archiveLoadFailure;

  /// Screen title for the settings tab.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Placeholder text on the settings tab.
  ///
  /// In en, this message translates to:
  /// **'Theme and preferences will appear here.'**
  String get settingsPlaceholder;

  /// Section heading for developer tools on the settings screen.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get settingsDeveloperSection;

  /// Button label to load dummy inventory data into the database.
  ///
  /// In en, this message translates to:
  /// **'Seed database'**
  String get settingsSeedDatabase;

  /// Snack bar message after dummy data was seeded successfully.
  ///
  /// In en, this message translates to:
  /// **'Sample data loaded.'**
  String get settingsSeedDatabaseSuccess;

  /// Snack bar message when dummy data seeding failed.
  ///
  /// In en, this message translates to:
  /// **'Could not seed database.'**
  String get settingsSeedDatabaseFailure;

  /// Button label to wipe and recreate the local database.
  ///
  /// In en, this message translates to:
  /// **'Wipe database'**
  String get settingsWipeDatabase;

  /// Snack bar message after the database was wiped successfully.
  ///
  /// In en, this message translates to:
  /// **'Database wiped.'**
  String get settingsWipeDatabaseSuccess;

  /// Snack bar message when wiping the database failed.
  ///
  /// In en, this message translates to:
  /// **'Could not wipe database.'**
  String get settingsWipeDatabaseFailure;

  /// Legacy section heading for theme settings.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearanceSection;

  /// Section heading for theme settings inside the theme panel.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsThemeSection;

  /// Section heading for language settings.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageSection;

  /// Language picker option for English.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageEnglish;

  /// Language picker option for German.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get settingsLanguageGerman;

  /// Section heading for app information.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAboutSection;

  /// App version shown on the settings screen.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get settingsAboutVersion;

  /// Badge label for light-category theme presets.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeCategoryLight;

  /// Badge label for dark-category theme presets.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeCategoryDark;

  /// Display name for the Cosmopolitan theme preset.
  ///
  /// In en, this message translates to:
  /// **'Cosmopolitan'**
  String get settingsThemeCosmopolitan;

  /// Display name for the Piña Colada theme preset.
  ///
  /// In en, this message translates to:
  /// **'Piña Colada'**
  String get settingsThemePinaColada;

  /// Display name for the White Russian theme preset.
  ///
  /// In en, this message translates to:
  /// **'White Russian'**
  String get settingsThemeWhiteRussian;

  /// Display name for the Chartreuse theme preset.
  ///
  /// In en, this message translates to:
  /// **'Chartreuse'**
  String get settingsThemeChartreuse;

  /// Display name for the Blue Hawaii theme preset.
  ///
  /// In en, this message translates to:
  /// **'Blue Hawaii'**
  String get settingsThemeBlueHawaii;

  /// Display name for the Old Fashioned theme preset.
  ///
  /// In en, this message translates to:
  /// **'Old Fashioned'**
  String get settingsThemeOldFashioned;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
