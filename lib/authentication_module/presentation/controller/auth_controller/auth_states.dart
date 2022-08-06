abstract class AuthState  {
  const AuthState();
}

class AuthInitial extends AuthState {

}

class Authenticated extends AuthState {
  final String uid;
  const Authenticated({required this.uid});
}


class UnAuthenticated extends AuthState {
}