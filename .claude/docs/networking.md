# Networking

## Stack

| Layer | Library | File |
|-------|---------|------|
| HTTP client | `dio ^5.8.0` | `lib/core/di/modules/network_module.dart` |
| Type-safe REST | `retrofit ^4.4.2` | `lib/core/network/api_client.dart` |
| Response envelope | custom | `lib/core/network/responses/base_response.dart` |
| Safe call wrapper | custom | `lib/core/network/safe_api_call.dart` |
| Firebase Callable Functions | `cloud_functions ^5.3.4` | injected as `FirebaseFunctions` via `FirebaseModule` |

---

## Firebase Functions

Firebase Callable Functions are invoked directly from feature datasource impls.
`FirebaseFunctions` is injected via DI — do not call `FirebaseFunctions.instance` directly in features.

```dart
class MyDataSourceImpl implements MyDataSource {
  MyDataSourceImpl(this._functions);
  final FirebaseFunctions _functions;

  @override
  Future<Result> doSomething(Params params) async {
    final callable = _functions.httpsCallable('functionName');
    final result = await callable.call(params.toJson());
    return Result.fromJson(result.data);
  }
}
```

HTTP Trigger Functions (plain REST) go through the existing `ApiClient` (Dio + Retrofit) if they share the backend base URL.

---

## Dio Configuration

`Dio` is provided as a `@lazySingleton` by `NetworkModule`.

```
baseUrl        = EnvConfig.apiUrl  (= API_BASE_URL + '/' + API_VERSION + '/')
connectTimeout = EnvConfig.connectTimeout  (env: CONNECT_TIMEOUT, default 30s)
receiveTimeout = EnvConfig.receiveTimeout  (env: RECEIVE_TIMEOUT, default 30s)
sendTimeout    = EnvConfig.sendTimeout     (env: SEND_TIMEOUT, default 30s)
Content-Type   = application/json
Accept         = application/json
validateStatus = status < 500  (4xx returned as normal responses; 5xx throws)
```

**Why `validateStatus < 500`:** The PG backend returns non-2xx status codes (e.g. 400, 409) for
business-logic errors (OTP failure, duplicate email, etc.) with a `{ status, message }` body.
Dio's default throws on any non-2xx, preventing `PgResponse` from parsing the body. Setting
`validateStatus: (s) => s != null && s < 500` lets 4xx flow through to `PgResponse.throwIfFailed()`
while still throwing on genuine 5xx server errors.

### Interceptor Stack (in order)

1. **`SecurityInterceptor`** — `lib/core/network/interceptors/security_interceptor.dart`
   - Adds `X-Payload-Hash` header: SHA-256 hash of `payload|timestamp|secretKey`
   - Adds `X-Timestamp` header: current epoch millis
   - On response: verifies `X-Payload-Hash` from response headers (if present)
   - Rejects with `HashValidationException` on mismatch

2. **`ErrorInterceptor`** — `lib/core/network/interceptors/error_interceptor.dart`
   - Converts any `DioException` → `APIException` via `APIException.initWithException(err)`
   - Logs `logger.e(...)` with title and message
   - Re-rejects with an `APIException`-wrapped `DioException`

5. **`PrettyDioLogger`** — (conditional: `EnvConfig.enableLogging`)
   - Logs request headers, request body, and response body to console
   - Filters binary (Uint8List) responses

6. **`RequestsInspectorInterceptor`** — (conditional: `EnvConfig.enableLogging`)
   - Sends requests to the in-app HTTP inspector UI (shake gesture to open)

---

## ApiClient (Retrofit)

**File:** `lib/core/network/api_client.dart`
**Generated:** `lib/core/network/api_client.g.dart`

Main API client. Base URL from `EnvConfig.apiUrl`. Includes `access-key: EnvConfig.accessKey` header (added in `NetworkModule`).

Endpoints:

