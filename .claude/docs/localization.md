# Localization

## Overview

The app uses a **custom localization system** — not `easy_localization` or Flutter's `gen-l10n`.
Translations are stored in SQLite, seeded from bundled JSON files, and periodically synced from the
API.

---

## Supported Languages

Defined in `lib/core/constants/const.dart`:

| Language | Code | Direction |
|----------|------|-----------|
| English | `en` | LTR |
| Sinhala | `si` | LTR |
| Tamil | `ta` | RTL |

```dart
class Const {
  static const String languageEn = 'en';
  static const String languageSi = 'si';
  static const String languageTa = 'ta';
  static const List<String> supportLanguages = [languageEn, languageSi, languageTa];
}
```

---

## Key Classes

### AppLocalizations — `lib/core/services/locale/app_localizations.dart`

Custom `LocalizationsDelegate<AppLocalizations>`. Registered in `main.dart` alongside Flutter's
built-in delegates.

```dart
localizationsDelegates: const [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
],
```

**Getting the instance:**
```dart
final localizations = AppLocalizations.of(context);
```

**Translating a key:**
```dart
localizations.translate('welcome_page_lbl_welcome')
// Returns the key itself if not found (never throws)
```

The `_AppLocalizationsDelegate.load()` method calls `sl<TranslationLocalDataSource>().getTranslations()`
to load all translations from SQLite when the locale changes.

### TranslationBloc — `lib/core/services/locale/presentation/bloc/translation_bloc.dart`

Global `@lazySingleton` BLoC that manages the current language and triggers sync.

**Events:**
| Event | Purpose |
|-------|---------|
| `InitializeTranslationsEvent` | Load saved language from storage, then trigger sync |
| `SyncTranslationsEvent` | Fetch translations from API → save to SQLite |
| `ChangeLanguageEvent(languageCode)` | Persist new language code, emit `TranslationLanguageChanged` |

**States:**
| State | Fields |
|-------|--------|
| `TranslationInitial` | — |
| `TranslationLoading` | — |
| `TranslationLanguageLoaded` | `currentLanguageCode` |
| `TranslationSyncSuccess` | `updated`, `currentLanguageCode` |
| `TranslationLanguageChanged` | `currentLanguageCode` |
| `TranslationError` | `message` |

The active locale in `MaterialApp.router` is driven by `TranslationBloc`:
```dart
locale: tranState is TranslationLanguageChanged
    ? Locale(tranState.currentLanguageCode, '')
    : const Locale(Const.languageEn, ''),
```

---

## Data Flow

```
JSON seed files (assets/)
        ↓ (first run / fallback)
TranslationLocalDataSourceImpl → SQLite (table_translation)
        ↓                               ↑
TranslationRemoteDataSourceImpl → SyncTranslationsUseCase (API sync)
        ↓
GetTranslationUseCase → TranslationBloc → locale change → AppLocalizations.load()
```

---

## Translation Key Naming Convention

Format: `<screen>_<element_type>_<description>`

Examples:
- `welcome_page_lbl_welcome` — label on welcome page
- `welcome_page_lbl_select_language` — label for language selection
- `welcome_page_btn_continue` — button on welcome page
- `api_exception_lbl_connection_error` — API error label
- `api_exception_lbl_unable_to_connect` — API error message

Segments:
- Screen prefix: `welcome_page`, `login_page`, `beneficiaries_page`, `auth_landing_page`, etc.
- Element type: `lbl` (label/text), `btn` (button), `hint` (placeholder), `error` (validation error message)
- Description: snake_case description of the content

### auth_landing_page keys

| Key | en value |
|-----|----------|
| `auth_landing_page_lbl_headline` | `"Your app headline here"` |
| `auth_landing_page_lbl_subtitle` | `"Discover premium properties across Sri Lanka"` |
| `auth_landing_page_btn_continue_as_guest` | `"Continue as a Guest"` |
| `auth_landing_page_btn_login` | `"Login"` |
| `auth_landing_page_lbl_or` | `"OR"` |
| `auth_landing_page_lbl_no_account` | `"Dont have an account? "` |
| `auth_landing_page_btn_register` | `"Register now!"` |
| `auth_landing_page_lbl_terms_prefix` | `"By continuing, you agree to our "` |
| `auth_landing_page_btn_terms` | `"Terms"` |
| `auth_landing_page_lbl_terms_conjunction` | `" & "` |
| `auth_landing_page_btn_privacy_policy` | `"Privacy Policy"` |
| `auth_landing_page_btn_sign_in_apple` | `"Sign in with Apple"` |
| `auth_landing_page_btn_sign_in_google` | `"Sign in with Google"` |

`si` and `ta` values are intentionally empty — app is English-only.

### auth_login_page keys

