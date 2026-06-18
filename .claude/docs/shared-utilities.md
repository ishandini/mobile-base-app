# Shared Utilities

## StorageManager — `lib/core/utils/storage_manager.dart`

Static class. Two backends: `flutter_secure_storage` (encrypted) and `SharedPreferences`.

```dart
// Write
await StorageManager.saveString(key, value, secure: false); // secure: true for sensitive
await StorageManager.saveBool(key, value);
await StorageManager.saveStringList(key, ['a', 'b']);       // plain SharedPreferences only

// Read
final str  = await StorageManager.getString(key, secure: false);
final b    = await StorageManager.getBool(key);
final list = await StorageManager.getStringList(key);       // returns [] if absent

// Delete
await StorageManager.remove(key, secure: false);
await StorageManager.clear(secure: false);  // clears all keys in that storage
```

### Storage Keys — `StorageKeys` extension on `StorageManager`

| Constant | Key string | Used for |
|----------|-----------|---------|
| `StorageKeys.isLoggedIn` | `'isLoggedIn'` | Firebase session flag (secure) |
| `StorageKeys.fcmToken` | `'fcmToken'` | FCM device token (local cache, sync to Firestore after login) |
| `StorageKeys.username` | `'username'` | Persisted username |
| `StorageKeys.language` | `'language'` | Selected language code |
| `StorageKeys.themeMode` | `'themeMode'` | ThemeMode string |
| `StorageKeys.fontScale` | `'fontScale'` | FontScale enum string |
| `StorageKeys.translationSyncDateTime` | `'translationSyncDateTime'` | Last sync timestamp |
| `StorageKeys.colorSyncDateTime` | `'colorSyncDateTime'` | Last color sync timestamp |
| `StorageKeys.pendingPhone` | `'pendingPhone'` | Phone (Firestore format `'94 771234567'`) set by `RegisterUserUseCase`; read by `AuthSmsOtpVerifyBloc._onStarted` |
| `StorageKeys.pendingEmail` | `'pendingEmail'` | Email set by `RegisterUserUseCase`; read by `AuthEmailOtpVerifyBloc._onStarted` and `AuthLoginCredentialBloc._onStarted` |
| `StorageKeys.welcomeHomeShown` | `'welcomeHomeShown'` | `true` after user presses a button on `WelcomeHomePage`; set by `ActivateAccountUseCase` to `false` on activation, then set to `true` by `WelcomeHomeBloc` when user taps a CTA |
| `StorageKeys.hasLaunched` | `'hasLaunched'` | Stored in **plain SharedPreferences** (not secure). Absence = fresh install. Written once by `FreshInstallGuard` on first launch. |
| `StorageKeys.searchHistory` | `'searchHistory'` | Recent search keywords (plain SharedPreferences string list, max 5 entries, managed by `SearchFilterBloc`) |

Android secure storage uses `encryptedSharedPreferences: true`.
iOS secure storage uses `KeychainAccessibility.first_unlock_this_device` + `synchronizable: true`.

---

## Helper — `lib/core/utils/helper.dart`

Singleton (`Helper._internal()`). Access via `Helper()`.

```dart
// Load a JSON file from assets
final data = await Helper().loadLocalJsonData(path: 'assets/data/file.json');

// Current date as formatted string
final str = Helper().getStringDateNow('dd-MM-yyyy');

// Convert Unix timestamp (seconds) to formatted date string
final str = Helper().getDateFromTimeStamp(timestamp, DateConst.ddMMMyyyyDash);

// Check if a date string is within a range
final inRange = Helper().isDateInRange(start: start, end: end, dateTime: '21-Mar-2025 10:30:00');

// Parse date string using the standard 24h format
final dt = Helper().getDateTime24('21-Mar-2025 10:30:00');
```

---

## Extensions — `lib/core/utils/extension.dart`

### `OptionalBoolExtension on bool?`

```dart
nullableBool.orTrue   // returns true if null
nullableBool.orFalse  // returns false if null
```

### `StringExtension on String`

