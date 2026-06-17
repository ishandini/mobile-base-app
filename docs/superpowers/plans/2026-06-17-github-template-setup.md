# GitHub Template Setup Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Strip all Prime Group branding and credentials from the Flutter base app, wipe git history, and detach from the original remote so the repo is ready to publish as a GitHub template.

**Architecture:** Pure config/credential cleanup — no Dart code changes. Edit three native config files (build.gradle, Info.plist, project.pbxproj), overwrite three gitignored .env files with placeholders, then replace git history with a single orphan commit and remove the remote.

**Tech Stack:** Flutter, Android Gradle, iOS Xcode project, Git

## Global Constraints

- `flutter analyze` must report 0 errors after all code changes
- No `CLEVERTAP_ACCOUNT_ID` or `CLEVERTAP_TOKEN` must remain in any tracked file
- App names: prod → `"Base App"`, dev → `"Base App Dev"`, qa → `"Base App QA"`
- Git history wipe happens LAST — after all code changes are committed to `feature/template`
- The git history wipe is irreversible; confirm code changes are correct before running Phase 2

---

## Files Modified

| File | Change |
|------|--------|
| `android/app/build.gradle` | Rename flavor app_name strings; remove CleverTap manifestPlaceholders from all 3 flavors |
| `ios/Runner/Info.plist` | Change CFBundleName to "Base App"; remove CleverTapAccountID and CleverTapToken entries |
| `ios/Runner.xcodeproj/project.pbxproj` | Update PRODUCT_NAME in 6 build config blocks; remove CLEVERTAP_ACCOUNT_ID and CLEVERTAP_TOKEN from 6 build config blocks (12 lines total) |
| `env/.env.dev` | Overwrite with placeholder values (gitignored — not committed) |
| `env/.env.qa` | Overwrite with placeholder values (gitignored — not committed) |
| `env/.env.prod` | Overwrite with placeholder values (gitignored — not committed) |

---

## Task 1: Android — Update Flavor App Names and Remove CleverTap

**Files:**
- Modify: `android/app/build.gradle:58-87`

**Current `productFlavors` block (lines 60–87):**
```gradle
productFlavors {
    dev {
        dimension "default"
        resValue "string", "app_name", "Prime Dev"
        applicationIdSuffix ".dev"
        manifestPlaceholders = [
            CLEVERTAP_ACCOUNT_ID: "324-60b",
            CLEVERTAP_TOKEN: "111-552"
        ]
    }
    qa {
        dimension "default"
        resValue "string", "app_name", "Prime QA"
        applicationIdSuffix ".qa"
        manifestPlaceholders = [
            CLEVERTAP_ACCOUNT_ID: "324-60b",
            CLEVERTAP_TOKEN: "111-552"
        ]
    }
    prod {
        dimension "default"
        resValue "string", "app_name", "Prime Edge"
        manifestPlaceholders = [
            CLEVERTAP_ACCOUNT_ID: "8W6-4RK-677Z",
            CLEVERTAP_TOKEN: "324-60b"
        ]
    }
}
```

- [ ] **Step 1: Replace the entire productFlavors block**

In `android/app/build.gradle`, replace:
```gradle
      productFlavors {
        dev {
            dimension "default"
            resValue "string", "app_name", "Prime Dev"
            applicationIdSuffix ".dev"
            manifestPlaceholders = [
                CLEVERTAP_ACCOUNT_ID: "324-60b",
                CLEVERTAP_TOKEN: "111-552"
            ]
        }
        qa {
            dimension "default"
            resValue "string", "app_name", "Prime QA"
            applicationIdSuffix ".qa"
            manifestPlaceholders = [
                CLEVERTAP_ACCOUNT_ID: "324-60b",
                CLEVERTAP_TOKEN: "111-552"
            ]
        }
        prod {
            dimension "default"
            resValue "string", "app_name", "Prime Edge"
            manifestPlaceholders = [
                CLEVERTAP_ACCOUNT_ID: "8W6-4RK-677Z",
                CLEVERTAP_TOKEN: "324-60b"
            ]
        }
    }
```

With:
```gradle
      productFlavors {
        dev {
            dimension "default"
            resValue "string", "app_name", "Base App Dev"
            applicationIdSuffix ".dev"
        }
        qa {
            dimension "default"
            resValue "string", "app_name", "Base App QA"
            applicationIdSuffix ".qa"
        }
        prod {
            dimension "default"
            resValue "string", "app_name", "Base App"
        }
    }
```

- [ ] **Step 2: Verify no CleverTap references remain in build.gradle**

