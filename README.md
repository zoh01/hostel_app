# 🏠 Hostel Management App
<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)

A comprehensive hostel management solution built with Flutter for seamless administration and guest management.

[Features](#-features) • [Installation](#-installation) • [Architecture](#-my-approach) • [Tech Stack](#-tools-and-libraries-used)

</div>

## 📖 Introduction
The Hostel Management App is a modern, cross-platform application designed to streamline hostel operations, from guest check-ins to room management and facility bookings. Built with Flutter, this application provides hostel administrators, staff, and guests with an efficient digital platform to manage all aspects of hostel life.

---

## 🎯 Overview
Managing a hostel involves coordinating multiple aspects: room allocation, guest registration, payment tracking, maintenance requests, and facility bookings. Traditional paper-based or spreadsheet systems are inefficient, error-prone, and difficult to scale.

### The Challenge:
- Manual guest registration is time-consuming
- Room availability tracking is complicated
- Payment records get lost or mismanaged
- Maintenance requests are not tracked properly
- Communication between staff and guests is inefficient
- Reporting and analytics are difficult to generate

### The Solution: 
- Instant digital check-in/check-out process
- Real-time room availability tracking
- Automated payment processing and receipt generation
- Centralized maintenance request management
- Direct communication channels between staff and residents
- Comprehensive analytics dashboard for administrators

The app serves three primary user types:

1️⃣ **Administrators:** Full system access and management capabilities

2️⃣ **Staff Members:** Day-to-day operations management

3️⃣ **Guests/Residents:** Self-service portal for bookings and requests

---

## ✨ Features
### 🔐 User Management & Authentication
- **Multi-Role Access Control:** Separate interfaces for admins, staff, and guests
- **Secure Login System:** Email/password authentication with password recovery
- **User Profiles:** Comprehensive profiles with personal information and documents
- **Registration Management:** Digital onboarding process for new residents
- **Guest Database:** Centralized repository of all current and past guests

### 🏠 Room Management
- **Room Inventory:** Complete listing of all rooms with details (capacity, amenities, pricing)
- **Real-Time Availability:** Live view of vacant and occupied rooms
- **Room Allocation:** Assign rooms to guests with conflict prevention
- **Room Types:** Categorize rooms (single, double, dormitory, suite)
- **Occupancy Dashboard:** Visual representation of hostel occupancy rates

### 🔔 Additional Features
- **Online Booking:**  Guests can book rooms through the app
- **Booking Modifications:** Extend stays or change rooms easily
- **Payment Tracking:** Record all payments with date and method
- **Invoice Generation:** Automatic invoice creation for stays
- **Multiple Payment Methods:** Cash, card, bank transfer tracking
- **Maintenance Requests:** Guests can report issues directly
- **Staff Assignment:** Assign tasks to specific maintenance staff
- **In-App Notifications:** Push notifications for important updates

---

## 🛠️ My Approach
### Development Philosophy
The development of this hostel management application follows industry best practices, focusing on scalability, security, and user experience. The architecture is designed to handle both small hostels and large residential facilities with hundreds of rooms.
### Architecture Pattern
The app implements a Clean Architecture approach with clear separation between presentation, business logic, and data layers:

1. Clean Architecture Implementation
   
         lib/
          ├── core/                          # Core utilities and shared resources
          │   ├── constants/                 # App-wide constants
          │   │   ├── app_colors.dart
          │   │   ├── app_strings.dart
          │   │   └── app_routes.dart
          │   ├── themes/                    # App theming
          │   │   ├── light_theme.dart
          │   │   └── dark_theme.dart
          │   ├── utils/                     # Helper functions
          │   │   ├── validators.dart
          │   │   ├── date_formatter.dart
          │   │   └── pdf_generator.dart
          │   └── errors/                    # Error handling
          │       └── exceptions.dart
          │
          ├── data/                          # Data layer
          │   ├── models/                    # Data models
          │   │   ├── user_model.dart
          │   │   ├── room_model.dart
          │   │   ├── booking_model.dart
          │   │   └── payment_model.dart
          │   ├── repositories/              # Repository implementations
          │   │   ├── auth_repository.dart
          │   │   ├── room_repository.dart
          │   │   └── booking_repository.dart
          │   └── services/                  # External services
          │       ├── firebase_service.dart
          │       └── notification_service.dart
          │
          ├── domain/                        # Business logic layer
          │   ├── entities/                  # Business entities
          │   ├── repositories/              # Repository interfaces
          │   └── usecases/                  # Business use cases
          │       ├── create_booking.dart
          │       ├── assign_room.dart
          │       └── process_payment.dart
          │
          ├── presentation/                  # Presentation layer
          │   ├── screens/                   # App screens
          │   │   ├── auth/                  # Authentication screens
          │   │   │   ├── login_screen.dart
          │   │   │   └── register_screen.dart
          │   │   ├── admin/                 # Admin dashboard
          │   │   │   ├── dashboard_screen.dart
          │   │   │   ├── rooms_screen.dart
          │   │   │   ├── bookings_screen.dart
          │   │   │   └── reports_screen.dart
          │   │   ├── staff/                 # Staff interface
          │   │   │   ├── check_in_screen.dart
          │   │   │   └── maintenance_screen.dart
          │   │   └── guest/                 # Guest portal
          │   │       ├── home_screen.dart
          │   │       ├── booking_screen.dart
          │   │       └── profile_screen.dart
          │   ├── widgets/                   # Reusable widgets
          │   │   ├── room_card.dart
          │   │   ├── booking_card.dart
          │   │   └── custom_button.dart
          │   └── providers/                 # State management
          │       ├── auth_provider.dart
          │       ├── room_provider.dart
          │       └── booking_provider.dart
          │
          └── main.dart                      # Application entry point

## 🔧 Tools and Libraries Used
1. ### Core Technologies
   - **Flutter SDK** (3.X+) - UI framework for building natively compiled applications
   - **Dart** (3.X+) - Programming language optimized for building mobile, desktop, and web apps
2. ### Backend & Database
   
         # Firebase Services
         firebase_core: ^latest              # Firebase initialization
         firebase_auth: ^latest              # Authentication
         cloud_firestore: ^latest            # Real-time database
         firebase_storage: ^latest           # File storage
         firebase_messaging: ^latest         # Push notifications
         cloud_functions: ^latest            # Serverless functions
3. ### State Management
   
         provider: ^latest                   # State management solution
         # OR
         riverpod: ^latest                   # Advanced state management
         # OR
         bloc: ^latest                       # BLoC pattern implementation
4. ### UI & Design
   
         # UI Components
         google_fonts: ^latest               # Custom fonts
         flutter_svg: ^latest                # SVG support
         cached_network_image: ^latest       # Image caching
         shimmer: ^latest                   # Loading animations
         flutter_slidable: ^latest          # Swipeable list items
         card_swiper: ^latest               # Card swiping
         animations: ^latest                # Custom animations
   
         # Date & Time
         intl: ^latest                      # Internationalization
         table_calendar: ^latest            # Calendar widget
         syncfusion_flutter_calendar: ^latest # Advanced calendar
5. **Utilities**
   
         # Data Handling
         uuid: ^latest                       # Unique ID generation
         pdf: ^latest                        # PDF generation
         path_provider: ^latest             # File system access
         file_picker: ^latest               # File selection
         image_picker: ^latest              # Image selection
         
         # Networking & Storage
         dio: ^latest                        # HTTP client
         shared_preferences: ^latest         # Local storage
         hive: ^latest                      # Local database
         sqflite: ^latest                   # SQLite database
         
         # Connectivity
         connectivity_plus: ^latest          # Network status
         internet_connection_checker: ^latest # Internet check

---

## ⚙️ How It Works
1. ### User Authentication Flow
   
         App Launch
          ↓
         Check Authentication State
             ↓
         ├─→ Not Authenticated ──→ Login Screen
         │                             ↓
         │                        Enter Credentials
         │                             ↓
         │                        Firebase Auth
         │                             ↓
         └─→ Authenticated ──────→ Check User Role
                                       ↓
                 ┌─────────────────────┼─────────────────────┐
                 ↓                     ↓                     ↓
            Admin Dashboard      Staff Dashboard      Guest Dashboard

---

## 📱 App Preview
### Dashboard Screen
![Dashboard_Screen](https://github.com/zoh01/hostel_app/blob/371155ca070adeea68e6ae83e7a9378ce4f846e1/hostel1.jpg)

### SignUp Screen
![SignUp_Screen](https://github.com/zoh01/hostel_app/blob/371155ca070adeea68e6ae83e7a9378ce4f846e1/hostel3.jpg)

### Login Screen
![Login_Screen](https://github.com/zoh01/hostel_app/blob/e382138214f79ff4dbe1a4acda1d1bc17e7e353c/hostel2.jpg)

### Profile Screen
![Profile_Screen](https://github.com/zoh01/hostel_app/blob/e382138214f79ff4dbe1a4acda1d1bc17e7e353c/hostel4.jpg)

### Available Rooms Screen
![Available_Rooms_Screen](https://github.com/zoh01/hostel_app/blob/e7c4defe9585d4d0de988e26e1cf3ff7c429a5f2/hostel6.jpg)

### Change Request Screen
![Change_Request_Screen](https://github.com/zoh01/hostel_app/blob/e7c4defe9585d4d0de988e26e1cf3ff7c429a5f2/hostel7.jpg)

---

## 🚀 Installation
### 📝 Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode / VS Code
- Firebase account with project setup
- Git installed on your machine

**STEPS TO RUN**
1. Clone the Repository
   ```bash
   git clone https://github.com/zoh01/hostel_app.git
   cd hostel_app
2. Install Dependencies
   ```bash
   flutter pub get
3. Firebase Configuration
   **Create a Firebase Project:**
   1. Go to Firebase Console
   2. Create a new project named "Hostel Management"
   3. Enable the following services:
      - Authentication (Email/Password)
      - Cloud Firestore
      - Cloud Storage
      - Cloud Messaging
     
---

## 🚀 Future Enhancement & Ideas
- 🥽 AI-powered demand forecasting
- 🤖 Dynamic pricing based on occupancy
- 📱 Integration with booking platforms (Booking.com, Hostelworld)
- 🛍️ Designer marketplace
- 🏠 Mobile POS system for cafe/shop
- 🎨 Biometric authentication
- 📦 Virtual tour of rooms

--- 

## 🤝 Contributing
Contributions make the open-source community an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

---

## 👤 Author
**Adebayo Wariz**  

## 📧 Contact
Whatsapp: +234 702 513 6608

Email: adebayozoh@gmail.com

LinkedIn: https://www.linkedin.com/in/adebayo-wariz-a8ab9a310/

GitHub: [https://github.com/zoh01](https://github.com/zoh01)

Project Link: [https://github.com/zoh01/hostel_app](https://github.com/zoh01/hostel_app)

---

## 📄 License
Distributed under the MIT License. See LICENSE file for more information.
```bash
MIT License

Copyright (c) 2025 [Adebayo Wariz]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