```dart
'1234.5'.toCurrency()                      // '1,234.50'
'1234'.toCurrency(isDecibleOmitted: true)  // '1,234'
'1500000'.toAmount()                       // 'LKR 1,500,000'
'1500000'.toAmount(showDecimals: true)     // 'LKR 1,500,000.00'
'hello world'.allWordsCapitilize()         // 'Hello World'
'user@example.com'.isValidEmail            // true — requires char@domain.tld
'861234567V'.isValidNic                    // true — old format (9 digits + V/X) with day-of-year check
'200086123456'.isValidNic                  // true — new format (12 digits) with day-of-year check
'hello world'.toCapitalized()              // 'Hello world'
'#FF5733'.toColor()                        // Color
'42'.toInt()                               // 42 (0 on parse fail)
'3.14'.toDouble()                          // 3.14 (0 on parse fail)
'21-Mar-2025 10:30:00'.toDateTimeObject()  // DateTime
'21-Mar-2025 10:30:00'.toDateTimeString('dd/MM/yyyy')  // '21/03/2025'
'+94771234567'.maskPhone()                             // '+94 7*****4567'
'alex@gmail.com'.maskEmail()                           // 'a***@gmail.com'
'+94 771234567'.digitsOnly                             // '94771234567' — strips all non-digit chars
```

### `StringHtmlExtension on String`

```dart
'<p>Hello <b>world</b></p>'.stripHtml()  // 'Hello world'
```

Strips HTML to plain text. Converts `<li>` → `\n • ` (bullets), `<p>` → `\n` (paragraph breaks), decodes `&nbsp;` / `&amp;` / `&lt;` / `&gt;`, then regex-strips all remaining tags. Used in `PropertyDetailPage` to sanitize API description before rendering.

### `OptionalStringExtension on String?`

```dart
nullableStr.toCurrency()         // currency-formatted string, treats null as '0'
nullableStr.toAmount()           // 'LKR 1,500,000' — full formatted amount
nullableStr.toShortAmount()      // 'LKR 1.5M' — millions format (omits .0 for whole numbers); used in PropertyTile
nullableStr.toShortValue()       // '1.5M' — millions format without currency prefix; used in PropertyDetailPage price block
nullableStr.orEmpty              // '' if null
nullableStr.orZero               // '0' if null
nullableStr.orZeroWithDecimal    // '0.00' if null
nullableStr.orDash               // '-' if null or empty
nullableStr.newLine              // '$this \n' or '' if null/empty
```

### `ContextExtension on BuildContext`

```dart
context.unfocus()  // dismisses keyboard

await context.showModal(myWidget)            // dismissible bottom sheet
await context.showUndismissableModal(myWidget) // non-dismissible bottom sheet
```

### `GeneralObjectExtension on Object?`

```dart
anyObject.isNull        // true if null
anyObject.isNotNull     // true if not null
anyObject.isNullOrEmpty // true if null, empty String, empty Iterable, or empty Map
```

---

## DeepLinkAnalyticsHelper — `lib/core/deeplinks/deep_link_analytics_helper.dart`

Free functions (no class, no DI registration). Used by `DeepLinkHandler`, `DeepLinkService`, and all auth post-login pages.

```dart
// Sets attribution on DeepLinkAttributionNotifier and fires 'deeplink_navigated' event.
// Skip for ExternalUrlDestination — launchUrl fires no route push so the flag would get stuck.
void fireDeeplinkNavigatedAndSetAttribution(DeepLinkDestination destination)

// Maps a DeepLinkDestination to its analytics string name.
// Used by both deeplink_received and deeplink_navigated events to ensure consistent naming.
String deeplinkDestinationName(DeepLinkDestination destination)
```

**Destination → name mapping:**

| Destination | Name string |
|-------------|------------|
| `PropertyDetailDestination` | `'property_detail'` |
| `ProfileDestination` | `'profile'` |
| `MyPropertiesDestination` | `'my_property'` |
| `PurchaseRequestsDestination` | `'purchase_requests'` |
| `ReferralSalesDestination` | `'referral_sales'` |
| `BookmarkedPropertiesDestination` | `'saved_property'` |
| `PrimeBeeDestination` | `'prime_bee'` |
| `NotificationsDestination` | `'notifications'` |
| `AboutUsDestination` | `'about_us'` |
| `SearchFilterDestination` | `'search_filter'` |
| `ExternalUrlDestination` | `'external_url'` |
| `WizardDestination` | `'wizard'` |

---

## SapMapper — `lib/core/utils/sap_mapper.dart`

Pure static utility. Private constructor — not instantiable.

Centralises SAP integer ID mappings that are shared across features (refer_friend, purchase_request).
No feature's presentation or data layer needs to cross a feature boundary just for these lookups.