| Key | en value |
|-----|----------|
| `auth_login_page_lbl_headline` | `"Welcome to [App Name]"` |
| `auth_login_page_lbl_subtitle` | `"Your trusted partner in premium property investments across Sri Lanka."` |
| `auth_login_page_lbl_email` | `"E-mail address"` |
| `auth_login_page_hint_email` | `"E-mail address"` |
| `auth_login_page_lbl_password` | `"Password"` |
| `auth_login_page_hint_password` | `"Password"` |
| `auth_login_page_btn_forgot_password` | `"Forgot password ?"` |
| `auth_login_page_btn_login` | `"Login"` |
| `auth_login_page_lbl_no_account` | `"Dont have an account? "` |
| `auth_login_page_btn_register` | `"Register now!"` |
| `auth_login_page_lbl_terms_prefix` | `"By continuing, you agree to our "` |
| `auth_login_page_btn_terms` | `"Terms"` |
| `auth_login_page_lbl_terms_conjunction` | `" & "` |
| `auth_login_page_btn_privacy_policy` | `"Privacy Policy"` |

### auth_personal_info_page keys

| Key | en value |
|-----|----------|
| `auth_personal_info_page_lbl_headline` | `"Let's Get to Know You!"` |
| `auth_personal_info_page_lbl_subtitle` | `"Share a few details to personalize your experience"` |
| `auth_personal_info_page_lbl_first_name` | `"First name"` |
| `auth_personal_info_page_hint_first_name` | `"First name"` |
| `auth_personal_info_page_lbl_last_name` | `"Last name"` |
| `auth_personal_info_page_hint_last_name` | `"Last name"` |
| `auth_personal_info_page_lbl_mobile_number` | `"Mobile number"` |
| `auth_personal_info_page_lbl_email` | `"E-mail address"` |
| `auth_personal_info_page_hint_email` | `"E-mail address"` |
| `auth_personal_info_page_lbl_gender` | `"Gender"` |
| `auth_personal_info_page_btn_continue` | `"Continue"` |
| `auth_personal_info_page_error_first_name_required` | `"First name is required"` |
| `auth_personal_info_page_error_last_name_required` | `"Last name is required"` |
| `auth_personal_info_page_error_phone_required` | `"Phone number is required"` |
| `auth_personal_info_page_error_phone_invalid` | `"Enter a valid phone number"` |
| `auth_personal_info_page_error_email_required` | `"Email address is required"` |
| `auth_personal_info_page_error_email_invalid` | `"Enter a valid email address"` |

`si` and `ta` values are intentionally empty — app is English-only.

### gender_option keys (shared)

| Key | en value |
|-----|----------|
| `gender_option_male` | `"Male"` |
| `gender_option_female` | `"Female"` |

### phone_number_field keys (shared widget)

| Key | en value |
|-----|----------|
| `phone_number_field_placeholder` | `"000 000 000"` |

### header_profile_view keys (shared widget)

| Key | en value |
|-----|----------|
| `header_profile_view_lbl_greeting` | `"Hi,"` |

### otp_input keys (shared widget)

| Key | en value |
|-----|----------|
| `otp_input_lbl_minute` | `"minute"` |
| `otp_input_lbl_minutes` | `"minutes"` |
| `otp_input_lbl_seconds` | `"seconds"` |

### welcome_home_page keys

| Key | en value |
|-----|----------|
| `welcome_home_page_lbl_headline` | `"Your home page headline here"` |
| `welcome_home_page_lbl_earn_prefix` | `"Earn up to"` |
| `welcome_home_page_lbl_earn_description` | `"by referring customers and completing\nsuccessful sales."` |
| `welcome_home_page_btn_become_agent` | `"Become a virtual sales agent"` |
| `welcome_home_page_btn_skip` | `"Skip"` |

`si` and `ta` values are intentionally empty — app is English-only.

### auth_sms_otp_verify_page keys

| Key | en value |
|-----|----------|
| `auth_sms_otp_verify_page_lbl_headline` | `"Enter the 6 digit code"` |
| `auth_sms_otp_verify_page_lbl_subtitle_line1` | `"A one time PIN has been send to your"` |
| `auth_sms_otp_verify_page_lbl_subtitle_line2_prefix` | `"registered number "` |
| `auth_sms_otp_verify_page_btn_continue` | `"Continue"` |

`si` and `ta` values are intentionally empty — app is English-only.

### auth_login_credential_page keys

| Key | en value |
|-----|----------|
| `auth_login_credential_page_lbl_headline` | `"Login credentials"` |
| `auth_login_credential_page_lbl_subtitle` | `"Provide your credentials to continue to your account"` |
| `auth_login_credential_page_lbl_username` | `"Username"` |
| `auth_login_credential_page_hint_username` | `"Username"` |
| `auth_login_credential_page_lbl_password` | `"Password"` |
| `auth_login_credential_page_hint_password` | `"Password"` |
| `auth_login_credential_page_lbl_confirm_password` | `"Confirm password"` |
| `auth_login_credential_page_hint_confirm_password` | `"Confirm password"` |
| `auth_login_credential_page_btn_continue` | `"Continue"` |

`si` and `ta` values are intentionally empty — app is English-only.

### auth_email_otp_verify_page keys

