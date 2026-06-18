# Architecture

## Project Overview

| Field | Value |
|-------|-------|
| App name | BaseApp (per flavor: "BaseApp DEV", "BaseApp QA", "BaseApp") |
| Package name | `flutter_base_app` |
| Bundle ID | *fill in real iOS/Android bundle IDs* |
| Flavors | `dev`, `qa`, `prod` |
| Entry point | `lib/main.dart` |

### Flavors / Environments

| Flavor | Env file | Android app name | Android ID suffix |
|--------|----------|-----------------|-------------------|
| `dev`  | `env/.env.dev`  | BaseApp DEV | `.dev` |
| `qa`   | `env/.env.qa`   | BaseApp QA  | `.qa`  |
| `prod` | `env/.env.prod` | BaseApp     | (none) |

Active flavor is read from Flutter's native `appFlavor` variable (set by Android
`productFlavors` / iOS Xcode schemes). `EnvConfig.initialize(appFlavor)` loads
the matching `.env.*` file via `flutter_dotenv` before DI is bootstrapped.

---

## Flutter & Dart Versions

| | Version |
|-|---------|
| Flutter | 3.41.9 (stable) |
| Dart | 3.9.2 |
| Min SDK | `^3.5.3` |

---

## Key Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_bloc` | ^9.1.0 | State management (BLoC pattern) |
| `bloc` | ^9.0.0 | Core BLoC library |
| `get_it` | ^9.x | Service locator |
| `injectable` | ^2.7.x | Code-gen DI annotations |
| `fpdart` | ^1.1.1 | Functional types — `Either<Failure, T>` |
| `equatable` | ^2.0.7 | Value equality for domain error types only (`Failure`, `APIException`) |
| `freezed_annotation` | ^2.4.4 | Freezed annotations (runtime) — immutable classes, unions, copyWith |
| `auto_route` | ^10.1.2 | Declarative navigation with code-gen |
| `dio` | ^5.8.0 | HTTP client |
| `retrofit` | ^4.4.2 | Type-safe REST client (code-gen) |
| `json_annotation` / `json_serializable` | ^4.9.0 / ^6.9.4 | JSON serialization — kept for `BaseResponse<T>` (uses `genericArgumentFactories`) and as freezed's JSON pipeline |
| `freezed` | ^2.5.7 | **dev** — code-gen for all models, BLoC events, and BLoC states |
| `sqflite` | ^2.4.2 | Local SQLite database |
| `flutter_secure_storage` | ^9.2.4 | Encrypted token storage |
| `shared_preferences` | ^2.5.2 | Plain key/value persistence |
| `flutter_dotenv` | ^5.2.1 | `.env` file loading |
| `flutter_hooks` | ^0.20.5 | React-style hooks for widgets |
| `shimmer` | ^3.0.0 | Loading skeleton animations |
| `lottie` | ^3.3.1 | Lottie JSON animation rendering — used by `WelcomePage` splash screen |
| `flutter_native_splash` | ^2.4.4 | Extends native OS splash until `WelcomePage` is ready; `FlutterNativeSplash.preserve()` in `main()`, removed in `WelcomePage` on first frame |
| `cached_network_image` | ^3.4.1 | Image caching |
| `flutter_svg` | ^2.0.17 | SVG rendering |
| `firebase_core` | ^3.13.0 | Firebase SDK base |
| `firebase_auth` | ^5.5.3 | Firebase Authentication (email, Google, Apple) |
| `cloud_firestore` | ^5.5.0 | Firestore document database (user profiles, `customers` collection) |
| `firebase_messaging` | ^15.2.5 | Firebase Cloud Messaging — push notifications |
| `firebase_remote_config` | ^5.4.0 | Remote feature flags and app config |
| `firebase_analytics` | ^11.4.4 | Event tracking and screen views |
| `firebase_crashlytics` | ^4.3.4 | Crash and error reporting |
| `cloud_functions` | ^5.3.4 | Firebase Callable Functions |
| `google_sign_in` | ^6.3.0 | Google OAuth flow (used by `AuthDataSourceImpl`) |
| `sign_in_with_apple` | ^7.0.1 | Apple OAuth flow (used by `AuthDataSourceImpl`) |
| `facebook_app_events` | ^0.19.2 | Facebook App Events analytics — used by `FacebookAnalyticsServiceImpl` |
| `package_info_plus` | ^8.3.0 | App version and build number — used in `main.dart` to attach `version` to `app_opened` event |
| `logger` | ^2.5.0 | Structured logging |
| `pretty_dio_logger` | ^1.4.0 | Dio request/response logging |
| `requests_inspector` | ^4.2.3 | In-app HTTP inspector (non-prod only) |
| `crypto` | ^3.0.6 | SHA-256 for request signing |
| `intl` | (pinned) | i18n formatting |
| `dart_date` | ^1.4.0 | Date parsing/formatting helpers (used by `Helper`) |
| `path_provider` | ^2.1.5 | File-system path resolution (required by sqflite) |
| `path` | ^1.9.1 | Path joining (required by sqflite) |
| `app_links` | ^6.4.0 | Deeplink handling — both cold-start and warm-start, wraps platform deeplink streams |
| `appsflyer_sdk` | ^6.18.0 | AppsFlyer attribution and deep linking (replaced `flutter_branch_sdk`) |
| `collection` | ^1.19.1 | Collection utilities |
| `talker_dio_logger` | ^4.7.1 | Alternative Dio logger — present in pubspec but unused (pretty_dio_logger is active) |
| `connectivity_plus` | ^6.1.3 | Network connectivity checks — present in pubspec but not yet wired |
| `jiffy` | ^6.3.2 | Date manipulation — present in pubspec but unused (dart_date is active) |
| `geolocator` | ^13.0.2 | GPS location — present in pubspec but not yet wired |
| `google_maps_flutter` | ^2.10.0 | Interactive map — used by `PropertyLocationSection` (property detail screen) |
| `webview_flutter` | ^4.10.0 | WebView widget — used by `PrimeBeePage` for the AI chatbot |
| `webview_flutter_wkwebview` | ^3.0.0 | iOS WKWebView platform implementation — imported directly to configure `WebKitWebViewControllerCreationParams` (audio capture settings) |
| `speech_to_text` | ^7.0.0 | Native speech recognition — bridges `window.SpeechRecognition` in the PrimeBee WebView so voice input works on Android and iOS (Web Speech API is unavailable in WebView) |