```dart
// Maps 0-based language selection index to SAP LanguageId
SapMapper.languageIndexToId(0)  // → 2 (Sinhala)
SapMapper.languageIndexToId(1)  // → 1 (English)
SapMapper.languageIndexToId(2)  // → 3 (Tamil)
SapMapper.languageIndexToId(99) // → 1 (default)

// Maps property type name string to SAP PropertyTypeID
SapMapper.propertyTypeToId('apartment')  // → 3
SapMapper.propertyTypeToId('Apartment')  // → 3 (case-insensitive)
SapMapper.propertyTypeToId('house')      // → 2
SapMapper.propertyTypeToId('villa')      // → 2
SapMapper.propertyTypeToId('land')       // → 1 (fallback)
SapMapper.propertyTypeToId(null)         // → 1 (null-safe)
```

Note: `SapPurchaseRequestMapper` in the `purchase_request` feature remains in place for its own feature use.
`SapMapper` is the shared equivalent for use outside that feature.

---

## PropertyTypeHelper — `lib/core/utils/property_type_helper.dart`

Maps a property type string (as returned by the API) to its corresponding SVG icon asset path.
Used by `PropertyTile` and `DiscoverPropertiesView`'s `FilterChipButton` rows to keep icon-to-type
mapping consistent across the app.

```dart
// Returns an AssetConst SVG path
PropertyTypeHelper.iconFor('Apartment')   // → AssetConst.iconFilterApartments
PropertyTypeHelper.iconFor('apartments')  // → AssetConst.iconFilterApartments (case-insensitive)
PropertyTypeHelper.iconFor('House')       // → AssetConst.iconFilterHouses
PropertyTypeHelper.iconFor('houses')      // → AssetConst.iconFilterHouses
PropertyTypeHelper.iconFor('Land')        // → AssetConst.iconFilterLand
PropertyTypeHelper.iconFor('unknown')     // → AssetConst.iconFilterAll (fallback)
```

The class has a private constructor (`PropertyTypeHelper._()`) — it is a pure static utility, not
instantiable. The `iconFor` method lowercases and trims the input before matching.

---

## AddressConst — `lib/core/constants/address_const.dart`

Hardcoded country list and storage-format helpers for the Edit Address feature.

```dart
AddressConst.countries          // List<AddressCountry> — 11 countries with id/label
AddressConst.sriLankaId         // '8' — constant for Sri Lanka ID
AddressConst.resolveCountryId(stored)    // stored country value → country ID string
AddressConst.storageValueFor(id, label)  // id + label → value to write to Firestore
AddressConst.localizationKey(id)         // country ID → l10n key suffix (e.g. '8' → 'sri_lanka')
```

`localizationKey` is used inside `EditAddressForm` to build the dropdown display label:
```dart
AppLocalizations.of(context).translate(
  'address_country_${AddressConst.localizationKey(c.id)}',
)
// e.g. 'address_country_sri_lanka', 'address_country_australia'
```

Business rules (ported from OldApp):
- Sri Lanka is stored as its ID `"8"` in Firestore.
- Other countries are stored by their name string (e.g. `"Australia"`).
- `resolveCountryId` handles both: if stored value length > 3 it is a name, otherwise it's already an ID.

Country list: Australia (1), Bahrain (2), Canada (3), Kuwait (4), Oman (5), Qatar (6), Saudi Arabia (7), Sri Lanka (8), UAE (9), UK (10), USA (11).

---

## LanguageHelper — `lib/core/utils/language_helper.dart`

Static helper for RTL detection. `isRTL` currently returns `false` (RTL disabled while
Tamil layout is not yet designed); `textDirection` always returns `TextDirection.ltr`.

```dart
LanguageHelper.isRTL(context)           // bool — always false (RTL not yet active)
LanguageHelper.textDirection(context)   // TextDirection.ltr
LanguageHelper.textAlign(context)       // TextAlign.left
```

---

## NotificationConst — `lib/core/constants/notification_const.dart`

FCM push notification type identifiers and payload field keys. Values must match the backend FCM v1 data payload.

### Type constants (`data['type']`)

| Constant | Value | Action |
|----------|-------|--------|
| `NotificationConst.typeProperty` | `'property'` | Navigate to `PropertyDetailPageRoute(slug: ...)` |
| `NotificationConst.typeGeneralNotification` | `'general_notification'` | Show `AlertDialog` using notification title/body |
| `NotificationConst.typeAppVersionUpdate` | `'app_version_update'` | Show `AlertDialog` using notification title/body |