| Key | en value |
|-----|----------|
| `auth_email_otp_verify_page_lbl_headline` | `"Enter the 6 digit code"` |
| `auth_email_otp_verify_page_lbl_subtitle_line1` | `"A one time PIN has been sent to your"` |
| `auth_email_otp_verify_page_lbl_subtitle_line2_prefix` | `"registered email "` |
| `auth_email_otp_verify_page_btn_continue` | `"Continue"` |

`si` and `ta` values are intentionally empty — app is English-only.

### otp_input (shared widget) keys

These keys are used inside `OtpInput` widget itself — not tied to a specific screen.

| Key | en value |
|-----|----------|
| `otp_input_lbl_validity_info` | `"Enter 6-digit code\nThe code is valid for "` |
| `otp_input_lbl_validity_prefix` | `"Resend code in "` |
| `otp_input_lbl_resend_prefix` | `"Didn't receive the code? "` |
| `otp_input_btn_resend` | `"Resend"` |

`si` and `ta` values are intentionally empty — app is English-only.

### main_tab (AppTabBar shared widget) keys

Used inside `AppTabBar` — not tied to a specific screen.

| Key | en value |
|-----|----------|
| `main_tab_lbl_home` | `"Home"` |
| `main_tab_lbl_menu` | `"Menu"` |
| `main_tab_lbl_saved` | `"Save"` |

`si` and `ta` values are intentionally empty — app is English-only.

### home_quick_link (QuickLinkButton labels) keys

| Key | en value |
|-----|----------|
| `home_quick_links_lbl_title` | `"Quick links"` |
| `home_quick_link_lbl_my_properties` | `"My Properties"` |
| `home_quick_link_lbl_earn_commissions` | `"Earn Commissions"` |
| `home_quick_link_lbl_smart_assistant` | `"Smart Assistant"` |

`si` and `ta` values are intentionally empty — app is English-only.

### home_discover (DiscoverPropertiesView) keys

| Key | en value |
|-----|----------|
| `home_discover_lbl_title` | `"Discover all properties"` |
| `home_discover_btn_view_all` | `"View all"` |
| `home_discover_filter_lbl_all` | `"All"` |
| `home_discover_filter_lbl_apartments` | `"Apartments"` |
| `home_discover_filter_lbl_houses` | `"Houses"` |
| `home_discover_filter_lbl_land` | `"Land"` |
| `home_discover_lbl_no_results` | `"No properties found"` |
| `home_discover_btn_retry` | `"Retry"` |
| `home_discover_lbl_error` | `"Failed to load properties"` |

`si` and `ta` values are intentionally empty — app is English-only.

### property_tile (shared widget) keys

Used inside `PropertyTile` — not tied to a specific screen.

| Key | en value |
|-----|----------|
| `property_tile_lbl_upwards` | `"Upwards"` |
| `property_tile_snack_saved` | `"Saved to your favourites"` |
| `property_tile_snack_removed` | `"Removed from favourites"` |
| `property_tile_snack_toggle_error` | `"Something went wrong"` |

`si` and `ta` values are intentionally empty — app is English-only.

### auth_forgot_password_page keys

| Key | en value |
|-----|----------|
| `auth_forgot_password_page_lbl_headline` | `"Forgot Password?"` |
| `auth_forgot_password_page_lbl_subtitle` | `"Enter your registered email address and we'll send you a reset link."` |
| `auth_forgot_password_page_lbl_email` | `"E-mail address"` |
| `auth_forgot_password_page_hint_email` | `"E-mail address"` |
| `auth_forgot_password_page_btn_send` | `"Send Reset Link"` |
| `auth_forgot_password_page_lbl_success_title` | `"Check Your Inbox"` |
| `auth_forgot_password_page_lbl_success_subtitle` | `"We've sent a password reset link to your email address."` |
| `auth_forgot_password_page_btn_back_to_login` | `"Back to Login"` |

`si` and `ta` values are intentionally empty — app is English-only.

### saved_property_page keys

| Key | en value |
|-----|----------|
| `saved_property_page_lbl_title` | `"Saved Properties"` |
| `saved_property_page_lbl_empty_title` | `"No saved properties"` |
| `saved_property_page_lbl_empty_subtitle` | `"Properties you save will appear here"` |
| `saved_property_page_guest_lbl_title` | `"Login to Save Properties"` |
| `saved_property_page_guest_lbl_subtitle` | `"Create an account to save your favourite properties"` |
| `saved_property_page_guest_btn_login` | `"Login"` |

`si` and `ta` values are intentionally empty — app is English-only.

### auth_landing_page guest dialog keys

| Key | en value |
|-----|----------|
| `auth_landing_guest_dialog_lbl_title` | `"What's your name?"` |
| `auth_landing_guest_dialog_lbl_subtitle` | `"Enter your name to continue as a guest"` |
| `auth_landing_guest_dialog_hint_name` | `"Your name"` |
| `auth_landing_guest_dialog_btn_continue` | `"Continue"` |
| `auth_landing_guest_dialog_error_min_length` | `"Name must be at least 3 characters"` |

`si` and `ta` values are intentionally empty — app is English-only.

### guest_locked (shared dialog) keys