**Code-gen dev dependencies:** `injectable_generator`, `retrofit_generator`,
`freezed`, `json_serializable`, `auto_route_generator`, `build_runner`

**UI dev tools:** Plain Flutter component catalog (no Widgetbook library) — run as a separate
entry point: `flutter run -t widgetbook/lib/main.dart`. Catalog sections live in
`widgetbook/lib/components/`. See Conventions for catalog file placement rules.

---

## Architecture Pattern

**Clean Architecture** — three strict layers per feature, with dependency flow
pointing only inward: `presentation → domain ← data`.

```
┌─────────────────────────────────────────┐
│  Presentation (UI, BLoC)                │  ← Flutter-aware
│    depends on Domain only               │
├─────────────────────────────────────────┤
│  Domain (Entities, UseCases, Repos)     │  ← Pure Dart, no Flutter
│    no outward dependencies              │
├─────────────────────────────────────────┤
│  Data (Models, DataSources, RepoImpl)   │  ← Flutter-aware, implements Domain
│    implements Domain interfaces         │
└─────────────────────────────────────────┘
```

---

## Folder Structure

```
lib/
├── core/                          # App-wide infrastructure (shared by all features)
│   ├── common/
│   │   ├── data_sources/          # Abstract + impl for shared data sources (e.g. Settings)
│   │   ├── repositories/          # Shared repository abstractions
│   │   └── usecases/
│   │       └── usecase.dart       # Base UseCaseWithParams / UseCaseWithoutParams
│   ├── config/
│   │   └── env_config.dart        # EnvConfig — reads .env.* values
│   ├── constants/
│   │   ├── api_const.dart         # APIConst (status strings)
│   │   ├── asset_const.dart       # AssetConst (asset paths)
│   │   ├── const.dart             # Const (supported languages, etc.)
│   │   └── date_const.dart        # DateConst (date format strings)
│   ├── data_base/
│   │   ├── database_helper.dart   # SQLite init + singleton access
│   │   ├── table_color.dart       # TableColor schema + createQuery
│   │   └── table_translation.dart # TableTranslation schema + createQuery
│   ├── di/
│   │   ├── injection.dart         # sl = GetIt.instance, configureDependencies()
│   │   ├── injection.config.dart  # GENERATED — do not edit
│   │   └── modules/
│   │       ├── app_module.dart    # @module: AppRouter, AppLocalizations
│   │       ├── network_module.dart# @module: Dio (with interceptors), ApiClient
│   │       └── firebase_module.dart # @module: all Firebase SDK singletons
│   ├── errors/
│   │   ├── exceptions.dart        # APIException, HashValidationException
│   │   └── failure.dart           # Failure, APIFailure, AppFailure
│   ├── migration/
│   │   └── old_app_bookmark_migration.dart  # OldAppBookmarkMigration — one-time migration of OldApp bookmark slugs from SharedPrefs into Firestore
│   ├── network/
│   │   ├── api_client.dart        # @RestApi() Retrofit client
│   │   ├── api_client.g.dart      # GENERATED
│   │   ├── interceptors/
│   │   │   ├── error_interceptor.dart
│   │   │   └── security_interceptor.dart
│   │   ├── responses/
│   │   │   ├── base_response.dart # BaseResponse<T> envelope
│   │   │   └── base_response.g.dart
│   │   └── safe_api_call.dart     # safeApiCall<T>() wrapper
│   ├── routes/
│   │   ├── app_router.dart        # @AutoRouterConfig — route list
│   │   └── app_router.gr.dart     # GENERATED
│   ├── services/                  # Cross-cutting services (each a mini Clean-Arch module)
│   │   ├── appsflyer/             # AppsFlyer attribution + deep linking
│   │   │   ├── appsflyer_service.dart       # @lazySingleton; SDK init, onDeepLinking stream, logEvent
│   │   │   └── appsflyer_link_service.dart  # @lazySingleton; builds OneLink URLs synchronously
│   │   ├── analytics/             # Firebase Analytics — simple service (no BLoC)
│   │   │   ├── analytics_service.dart
│   │   │   └── firebase_analytics_service_impl.dart
│   │   ├── crashlytics/           # Firebase Crashlytics — simple service (no BLoC)
│   │   │   ├── crashlytics_service.dart
│   │   │   └── firebase_crashlytics_service_impl.dart
│   │   ├── notifications/         # FCM — full Clean Arch + NotificationsBloc (global)
│   │   │   ├── data/datasources/ + repositories/
│   │   │   ├── domain/entities/ + repositories/ + usecases/
│   │   │   └── presentation/bloc/
│   │   ├── remote_config/         # Remote Config — full Clean Arch + RemoteConfigBloc (global)
│   │   │   ├── data/datasources/ + repositories/
│   │   │   ├── domain/repositories/ + usecases/
│   │   │   ├── presentation/bloc/
│   │   │   └── remote_config_defaults.dart
│   │   ├── colors/                # Dynamic color system (API → SQLite → ColorBloc)
│   │   ├── locale/                # Translations (JSON/API → SQLite → TranslationBloc)
│   │   └── theme/                 # Theme mode + font scale (SharedPrefs → ThemeBloc)
│   ├── utils/
│   │   ├── common.dart            # Global logger instance
│   │   ├── enums.dart             # Environment enum, enumFromString helper
│   │   ├── extension.dart         # Extensions on String, bool?, BuildContext, Object?
│   │   ├── helper.dart            # Helper singleton (JSON loading, date ops)
│   │   ├── language_helper.dart   # RTL detection, TextDirection, TextAlign helpers
│   │   ├── property_type_helper.dart  # Maps property type string → SVG icon asset path
│   │   ├── sap_mapper.dart        # SapMapper: languageIndexToId(), propertyTypeToId() — shared across features
│   │   ├── storage_manager.dart   # StorageManager static class + StorageKeys extension
│   │   ├── typedef.dart           # ResultFuture<T>, DataMap
│   └── phone_normalizer.dart  # PhoneNormalizer: normalize() — phone normalization only
│   └── widgets/                   # Shared UI components
│       ├── app_text_field.dart
│       ├── app_title_bar.dart      # transparent PreferredSizeWidget with back + title
│       ├── auth_base_page.dart
│       ├── base_page.dart          # gradient scaffold for post-login screens
│       ├── custom_app_bar.dart
│       ├── custom_text_field.dart  # legacy — superseded by app_text_field.dart
│       ├── font_scale_slider.dart
│       ├── plain_card.dart         # white card with shadow; base for section cards
│       ├── prime_logo.dart
│       ├── rich_text_button.dart
│       ├── section_introduction_card.dart  # illustration + title + subtitle + topRightWidget
│       ├── app_tab_bar.dart            # floating pill tab bar (3 tabs, elastic sliding indicator)
│       ├── otp_input.dart              # 6-cell OTP entry with countdown, shake, masking
│       ├── page_bottom_bar.dart        # pinned bottom CTA bar wrapper
│       ├── property_tile.dart          # property card with image, price, type/location, favorite button
│       ├── buttons/
│       │   ├── add_to_favorite_button.dart  # controlled toggle for property bookmarking
│       │   ├── chip_button.dart        # small pill button (primary/secondary variants)
│       │   ├── custom_text_button.dart
│       │   ├── nav_back_button.dart
│       │   ├── plain_text_button.dart
│       │   ├── primary_button.dart
│       │   ├── secondary_button.dart
│       │   ├── social_login_button.dart
│       │   └── text_icon_button.dart   # label + trailing chevron, no background/border
│       ├── pill_tab_switch.dart        # generic pill-shaped tab toggle (N tabs, full-width, animated active pill)
│       ├── calendar_date_view.dart     # date box: month abbreviation + day + year; takes DateTime
│       ├── payment_status_chip.dart    # PaymentStatusChipVariant { paid, pending, cancelled } chip; labels via AppLocalizations
│       ├── legend_dot.dart             # colored dot + label (used in cost overview legends)
│       ├── amount_column.dart          # dual-row amount display; topAmount nullable (null = single-amount mode)
│       └── paddings/
│           ├── default_h_padding.dart
│           ├── default_padding.dart
│           └── default_v_padding.dart
├── features/                      # All product features
│   ├── auth/                      # Authentication feature group
│   │   ├── data/                  # Shared auth data layer (Firebase Auth)
│   │   │   ├── datasources/
│   │   │   │   ├── auth_datasource.dart
│   │   │   │   └── auth_datasource_impl.dart  # wraps FirebaseAuth, GoogleSignIn, Apple
│   │   │   ├── models/
│   │   │   │   └── auth_user_model.dart        # maps firebase_auth.User → model/entity
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart
│   │   ├── domain/                # Shared auth domain layer
│   │   │   ├── entities/auth_user_entity.dart
│   │   │   ├── repositories/auth_repository.dart
│   │   │   └── usecases/
│   │   │       ├── sign_in_email_usecase.dart
│   │   │       ├── sign_in_google_usecase.dart
│   │   │       ├── sign_in_apple_usecase.dart
│   │   │       ├── sign_out_usecase.dart
│   │   │       ├── get_current_user_usecase.dart
│   │   │       └── get_auth_state_usecase.dart  # returns Stream<AuthUserEntity?>
│   │   ├── auth_landing/          # Auth landing — presentation-only (no BLoC yet)
│   │   │   └── presentation/
│   │   │       └── pages/auth_landing_page.dart
│   │   ├── auth_login/            # Login screen — BLoC wired (SignInEmailUseCase, GetUserProfileUseCase)
│   │   │   └── presentation/
│   │   │       ├── bloc/ (auth_login_bloc, _event, _state)
│   │   │       └── pages/auth_login_page.dart
│   │   └── on_boarding/           # Onboarding sub-group
│   │       ├── auth_personal_info/ # Personal info step — BLoC wired (RegisterUserUseCase)
│   │       │   ├── BEHAVIOUR_CONTRACT.md
│   │       │   └── presentation/
│   │       │       ├── bloc/ (auth_personal_info_bloc, _event, _state)
│   │       │       └── pages/auth_personal_info_page.dart
│   │       ├── auth_sms_otp_verify/ # SMS OTP verification
│   │       │   ├── BEHAVIOUR_CONTRACT.md
│   │       │   └── presentation/
│   │       │       ├── bloc/ (auth_sms_otp_verify_bloc, _event, _state)
│   │       │       └── pages/auth_sms_otp_verify_page.dart
│   │       ├── auth_email_otp_verify/ # Email OTP verification
│   │       │   ├── BEHAVIOUR_CONTRACT.md
│   │       │   └── presentation/
│   │       │       ├── bloc/ (auth_email_otp_verify_bloc, _event, _state)
│   │       │       └── pages/auth_email_otp_verify_page.dart
│   │       └── auth_login_credential/ # Set password — BLoC wired (ActivateAccountUseCase)
│   │           ├── BEHAVIOUR_CONTRACT.md
│   │           └── presentation/
│   │               ├── bloc/ (auth_login_credential_bloc, _event, _state)
│   │               └── pages/auth_login_credential_page.dart
│   ├── user_profile/              # Firestore-backed user profile
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── user_profile_datasource.dart
│   │   │   │   └── user_profile_datasource_impl.dart  # receives FirebaseFirestore
│   │   │   ├── models/user_profile_model.dart
│   │   │   └── repositories/user_profile_repository_impl.dart
│   │   └── domain/
│   │       ├── entities/user_profile_entity.dart
│   │       ├── repositories/user_profile_repository.dart
│   │       └── usecases/
│   │           ├── get_user_profile_usecase.dart
│   │           ├── create_user_profile_usecase.dart
│   │           └── update_user_profile_usecase.dart
│   ├── profile/                   # User profile screen — full presentation layer with BLoC
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── profile_bloc.dart    # @injectable — injected: GetCurrentUserUseCase, GetUserProfileUseCase, SignOutUseCase
│   │       │   ├── profile_event.dart   # started(), logoutRequested()
│   │       │   └── profile_state.dart   # ProfileStatus enum + ProfileState (userName, email, phone, avatarUrl, isGuest, isSapLocked)
│   │       └── pages/profile_page.dart  # @RoutePage(); launches EditAddressForm via AppFormModal with EditAddressBloc BlocProvider
│   ├── address/                   # Edit Address feature — Firestore province/district/city cascade + OldApp business rules
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── address_datasource.dart       # abstract
│   │   │   │   └── address_datasource_impl.dart  # @Injectable(as: AddressDataSource) — Firestore provinces/districts/cities
│   │   │   ├── models/
│   │   │   │   ├── province_model.dart    # @freezed — id, nameEn
│   │   │   │   ├── district_model.dart    # @freezed — AddressDistrictModel — id, nameEn, provinceId
│   │   │   │   └── city_model.dart        # @freezed — id, nameEn, districtId
│   │   │   └── repositories/address_repository_impl.dart  # @Injectable(as: AddressRepository)
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── province_entity.dart    # id, nameEn
│   │   │   │   ├── city_entity.dart        # id, nameEn, districtId
│   │   │   │   └── address_country.dart    # value object — id, label (hardcoded list in AddressConst)
│   │   │   ├── repositories/address_repository.dart  # abstract
│   │   │   └── usecases/
│   │   │       ├── fetch_provinces_usecase.dart   # @lazySingleton
│   │   │       ├── fetch_districts_usecase.dart   # @lazySingleton, params: String provinceId
│   │   │       └── fetch_cities_usecase.dart      # @lazySingleton, params: String districtId
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── edit_address_bloc.dart    # @injectable — handles prefill, cascading Firestore loads, SL switch, submit
│   │       │   ├── edit_address_event.dart   # started, countryChanged, provinceChanged, districtChanged, cityChanged, addressLine1Changed, addressLine2Changed, postalCodeChanged, stateProvinceTextChanged, cityTextChanged, submitted
│   │       │   └── edit_address_state.dart   # EditAddressStatus enum + all form field state
│   │       └── widgets/edit_address_form.dart  # Skeleton BlocConsumer — UI pass will complete the form body
│   ├── main_shell/                # Post-login tab shell — hosts all tab pages
│   │   ├── BEHAVIOUR_CONTRACT.md
│   │   └── presentation/
│   │       └── pages/main_shell_page.dart  # @RoutePage(), IndexedStack + floating AppTabBar
│   ├── property/                  # Shared property domain — model/entity used across all property features
│   │   ├── data/
│   │   │   └── models/
│   │   │       ├── property_detail_model.dart   # @freezed — unified model (list + detail fields + 5 nested types)
│   │   │       └── mapper/property_detail_mappers.dart
│   │   └── domain/
│   │       └── entities/property_detail_entity.dart  # + nested entity classes (Slider, FloorPlan, Amenity, etc.)
│   ├── home/                      # Home tab (tab 0) — HeaderProfileView, QuickLinks, FeaturedSlider, PopupBanner, logout
│   │   ├── BEHAVIOUR_CONTRACT.md
│   │   ├── data/
│   │   │   ├── datasources/featured_property_datasource.dart       # uses PropertyDetailModel
│   │   │   ├── datasources/featured_property_datasource_impl.dart
│   │   │   ├── datasources/popup_banner_datasource.dart
│   │   │   ├── datasources/popup_banner_datasource_impl.dart       # GET /PopUp; returns first item or null
│   │   │   ├── models/popup_banner_model.dart                      # @freezed; fields: mobileImage, extLink, intLink
│   │   │   ├── repositories/featured_property_repository_impl.dart
│   │   │   └── repositories/popup_banner_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/popup_banner_entity.dart                   # plain immutable class
│   │   │   ├── repositories/featured_property_repository.dart      # uses PropertyDetailEntity
│   │   │   ├── repositories/popup_banner_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_featured_properties_usecase.dart
│   │   │       └── get_popup_banner_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── home_bloc, home_event, home_state   # logout flow
│   │       │   ├── home_page_slider/
│   │       │   │   ├── home_page_slider_bloc.dart
│   │       │   │   ├── home_page_slider_event.dart
│   │       │   │   └── home_page_slider_state.dart
│   │       │   └── popup_banner/
│   │       │       ├── popup_banner_bloc.dart          # states: initial, loading, ready(banner?), error
│   │       │       ├── popup_banner_event.dart         # event: fetch()
│   │       │       └── popup_banner_state.dart
│   │       ├── pages/home_page.dart        # NOT @RoutePage() — embedded in MainShellPage
│   │       └── widgets/
│   │           ├── quick_links_view.dart   # home-only section widget
│   │           ├── home_page_slider_view.dart  # featured properties slider
│   │           └── popup_banner_dialog.dart    # showDialog with CachedNetworkImage; handles intLink/extLink nav
│   ├── menu/                      # Menu tab (tab 1) — stub
│   │   └── presentation/
│   │       └── pages/menu_page.dart        # NOT @RoutePage() — embedded in MainShellPage
│   ├── saved_property/            # Saved tab (tab 2) — full Clean Arch + global SavedPropertyBloc
│   │   ├── BEHAVIOUR_CONTRACT.md
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── saved_property_datasource.dart
│   │   │   │   └── saved_property_datasource_impl.dart  # Firestore arrayUnion/arrayRemove on customers/{uid}
│   │   │   └── repositories/
│   │   │       └── saved_property_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── repositories/saved_property_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_saved_properties_usecase.dart
│   │   │       ├── add_saved_property_usecase.dart      # defines AddSavedPropertyParams (uid, entity)
│   │   │       └── remove_saved_property_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── saved_property_bloc.dart             # @lazySingleton — global singleton
│   │       │   ├── saved_property_event.dart
│   │       │   └── saved_property_state.dart
│   │       └── pages/saved_property_page.dart           # NOT @RoutePage() — embedded in MainShellPage
│   ├── welcome_home/              # Post-OTP landing screen
│   │   ├── BEHAVIOUR_CONTRACT.md
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── welcome_home_bloc.dart
│   │       │   ├── welcome_home_event.dart
│   │       │   └── welcome_home_state.dart
│   │       └── pages/welcome_home_page.dart
│   ├── property_detail/           # Property detail screen — full Clean Arch + PropertyDetailBloc
│   │   ├── BEHAVIOUR_CONTRACT.md
│   │   ├── data/
│   │   │   ├── datasources/property_detail_datasource.dart         # abstract
│   │   │   ├── datasources/property_detail_datasource_impl.dart    # @Injectable
│   │   │   └── repositories/property_detail_repository_impl.dart   # @Injectable
│   │   ├── domain/
│   │   │   ├── repositories/property_detail_repository.dart        # abstract
│   │   │   └── usecases/get_property_detail_usecase.dart           # @lazySingleton
│   │   └── presentation/
│   │       ├── bloc/ (property_detail_bloc, _event, _state)        # @injectable
│   │       └── pages/property_detail_page.dart                     # @RoutePage(), slug path param, parallax + glass UI
│   ├── search_filter/             # Search & filter — full Clean Arch + SearchFilterBloc
│   │   ├── BEHAVIOUR_CONTRACT.md
│   │   ├── data/
│   │   │   ├── datasources/ (search_filter_datasource, _impl)
│   │   │   ├── models/ (amenity_model, district_model + freezed/g)
│   │   │   ├── mapper/search_filter_mappers.dart
│   │   │   └── repositories/search_filter_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/ (amenity_entity, district_entity, search_filter_params, property_search_result)
│   │   │   ├── repositories/search_filter_repository.dart
│   │   │   └── usecases/ (get_amenities, get_districts, search_properties)
│   │   └── presentation/
│   │       ├── bloc/ (search_filter_bloc, _event, _state)  # @injectable; search history, pagination; events: initialized, initializedWithFilter(SearchFilterParams), filterApplied, filterCleared, searchSubmitted, loadMoreRequested, historyItemRemoved
│   │       ├── pages/search_filter_page.dart               # @RoutePage(), slideLeft; optional initialFilter: SearchFilterParams? pre-seeds filter and triggers search on open
│   │       └── widgets/ (search_filter_sheet, search_filter_filter_button, recent_search_overlay)
│   ├── my_property/               # My Properties — full Clean Arch + MyPropertyBloc (SAP backend)
│   │   ├── BEHAVIOUR_CONTRACT.md
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── my_property_datasource.dart          # abstract
│   │   │   │   └── my_property_datasource_impl.dart     # @Injectable; calls SapApiClient.searchCustomerReservations + getReservationDetail
│   │   │   ├── models/
│   │   │   │   ├── reservation_model.dart               # @freezed; nested: ReservationInstallmentModel, ReservationPaymentHistoryModel
│   │   │   │   └── mapper/reservation_mappers.dart      # toEntity() extensions for all three model types
│   │   │   └── repositories/my_property_repository_impl.dart  # @Injectable
│   │   ├── domain/
│   │   │   ├── entities/reservation_entity.dart         # ReservationEntity + ReservationInstallmentEntity + ReservationPaymentHistoryEntity
│   │   │   ├── repositories/my_property_repository.dart # abstract; getMyReservations + getReservationDetail
│   │   │   └── usecases/
│   │   │       ├── get_my_reservations_usecase.dart     # @lazySingleton; param = email String
│   │   │       └── get_reservation_detail_usecase.dart  # @lazySingleton; param = int docNum
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── my_property_bloc.dart    # @injectable; fetches auth user → profile → reservations; per-docNum detail loading
│   │       │   ├── my_property_event.dart   # started(), refreshRequested(), loadReservationDetail(int docNum)
│   │       │   └── my_property_state.dart   # MyPropertyStatus enum + MyPropertyState (with loadingDetailDocNums, errorDetailDocNums, loadedDetailDocNums Sets)
│   │       ├── pages/my_property_page.dart  # @RoutePage(), slideLeft; _SliderContent HookWidget; AnimatedSwitcher + KeyedSubtree for slide+fade on property change
│   │       └── widgets/
│   │           ├── reservation_detail_card.dart     # Payment/cost overview card; uses shared LegendDot + AmountColumn
│   │           ├── installment_overview_card.dart   # PillTabSwitch (Instalment / Payment History); PaymentListItem list; shimmer loading; error+retry
│   │           └── payment_list_item.dart           # Row: CalendarDateView + title + PaymentStatusChip + AmountColumn
│   ├── purchase_request/          # Purchase Request — full Clean Arch + PurchaseRequestBloc + UserPurchaseRequestsBloc
   │   ├── data/
   │   │   ├── datasources/
   │   │   │   ├── purchase_request_datasource.dart         # abstract
   │   │   │   └── purchase_request_datasource_impl.dart    # @Injectable; calls SapApiClient.createCrmEntry + getBuyRequests
   │   │   ├── models/
   │   │   │   ├── purchase_request_submit_model.dart       # plain class; toJson() builds nested SAP request body; SAP constants as private _k* consts
   │   │   │   ├── purchase_request_response_model.dart     # @freezed; errorCode/errorMessage; isSuccess = 200–209
   │   │   │   ├── user_purchase_request_model.dart         # @freezed; JsonKey(PreferedProject) → preferredProject; toEntity() via extension
   │   │   │   └── sap_purchase_request_mapper.dart         # SapPurchaseRequestMapper: propertyTypeToId(), languageKeyToId(), languageIndexToId()
   │   │   └── repositories/purchase_request_repository_impl.dart  # @Injectable; safeRepoCall for both methods
   │   ├── domain/
   │   │   ├── entities/purchase_request_entity.dart        # preferredProject String (SAP JSON key "PreferedProject" is the API typo)
   │   │   ├── repositories/purchase_request_repository.dart  # abstract
   │   │   └── usecases/
   │   │       ├── submit_purchase_request_usecase.dart     # @lazySingleton; params: SubmitPurchaseRequestParams (@freezed)
   │   │       └── get_user_purchase_requests_usecase.dart  # @lazySingleton; param = email String
   │   └── presentation/
   │       └── bloc/
   │           ├── purchase_request_bloc.dart               # @injectable — injected: SubmitPurchaseRequestUseCase, GetCurrentUserUseCase, GetUserProfileUseCase; fetches profile internally
   │           ├── purchase_request_event.dart              # submitPurchaseRequest(propertyCode, propertyType, languageKey, interestPercentage)
   │           ├── purchase_request_state.dart              # initial | loading | success | error(message)
   │           ├── user_purchase_requests_bloc.dart         # @injectable — injected: GetUserPurchaseRequestsUseCase
   │           ├── user_purchase_requests_event.dart        # fetch(email) | refetch(email)
   │           └── user_purchase_requests_state.dart        # initial | loading | loaded(requests) | error({message?}); UserPurchaseRequestsLoadedExt.hasRequestedProperty()
│   ├── refer_friend/              # Refer a Friend — full Clean Arch + ReferFriendBloc
   │   ├── data/
   │   │   ├── datasources/
   │   │   │   ├── refer_friend_datasource.dart             # abstract; AlreadyReferredByUserException defined here
   │   │   │   └── refer_friend_datasource_impl.dart        # @Injectable; calls SapApiClient.createCrmEntry; wraps fromJson in try/catch for TypeError/FormatException
   │   │   ├── models/
   │   │   │   └── refer_friend_submit_model.dart           # plain class; toJson() builds SAP request body; LeadChannelId=31, LeadSourceId=4; single propertyTypeId field used for both InterestedPropertyCategoryID and PropertyTypeID
   │   │   └── repositories/refer_friend_repository_impl.dart  # @Injectable; maps AlreadyReferredByUserException → AlreadyReferredFailure (via repository re-export)
   │   ├── domain/
   │   │   ├── errors/refer_friend_failures.dart            # AlreadyReferredFailure extends Failure
   │   │   ├── repositories/refer_friend_repository.dart    # abstract; re-exports refer_friend_failures.dart
   │   │   └── usecases/submit_refer_friend_usecase.dart    # @lazySingleton; params: SubmitReferFriendParams (@freezed)
   │   └── presentation/
   │       ├── bloc/
   │       │   ├── refer_friend_bloc.dart                   # @injectable — injected: SubmitReferFriendUseCase, GetCurrentUserUseCase, GetUserProfileUseCase; splits name on first space; uses SapMapper (core/utils) for language/property mapping
   │       │   ├── refer_friend_event.dart                  # submitted(titleId, name, phone, email, langIndex, interest, entity)
   │       │   └── refer_friend_state.dart                  # initial | loading | success | alreadyReferred | error(message)
   │       ├── pages/refer_friend_modal.dart                # BlocProvider(sl<ReferFriendBloc>()); BlocListener exhaustive switch; submit button enabled only when name+phone+email+lang set
   │       └── widgets/
   │           ├── refer_friend_form_body.dart              # HookWidget; exposes onFormChanged callback with all field values
   │           ├── refer_friend_property_card.dart
   │           └── property_badge.dart
   ├── wizard/                    # JSON-driven multi-step form wizard — full Clean Arch; supports local asset and API-fetched definitions
│   │   ├── BEHAVIOUR_CONTRACT.md
│   │   ├── data/
│   │   │   ├── datasources/wizard_datasource.dart                # abstract: loadWizard(assetPath)
│   │   │   ├── datasources/wizard_local_datasource_impl.dart     # @Injectable(as: WizardDataSource); uses Helper.loadLocalJsonData
│   │   │   ├── datasources/wizard_remote_datasource.dart         # abstract: fetchWizardFromApi(slug)
│   │   │   ├── datasources/wizard_remote_datasource_impl.dart    # @Injectable(as: WizardRemoteDataSource); calls ApiClient.getWizardForm
│   │   │   ├── models/response/wizard_form_response.dart         # plain parse-and-discard model for GET /forms/{slug}
│   │   │   └── repositories/wizard_repository_impl.dart          # @Injectable; injected: WizardDataSource, ApiClient, WizardRemoteDataSource
│   │   ├── domain/
│   │   │   ├── entities/ (WizardDefinition, WizardStep, WizardField, WizardFieldType enum,
│   │   │   │              WizardOption, WizardTransition, WizardCondition, WizardValidationRule,
│   │   │   │              WizardValidationType enum, WizardMeta, WizardIntro, WizardSubmission)
│   │   │   ├── repositories/wizard_repository.dart               # abstract; getWizard, submitWizard, fetchWizardFromApi
│   │   │   └── usecases/
│   │   │       ├── load_wizard_usecase.dart                      # @lazySingleton; params: LoadWizardParams(assetPath)
│   │   │       ├── submit_wizard_usecase.dart                    # @lazySingleton; params: WizardSubmission; POST /forms/{slug}/submissions
│   │   │       └── fetch_wizard_from_api_usecase.dart            # @lazySingleton; params: String slug; GET /forms/{slug}
│   │   └── presentation/
│   │       ├── bloc/ (wizard_bloc, wizard_event, wizard_state)   # @injectable; injected: LoadWizardUseCase, SubmitWizardUseCase, FetchWizardFromApiUseCase
│   │       ├── pages/wizard_page.dart                            # @RoutePage(); optional params: wizardAssetPath OR wizardSlug (one required)
│   │       └── widgets/
│   │           ├── wizard_field_renderer.dart  # switch on WizardFieldType → correct input widget
│   │           ├── wizard_checkbox_group_field.dart   # multi-select tiles using AppCheckbox
│   │           ├── wizard_date_time_field.dart         # date+time picker field
│   │           ├── wizard_image_field.dart             # display-only CachedNetworkImage
│   │           └── wizard_notice_field.dart            # display-only styled text block
│   ├── example/                   # Example feature group
│       ├── beneficiaries/         # Full example feature
│       ├── login/                 # Login screen (no BLoC yet)
│       └── welcome/               # Welcome + language selection
└── main.dart
```

