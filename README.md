
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

Connect your ARCore-compatible Android device and run:

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

## 🧩 Dependencies

Key packages used:

- `ar_flutter_plugin`
- `flutter_3d_obj`
- `flutter_stripe`
- `paypal_sdk`
- `paymob_package` (customized)
- `provider`, `http`, `shared_preferences`, etc.

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