| Key | en value |
|-----|----------|
| `guest_locked_lbl_title` | `"Login Required"` |
| `guest_locked_lbl_message` | `"Please log in to access this feature"` |
| `guest_locked_btn_login` | `"Login"` |
| `guest_locked_btn_cancel` | `"Cancel"` |

`si` and `ta` values are intentionally empty — app is English-only.

### property_detail_page keys

| Key | en value |
|-----|----------|
| `property_detail_lbl_upwards` | `"Upwards"` |
| `property_detail_lbl_view_more` | `"View more..."` |
| `property_detail_lbl_amenities` | `"Amenities"` |
| `property_detail_lbl_location` | `"Location"` |
| `property_detail_lbl_introduction` | `"Introduction"` |
| `property_detail_lbl_floor_plans` | `"Floor plans"` |
| `property_detail_btn_open_in_maps` | `"Open in Maps"` |
| `property_detail_btn_maps_google` | `"Google Maps"` |
| `property_detail_btn_maps_apple` | `"Apple Maps"` |
| `property_detail_btn_maps_cancel` | `"Cancel"` |
| `property_detail_snack_shared` | `"Thanks for sharing!"` |
| `property_detail_share_body` | `"Your share message body here."` |
| `property_detail_btn_refer_to_friends` | `"Refer to friends"` |
| `property_detail_btn_buy` | `"Buy"` |
| `property_detail_btn_take_a_tour` | `"Take a Tour"` |

`si` and `ta` values are intentionally empty — app is English-only.

### purchase_request_modal keys

| Key | en | si | ta |
|-----|----|----|-----|
| `purchase_request_title` | `"Purchase request"` | `"ගැනුම් ඉල්ලීම"` | `"கொள்முதல் கோரிக்கை"` |
| `purchase_request_subtitle` | `"Our sales team will contact you to assist with your purchase request."` | (translated) | (translated) |
| `purchase_request_language_prompt` | `"Select your preferred language to continue."` | (translated) | (translated) |
| `purchase_request_btn_submit` | `"Submit to sales department"` | (translated) | (translated) |
| `purchase_request_lang_sinhala` | `"Sinhala"` | `"සිංහල"` | `"சிங்களம்"` |
| `purchase_request_lang_english` | `"English"` | `"ඉංග්‍රීසි"` | `"ஆங்கிலம்"` |
| `purchase_request_lang_tamil` | `"Tamil"` | `"දෙමළ"` | `"தமிழ்"` |
| `purchase_request_interest_label` | `"Interest level"` | `"උනන්දු මට්ටම"` | `"ஆர்வ நிலை"` |
| `purchase_request_success` | `"Your request has been forwarded to our Sales Department. A representative will be in touch shortly."` | (translated) | (translated) |
| `purchase_request_already_requested` | `"You have already submitted a purchase request for this property."` | (translated) | (translated) |
| `property_detail_btn_buy_requested` | `"BUY REQUESTED"` | `"ඉල්ලූ ගැනුම"` | `"வாங்க கோரப்பட்டது"` |
| `purchase_request_error_unauthenticated` | `"Unable to verify your account. Please log in again."` | (translated) | (translated) |
| `purchase_request_error_profile_load` | `"Could not load your profile. Please try again."` | (translated) | (translated) |

All 13 keys are seeded in `assets/locales/language.json` with full en/si/ta translations.

The two error keys (`purchase_request_error_unauthenticated`, `purchase_request_error_profile_load`) are carried as translation key strings in `PurchaseRequestState.error(message)`. The UI resolves them via `l.translate(state.message)` — the BLoC never holds English strings directly.

### incomplete_profile_dialog keys

| Key | en value |
|-----|----------|
| `incomplete_profile_dialog_title` | `"Incomplete Profile"` |
| `incomplete_profile_dialog_subtitle` | `"Please complete your account details to continue."` |
| `incomplete_profile_dialog_phone_missing` | `"Phone number is missing"` |
| `incomplete_profile_dialog_address_missing` | `"Address is missing"` |
| `incomplete_profile_dialog_btn_cancel` | `"Cancel"` |
| `incomplete_profile_dialog_btn_update` | `"Update Now"` |

`si` and `ta` values are intentionally empty — app is English-only.

### search_filter_page keys

| Key | en value |
|-----|----------|
| `search_filter_page_lbl_title` | `"Search & filter"` |
| `search_filter_page_hint_search` | `"Search properties..."` |
| `search_filter_lbl_recent_search` | `"Recent search"` |
| `search_filter_page_lbl_hint_title` | `"Search for properties"` |
| `search_filter_page_lbl_hint_subtitle` | `"Enter keyword to search, also include filters for better result"` |
| `search_filter_page_lbl_no_results` | `"No properties found"` |
| `search_filter_page_lbl_no_results_subtitle` | `"Try adjusting your search or filters"` |
| `search_filter_page_lbl_error` | `"Failed to load results"` |
| `search_filter_page_btn_retry` | `"Retry"` |

`si` and `ta` values are intentionally empty — app is English-only.

### profile_page keys

