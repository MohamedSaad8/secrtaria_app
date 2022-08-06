import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secrtaria/authentication_module/data/data_source/base_firebase_remote_data_source.dart';
import 'package:secrtaria/authentication_module/domain/entity/user_entity.dart';
import '../models/user_model.dart';



class FireBaseRemoteDataSource extends BaseFirebaseRemoteDataSource {

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseAuth auth  = FirebaseAuth.instance;
 

  @override
  Future<void> signInDataSource(UserEntity user) async {
     await auth.signInWithEmailAndPassword(
        email: user.email, password: user.password);
  }

    @override
  Future<void> signUpDataSource(UserEntity user) async {
    await auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
  }


  @override
  Future<void> signOutDataSource() async {
    await auth.signOut();
  }


  @override
  Future<void> getCreateCurrentUserDataSource(UserEntity user) async{
     final userCollection =  fireStore.collection("users");
    final uid =  getCurrentUIdDataSource();
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
        // ignore: avoid_print
        print("user already exist");
        return;
      }
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
    });
  }

  @override
 String getCurrentUIdDataSource()  => auth.currentUser!.uid;

 
  @override
   bool isSignInDataSource()  
   {
     return  auth.currentUser?.uid != null;
   }
}