| Method | Path | Purpose |
|--------|------|---------|
| `@POST` | `32aac532-…` | Beneficiaries |
| `@POST` | `SmsOtp` | Send SMS OTP — body: `{ PhoneNo }` |
| `@POST` | `SmsOtpVerify` | Verify SMS OTP — body: `{ PhoneNo, Otp }` |
| `@POST` | `EmailOtp` | Send email OTP — body: `{ Email }` |
| `@POST` | `OtpVerify` | Verify email OTP — body: `{ Email, Otp }` |
| `@GET` | `SortProperties` | Fetch properties filtered by type and paginated — query: `fltrType?`, `fltrKeyword?`, `fltrLocation?`, `fltrMinPrice?`, `fltrMaxPrice?`, `amenities[]?` (via `@Queries extras`), `page` |
| `@GET` | `FeaturedProperties` | Fetch featured properties for home page slider |
| `@GET` | `AllProperties` | Fetch all properties (no pagination) — used by `SavedPropertyDataSourceImpl` to resolve saved slugs; response: `{ status, data: [...PropertyDetailModel] }` |
| `@GET` | `PopUp` | Fetch home screen popup banner — response: `{ status, data: [{ MobileImage, ExtLink?, IntLink? }] }`; parsed via `PgResponse.from(raw).dataList(...)`; first item only or null if empty |
| `@POST` | `PropertyDetails` | Fetch full property detail by slug — body: `{ slug }` |
| `@GET` | `AllAmenities` | Fetch all amenities for search filter UI — response: `{ status, data: [{ id, Name, Icon, IsActive }] }` |
| `@GET` | `notifications` | Fetch paginated notification inbox — query: `email`, `page`; response: Laravel pagination envelope with `data[]`, `current_page`, `last_page`, `total` |
| `@GET` | `notifications/unread-count` | Get total unread count — query: `email`; response: `{ email, unread_counts: { device_specific, general, total } }` |
| `@POST` | `notifications/mark-as-read` | Mark single notification read — body: `{ notification_id: int, email }` |
| `@POST` | `notifications/bulk-mark-as-read` | Bulk mark notifications read — body: `{ notification_ids: List<int>, email }` |
| `@POST` | `notifications/delete` | Delete a notification — body: `{ notification_id: int, email }` |
| `@GET` | `forms/{slug}` | Fetch wizard form definition by slug — response: `{ ok, slug, version, definition: WizardDefinition }` |
| `@POST` | `forms/{slug}/submissions` | Submit a completed wizard form — body: flat `{ wizardId, wizardVersion, submittedAt, values: { fieldId → value } }` |

Phone format for SMS OTP: full number with country code, no `+` prefix (`94766364321`).

`SortProperties` response shape: `{ status, data: [...PropertyDetailModel], meta: { total, per_page, current_page } }`. HTTP 204 = empty page. `fltrType` omitted for All; `'Apartment'`, `'House'`, or `'Land'` for filtered views. Parsed manually in `DiscoverPropertiesDatasourceImpl` (Pattern A) since `meta` is alongside `data`.

---

## SapApiClient (Retrofit)

**File:** `lib/core/network/sap_api_client.dart`
**Generated:** `lib/core/network/sap_api_client.g.dart`

Separate Retrofit client for the SAP backend. Uses a `@Named('sap')` Dio instance registered in `NetworkModule.sapDio()`.

**SAP Dio configuration:**
```
baseUrl     = EnvConfig.sapBaseUrl  (= SAP_BASE_URL)
timeouts    = same as main Dio (connectTimeout, receiveTimeout, sendTimeout)
primeKey    = EnvConfig.sapApiKey   (= SAP_API_KEY) — header on every request
Interceptors: PrettyDioLogger + RequestsInspectorInterceptor (when enableLogging)
              No SecurityInterceptor, no ErrorInterceptor
```

| Method | Path | Purpose |
|--------|------|---------|
| `@POST` | `GetCustomerDetail` | Look up customer by email — body: `{ email }` |
| `@POST` | `SearchCustomerReservations` | Fetch all reservations for a customer — body: `{ email }`; response: `List<dynamic>` deserialized to `List<ReservationModel>` |
| `@POST` | `GetReservationDetail` | Fetch full reservation detail (with `PaymentPlan` + `PaymentHistory`) by doc num — body: a JSON-quoted string e.g. `'"26366"'` (not a JSON object); response: raw `Map<String, dynamic>` deserialized to `ReservationModel` |
| `@POST` | `CreateCRMEntry` | Submit a purchase request to SAP CRM — body: nested `{ oCRMCustomerObject, oSalesLead, Company }` map; response: `{ ErrorCode, ErrorMessage }` — success when `ErrorCode` 200–209 |
| `@POST` | `BuyRequests` | Fetch a user's submitted purchase requests — body: `{ ReferrerEmailId, Company: "PL" }`; response: `List<dynamic>` with `PreferedProject` fields |
| `@POST` | `GetReferrals` | Fetch referral leads for a user — body: `{ LeadId: null, ReferrerEmailId, Company: "PL" }`; response: `List<dynamic>` deserialized to `List<ReferralLeadModel>` |
| `@POST` | `GetReferralCommissionList` | Fetch commission entries for a user — same body shape as `GetReferrals`; response: `List<dynamic>` deserialized to `List<ReferralLeadModel>` |
| `@POST` | `CommissionRequest` | Submit a commission cash-out / transfer request — body: `{ NicNumber, LeadId: int, Bank, Branch: "HO", AccountNumber, ReferrerEmailId }`; response: `{ ErrorCode: int }` — success when `ErrorCode` 200 or 201 |