| Key | en value |
|-----|----------|
| `profile_page_lbl_no_name` | `"No name"` |
| `profile_page_tile_edit_profile` | `"Edit Profile"` |
| `profile_page_tile_edit_profile_subtitle` | `"Update your personal information"` |
| `profile_page_tile_edit_address` | `"Edit Address"` |
| `profile_page_tile_edit_address_subtitle` | `"Update your address details"` |
| `profile_page_tile_logout` | `"Logout"` |
| `profile_page_tile_logout_subtitle` | `"Sign out of your account"` |
| `profile_page_snack_tap_again` | `"Tap again to copy ID"` |
| `profile_page_snack_copied_id` | `"Copied to clipboard"` |
| `profile_page_dialog_logout_title` | `"Logout"` |
| `profile_page_dialog_logout_message` | `"Are you sure you want to logout?"` |
| `profile_page_dialog_delete_account_title` | `"Delete Account"` |
| `profile_page_dialog_delete_account_message` | `"Are you sure you want to delete your account?"` |
| `profile_page_dialog_delete_account_confirm` | `"Proceed"` |
| `profile_page_lbl_delete_account_hint` | `"Delete account"` |
| `profile_page_btn_delete_account` | `"Delete Account"` |

`si` and `ta` values are intentionally empty — app is English-only.

### delete_account_page keys

Used in `DeleteAccountPage` — the 3-step email OTP verification and account deletion screen.

| Key | en value |
|-----|----------|
| `delete_account_page_title` | `"Delete Account"` |
| `delete_account_page_subtitle` | `"To confirm deletion, please verify your email address."` |
| `delete_account_lbl_email` | `"Email Address"` |
| `delete_account_btn_send_otp` | `"Send OTP"` |
| `delete_account_lbl_otp` | `"Enter OTP"` |
| `delete_account_btn_verify_otp` | `"Verify OTP"` |
| `delete_account_warning` | `"This action is irreversible. Your account and all associated data will be permanently deleted."` |
| `delete_account_btn_confirm` | `"Permanently Delete Account"` |
| `delete_account_error_recent_login` | `"For security, please log out and log back in before deleting your account."` |
| `delete_account_error_email_required` | `"Email address is required"` |
| `delete_account_error_email_invalid` | `"Please enter a valid email address"` |

`si` and `ta` values are English placeholders pending translation.

### edit_personal_info keys

Used in the Edit Personal Info modal, shown from `profile_page.dart`.

| Key | en value |
|-----|----------|
| `edit_personal_info_modal_title` | `"Edit Personal Info"` |
| `edit_personal_info_modal_subtitle` | `"Update your personal details to keep your profile information accurate"` |
| `edit_personal_info_modal_confirm_title` | `"Update Personal Info"` |
| `edit_personal_info_modal_confirm_subtitle` | `"Are you sure you want to update your personal information?"` |
| `edit_personal_info_modal_confirm_cancel` | `"Cancel"` |
| `edit_personal_info_modal_confirm_save` | `"Save"` |
| `edit_personal_info_field_first_name` | `"First name"` |
| `edit_personal_info_field_last_name` | `"Last name"` |
| `edit_personal_info_field_phone` | `"Phone number"` |
| `edit_personal_info_btn_save` | `"Save"` |

### phone_otp_verify_modal keys

Used in `PhoneOtpVerifyModal` — shown when the user changes their phone number in the Edit Personal Info flow.

| Key | en value |
|-----|----------|
| `phone_otp_verify_modal_lbl_title` | `"Phone Verification"` |
| `phone_otp_verify_modal_lbl_subtitle` | `"Enter the verification code sent to"` |

`si` and `ta` values are intentionally empty — app is English-only.

### edit_address keys

Used in the Edit Address modal, shown from `profile_page.dart`.

| Key | en value |
|-----|----------|
| `edit_address_modal_title` | `"Edit address"` |
| `edit_address_modal_subtitle` | `"Update your address details to keep your profile information accurate"` |
| `edit_address_modal_button_save` | `"Save"` |
| `edit_address_modal_view_only` | `"Close"` |
| `edit_address_modal_confirm_title` | `"Update Address"` |
| `edit_address_modal_confirm_subtitle` | `"Are you sure you want to update your address?"` |
| `edit_address_modal_confirm_cancel` | `"Cancel"` |
| `edit_address_modal_confirm_save` | `"Save"` |
| `edit_address_label_address` | `"Address"` |
| `edit_address_hint_address_line1` | `"Address line 1"` |
| `edit_address_hint_address_line2` | `"Address line 2 (Optional)"` |
| `edit_address_hint_country` | `"Country"` |
| `edit_address_hint_province` | `"Province"` |
| `edit_address_hint_district` | `"District"` |
| `edit_address_hint_city` | `"City"` |
| `edit_address_hint_state_province` | `"State / Province"` |
| `edit_address_hint_postal_code` | `"Postal code"` |
| `edit_address_error_required` | `"This field is required"` |
| `edit_address_error_min_length` | `"Must be at least 5 characters"` |

### address_country keys

Country display names for the country dropdown in `EditAddressForm`. Keys are resolved
dynamically via `address_country_${countryKey(id)}` in `edit_address_form.dart`.