---

## Feature Module Structure

Every feature follows this template (using `beneficiaries` as the canonical example):

```
features/<group>/<feature>/
├── data/
│   ├── datasources/
│   │   ├── <feature>_remote_datasource.dart        # abstract interface
│   │   ├── <feature>_remote_datasource_impl.dart   # @Injectable(as: ...) Retrofit impl
│   │   ├── <feature>_local_datasource.dart         # abstract interface
│   │   └── <feature>_local_datasource_impl.dart    # @Injectable(as: ...) SQLite/cache impl
│   ├── models/
│   │   ├── <feature>_model.dart                    # @freezed DTO (+ fromJson for API models)
│   │   ├── <feature>_model.freezed.dart            # GENERATED
│   │   ├── <feature>_model.g.dart                  # GENERATED (JSON — only if fromJson used)
│   │   ├── mapper/<feature>_mappers.dart            # extension .toEntity() on model
│   │   └── response/<feature>_list_response.dart   # @freezed response wrapper model
│   └── repositories/
│       └── <feature>_repository_impl.dart          # @Injectable(as: IRepo)
├── domain/
│   ├── entities/<feature>_entity.dart              # pure Dart, no annotations
│   ├── repositories/<feature>_repository.dart      # abstract interface
│   └── usecases/<feature>_usecase.dart             # @lazySingleton, extends UseCase base
├── presentation/
│   ├── bloc/
│   │   ├── <feature>_bloc.dart                     # @injectable — imports event + state files
│   │   ├── <feature>_event.dart                    # standalone @freezed sealed class
│   │   └── <feature>_state.dart                    # standalone @freezed class or sealed class
│   └── pages/<feature>_page.dart                   # @RoutePage()
```