**`GetReservationDetail` body format note:** The body is sent as a JSON-encoded string literal, not a JSON object. The datasource constructs the body as `'"$docNum"'` (with embedded double-quotes). This matches the OldApp wire format. The backend has not been updated to accept a standard `{ docNum: ... }` JSON object — see tech-debt.

**Response model:** `SapCustomerResponse` (`lib/core/network/models/sap_customer_response.dart`)

```dart
@freezed
class SapCustomerResponse with _$SapCustomerResponse {
  const factory SapCustomerResponse({
    @JsonKey(name: 'cardCode') String? cardCode,
    @JsonKey(name: 'customerName') String? customerName,
    @JsonKey(name: 'mobileNumber') String? mobileNumber,
    @JsonKey(name: 'postalAddressCity') String? postalAddressCity,
    @JsonKey(name: 'postalAddressBlock') String? postalAddressBlock,
    @JsonKey(name: 'postalAddressStreet') String? postalAddressStreet,
    @JsonKey(name: 'postalAddressNumber') String? postalAddressNumber,
    bool? success,
    String? message,
  }) = _SapCustomerResponse;
  factory SapCustomerResponse.fromJson(Map<String, dynamic> json) => ...
}
```

If `cardCode` is empty/null, no SAP customer was found. SAP lookup failures are **non-fatal** — `AuthDataSourceImpl.getSapEnrichment` catches all exceptions and returns `null`; `AuthRepositoryImpl.getSapEnrichment` always returns `Right`.

**Domain entity:** `SapEnrichmentEntity` (`lib/features/auth/domain/entities/sap_enrichment_entity.dart`) — produced by `AuthDataSourceImpl.getSapEnrichment`, consumed by `SapEnrichProfileUseCase`.

**Usage:**
- `RegisterUserUseCase` — calls `getSapEnrichment` during registration to capture `cardCode` for the initial Firestore profile write.
- `SapEnrichProfileUseCase` — called in the background after a successful login when `profile.cardCode` is empty. Merges SAP address/phone data without overwriting user-entered fields.

To add an endpoint, add a method to `ApiClient` with the appropriate `@GET`/`@POST`/`@PUT`/`@DELETE`
annotation, then run `build_runner`.

---

## Response Handling — Two Patterns

The PG backend has inconsistent response shapes across endpoints. Two patterns are used:

---

### Pattern A — `PgResponse` (action endpoints, no typed data)

**File:** `lib/core/network/pg_response.dart`

Use for endpoints that return `{ status, message, status_code }` with no `data` field (OTP send/verify, future action-only endpoints). In `ApiClient`, declare the return type as `Map<String, dynamic>`.

```dart
// ApiClient
@POST('SmsOtp')
Future<Map<String, dynamic>> sendSmsOtp(@Body() Map<String, dynamic> body);

// Datasource — action call (throw on failure)
final raw = await _apiClient.sendSmsOtp({'PhoneNo': phone});
PgResponse.from(raw).throwIfFailed('Failed to send SMS OTP');

// Datasource — data call (extract typed model)
final raw = await _apiClient.getProfile({'uid': uid});
final profile = PgResponse.from(raw).data(ProfileModel.fromJson);

// Datasource — list call
final raw = await _apiClient.listItems({});
final items = PgResponse.from(raw).dataList(ItemModel.fromJson);
```

`PgResponse.isSuccess` checks `status` field (case-insensitive).
`PgResponse.throwIfFailed(fallback)` throws `Exception(message)` if not successful.

---

### Pattern B — `BaseResponse<T>` (typed data endpoints)

**File:** `lib/core/network/responses/base_response.dart`

Use for endpoints that return the `{ status, message, data: T }` envelope where `T` is a known Dart model. In `ApiClient`, declare the return type as `BaseResponse<MyModel>` and use `safeApiCall` in the repository.

```dart
class BaseResponse<T> {
  String? status;
  String? message;
  T? data;

  bool isSuccess() => status?.toLowerCase() == 'success';
}
```

Currently used by: `beneficiaries` (example endpoint).

---

### Decision guide

| Endpoint returns | Pattern | ApiClient return type |
|---|---|---|
| `{ status, message }` — no data | A — `PgResponse` | `Map<String, dynamic>` |
| `{ status, message, data: {...} }` | A — `PgResponse` | `Map<String, dynamic>` |
| `{ status, message, data: T }` — known model | B — `BaseResponse<T>` | `BaseResponse<MyModel>` |
| SAP `{ cardCode, ... }` | Custom model | `SapCustomerResponse` |

---

## safeApiCall\<T\>

**File:** `lib/core/network/safe_api_call.dart`

Wrapper used inside repository implementations to handle the response envelope and exception
conversion uniformly.