### Payload field key constants

| Constant | Value | Notes |
|----------|-------|-------|
| `NotificationConst.keyType` | `'type'` | Discriminator field present in all payloads |
| `NotificationConst.keyPropertyId` | `'property_id'` | Property handle/slug; present when `typeProperty` |
| `NotificationConst.keyTitle` | `'title'` | Notification title; present in general/version payloads |
| `NotificationConst.keyBody` | `'body'` | Notification body; present in general/version payloads |

---

## Const — `lib/core/constants/const.dart`

General-purpose string constants shared across the app.

| Constant | Value | Notes |
|----------|-------|-------|
| `Const.languageEn` | `'en'` | English language code |
| `Const.languageSi` | `'si'` | Sinhala language code |
| `Const.languageTa` | `'ta'` | Tamil language code |
| `Const.currencyCode` | `'LKR'` | Currency prefix |
| `Const.emDash` | `'\u2014'` | Em dash placeholder for null/empty text fields |

Use `Const.emDash` as the fallback value for any display field that may be null or empty:
```dart
value: someNullable ?? Const.emDash
value: text.isEmpty ? Const.emDash : text
```

---

## ValidationConst — `lib/core/constants/validation_const.dart`

Centralised validation thresholds. Import and reference these instead of inlining magic numbers.

| Constant | Value | Used for |
|----------|-------|---------|
| `ValidationConst.minNameLength` | `2` | First / last name fields in profile edit |
| `ValidationConst.minGuestNameLength` | `3` | Guest display name in `GuestNameInputDialog` |
| `ValidationConst.minPhoneDigits` | `7` | Minimum digit count for phone field submission |
| `ValidationConst.minPhoneLength` | `9` | Minimum total chars to consider a phone "complete" (dial code + number) |
| `ValidationConst.minAddressFieldLength` | `5` | Address line 1, state/province, city text fields |
| `ValidationConst.otpDigitCount` | `6` | Default digit count for `OtpInput` widget |
| `ValidationConst.minAccountNumberLength` | `6` | Minimum digits for bank account number in `TransferRequestPage` |
| `ValidationConst.minAccountNameLength` | `3` | Minimum chars for account holder name in `TransferRequestPage` |
| `ValidationConst.sriLankaCommercialBanks` | `List<String>` (16 items) | Licensed Sri Lankan commercial bank names for the bank dropdown in `TransferRequestPage` |

**New asset constant added:**
- `AssetConst.iconSecure` → `'assets/images/icon_secure.png'` — green shield PNG used in `TransferRequestPage` security notice row

---

## DateConst — `lib/core/constants/date_const.dart`

Pre-defined date format strings for use with `DateFormat` / `dart_date`.

| Constant | Format string |
|----------|--------------|
| `DateConst.ddMMMyyyyDash` | `'dd-MMM-yyyy'` |
| `DateConst.ddMMyyyyDash` | `'dd-MM-yyyy'` |
| `DateConst.ddMMMYyyyDashHHmmssDot` | `'dd-MMM-yyyy HH:mm:ss'` (primary parse format) |
| `DateConst.ddMMMMyySpace` | `'dd MMMM yy'` |
| `DateConst.ddMMMMyyyySpace` | `'dd MMMM yyyy'` |
| `DateConst.ddMMMyySpace` | `'dd MMM yy'` |
| `DateConst.dMMMySpace` | `'d MMM y'` |
| `DateConst.ddmmySlash` | `'dd/MM/y'` |
| `DateConst.ddMMyyyySlashhhmmssDot` | `'dd/MM/yyyy hh:mm:ss'` |
| `DateConst.hhmmDot` | `'HH:mm'` |
| `DateConst.ddMMMCommaYyyy` | `'dd MMM, yyyy'` |
| `DateConst.ddMMMCommaYyyyHHmm` | `'dd MMM, yyyy  HH:mm'` — notification inbox datetime display |
| `DateConst.MMM` | `'MMM'` — abbreviated month name only (used by `CalendarDateView`) |

---

## Typedefs — `lib/core/utils/typedef.dart`

```dart
typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid<T>   = ResultFuture<void>;
typedef DataMap         = Map<String, dynamic>;
```

`ResultFuture<T>` is the universal return type for all use cases and repository methods.

---

## EnvConfig — `lib/core/config/env_config.dart`