| Key | en value |
|-----|----------|
| `address_country_australia` | `"Australia"` |
| `address_country_bahrain` | `"Bahrain"` |
| `address_country_canada` | `"Canada"` |
| `address_country_kuwait` | `"Kuwait"` |
| `address_country_oman` | `"Oman"` |
| `address_country_qatar` | `"Qatar"` |
| `address_country_saudi_arabia` | `"Saudi Arabia"` |
| `address_country_sri_lanka` | `"Sri Lanka"` |
| `address_country_uae` | `"UAE"` |
| `address_country_uk` | `"UK"` |
| `address_country_usa` | `"USA"` |

`si` and `ta` values are intentionally empty — app is English-only.

### referral_sales_page keys

| Key | en value |
|-----|----------|
| `referral_sales_page_lbl_title` | `"Referral sales"` |
| `referral_sales_lbl_available_balance` | `"Available balance  :"` |
| `referral_sales_lbl_total_referrals` | `"Total referrals"` |
| `referral_sales_lbl_active_leads` | `"Active leads"` |
| `referral_sales_lbl_disclaimer` | `"Disclaimer : These are summary of your referrals. Until the actual purchase is made, the referral amount will not be credited to your account"` |
| `referral_sales_error_auth` | `"You must be signed in to view your referrals."` |
| `referral_sales_error_profile` | `"Could not load your profile. Please try again."` |
| `referral_sales_tab_referrals` | `"Referrals"` |
| `referral_sales_tab_commission` | `"Commission"` |
| `referral_sales_empty_referrals` | `"No referrals found"` |
| `referral_sales_empty_commissions` | `"No commissions found"` |
| `referral_lead_card_lbl_sales_officer` | `"Sales officer"` |
| `referral_lead_card_lbl_area_sales_manager` | `"Area sales manager"` |
| `referral_lead_card_lbl_status` | `"Status"` |
| `referral_lead_card_lbl_site_visited` | `"Site visited"` |
| `commission_lead_card_lbl_commission` | `"Commission :"` |
| `commission_lead_card_btn_redeem` | `"Redeem"` |

Full en/si/ta translations seeded in `assets/locales/language.json`.

### common keys

Shared keys used across multiple screens.

| Key | en value |
|-----|----------|
| `common_btn_cancel` | `"Cancel"` |
| `common_btn_ok` | `"OK"` |

### menu_page keys

| Key | en value |
|-----|----------|
| `menu_page_lbl_title` | `"Menu"` |
| `menu_page_lbl_customer` | `"Customer"` |
| `menu_page_lbl_home` | `"Home"` |
| `menu_page_lbl_purchase` | `"Purchase"` |
| `menu_page_lbl_referral` | `"Referral"` |
| `menu_page_lbl_corporate` | `"Corporate"` |
| `menu_page_lbl_investor` | `"Investor"` |
| `menu_page_lbl_bee` | `"Bee"` |
| `menu_page_lbl_my_property` | `"My Property"` |
| `menu_page_lbl_about_us` | `"About Us"` |

`si` and `ta` values are intentionally empty — app is English-only.

### about_us_page keys

| Key | en value |
|-----|----------|
| `about_us_page_lbl_title` | `"About Us"` |
| `about_us_page_lbl_prime_lands` | `"[COMPANY NAME]"` |
| `about_us_page_lbl_prime_lands_desc` | `"Your company description here."` |
| `about_us_page_lbl_history` | `"HISTORY"` |
| `about_us_page_lbl_history_desc` | `"Your company history here."` |
| `about_us_page_lbl_quality_policy` | `"QUALITY POLICY"` |
| `about_us_page_lbl_quality_policy_desc` | `"We are dedicated to delivering the highest standards of customer satisfaction, trust, and environmental responsibility in every project we undertake."` |

`si` and `ta` values are intentionally empty — app is English-only.

### notifications_page keys

| Key | en value |
|-----|----------|
| `notifications_page_lbl_title` | `"Notifications"` |
| `notifications_page_lbl_empty` | `"No notifications yet"` |
| `notifications_page_lbl_empty_subtitle` | `"Your notifications will appear here"` |
| `notifications_page_lbl_error` | `"Failed to load notifications"` |
| `notifications_page_btn_retry` | `"Retry"` |
| `notifications_page_error_not_authenticated` | `"You are not signed in"` |

`si` and `ta` values are intentionally empty — app is English-only.

### my_property_page keys

| Key | en value |
|-----|----------|
| `my_property_page_lbl_title` | `"My Properties"` |
| `my_property_page_lbl_empty` | `"No reservations found"` |
| `my_property_page_lbl_empty_subtitle` | `"Properties you have reserved will appear here"` |
| `my_property_page_lbl_error` | `"Failed to load your properties"` |
| `my_property_page_btn_retry` | `"Retry"` |
| `my_property_page_error_not_authenticated` | `"You are not signed in"` |
| `my_property_page_error_profile_unavailable` | `"Unable to load your profile"` |

`si` and `ta` values are intentionally empty — app is English-only.

