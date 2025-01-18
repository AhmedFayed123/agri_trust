import 'package:agri_trust/core/router/routes.dart';
import 'package:agri_trust/features/auth/presentation/views/auth_view.dart';
import 'package:agri_trust/features/auth/presentation/views/code_verification_view.dart';
import 'package:agri_trust/features/auth/presentation/views/create_new_password_view.dart';
import 'package:agri_trust/features/auth/presentation/views/forget_password_view.dart';
import 'package:agri_trust/features/auth/presentation/views/login_view.dart';
import 'package:agri_trust/features/auth/presentation/views/register_view.dart';
import 'package:agri_trust/features/history/presentaion/views/history_view.dart';
import 'package:agri_trust/features/home/presentation/views/settings_view.dart';
import 'package:agri_trust/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:agri_trust/features/qr_code_scanner/presentation/views/barcode_confirmation_view.dart';
import 'package:agri_trust/features/qr_code_scanner/presentation/views/loading_view.dart';
import 'package:agri_trust/features/qr_code_scanner/presentation/views/product_details_view.dart';
import 'package:agri_trust/features/wallet/presentation/views/wallet_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/qr_code_scanner/presentation/views/scan_barcode_view.dart';
import '../../features/qr_code_scanner/presentation/views/second_barcode_confirmation_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutes.onBoarding,
      builder: (context, state) => OnBoardingView(),
    ),
    GoRoute(
      path: AppRoutes.auth,
      builder: (context, state) => const AuthView(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: AppRoutes.history,
      builder: (context, state) => const HistoryView(),
    ),
    GoRoute(
      path: AppRoutes.scanBarcodeView,
      builder: (context, state) => const ScanBarcodeView(),
    ),
    GoRoute(
      path: AppRoutes.barcodeConfirmationView,
      builder: (context, state) {
        final scannedCode = state.extra as String? ?? 'defaultCode';
        return BarcodeConfirmationView(scannedCode: scannedCode);
      },
    ),
    GoRoute(
      path: AppRoutes.secondBarcodeConfirmationView,
      builder: (context, state) {
        final scannedCode = state.extra as String? ?? 'defaultCode';
        return SecondBarcodeConfirmationView(scannedCode: scannedCode);
      },
    ),
    GoRoute(
      path: AppRoutes.productDetails,
      builder: (context, state) {
        final scannedCode = state.extra as String? ?? 'defaultCode';
        return ProductDetailsView(scannedCode: scannedCode);
      },
    ),
    GoRoute(
      path: AppRoutes.wallet,
      builder: (context, state) => const WalletView(),
    ),
    GoRoute(
      path: AppRoutes.loadingScreen,
      builder: (context, state) => const LoadingView(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => const SettingsView(),
    ),
    GoRoute(
      path: AppRoutes.forgetPassword,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: AppRoutes.codeVerificationView,
      builder: (context, state) => const CodeVerificationView(),
    ),
    GoRoute(
      path: AppRoutes.createNewPassword,
      builder: (context, state) => const CreateNewPasswordView(),
    ),
  ],
);
