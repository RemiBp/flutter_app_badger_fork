import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Firebase Authentication implementation.
///
/// This is a stub implementation to avoid Android Gradle issues.
class FirebaseAuth {
  FirebaseAuth._({required FirebaseApp app}) : _app = app;

  static final Map<String, FirebaseAuth> _authInstances = {};

  /// The current FirebaseApp for this instance.
  final FirebaseApp _app;

  /// Returns the [FirebaseApp] for the current instance.
  FirebaseApp get app => _app;

  /// Returns an instance using the default [FirebaseApp].
  static FirebaseAuth get instance {
    return instanceFor(app: Firebase.app());
  }

  /// Returns an instance using a specified [FirebaseApp].
  static FirebaseAuth instanceFor({required FirebaseApp app}) {
    if (_authInstances.containsKey(app.name)) {
      return _authInstances[app.name]!;
    }

    final auth = FirebaseAuth._(app: app);
    _authInstances[app.name] = auth;
    return auth;
  }

  /// Stream that emits when the user auth state changes
  Stream<User?> authStateChanges() {
    return Stream.value(null);
  }

  /// Stream that emits when the user sign-in state changes
  Stream<User?> userChanges() {
    return Stream.value(null);
  }

  /// Stream that emits when ID token changes
  Stream<User?> idTokenChanges() {
    return Stream.value(null);
  }

  /// The current User if they're signed in, or null if not.
  User? get currentUser => null;

  /// Signs out the current user.
  Future<void> signOut() async {
    return;
  }

  /// Signs in with a phone number.
  /// 
  /// This is a stub implementation.
  Future<ConfirmationResult> signInWithPhoneNumber(
    String phoneNumber, {
    RecaptchaVerifier? verifier,
  }) async {
    return ConfirmationResult();
  }

  /// Signs in with credentials from an authentication provider.
  /// 
  /// This is a stub implementation.
  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return UserCredential();
  }

  /// Signs in anonymously.
  Future<UserCredential> signInAnonymously() async {
    return UserCredential();
  }

  /// Signs in with a custom token.
  Future<UserCredential> signInWithCustomToken(String token) async {
    return UserCredential();
  }

  /// Signs in with email and password.
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return UserCredential();
  }

  /// Creates a new user with email and password.
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return UserCredential();
  }

  /// Sends a password reset email.
  Future<void> sendPasswordResetEmail({
    required String email,
    ActionCodeSettings? actionCodeSettings,
  }) async {
    return;
  }

  /// Validates a password reset code.
  Future<String> verifyPasswordResetCode(String code) async {
    return "";
  }

  /// Confirms a password reset with a code and new password.
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    return;
  }

  /// Checks if an email is already registered.
  Future<bool> fetchSignInMethodsForEmail(String email) async {
    return false;
  }

  /// Sets the current language code used for authentication flows.
  Future<void> setLanguageCode(String languageCode) async {
    return;
  }

  /// Gets the current language code used for authentication flows.
  String? get languageCode => "en";

  /// Sets the user-facing setting for the phone verification timeout.
  Future<void> setSettings({
    bool appVerificationDisabledForTesting = false,
    String? userAccessGroup,
    String? phoneNumber,
    String? smsCode,
    bool? forceRecaptchaFlow,
  }) async {
    return;
  }

  /// Uses device information to detect authentication anti-patterns.
  Future<void> useEmulator(String host, int port) async {
    return;
  }
}

/// A user account.
class User {
  /// The user's unique ID.
  String get uid => "stub-uid";

  /// The user's email address.
  String? get email => null;

  /// Returns whether the user's email is verified.
  bool get emailVerified => false;

  /// Returns whether the user is anonymous.
  bool get isAnonymous => false;

  /// The user's phone number.
  String? get phoneNumber => null;

  /// The user's display name.
  String? get displayName => null;

  /// The user's photo URL.
  String? get photoURL => null;

  /// Returns additional provider-specific information about the user.
  List<UserInfo> get providerData => [];

  /// Returns a token used to identify the user to Firebase services.
  Future<String> getIdToken([bool forceRefresh = false]) async {
    return "stub-token";
  }

