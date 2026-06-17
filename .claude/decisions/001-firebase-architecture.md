# ADR-001: Firebase Architecture

**Date:** 2026-03-16
**Status:** Accepted

---

## Context

The NewApp requires authentication, user profile storage, push notifications,
remote feature flags, analytics, and crash reporting. The OldApp used Firebase
for all of these. The decision was made to match that approach rather than using
a custom JWT + REST API for auth.

---

## Decision

Use Firebase as the primary infrastructure layer alongside the existing REST
`ApiClient`. The two layers serve different purposes and coexist:

| Concern | Layer |
|---------|-------|
| Authentication | Firebase Auth |
| User profile document | Firestore (`customers` collection) |
| Push notifications | Firebase Cloud Messaging |
| Feature flags / app config | Firebase Remote Config |
| Analytics events | Firebase Analytics |
| Crash reporting | Firebase Crashlytics |
| Business data / REST endpoints | `ApiClient` (Dio + Retrofit) |
| Callable server-side logic | Firebase Functions (`cloud_functions`) |

---

## Auth Strategy

Firebase Auth only — **no JWT exchange with the NewApp backend**.

```
Email/Password → FirebaseAuth.signInWithEmailAndPassword()
Google         → GoogleSignIn → Firebase credential
Apple          → SignInWithApple → Firebase credential

On success:
  - isLoggedIn = "true" saved to FlutterSecureStorage
  - AuthUserEntity emitted to BLoC (implemented per feature screen)

On sign-out:
  - FirebaseAuth.signOut() + GoogleSignIn().signOut()
  - isLoggedIn removed from SecureStorage
```

No `AuthInterceptor`, no `RefreshTokenInterceptor`, no `/auth/refresh` endpoint.
Firebase SDK manages token refresh internally.

---

## Firestore Pattern

`FirebaseFirestore` is registered as a `@lazySingleton` via `FirebaseModule` and
**injected directly into feature datasource impls** — the same way `ApiClient` is
injected into Retrofit datasources.

There is no monolithic "FirestoreClient" wrapper. Each feature datasource defines
its own collection path and query logic.

**Firestore collection:** `customers` (mirrors OldApp schema).
Document ID = Firebase UID.

---

## Service Architecture Tiers

### Full Clean Architecture (data + domain + BLoC)
Used for services that have reactive state consumed by the UI:

- `core/services/remote_config/` — `RemoteConfigBloc` (global `@lazySingleton`)
- `core/services/notifications/` — `NotificationsBloc` (global `@lazySingleton`)

### Simple Service (interface + impl only, no BLoC)
Used for cross-cutting infrastructure with no UI state:

- `core/services/analytics/` — `AnalyticsService`
- `core/services/crashlytics/` — `CrashlyticsService`

---

## Consequences

**Positive:**
- No JWT token management — Firebase handles expiry and refresh automatically
- Consistent with OldApp — team has prior knowledge
- Crashlytics + Analytics = production observability from day one
- Remote Config enables server-driven feature flags without app releases

**Negative:**
- Firestore introduces a second data store alongside SQLite — queries must be
  kept in the correct layer (SQLite for translated strings/colors, Firestore
  for user profile documents)
- Firebase Functions callable pattern differs from standard REST — datasource
  impls that call Functions receive `FirebaseFunctions` via DI rather than
  `ApiClient`

---

## Alternatives Rejected

**JWT exchange (Option B):** Backend would issue custom JWT in exchange for
Firebase ID token. Rejected because it requires maintaining the
`AuthInterceptor` + `RefreshTokenInterceptor` stack and a `/auth/refresh`
endpoint that does not yet exist.