```bash
grep -n "CLEVERTAP\|Prime Dev\|Prime QA\|Prime Edge" android/app/build.gradle
```

Expected: no output.

- [ ] **Step 3: Commit**

```bash
git add android/app/build.gradle
git commit -m "chore(template): update Android flavor names and remove CleverTap config"
```

---

## Task 2: iOS — Update Info.plist

**Files:**
- Modify: `ios/Runner/Info.plist`

- [ ] **Step 1: Change CFBundleName**

In `ios/Runner/Info.plist`, replace:
```xml
	<key>CFBundleName</key>
	<string>Prime Edge</string>
```
With:
```xml
	<key>CFBundleName</key>
	<string>Base App</string>
```

- [ ] **Step 2: Remove CleverTapAccountID and CleverTapToken entries**

In `ios/Runner/Info.plist`, remove these four lines:
```xml
	<key>CleverTapAccountID</key>
	<string>$(CLEVERTAP_ACCOUNT_ID)</string>
	<key>CleverTapToken</key>
	<string>$(CLEVERTAP_TOKEN)</string>
```

- [ ] **Step 3: Verify no CleverTap or stale app name remains**

```bash
grep -n "CleverTap\|Prime Edge" ios/Runner/Info.plist
```

Expected: no output.

- [ ] **Step 4: Commit**

```bash
git add ios/Runner/Info.plist
git commit -m "chore(template): update iOS bundle name and remove CleverTap plist keys"
```

---

## Task 3: iOS — Update Xcode Project (project.pbxproj)

**Files:**
- Modify: `ios/Runner.xcodeproj/project.pbxproj`

The file has 6 build configuration blocks with `PRODUCT_NAME` and 6 blocks with `CLEVERTAP_ACCOUNT_ID` / `CLEVERTAP_TOKEN` pairs (12 lines total). Use `replace_all` edits for the PRODUCT_NAME changes and sed for removing the CleverTap lines.

- [ ] **Step 1: Replace PRODUCT_NAME "Prime Edge" → "Base App" (2 occurrences)**

Use replace_all in `ios/Runner.xcodeproj/project.pbxproj`:

old: `				PRODUCT_NAME = "Prime Edge";`
new: `				PRODUCT_NAME = "Base App";`

- [ ] **Step 2: Replace PRODUCT_NAME "Prime QA" → "Base App QA" (2 occurrences)**

Use replace_all in `ios/Runner.xcodeproj/project.pbxproj`:

old: `				PRODUCT_NAME = "Prime QA";`
new: `				PRODUCT_NAME = "Base App QA";`

- [ ] **Step 3: Replace PRODUCT_NAME "Prime Dev" → "Base App Dev" (2 occurrences)**

Use replace_all in `ios/Runner.xcodeproj/project.pbxproj`:

old: `				PRODUCT_NAME = "Prime Dev";`
new: `				PRODUCT_NAME = "Base App Dev";`

- [ ] **Step 4: Remove all CLEVERTAP_ACCOUNT_ID and CLEVERTAP_TOKEN lines**

```bash
sed -i '' '/^\t\t\t\tCLEVERTAP_ACCOUNT_ID = /d' ios/Runner.xcodeproj/project.pbxproj
sed -i '' '/^\t\t\t\tCLEVERTAP_TOKEN = /d' ios/Runner.xcodeproj/project.pbxproj
```

- [ ] **Step 5: Verify all changes**

```bash
grep -n "CLEVERTAP\|Prime Edge\|Prime QA\|Prime Dev" ios/Runner.xcodeproj/project.pbxproj
```

Expected output — only these harmless PBXFileReference lines (app artifact name, not build setting):
```
49:		97C146EE1CF9000F007C117D /* Prime Dev.app */ = {isa = PBXFileReference; ...
127:			97C146EE1CF9000F007C117D /* Prime Dev.app */,
171:		productReference = 97C146EE1CF9000F007C117D /* Prime Dev.app */;
```
These are internal Xcode artifact references, not credential or branding config — safe to leave.

```bash
grep -n "PRODUCT_NAME" ios/Runner.xcodeproj/project.pbxproj
```

Expected — 6 lines showing Base App / Base App Dev / Base App QA.

- [ ] **Step 6: Commit**

```bash
git add ios/Runner.xcodeproj/project.pbxproj
git commit -m "chore(template): update iOS scheme names and remove CleverTap build settings"
```

---

## Task 4: Reset .env Files to Placeholders

**Files:**
- Overwrite: `env/.env.dev` (gitignored — change is local only)
- Overwrite: `env/.env.qa` (gitignored — change is local only)
- Overwrite: `env/.env.prod` (gitignored — change is local only)