No `injection_container.dart` per feature — injectable discovers all annotated
classes automatically during `build_runner`.

### Presentation-Only Feature Folders

Auth screens that have no BLoC yet (and therefore no data/domain layers) use a minimal folder:

```
features/<group>/<feature>/
└── presentation/
    └── pages/<feature>_page.dart   # @RoutePage(), HookWidget or StatelessWidget
```

Data/domain layers are added when a BLoC is introduced. Do **not** pre-create empty folders.

### HookWidget for Presentation-Only Pages

Pages that need `TextEditingController` or `FocusNode` but have no BLoC yet use `HookWidget`
from `flutter_hooks` instead of `StatefulWidget`:

```dart
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class AuthLoginPage extends HookWidget {
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    // controllers are automatically disposed when the widget is removed
    ...
  }
}
```

Use `HookWidget` only for presentation-only pages. Pages with a BLoC use `StatelessWidget` +
`BlocProvider` (BLoC owns state; no hooks needed).

---

## Base Classes

| Class | File | Purpose |
|-------|------|---------|
| `UseCaseWithParams<Type, Params>` | `core/common/usecases/usecase.dart` | Base for use cases that take a parameter |
| `UseCaseWithoutParams<Type>` | `core/common/usecases/usecase.dart` | Base for parameterless use cases |
| `Failure` | `core/errors/failure.dart` | Base failure type (abstract, Equatable) |
| `APIFailure` | `core/errors/failure.dart` | Network error failure |
| `AppFailure` | `core/errors/failure.dart` | General app failure |
| `APIException` | `core/errors/exceptions.dart` | Network exception with localized messages |
| `BasePage` | `core/widgets/base_page.dart` | Standard page scaffold wrapper |

