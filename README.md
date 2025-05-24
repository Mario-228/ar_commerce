
# AR-Commerce Flutter App

AR-Commerce is a mobile e-commerce application built with Flutter, designed exclusively for Android devices. It offers a unique shopping experience by allowing users to preview products in Augmented Reality (AR) and 3D, along with a smooth and secure checkout process.

---

## 📱 Features

- 🔍 **Product Browsing** with:
  - 🧊 3D view
  - 📱 AR view (Augmented Reality)
- 🛒 **Shopping Cart**
- ❤️ **Loved Items** (Wishlist)
- 💳 **Multiple Payment Options**
  - PayPal
  - Stripe
  - Paymob
- 👤 **User Profile** with:
  - **Orders**
    - `Complete` – Paid orders
    - `Pending` – Unpaid orders (can pay or delete)
  - **My Details** – Update profile photo, name, and phone
  - **Addresses** – Add, update, and delete delivery addresses
  - **Contact Us** – Support & feedback

---

## ⚙️ System Requirements

- **Operating System**: Windows 10/11 or macOS (for development only)
- **Flutter SDK**: >=3.10.0
- **Android Studio** (with Android SDK tools)
- **Java**: JDK 17
- **Gradle**: Uses wrapper; no manual install needed
- **AR Support**: Physical Android device with ARCore support

---

## 🛠️ Setup Instructions (Windows/macOS)

> Note: The app runs on Android devices only.

### 1. Clone the repository

```bash
git clone https://github.com/Mario-228/ar_commerce.git
cd ar-commerce
```

### 2. Install Flutter

Follow the [Flutter install guide](https://docs.flutter.dev/get-started/install) and set it up for your OS.

### 3. Configure Flutter

```bash
flutter doctor
flutter pub get
```

Make sure there are no errors.

### 4. Add `local.properties`

In `android/local.properties`, add your Flutter SDK path:

```properties
flutter.sdk=D:\Flutter\flutter
```

> Use double backslashes on Windows.

### 5. Run on Android device

Connect your Android device (ARCore support is optional). Then run:

```bash
flutter run
```

---

## 📦 Building the APK

```bash
flutter build apk --release
```

APK will be in: `build/app/outputs/flutter-apk/app-release.apk`

---

## 🔽 Download APK

You can try the app directly by downloading the prebuilt APK from the link below:

👉 [Download AR-Commerce APK v1.0.0](https://github.com/Mario-228/ar_commerce/releases/tag/v1.0.0)

> Note: You may need to allow installs from unknown sources in your phone settings.

---

## 🧩 Dependencies

This project uses a number of Dart & Flutter packages. Below are the major dependencies listed in `pubspec.yaml`:

| Package | Version | Description |
|--------|---------|-------------|
| `carousel_slider` | ^5.0.0 | Create image and content sliders |
| `cupertino_icons` | ^1.0.8 | iOS-style icons |
| `dartz` | ^0.10.1 | Functional programming for Dart |
| `device_info_plus` | ^11.4.0 | Device information utility |
| `device_preview` | ^1.2.0 | Preview app on multiple devices |
| `dio` | ^5.7.0 | Powerful HTTP client |
| `dropdown_button2` | ^2.3.9 | Custom dropdowns |
| `email_validator` | ^3.0.0 | Validate email formats |
| `equatable` | ^2.0.7 | Simplifies equality comparisons |
| `flutter_bloc` | ^8.1.6 | State management (Bloc) |
| `flutter_otp_text_field` | ^1.4.0+2 | OTP input field UI |
| `flutter_paypal_payment` | ^1.0.8 | PayPal integration |
| `flutter_stripe` | ^11.4.0 | Stripe payment SDK |
| `flutter_svg` | ^2.0.10+1 | Display SVG images |
| `geocoding` | ^3.0.0 | Convert coordinates to addresses |
| `geolocator` | 10.1.0 | Location services |
| `go_router` | ^14.3.0 | Declarative routing |
| `google_maps_flutter` | ^2.12.1 | Google Maps SDK |
| `hive` | ^2.2.3 | Lightweight key-value DB |
| `hive_flutter` | ^1.1.0 | Hive support for Flutter |
| `image_picker` | ^1.1.2 | Pick images from gallery/camera |
| `model_viewer_plus` | ^1.9.0 | Display 3D models |
| `password_strength_checker` | ^1.2.4 | Validate password strength |
| `path_provider` | ^2.1.5 | File system paths |
| `paymob_payment` | ^0.0.1+1 | (Custom integration) |
| `pdf` | ^3.10.4 | Generate PDFs |
| `pretty_bloc_observer` | ^1.0.4 | Debug Bloc state transitions |
| `printing` | ^5.12.0 | Print PDFs and images |
| `radio_group_v2` | ^3.3.1 | Radio buttons group |
| `shared_preferences` | ^2.3.3 | Store simple data locally |
| `smooth_page_indicator` | ^1.2.0+3 | Page indicators |

---

## 🧯 Troubleshooting

- **Build errors**: Check your `local.properties` path and Java version.

---

## 📬 Contact & Support

For feedback or inquiries, use the "Contact Us" section in the app or reach out at:

```
support@ar-commerce.app
```

---