- [ ] **Step 1: Overwrite env/.env.dev**

Write the following content to `env/.env.dev`:
```
API_BASE_URL=''
API_VERSION=api
CONNECT_TIMEOUT=30
RECEIVE_TIMEOUT=30
SEND_TIMEOUT=30
APP_NAME=Base App Dev
ENABLE_LOGGING=true
SECRET_KEY=''
GOOGLE_MAPS_ANDROID_KEY=your_google_maps_android_key
GOOGLE_MAPS_IOS_KEY=your_google_maps_ios_key
DEEP_LINK_BASE_URL=''
APPSFLYER_DEV_KEY=your_dev_key_here
APPSFLYER_APP_ID=your_app_id_here
APPSFLYER_ONELINK_TEMPLATE_ID=your_onelink_template_id_here
```

- [ ] **Step 2: Overwrite env/.env.qa**

Write the following content to `env/.env.qa`:
```
API_BASE_URL=''
API_VERSION=''
CONNECT_TIMEOUT=30
RECEIVE_TIMEOUT=30
SEND_TIMEOUT=30
APP_NAME=Base App QA
ENABLE_LOGGING=true
SECRET_KEY=''
GOOGLE_MAPS_ANDROID_KEY=your_google_maps_android_key
GOOGLE_MAPS_IOS_KEY=your_google_maps_ios_key
DEEP_LINK_BASE_URL=''
APPSFLYER_DEV_KEY=your_dev_key_here
APPSFLYER_APP_ID=your_app_id_here
APPSFLYER_ONELINK_TEMPLATE_ID=your_onelink_template_id_here
```

- [ ] **Step 3: Overwrite env/.env.prod**

Write the following content to `env/.env.prod`:
```
API_BASE_URL=''
API_VERSION=api
CONNECT_TIMEOUT=30
RECEIVE_TIMEOUT=30
SEND_TIMEOUT=30
APP_NAME=Base App
ENABLE_LOGGING=false
SECRET_KEY=''
GOOGLE_MAPS_ANDROID_KEY=your_google_maps_android_key
GOOGLE_MAPS_IOS_KEY=your_google_maps_ios_key
DEEP_LINK_BASE_URL=''
APPSFLYER_DEV_KEY=your_dev_key_here
APPSFLYER_APP_ID=your_app_id_here
APPSFLYER_ONELINK_TEMPLATE_ID=your_onelink_template_id_here
```

- [ ] **Step 4: Verify no real credentials remain in any .env file**

```bash
grep -n "CLEVERTAP\|primegroup\|primelands\|primeresidencies\|324-60b\|8W6-4RK\|Aidantz\|q8HtFtp\|6749210943" env/.env.dev env/.env.qa env/.env.prod
```

Expected: no output.

*(No commit needed — these files are gitignored.)*

---

## Task 5: Verify with flutter analyze

- [ ] **Step 1: Run flutter analyze**

```bash
flutter analyze
```

Expected: `No issues found!`

If errors appear, fix them before proceeding to the git history wipe.

---

## Task 6: Git History Wipe and Remote Removal

> **WARNING: This is irreversible.** All local branches and all commit history will be wiped. Confirm Tasks 1–5 are complete and `flutter analyze` is clean before running these steps.

- [ ] **Step 1: Create orphan branch from current feature/template state**

```bash
git checkout --orphan fresh-main
```

This creates a new branch with no parent commits but keeps all current working tree files staged.

- [ ] **Step 2: Stage all files**

```bash
git add -A
```

- [ ] **Step 3: Create the single initial commit**

```bash
git commit -m "chore: initial Flutter base app template"
```

- [ ] **Step 4: Delete the old main branch**

```bash
git branch -D main
```

- [ ] **Step 5: Rename fresh-main to main**

```bash
git branch -m main
```

- [ ] **Step 6: Remove the remote**

```bash
git remote remove origin
```

- [ ] **Step 7: Verify the result**

```bash
git log --oneline
```
Expected: exactly 1 line — the initial commit.

```bash
git remote -v
```
Expected: no output (empty).

```bash
git branch
```
Expected: `* main` only.

---

## Post-Implementation: GitHub Setup (Manual)

These steps are performed by you in the browser/terminal after the plan is complete:

1. Create a new GitHub repository (e.g., `mobile-base-app`)
2. Add the new remote: `git remote add origin <new-repo-ssh-or-https-url>`
3. Push: `git push -u origin main`
4. In GitHub → repo **Settings → General** → check **"Template repository"**