Static class that wraps `flutter_dotenv`. Initialized before DI:

```dart
await EnvConfig.initialize(appFlavor); // loads env/.env.dev|qa|prod
```

| Getter | Env key | Default |
|--------|---------|---------|
| `EnvConfig.baseUrl` | `API_BASE_URL` | — |
| `EnvConfig.apiVersion` | `API_VERSION` | `'v1'` |
| `EnvConfig.apiUrl` | derived | `baseUrl/apiVersion/` |
| `EnvConfig.secretKey` | `SECRET_KEY` | `''` |
| `EnvConfig.accessKey` | `ACCESS_KEY` | `''` |
| `EnvConfig.connectTimeout` | `CONNECT_TIMEOUT` | 30s |
| `EnvConfig.receiveTimeout` | `RECEIVE_TIMEOUT` | 30s |
| `EnvConfig.sendTimeout` | `SEND_TIMEOUT` | 30s |
| `EnvConfig.appName` | `APP_NAME` | `'Base App'` |
| `EnvConfig.enableLogging` | `ENABLE_LOGGING` | `true` |
| `EnvConfig.sapBaseUrl` | `SAP_BASE_URL` | `''` |
| `EnvConfig.sapApiKey` | `SAP_API_KEY` | `''` |
| `EnvConfig.googleMapsAndroidKey` | `GOOGLE_MAPS_ANDROID_KEY` | `''` |
| `EnvConfig.googleMapsIosKey` | `GOOGLE_MAPS_IOS_KEY` | `''` |
| `EnvConfig.deepLinkBaseUrl` | `DEEP_LINK_BASE_URL` | `'https://edge.primegroup.lk/dl'` |
| `EnvConfig.environment` | — | `Environment` enum |

Use `EnvConfig.getValue('MY_KEY', 'default')` for custom env variables.

---

## FreshInstallGuard — `lib/core/utils/fresh_install_guard.dart`

Static utility. Detects a fresh install and clears stale iOS Keychain data (Firebase Auth token + FlutterSecureStorage) so the user is required to log in again after reinstalling the app.

```dart
// Called in main() after Firebase.initializeApp() and before configureDependencies()
await FreshInstallGuard.run();
```

**How it works:** Plain `SharedPreferences` is wiped on app uninstall (iOS + Android), while the iOS Keychain is not. Absence of `StorageKeys.hasLaunched` in `SharedPreferences` signals a fresh install → `FirebaseAuth.instance.signOut()` + `StorageManager.clear(secure: true)` are called → `hasLaunched` is then written so the check is skipped on subsequent launches.

**Private constructor** (`FreshInstallGuard._()`) — not instantiable.

---

## Logger — `lib/core/utils/common.dart`

Global `logger` instance (from the `logger` package). Use throughout the app instead of `print()`.

```dart
import 'package:flutter_base_app/core/utils/common.dart';

logger.d('Debug message');
logger.i('Info message');
logger.w('Warning message');
logger.e('Error message');
```

---

## Enums — `lib/core/utils/enums.dart`

```dart
enum Environment { dev, qa, prod }

T? enumFromString<T>(String key, List<T> values)
// Parses an enum by its .name string. Returns null if not found.
```

Usage:
```dart
final env = enumFromString(flavour ?? '', Environment.values) ?? Environment.dev;
```

---

## PhoneNormalizer — `lib/core/utils/phone_normalizer.dart`

Pure static utility. Private constructor — not instantiated.

```dart
PhoneNormalizer.normalize('+94771234567')  // → '0771234567'
PhoneNormalizer.normalize('94771234567')   // → '0771234567'
PhoneNormalizer.normalize('0771234567')    // → '0771234567'
PhoneNormalizer.normalize('+1234567890')   // → '1234567890'
```

**Rules:** strips whitespace, handles `+94`/`94` prefix (Sri Lankan: prepends `0` if NSN is 9 digits), strips leading `+` for other numbers. Used in `PurchaseRequestBloc` before building the SAP CRM payload.

---

## DatabaseHelper — `lib/core/data_base/database_helper.dart`

SQLite singleton. Must be initialized before DI:

```dart
await DatabaseHelper.init();       // call in main() before configureDependencies()
final db = DatabaseHelper.instance.db;  // access after init
```

Tables:
- `TableColor` — `lib/core/data_base/table_color.dart`
- `TableTranslation` — `lib/core/data_base/table_translation.dart`