```dart
Future<T?> safeApiCall<T>(Future<BaseResponse<T>> Function() apiCall) async {
  try {
    final response = await apiCall();
    if (response.isSuccess()) {
      return response.data;
    } else {
      throw APIException.initWithResponse(response);
    }
  } catch (e) {
    if (e is DioException && e.error is APIException) {
      throw e.error as APIException;
    }
    throw APIException.initWithException(e);
  }
}
```

Usage in a repository implementation:

```dart
final result = await safeApiCall(() => apiClient.beneficiaries());
```

Returns `T?` (unwrapped `data`). Throws `APIException` on any failure.

---

## Error Types

| Type | File | Purpose |
|------|------|---------|
| `APIException` | `lib/core/errors/exceptions.dart` | Network/API errors with localized `title` and `message` |
| `HashValidationException` | `lib/core/errors/exceptions.dart` | Response hash mismatch |
| `APIFailure` | `lib/core/errors/failure.dart` | Domain-layer wrapper; `APIFailure.fromException(e)` |
| `AppFailure` | `lib/core/errors/failure.dart` | General non-network failures |

### APIException constructors

```dart
// From a BaseResponse (non-success status)
APIException.initWithResponse(response)

// From a caught exception (DioException, generic, etc.)
APIException.initWithException(exception)

// Direct construction
APIException(message: '...', title: '...')
```

`initWithException` maps HTTP status codes to localized messages using `AppLocalizations`:
- `400` → `api_exception_lbl_something_wrong_400` / `api_exception_lbl_request_incorrect`
- `401` → `api_exception_lbl_unauthorized_401` / `api_exception_lbl_log_in_required`
- `403` → `api_exception_lbl_access_denied_403` / `api_exception_lbl_no_permission`
- `404` → `api_exception_lbl_not_found_404` / `api_exception_lbl_couldnt_find_page`
- `500` → `api_exception_lbl_server_error_500` / `api_exception_lbl_something_wrong_end`
- Connection error → `api_exception_lbl_connection_error` / `api_exception_lbl_unable_to_connect`
- Timeout → `api_exception_lbl_request_timeout` / `api_exception_lbl_took_too_long`

---

## Full Request/Response Flow

```
UI (BLoC event)
    ↓
UseCase.call()
    ↓
RepositoryImpl
    ↓
safeApiCall(() => apiClient.myEndpoint())
    ↓
Retrofit → Dio
    ↓ SecurityInterceptor (adds hash headers)
    ↓ AuthInterceptor (adds Bearer token)
    ↓ network
    ↑ SecurityInterceptor (verifies response hash)
    ↑ ErrorInterceptor (converts errors)
    ↑
BaseResponse<T>
    ↑ safeApiCall checks isSuccess(), unwraps data
    ↑
RepositoryImpl → Right(entity) or Left(APIFailure)
    ↑
UseCase → Either<Failure, T>
    ↑
BLoC .fold() → success state or error state
    ↑
UI rebuild
```

---

## How to Add a New Endpoint

1. Add a method to `ApiClient`:
   ```dart
   @GET('/users/{id}')
   Future<BaseResponse<UserModel>> getUser(@Path('id') String id);
   ```

2. Run build_runner to regenerate `api_client.g.dart`:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. Add a model with `@JsonSerializable()` if needed. Run build_runner again for `.g.dart`.

4. Call from a repository implementation:
   ```dart
   final data = await safeApiCall(() => _apiClient.getUser(id));
   ```

5. Map result to entity and return `Right(entity)` or catch `APIException` → `Left(APIFailure)`.

---

## Environment Variables

All network config comes from the active `.env.*` file via `EnvConfig`:

| Variable | `EnvConfig` getter | Notes |
|---------|--------------------|-------|
| `API_BASE_URL` | `EnvConfig.baseUrl` | No trailing slash — `https://edge.primegroup.lk` |
| `API_VERSION` | `EnvConfig.apiVersion` | `'api'` — appended to form `https://edge.primegroup.lk/api/` |
| `SECRET_KEY` | `EnvConfig.secretKey` | Used by `SecurityInterceptor` |
| `ACCESS_KEY` | `EnvConfig.accessKey` | Added as `access-key` header to every main API request |
| `CONNECT_TIMEOUT` | `EnvConfig.connectTimeout` | Seconds, default 30 |
| `RECEIVE_TIMEOUT` | `EnvConfig.receiveTimeout` | Seconds, default 30 |
| `SEND_TIMEOUT` | `EnvConfig.sendTimeout` | Seconds, default 30 |
| `ENABLE_LOGGING` | `EnvConfig.enableLogging` | `'true'`/`'false'` |
| `SAP_BASE_URL` | `EnvConfig.sapBaseUrl` | SAP backend base URL (no trailing slash) |
| `SAP_API_KEY` | `EnvConfig.sapApiKey` | SAP auth key added as `primeKey` header |
