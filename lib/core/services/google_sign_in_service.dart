// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:my_codes_app/core/functions/generate_password.dart';
// import 'package:my_codes_app/features/auth/data/models/user_model.dart';

// abstract class GoogleSignInService {
//   static Future<UserModel?> signInWithGoogle() async {
//     try {
//       // Step 1: Sign out any existing Google account
//       await GoogleSignIn().signOut();

//       // Step 2: Attempt to sign in and open the Google account picker
//       GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       if (googleUser == null) {
//         // User canceled the sign-in flow
//         print("Sign-in canceled by user.");
//         return null;
//       }

//       // Step 3: Authenticate with Firebase
//       GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Optional: Set language (remove if not required)
//       FirebaseAuth.instance.setLanguageCode('ar');

//       // Step 4: Sign in with the credential in Firebase
//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);

//       // Step 5: Get Firebase user details
//       User? user = userCredential.user;
//       if (user == null) throw Exception("Failed to sign in with Google");

//       // Step 6: Create and return the UserModel
//       String email = user.email ?? "";
//       String password = generatePassword(
//         length: 16,
//         hasUppercase: true,
//         hasNumbers: true,
//         hasSpecialChars: true,
//       );

//       final UserModel userModel = UserModel(email: email, password: password);

//       return userModel;
//     } catch (e) {
//       // Log or handle any errors
//       print("Error in Google Sign-In: $e");
//       return null;
//     }
//   }
// }