### reservation_detail_card keys

Used inside `ReservationDetailCard` widget — not tied to a specific screen.

| Key | en value |
|-----|----------|
| `reservation_detail_card_lbl_sales_agmt` | `"Sales AGMT"` |
| `reservation_detail_card_lbl_kyc` | `"KYC"` |
| `reservation_detail_card_lbl_payment_details` | `"Payment Details"` |
| `reservation_detail_card_lbl_payment_term` | `"Payment term"` |
| `reservation_detail_card_lbl_last_payment_date` | `"Last payment date"` |
| `reservation_detail_card_lbl_next_payment_date` | `"Next payment date"` |
| `reservation_detail_card_lbl_cost_overview` | `"Purchase Cost Overview"` |
| `reservation_detail_card_lbl_invoiced_amount` | `"Invoiced amount"` |
| `reservation_detail_card_lbl_paid_amount` | `"Paid amount"` |
| `reservation_detail_card_lbl_sales_value` | `"Sales value"` |
| `reservation_detail_card_lbl_stamp_fee` | `"Stamp fee"` |
| `reservation_detail_card_lbl_legal_fee` | `"Legal fee"` |
| `reservation_detail_card_lbl_due_total` | `"Amount due"` — shown in `_DueTotalRow` when `dueTotal > 0` |
| `reservation_detail_card_snb_sales_office_code` | `"Sales Office Code"` — snackbar prefix when tapping a sales person row |
| `lbl_currency` | `"LKR"` — global currency label, used by `AmountColumn` |

`si` and `ta` values are intentionally empty — app is English-only.

### my_property_slider_card (shared widget) keys

Used inside `MyPropertySliderCardInfoColumn` — not tied to a specific screen.

| Key | en value |
|-----|----------|
| `my_property_slider_card_lbl_paid` | `"paid"` — suffix in progress bar label (e.g. "45% paid") |

`si` and `ta` values are intentionally empty — app is English-only.

### payment_status_chip (shared widget) keys

Used inside `PaymentStatusChip` — not tied to a specific screen.

| Key | en value |
|-----|----------|
| `lbl_payment_status_paid` | `"Paid"` |
| `lbl_payment_status_pending` | `"Pending"` |
| `lbl_payment_status_cancelled` | `"Cancelled"` |

`si` and `ta` values are intentionally empty — app is English-only.

### refer_friend_modal keys

Used inside `ReferFriendModal` and `ReferFriendFormBody`.

| Key | en value |
|-----|----------|
| `refer_friend_title` | `"Refer a Friend"` |
| `refer_friend_btn_submit` | `"Submit"` |
| `refer_friend_lbl_preferred_name` | `"Preferred Name"` |
| `refer_friend_lbl_mobile` | `"Mobile"` |
| `refer_friend_lbl_email` | `"Email"` |
| `refer_friend_lbl_email_placeholder` | `"example@email.com"` |
| `refer_friend_lbl_language` | `"Language"` |
| `refer_friend_lbl_language_sinhala` | `"Sinhala"` |
| `refer_friend_lbl_language_english` | `"English"` |
| `refer_friend_lbl_language_tamil` | `"Tamil"` |
| `refer_friend_lbl_interest` | `"How much would your friend be interested?"` |
| `refer_friend_error_name_required` | `"Name is required"` |
| `refer_friend_error_phone_required` | `"Phone number is required"` |
| `refer_friend_error_phone_invalid` | `"Enter a valid phone number"` |
| `refer_friend_error_email_required` | `"Email address is required"` |
| `refer_friend_error_email_invalid` | `"Enter a valid email address"` |
| `refer_friend_success` | `"Your referral has been submitted successfully."` |
| `refer_friend_already_referred` | `"You have already referred this friend to this property."` |
| `refer_friend_error_already_referred_by_other` | `"This friend has already been referred to this property by someone else."` |
| `refer_friend_error_title` | `"Submission failed"` |
| `refer_friend_error_generic` | `"Something went wrong. Please try again."` |

All keys are fully translated into `si` and `ta`.

### transfer_request keys

Used in `TransferRequestPage` and the `TransferRequestBloc` error states.

| Key | en value |
|-----|----------|
| `transfer_request_page_lbl_title` | `"Transfer request"` |
| `transfer_request_page_btn_submit_request` | `"Submit request"` |
| `transfer_request_lbl_commission_amount` | `"Commission amount"` |
| `transfer_request_lbl_nic` | `"NIC number"` |
| `transfer_request_hint_nic` | `"Enter your NIC number"` |
| `transfer_request_error_nic_empty` | `"Please enter your NIC number"` |
| `transfer_request_error_nic_invalid` | `"Please enter a valid Sri Lankan NIC number"` |
| `transfer_request_lbl_bank` | `"Bank"` |
| `transfer_request_hint_bank` | `"Select your bank"` |
| `transfer_request_error_bank` | `"Please select a bank"` |
| `transfer_request_lbl_account_number` | `"Account number"` |
| `transfer_request_hint_account_number` | `"Enter your account number"` |
| `transfer_request_error_account_number` | `"Please enter a valid account number (min 6 digits)"` |
| `transfer_request_lbl_account_name` | `"Account holder name"` |
| `transfer_request_hint_account_name` | `"Enter account holder name"` |
| `transfer_request_error_account_name` | `"Please enter the account holder name"` |
| `transfer_request_msg_success` | `"Your transfer request has been submitted successfully"` |
| `transfer_request_note_processing_time` | `"Bank transfers are processed within 7 working days"` |
| `transfer_request_note_irreversible` | `"This action cannot be reversed once submitted"` |
| `transfer_request_error_auth` | `"Authentication failed. Please log in again."` |
| `transfer_request_error_profile` | `"Failed to load your profile. Please try again."` |
| `transfer_request_note_secure` | `"This information will not be shared with anyone"` |