---

## Code Generation

Five generators are used; all require:
```bash
dart run build_runner build --delete-conflicting-outputs
```

| Generator | Annotation | Output |
|-----------|-----------|--------|
| `injectable_generator` | `@injectable`, `@lazySingleton`, etc. | `lib/core/di/injection.config.dart` |
| `retrofit_generator` | `@RestApi()` | `lib/core/network/api_client.g.dart` |
| `freezed` | `@freezed` on models, events, states | `<file>.freezed.dart` (+ `<file>.g.dart` for JSON) |
| `json_serializable` | `@JsonSerializable()` — `BaseResponse<T>` only | `base_response.g.dart` |
| `auto_route_generator` | `@AutoRouterConfig`, `@RoutePage` | `lib/core/routes/app_router.gr.dart` |

**Note on `.g.dart` with freezed:** Every `@freezed` class that declares `fromJson` generates
**both** a `.freezed.dart` (class machinery) and a `.g.dart` (JSON functions via json_serializable
under the hood). Models without `fromJson` produce only `.freezed.dart`.

**Global build config** is in `build.yaml` at the project root — sets
`field_rename: snake` and `explicit_to_json: true` for json_serializable.

---

## Barrel Exports

**None used.** Always import specific file paths. Never create `index.dart`
or barrel files.
