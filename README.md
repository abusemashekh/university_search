# 🌍 Global University Search + User Profile App

## 📱 Overview
A Flutter app that allows users to search for universities by country and view basic university information.

## 🚀 Features
- Search universities by country
- View university details
- Show user profile
- Modern Flutter architecture (MVVM)
- State management using Riverpod
- Navigation using GoRouter

## 📦 Tech Stack
- Flutter
- MVVM Architecture
- Riverpod (State Management)
- GoRouter (Routing)

## 🗂 Folder Structure
```
lib/
├── main.dart
├── app/
│   ├── app.dart
│   └── router.dart
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── exceptions/
│   │   └── app_exceptions.dart
│   └── utils/
│       └── snackbar_utils.dart
├── features/
│   ├── home/
│   │   ├── models/
│   │   │   ├── university_model.dart
│   │   │   └── user_profile_model.dart
│   │   ├── services/
│   │   │   └── university_service.dart
│   │   ├── view_models/
│   │   │   └── home_view_model.dart
│   │   └── views/
│   │       └── home_screen.dart
│   └── detail/
│       ├── view_models/
│       │   └── detail_view_model.dart
│       └── views/
│           └── detail_screen.dart
└── shared/
└── widgets/
├── custom_text_field.dart
├── university_card.dart
└── loading_widget.dart
```

## 🛠 Setup Instructions

To run this Flutter project locally, follow the steps below:

1. **Clone the repository**
```
https://github.com/abusemashekh/university_search.git
```

## 🔐 Security & Error Handling
- HTTPS used for API calls
- Snackbar displayed on API failure
- Proper error state handling using Riverpod

## ☁ Bonus: AWS ECS Architecture (Optional)

> _Note: I do not have deep experience with AWS infrastructure, but based on my basic understanding, I am assuming a simple architecture setup as follows._

### Basic AWS Setup (Assumption)

If the app is connected to a backend API hosted on AWS using ECS (Elastic Container Service), here’s a basic assumed architecture:

1. Flutter App
2. Amazon API Gateway
3. Application Load Balancer (ALB)
4. Amazon ECS (Fargate)
5. Amazon RDS (Optional)
6. Amazon S3 (Optional)

### Architecture Flow

```
Flutter App
    ↓
API Gateway
    ↓
Application Load Balancer
    ↓
ECS Cluster (Fargate)
    └── API Container
          ↓
       (Optional) RDS / S3
```