  /// Returns a JWT refresh token for the user.
  Future<String?> getIdTokenResult([bool forceRefresh = false]) async {
    return null;
  }

  /// Links this user account with a credential.
  Future<UserCredential> linkWithCredential(AuthCredential credential) async {
    return UserCredential();
  }

  /// Unlinks the current user from a provider.
  Future<User> unlink(String providerId) async {
    return this;
  }

  /// Updates the user's email address.
  Future<void> updateEmail(String newEmail) async {
    return;
  }

  /// Updates the user's password.
  Future<void> updatePassword(String newPassword) async {
    return;
  }

  /// Updates the user's display name.
  Future<void> updateDisplayName(String? displayName) async {
    return;
  }

  /// Updates the user's photo URL.
  Future<void> updatePhotoURL(String? photoURL) async {
    return;
  }

  /// Updates the user's phone number.
  Future<void> updatePhoneNumber(PhoneAuthCredential phoneCredential) async {
    return;
  }

  /// Sends a verification email to the user.
  Future<void> sendEmailVerification([ActionCodeSettings? actionCodeSettings]) async {
    return;
  }

  /// Deletes the current user.
  Future<void> delete() async {
    return;
  }

  /// Verifies the user with a verification ID and code.
  Future<void> reload() async {
    return;
  }
}

/// A credential returned from a successful sign-in, link, or reauthenticate operation.
class UserCredential {
  /// The user that was signed in.
  User? get user => null;

  /// Additional authentication information.
  AdditionalUserInfo? get additionalUserInfo => null;

  /// The OAuth access token, if it was provided.
  String? get credential => null;
}

/// Additional user information from a successful sign-in or link operation.
class AdditionalUserInfo {
  /// Returns whether the user is new or existing.
  bool get isNewUser => false;

  /// Provider-specific user info.
  Map<String, dynamic>? get profile => {};

  /// The provider ID.
  String? get providerId => null;

  /// The user name.
  String? get username => null;
}

/// Interface for auth providers.
abstract class AuthProvider {
  /// The provider ID.
  String get providerId;
}

/// Common interface for authentication credentials.
abstract class AuthCredential {
  /// The provider ID.
  String get providerId;

  /// Whether this credential is a sign-in method.
  bool get signInMethod;
}

/// Email and password authentication credential.
class EmailAuthCredential extends AuthCredential {
  @override
  String get providerId => "password";

  @override
  bool get signInMethod => true;
}

/// Phone authentication credential.
class PhoneAuthCredential extends AuthCredential {
  @override
  String get providerId => "phone";

  @override
  bool get signInMethod => true;
}

/// Information about the user's sign-in provider.
class UserInfo {
  /// The user's unique ID.
  String get uid => "stub-uid";

  /// The provider ID.
  String get providerId => "password";

  /// The user's email address.
  String? get email => null;

  /// The user's display name.
  String? get displayName => null;

  /// The user's photo URL.
  String? get photoURL => null;

  /// The user's phone number.
  String? get phoneNumber => null;
}

/// Result of a phone authentication flow.
class ConfirmationResult {
  /// The verification ID.
  String get verificationId => "stub-verification-id";

  /// Completes phone authentication with a verification code.
  Future<UserCredential> confirm(String verificationCode) async {
    return UserCredential();
  }
}

/// Settings for the action code flow.
class ActionCodeSettings {
  /// Whether the action code link will be opened in a mobile app.
  final bool handleCodeInApp;

  /// The URL to open when the action code is completed.
  final String? url;

  /// The default action code continuation URL.
  final String? dynamicLinkDomain;

  /// The Android package name for the app to open for the action code.
  final String? androidPackageName;

  /// Whether to install the Android app if not already installed.
  final bool? androidInstallApp;

  /// The minimum Android version required to run the app.
  final String? androidMinimumVersion;

  /// The iOS bundle ID for the app to open for the action code.
  final String? iOSBundleId;

