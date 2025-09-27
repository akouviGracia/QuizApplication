import 'package:flutter/widgets.dart';
import 'package:quiztg/models/Phase.dart';
import 'package:quiztg/services/auth.phase.dart';

class AuthProvider with ChangeNotifier {
  final AuthPhaseService _phaseService = AuthPhaseService();

  Future<int> login(PhaseModel phase) async {
   return  await _phaseService.login(phase);

  }

}