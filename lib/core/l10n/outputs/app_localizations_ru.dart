// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get language => 'Язык';

  @override
  String get app_language => 'Язык приложения';

  @override
  String get skip => 'Пропустить';

  @override
  String get intro1Header => 'Сделайте шаг к финансовой свободе';

  @override
  String get intro1Body =>
      'Fundoo — умный помощник, который превращает ваши мечты в реальные финансовые цели.';

  @override
  String get intro2Header => 'Сформируйте привычку экономить';

  @override
  String get intro2Body =>
      'Каждый день немного экономя — со временем приводит к большим результатам. Определите свои финансовые цели.';

  @override
  String get intro3Header => 'Отслеживайте свои финансовые цели';

  @override
  String get intro3Body =>
      'С Fundoo вы можете полностью контролировать свой финансовый образ жизни';

  @override
  String get getStarted => 'Начать';

  @override
  String get next => 'Далее';

  @override
  String get intro1card1 =>
      'Устанавливайте и отслеживайте личные финансовые цели';

  @override
  String get intro1card2 => 'Анализируйте свои доходы и расходы';

  @override
  String get intro1card3 => 'Повышайте свою финансовую грамотность';

  @override
  String get intro3card1header => 'Анализ';

  @override
  String get intro3card1body => 'Распределение доходов и расходов';

  @override
  String get intro3card2header => 'Цели';

  @override
  String get intro3card2body => 'Определите свои финансовые цели';

  @override
  String get intro3card3header => 'Игры';

  @override
  String get intro3card3body => 'Играя, вы узнаете о финансах';

  @override
  String get intro3card4header => 'Напоминания';

  @override
  String get intro3card4body => 'Сигналы о достижении целей';

  @override
  String get welcome => 'Добро пожаловать в Fundoo';

  @override
  String get welcomeBody => 'Войдите в свою учетную запись или создайте новую';

  @override
  String get createAccount => 'Создать аккаунт';

  @override
  String get logIn => 'Войти';

  @override
  String get enter => 'Войти';

  @override
  String get enterPhone => 'Введите свой номер телефона';

  @override
  String get onlyUzb => 'Только телефонные номера Узбекистана (+998)';

  @override
  String get sendCode => 'Отправить код';

  @override
  String get noAccount => 'У вас нет аккаунта? ';

  @override
  String get haveAccount => 'Уже есть аккаунт? ';

  @override
  String get signUp => 'Зарегистрироваться';

  @override
  String get verification => 'Подтверждение';

  @override
  String get verificationBody =>
      'Введите 6-значный код, отправленный на ваш номер телефона';

  @override
  String get resendCode => 'Отправить код повторно';

  @override
  String get verify => 'Подтвердить';

  @override
  String get register => 'Зарегистрироваться';

  @override
  String get askingPhone =>
      'Введите свой номер телефона. На него будет отправлен код подтверждения.';

  @override
  String get personalInfo => 'Личная информация';

  @override
  String get askingInfo =>
      'Для создания учетной записи, пожалуйста, заполните следующие поля.';

  @override
  String get fullName => 'Полное имя';

  @override
  String get userName => 'Имя пользователя';

  @override
  String get age => 'Возраст';

  @override
  String get continuing => 'Продолжить';

  @override
  String get profilePicture => 'Фото профиля';

  @override
  String get optional => 'необязательно';

  @override
  String get uploadLaterInfo => 'Вы можете загрузить фото позже';

  @override
  String get doneHeader => 'Давайте установим вашу первую цель';

  @override
  String get doneBody =>
      'Fundoo помогает вам экономить деньги и достигать того, что для вас важнее всего.';

  @override
  String get setGoal => 'Установить цель';

  @override
  String get whatGoal => 'Какая у вас цель? ✨';

  @override
  String get goalBody => 'Расскажите, чего вы хотите достичь.';

  @override
  String get writeGoal => 'Запишите свою цель';

  @override
  String get howMuch => 'Сколько вам нужно денег? 💰';

  @override
  String get howMuchBody =>
      'Определите сумму, необходимую для достижения вашей цели.';

  @override
  String get amount => 'Сумма цели (сум)';

  @override
  String get goalSum => 'Целевая сумма';

  @override
  String get howMuchYouHave => 'Сколько вы уже сэкономили? 🏦';

  @override
  String get howMuchYouHaveBody => 'Добавьте сумму, которая у вас уже есть.';

  @override
  String get currentAmount => 'Текущая сумма (сум)';

  @override
  String get currentSum => 'Текущая сумма';

  @override
  String get balanceChangingInfo =>
      'Вы можете изменить этот баланс в любое время.';

  @override
  String get whenGoal => 'Когда вы хотите достичь цели? 📅';

  @override
  String get whenGoalBody =>
      'Выберите временной интервал для достижения вашей цели.';

  @override
  String get month => 'месяц';

  @override
  String get dateSelect => 'Укажите целевую дату';

  @override
  String dateInfo(int sum) {
    return 'Каждый месяц вы будете экономить $sum сум.';
  }

  @override
  String get planIsReady => 'Ваш план готов!';

  @override
  String get planIsReadyBody =>
      'Для достижения вашей цели были введены все необходимые данные.';

  @override
  String get goal => 'Цель';

  @override
  String get currentBalance => 'Текущий баланс';

  @override
  String get duration => 'Срок';

  @override
  String get monthlySaving => 'Ежемесячная сумма для экономии';

  @override
  String get saveEveryMonth => 'Экономьте эту сумму каждый месяц';

  @override
  String get goToFundoo => 'Перейти в Fundoo 🚀';

  @override
  String get main => 'Главная';

  @override
  String get profile => 'Профиль';

  @override
  String get analytics => 'Аналитика';

  @override
  String get game => 'Игры';

  @override
  String get notifications => 'Уведомления';

  @override
  String get noNotifications => 'Пока нет уведомлений';

  @override
  String get soon => 'Скоро...';

  @override
  String get gamesBody =>
      'Увлекательные игры для изучения финансовой грамотности скоро появятся. Оставайтесь с нами!';

  @override
  String get gamesButton => '🚀 Скоро';

  @override
  String get logOut => 'Выйти';

  @override
  String get phoneNumber => 'Номер телефона';

  @override
  String get bio => 'О себе';

  @override
  String get darkMode => 'Темный режим';

  @override
  String get qa => 'Часто задаваемые вопросы';

  @override
  String get qaBody => 'Раздел FAQ';

  @override
  String get support => 'Поддержка';

  @override
  String get supportBody => 'У вас есть проблемы или вопросы?';

  @override
  String get about => 'О приложении';

  @override
  String get save => 'Сохранить';

  @override
  String get phoneChangingBody =>
      'Введите новый номер телефона. На него будет отправлен код подтверждения.';

  @override
  String get currentPhone => 'Текущий номер телефона';

  @override
  String get newPhone => 'Новый номер телефона';

  @override
  String get bioBody =>
      'Напишите немного о себе. Это будет отображаться на вашей странице профиля.';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String get deleteAccountBody => 'Все данные будут удалены';

  @override
  String get deleteDialogTitle =>
      'Вы действительно хотите удалить ваш аккаунт?';

  @override
  String get deleteDialogContentBody =>
      'Предупреждение! Ниже перечисленные элементы будут永久 удалены:';

  @override
  String get deleteDialogItem1 => 'Все личные данные';

  @override
  String get deleteDialogItem2 => 'Все ваши цели';

  @override
  String get deleteDialogItem3 => 'Все ваши аналитические данные';

  @override
  String get deleteDialogItem4 => 'Фото профиля и настройки';

  @override
  String get cancel => 'Отмена';

  @override
  String get delete => 'Да, удалить';

  @override
  String get controlPanel => 'Панель управления';

  @override
  String get savingPurpose => 'Цель экономии';

  @override
  String daysLeft(int days) {
    return '$days дней осталось';
  }

  @override
  String get addMoney => 'Добавить деньги';

  @override
  String get removeMoney => 'Удалить деньги';

  @override
  String get addNewGoal => 'Добавить новую цель';

  @override
  String get recentActivity => 'Последняя активность';

  @override
  String get seeAll => 'Смотреть все';

  @override
  String get addIncome => '💰 Добавить доход';

  @override
  String get addIncomeBody => 'Введите данные о доходе';

  @override
  String get incomeAmount => 'Сумма (сум) *';

  @override
  String get incomeCategory => 'Категория *';

  @override
  String get incomeDate => 'Дата';

  @override
  String get incomeNotes => 'Примечание (необязательно)';

  @override
  String get addExpanse => '💰 Добавить расход';

  @override
  String get addExpanseBody => 'Введите данные о расходе';

  @override
  String get editGoal => '✏️ Редактировать цель';

  @override
  String get editGoalBody => 'Обновите данные цели';

  @override
  String get thisMonthAnalytic => 'Этот месяц';

  @override
  String get allIncome => 'Весь доход';

  @override
  String get allSpending => 'Все расходы';

  @override
  String get savingDegree => 'Степень экономии';

  @override
  String get balanceHistory => 'История баланса';

  @override
  String get spendingDistribution => 'Распределение расходов';

  @override
  String get weekly => 'Еженедельно';

  @override
  String get monthly => 'Ежемесячно';

  @override
  String get yearly => 'Ежегодно';
}
