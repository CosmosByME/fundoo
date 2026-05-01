import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'outputs/app_localizations.dart';
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
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @app_language.
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get app_language;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @intro1Header.
  ///
  /// In en, this message translates to:
  /// **'Take a Step Towards Financial Freedom'**
  String get intro1Header;

  /// No description provided for @intro1Body.
  ///
  /// In en, this message translates to:
  /// **'Fundoo — your smart companion that turns your dreams into real financial goals.'**
  String get intro1Body;

  /// No description provided for @intro2Header.
  ///
  /// In en, this message translates to:
  /// **'Form the Habit of Saving'**
  String get intro2Header;

  /// No description provided for @intro2Body.
  ///
  /// In en, this message translates to:
  /// **'Saving a little every day — over time, it leads to big results. Set your financial goals.'**
  String get intro2Body;

  /// No description provided for @intro3Header.
  ///
  /// In en, this message translates to:
  /// **'Track Your Financial Goals'**
  String get intro3Header;

  /// No description provided for @intro3Body.
  ///
  /// In en, this message translates to:
  /// **'With Fundoo, you can take full control of your financial lifestyle'**
  String get intro3Body;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @intro1card1.
  ///
  /// In en, this message translates to:
  /// **'Set and track your personal financial goals'**
  String get intro1card1;

  /// No description provided for @intro1card2.
  ///
  /// In en, this message translates to:
  /// **'Analyze your income and expenses'**
  String get intro1card2;

  /// No description provided for @intro1card3.
  ///
  /// In en, this message translates to:
  /// **'Improve your financial literacy'**
  String get intro1card3;

  /// No description provided for @intro3card1header.
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get intro3card1header;

  /// No description provided for @intro3card1body.
  ///
  /// In en, this message translates to:
  /// **'Expense and income distribution'**
  String get intro3card1body;

  /// No description provided for @intro3card2header.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get intro3card2header;

  /// No description provided for @intro3card2body.
  ///
  /// In en, this message translates to:
  /// **'Move forward with a clear plan'**
  String get intro3card2body;

  /// No description provided for @intro3card3header.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get intro3card3header;

  /// No description provided for @intro3card3body.
  ///
  /// In en, this message translates to:
  /// **'Learn about finance through games'**
  String get intro3card3body;

  /// No description provided for @intro3card4header.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get intro3card4header;

  /// No description provided for @intro3card4body.
  ///
  /// In en, this message translates to:
  /// **'Goal signals'**
  String get intro3card4body;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Fundoo'**
  String get welcome;

  /// No description provided for @welcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Log in to your account or create a new one'**
  String get welcomeBody;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get logIn;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get enter;

  /// No description provided for @enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhone;

  /// No description provided for @onlyUzb.
  ///
  /// In en, this message translates to:
  /// **'Only Uzbekistan phone numbers (+998)'**
  String get onlyUzb;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sendCode;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get noAccount;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get haveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @verificationBody.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to your phone number'**
  String get verificationBody;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @askingPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number. We will send a verification code to it.'**
  String get askingPhone;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @askingInfo.
  ///
  /// In en, this message translates to:
  /// **'Please fill in the following fields to create an account.'**
  String get askingInfo;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get userName;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @continuing.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continuing;

  /// No description provided for @profilePicture.
  ///
  /// In en, this message translates to:
  /// **'Profile Picture'**
  String get profilePicture;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @uploadLaterInfo.
  ///
  /// In en, this message translates to:
  /// **'You can upload a photo later'**
  String get uploadLaterInfo;

  /// No description provided for @doneHeader.
  ///
  /// In en, this message translates to:
  /// **'Let\'s set your first goal'**
  String get doneHeader;

  /// No description provided for @doneBody.
  ///
  /// In en, this message translates to:
  /// **'Fundoo helps you save money and achieve what matters most to you.'**
  String get doneBody;

  /// No description provided for @setGoal.
  ///
  /// In en, this message translates to:
  /// **'Set Goal'**
  String get setGoal;

  /// No description provided for @whatGoal.
  ///
  /// In en, this message translates to:
  /// **'What is your goal? ✨'**
  String get whatGoal;

  /// No description provided for @goalBody.
  ///
  /// In en, this message translates to:
  /// **'Tell us what you want to achieve.'**
  String get goalBody;

  /// No description provided for @writeGoal.
  ///
  /// In en, this message translates to:
  /// **'Write your goal'**
  String get writeGoal;

  /// No description provided for @howMuch.
  ///
  /// In en, this message translates to:
  /// **'How much money do you need? 💰'**
  String get howMuch;

  /// No description provided for @howMuchBody.
  ///
  /// In en, this message translates to:
  /// **'Set the amount needed to achieve your goal.'**
  String get howMuchBody;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Goal amount (sum)'**
  String get amount;

  /// No description provided for @goalSum.
  ///
  /// In en, this message translates to:
  /// **'Goal sum'**
  String get goalSum;

  /// No description provided for @howMuchYouHave.
  ///
  /// In en, this message translates to:
  /// **'How much have you saved? 🏦'**
  String get howMuchYouHave;

  /// No description provided for @howMuchYouHaveBody.
  ///
  /// In en, this message translates to:
  /// **'Add the amount you currently have.'**
  String get howMuchYouHaveBody;

  /// No description provided for @currentAmount.
  ///
  /// In en, this message translates to:
  /// **'Current amount (sum)'**
  String get currentAmount;

  /// No description provided for @currentSum.
  ///
  /// In en, this message translates to:
  /// **'Current savings'**
  String get currentSum;

  /// No description provided for @balanceChangingInfo.
  ///
  /// In en, this message translates to:
  /// **'You can update this balance at any time.'**
  String get balanceChangingInfo;

  /// No description provided for @whenGoal.
  ///
  /// In en, this message translates to:
  /// **'When do you want to achieve your goal? 📅'**
  String get whenGoal;

  /// No description provided for @whenGoalBody.
  ///
  /// In en, this message translates to:
  /// **'Choose the time frame for achieving your goal.'**
  String get whenGoalBody;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get month;

  /// No description provided for @dateSelect.
  ///
  /// In en, this message translates to:
  /// **'Select your goal date'**
  String get dateSelect;

  /// No description provided for @dateInfo.
  ///
  /// In en, this message translates to:
  /// **'Every month you will save {sum} sum.'**
  String dateInfo(int sum);

  /// No description provided for @planIsReady.
  ///
  /// In en, this message translates to:
  /// **'Your plan is ready!'**
  String get planIsReady;

  /// No description provided for @planIsReadyBody.
  ///
  /// In en, this message translates to:
  /// **'All necessary information for achieving your goal has been entered.'**
  String get planIsReadyBody;

  /// No description provided for @goal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goal;

  /// No description provided for @currentBalance.
  ///
  /// In en, this message translates to:
  /// **'Current balance'**
  String get currentBalance;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @monthlySaving.
  ///
  /// In en, this message translates to:
  /// **'Monthly saving amount'**
  String get monthlySaving;

  /// No description provided for @saveEveryMonth.
  ///
  /// In en, this message translates to:
  /// **'Save this amount every month'**
  String get saveEveryMonth;

  /// No description provided for @goToFundoo.
  ///
  /// In en, this message translates to:
  /// **'Go to Fundoo'**
  String get goToFundoo;
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
      <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
