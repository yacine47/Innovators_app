// import 'package:dio/dio.dart';

// class ApiService {
//   final String baseUrl = kBaseUrl;
//   final Dio _dio;

//   ApiService(this._dio);

//   Future<dynamic> get(String endPoint) async {
//     SecureStorageService? secureStorageService =
//         getIt.get<SecureStorageService>();
//     String? token = await secureStorageService.getToken();

//     if (token == null) {
//       Response response = await _dio.get('$baseUrl$endPoint');
//       return response.data;
//     }
//     Response response = await _dio.get('$baseUrl$endPoint',
//         options: Options(headers: {'authorization': 'Bearer $token'}));

//     return response.data;
//   }

//   dynamic post(
//     String endPoint,
//     Object data, {
//     bool Function(int?)? validateStatus,
//     String? contentType,
//   }) async {
//     SecureStorageService? secureStorageService =
//         getIt.get<SecureStorageService>();
//     String? token = await secureStorageService.getToken();
//     if (token == null) {
//       Response response = await _dio.post('$baseUrl$endPoint',
//           data: data,
//           options: Options(
//             contentType: contentType,
//             validateStatus: validateStatus,
//           ));

//       return response.data;
//     }

//     Response response = await _dio.post(
//       '$baseUrl$endPoint',
//       data: data,
//       options: Options(
//         validateStatus: validateStatus,
//         contentType: contentType,
//         headers: {
//           'authorization': 'Bearer $token',
//         },
//       ),
//     );
//     return response.data;
//   }

//   Future<Map<String, dynamic>> put(String endPoint, Object data) async {
//     SecureStorageService? secureStorageService =
//         getIt.get<SecureStorageService>();
//     String? token = await secureStorageService.getToken();
//     if (token == null || JwtDecoder.isExpired(token)) {
//       Response response = await _dio.put('$baseUrl$endPoint', data: data);

//       return response.data;
//     }

//     Response response = await _dio.put('$baseUrl$endPoint',
//         data: data,
//         options: Options(
//           headers: {'authorization': 'Bearer $token'},
//         ));
//     return response.data;
//   }

//   Future<Map<String, dynamic>> delete(String endPoint, Object data) async {
//     SecureStorageService? secureStorageService =
//         getIt.get<SecureStorageService>();
//     String? token = await secureStorageService.getToken();
//     if (token == null || JwtDecoder.isExpired(token)) {
//       Response response = await _dio.delete('$baseUrl$endPoint', data: data);

//       return response.data;
//     }

//     Response response = await _dio.delete('$baseUrl$endPoint',
//         data: data,
//         options: Options(
//           headers: {'authorization': 'Bearer $token'},
//         ));
//     return response.data;
//   }

//   Future<String> refreshToken(String token) async {
//     Map<String, dynamic> dataResponse = await post('auth/refresh', {
//       'token': token,
//     });

//     return dataResponse['access_token'];
//   }
// }
