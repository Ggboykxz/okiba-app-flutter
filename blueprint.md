# Okiba E-commerce App Blueprint

## Overview

This document outlines the architecture, features, and audit of the Okiba e-commerce application. Okiba is a Flutter-based super-app designed for the Gabonese market.

## 1. Project Structure

The project follows a clean, feature-driven architecture, separating concerns into three main layers:

*   **`data`**: Handles data sources, repositories, and models.
    *   `datasources`: Communicates with local (Hive) and remote (Firebase) data sources.
    *   `models`: Defines the data structures (e.g., `ProductModel`, `OrderModel`).
    *   `repositories`: Implements the domain repositories, abstracting the data sources.
*   **`domain`**: Contains the core business logic of the application.
    *   `entities`: Defines the business objects (e.g., `Product`, `Order`).
    *   `usecases`: Encapsulates specific business operations (e.g., `GetProducts`, `PlaceOrder`).
*   **`presentation`**: Contains all UI-related components.
    *   `screens`: Individual screens for different features (e.g., `client`, `seller`, `admin`, `auth`).
    *   `widgets`: Reusable UI components.
    *   `bloc`: State management logic using `flutter_bloc`.

## 2. Features

The application is a "super-app" with a wide range of features for different user roles:

*   **Client:**
    *   Browse products by category.
    *   Search for products.
    *   Add products to cart.
    *   Place orders and make payments.
    *   Track order delivery.
    *   Leave reviews.
*   **Seller:**
    *   Manage product inventory.
    *   View and process orders.
    *   Track earnings.
*   **Admin:**
    *   Dashboard with analytics.
    *   Manage users and KYC (Know Your Customer) verification.
    *   Oversee all orders.
*   **Delivery:**
    *   Dashboard for delivery drivers.
    *   View and accept delivery requests.
    *   Navigate for pickup and drop-off.
    *   Track earnings.

## 3. Core Technologies

*   **State Management:** `flutter_bloc`
*   **Navigation:** `go_router`
*   **Backend:** Firebase (Authentication, Firestore, Storage, Messaging, Analytics)
*   **Local Storage:** `hive`
*   **Location Services:** `google_maps_flutter`, `geolocator`
*   **Internationalization:** `intl`
*   **UI:** Material Design with `google_fonts`, `flutter_svg`, `lottie`, and `shimmer`.

## 4. Audit Plan

This section outlines the steps for auditing and improving the Okiba application.

*   **Step 1: Create `blueprint.md`** (Completed)
*   **Step 2: Dependency Check**
    *   [ ] Run `flutter pub outdated` to identify outdated packages.
    *   [ ] Recommend and apply dependency updates.
*   **Step 3: Code Analysis**
    *   [ ] Run `flutter analyze` to find static analysis issues.
    *   [ ] Run `dart format .` to ensure consistent formatting.
*   **Step 4: Navigation Review**
    *   [ ] Examine `lib/core/navigation/app_router.dart`.
*   **Step 5: State Management Review**
    *   [ ] Investigate the use of `flutter_bloc`.
*   **Step 6: Firebase Integration Review**
    *   [ ] Verify Firebase configuration and error handling.
*   **Step 7: Internationalization Review**
    *   [ ] Check `l10n` implementation.
*   **Step 8: Testing Review**
    *   [ ] Examine existing tests and suggest improvements.
*   **Step 9: Summary and Recommendations**
    *   [ ] Provide a final report with actionable recommendations.
