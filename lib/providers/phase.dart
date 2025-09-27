import 'package:flutter/material.dart';
import 'package:quiztg/models/Phase.dart';
import 'package:quiztg/services/phase.dart';

class PhaseProvider with ChangeNotifier {
  final PhaseService _phaseService = PhaseService();
  List<PhaseModel> _phases = [];

  List<PhaseModel> get phases => _phases;

  Future<void> fetchPhases() async {
    _phases = await _phaseService.fetchPhases();
    notifyListeners();
  }

    Future<void> addPhase(PhaseModel phase) async {
      
        await _phaseService.addPhase(phase);
        _phases.add(phase);
        notifyListeners();
      } 
    }
  