`si` and `ta` values are intentionally empty — app is English-only.

The BLoC `_onStarted` emits `error` with `message: 'transfer_request_error_auth'` or
`'transfer_request_error_profile'` as translation keys. The page listener calls
`l.translate(state.message)` which resolves them. API failure messages are raw English
strings — `l.translate()` falls through and returns them unchanged.

### project_progress_tile (shared widget) keys

Used inside `ProjectProgressTile` on `MyPropertyPage` — not tied to a specific screen.

| Key | en value |
|-----|----------|
| `project_progress_tile_lbl_title` | `"Project Progress"` |
| `project_progress_tile_btn_view` | `"View"` |

`si` and `ta` values are intentionally empty — app is English-only.

### project_progress_page keys

| Key | en value |
|-----|----------|
| `project_progress_lbl_title` | `"Project Progress"` |
| `project_progress_lbl_empty` | `"No progress reports available"` |
| `project_progress_lbl_open_error` | `"Could not open file"` |

`si` and `ta` values are intentionally empty — app is English-only.

### installment_overview_card keys

Used inside `InstallmentOverviewCard` widget — not tied to a specific screen.

| Key | en value |
|-----|----------|
| `installment_overview_card_lbl_title` | `"Instalment Overview"` |
| `installment_overview_card_lbl_tab_instalment` | `"Instalment"` |
| `installment_overview_card_lbl_tab_payment_history` | `"Payment History"` |
| `installment_overview_card_lbl_error` | `"Failed to load payment details"` |
| `installment_overview_card_btn_retry` | `"Retry"` |
| `installment_overview_card_lbl_no_installments` | `"No instalments found"` |
| `installment_overview_card_lbl_no_payment_history` | `"No payment history found"` |
| `installment_overview_card_lbl_legend_instalment` | `"Instalment"` |
| `installment_overview_card_lbl_legend_paid` | `"Paid"` |
| `installment_overview_card_lbl_legend_applied` | `"Applied"` |

`si` and `ta` values are intentionally empty — app is English-only.

---

## Adding a New Translation Key

1. Add the key to the JSON seed files in `assets/` (one file per language or a combined file — check
   existing structure).
2. Use the key in UI code:
   ```dart
   localizations.translate('my_screen_lbl_my_text')
   ```
3. If the API provides translations, the key will be synced automatically on next
   `SyncTranslationsEvent`.
4. `translate()` falls back to returning the key string itself if not found — safe for
   development before the key is seeded.

---

## Adding a New Language

1. Add the language code to `Const.supportLanguages` in `lib/core/constants/const.dart`.
2. Add a `case` in `AppLocalizations.load()` (`lib/core/services/locale/app_localizations.dart`):
   ```dart
   case 'fr':
     _localizedStrings[translation.key] = translation.fr;
     break;
   ```
3. Add the corresponding field to `TranslationModel` and `TableTranslation` schema.
4. Add an RTL check in `LanguageHelper.isRTL()` if the language is RTL.
5. Add a language selection button in `WelcomePage`.
6. Run `build_runner` if any models changed.

---

## RTL Support

**`LanguageHelper`** — `lib/core/utils/language_helper.dart`

```dart
LanguageHelper.isRTL(context)           // true if current locale is 'ta'
LanguageHelper.textDirection(context)   // TextDirection.rtl or .ltr
LanguageHelper.textAlign(context)       // TextAlign.right or .left
```

RTL detection is based solely on `languageCode == Const.languageTa`. Currently only Tamil triggers RTL.

App-level directionality is applied in `main.dart`:
```dart
Directionality(
  textDirection: LanguageHelper.textDirection(context),
  child: ...,
)
```

Widgets that must respect RTL must also explicitly pass `textDirection` and `textAlign`:
```dart
Text(
  localizations.translate('key'),
  textDirection: LanguageHelper.textDirection(context),
  textAlign: LanguageHelper.textAlign(context),
)
```

`CustomTextField` applies RTL automatically. `CustomAppBar` inherits from `Directionality`.

---

## StorageKeys for Locale

| Key | Location | Value |
|-----|----------|-------|
| `StorageKeys.language` | `SharedPreferences` | Language code string (`'en'`, `'si'`, `'ta'`) |
| `StorageKeys.translationSyncDateTime` | `SharedPreferences` | ISO timestamp of last sync |