  ActionCodeSettings({
    this.handleCodeInApp = false,
    this.url,
    this.dynamicLinkDomain,
    this.androidPackageName,
    this.androidInstallApp,
    this.androidMinimumVersion,
    this.iOSBundleId,
  });
}

/// Represents a CAPTCHA verification process.
class RecaptchaVerifier {
  RecaptchaVerifier();
}

/// Factory for creating various Auth providers.
class GoogleAuthProvider extends AuthProvider {
  /// The provider ID.
  @override
  String get providerId => "google.com";

  /// Creates a new Google credential.
  static OAuthCredential credential({
    required String accessToken,
    String? idToken,
  }) {
    return OAuthCredential(providerId: "google.com");
  }
}

/// OAuth credential for authentication.
class OAuthCredential extends AuthCredential {
  /// Creates an OAuth credential.
  OAuthCredential({required this.providerId});

  @override
  final String providerId;

  @override
  bool get signInMethod => true;
}

/// Factory for Facebook auth providers.
class FacebookAuthProvider extends AuthProvider {
  /// The provider ID.
  @override
  String get providerId => "facebook.com";

  /// Creates a Facebook credential.
  static OAuthCredential credential(String accessToken) {
    return OAuthCredential(providerId: "facebook.com");
  }
}

/// Factory for Twitter auth providers.
class TwitterAuthProvider extends AuthProvider {
  /// The provider ID.
  @override
  String get providerId => "twitter.com";

  /// Creates a Twitter credential.
  static OAuthCredential credential({
    required String accessToken,
    required String secret,
  }) {
    return OAuthCredential(providerId: "twitter.com");
  }
}

/// Factory for GitHub auth providers.
class GithubAuthProvider extends AuthProvider {
  /// The provider ID.
  @override
  String get providerId => "github.com";

  /// Creates a GitHub credential.
  static OAuthCredential credential(String accessToken) {
    return OAuthCredential(providerId: "github.com");
  }
}

/// Error thrown when an authentication operation fails.
class FirebaseAuthException implements Exception {
  /// The error code.
  final String code;

  /// The error message.
  final String message;

  /// The email used for the authentication attempt.
  final String? email;

  /// The phone number used for the authentication attempt.
  final String? phoneNumber;

  /// The URL to get more information about the error.
  final String? tenantId;

  FirebaseAuthException({
    required this.code,
    required this.message,
    this.email,
    this.phoneNumber,
    this.tenantId,
  });
}

/// Factory for email/password auth providers.
class EmailAuthProvider extends AuthProvider {
  /// The provider ID.
  @override
  String get providerId => "password";

  /// Creates an email and password credential.
  static AuthCredential credential({
    required String email,
    required String password,
  }) {
    return EmailAuthCredential();
  }
}

/// Factory for phone auth providers.
class PhoneAuthProvider extends AuthProvider {
  /// Creates a new PhoneAuthProvider instance
  PhoneAuthProvider({FirebaseAuth? auth}) : _auth = auth ?? FirebaseAuth.instance;

  final FirebaseAuth _auth;

  /// The provider ID.
  @override
  String get providerId => "phone";

  /// Starts a phone number verification flow.
  Future<String> verifyPhoneNumber({
    required String phoneNumber,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    Duration timeout = const Duration(seconds: 30),
    int? forceResendingToken,
    String? autoRetrievedSmsCodeForTesting,
  }) async {
    return "stub-verification-id";
  }

  /// Creates a phone auth credential from a verification ID and code.
  static PhoneAuthCredential credential({
    required String verificationId,
    required String smsCode,
  }) {
    return PhoneAuthCredential();
  }
}

/// Callback when a phone verification is completed.
typedef PhoneVerificationCompleted = void Function(PhoneAuthCredential credential);

/// Callback when a phone verification fails.
typedef PhoneVerificationFailed = void Function(FirebaseAuthException error);

/// Callback when a phone verification code is sent.
typedef PhoneCodeSent = void Function(String verificationId, int? resendToken);

/// Callback when a phone auto-retrieval timeout occurs.
typedef PhoneCodeAutoRetrievalTimeout = void Function(String verificationId); 