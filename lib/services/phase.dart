import 'package:dio/dio.dart';
import 'package:quiztg/models/Phase.dart';

class PhaseService {
  final Dio _dio = Dio(
    BaseOptions(
    baseUrl: 'http://127.0.0.1:8000/api/',
    headers: {
      'Content-Type': 'application/json',
    },
  ),
  );

  

  Future<List<PhaseModel>> fetchPhases() async {
    try {
      final response = await _dio.get('/phases');
      print(response);
      return (response.data as List)
          .map((phase) => PhaseModel.fromJson(phase))
          .toList();
    } catch (error) {
      return [];
    }
  }

  Future<void> addPhase(PhaseModel phase) async {
    try {
      final response = await _dio.post('/phases', data: phase.toJson());
      print("Phase added: ${response.data}");
      
    } catch (error) {
      print('Error adding phase: $error');
    }
  }
}
