// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:secrtaria/authentication_module/data/data_source/base_firebase_remote_data_source.dart';
import 'package:secrtaria/authentication_module/domain/entity/user_entity.dart';
import '../models/user_model.dart';



class FireBaseRemoteDataSource extends BaseFirebaseRemoteDataSource {


  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  // ignore: unused_field
  String _verificationId = "";

  FireBaseRemoteDataSource({
    required this.fireStore,
    required this.auth,
    required this.googleSignIn,
  });

  @override
  Future<void> signIn(UserEntity user) async {
     await auth.signInWithEmailAndPassword(
        email: user.email, password: user.password);
  }

    @override
  Future<void> signUp(UserEntity user) async {
    await auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
  }


  @override
  Future<void> signInWithPhoneNumber(String pinCode)  async{
      final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: pinCode);
    await auth.signInWithCredential(authCredential);
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }


  @override
  Future<void> verifyPhoneNumber(String phoneNumber)async {
    
    // ignore: prefer_function_declarations_over_variables
    final PhoneVerificationCompleted phoneVerificationCompleted =
        (AuthCredential authCredential) {
      print("phone is verified : token ${authCredential.token}");
    };

// ignore: prefer_function_declarations_over_variables
    final PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException authCredential) {
      print("phone failed ${authCredential.message},${authCredential.code}");
    };

// ignore: prefer_function_declarations_over_variables
    final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
      this._verificationId = verificationId;
      print("time out $verificationId");
    };

// ignore: prefer_function_declarations_over_variables
    final PhoneCodeSent phoneCodeSent =
        (String verificationID, [int? forceResendingToken]) {
      this._verificationId = verificationID;
      print("sendPhoneCode $verificationID");
    };

    auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
  }

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
    final userCollection = fireStore.collection("users");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList());
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async{
     final userCollection = fireStore.collection("users");
    final uid = await getCurrentUId();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
        name: user.name,
        uid: uid,
        phoneNumber: user.phoneNumber,
        email: user.email,
        profileUrl: user.profileUrl,
        isOnline: user.isOnline,
        status: user.status,
        dob: user.dob,
        gender: user.gender,
      ).toDocument();
      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
        return;
      } else {
        userCollection.doc(uid).update(newUser);
        print("user already exist");
        return;
      }
    }).catchError((error) {
      print(error);
    });
  }

  @override
 Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
 Future<void> getUpdateUser(UserEntity user) async {
    // ignore: prefer_collection_literals
    Map<String, dynamic> userInformation = Map(); 
    print(user.name);
    final userCollection = fireStore.collection("users");

    if (user.profileUrl != null && user.profileUrl != "") 
    {
      userInformation['profileUrl'] = user.profileUrl;
    }
    if (user.status != null && user.status != "") {
      userInformation['status'] = user.status;
    }
    if (user.phoneNumber != null && user.phoneNumber != "") {
      userInformation["phoneNumber"] = user.phoneNumber;
    }
    if (user.name != null && user.name != "") {
      userInformation["name"] = user.name;
    }

    userCollection.doc(user.uid).update(userInformation);
  }

  @override
  Future<void> googleAuth() async{
     final usersCollection = fireStore.collection("users");

    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await account!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final information = (await auth.signInWithCredential(credential)).user;
      usersCollection.doc(auth.currentUser!.uid).get().then((user) async {
        if (!user.exists) {
          var uid = auth.currentUser!.uid;
          var newUser = UserModel(
                  name: information!.displayName!,
                  email: information.email!,
                  phoneNumber: information.phoneNumber==null?"":information.phoneNumber!,
                  profileUrl: information.photoURL==null?"":information.photoURL!,
                  isOnline: false,
                  status: "",
                  dob: "",
                  gender: "",
                  uid: information.uid)
              .toDocument();

          usersCollection.doc(uid).set(newUser);
        }
      }).whenComplete(() {
        // ignore: avoid_print
        print("New User Created Successfully");
      }).catchError((e) {
        // ignore: avoid_print
        print("getInitializeCreateCurrentUser ${e.toString()}");
      });
    } catch (e) {
      print(e);
    }
  }

  @override
   Future<bool> isSignIn() async => auth.currentUser?.uid != null;
}
