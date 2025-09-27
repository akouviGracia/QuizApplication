import 'package:dio/dio.dart';
import 'package:quiztg/models/Phase.dart';

class AuthPhaseService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/api/',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<int> login(PhaseModel phase) async {
    try {
      final response = await _dio.post('/login', data: phase.toJson());
      if (response.statusCode != 200) {
        return -1;
      }       
      print(response);
      return response.data['id'];
    } catch (error) {
      print('Error logging in: $error');
      return -1;
    }
  }
          
  }

  

