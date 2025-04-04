import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  Failure(this.error);
}

class ServiceFailure extends Failure {
  ServiceFailure(super.error);

  factory ServiceFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure('انتهت مهلة الاتصال، الرجاء المحاولة مرة أخرى!');
      case DioExceptionType.sendTimeout:
        return ServiceFailure('انتهت مهلة الإرسال، الرجاء المحاولة مرة أخرى!');
      case DioExceptionType.receiveTimeout:
        return ServiceFailure(
            'انتهت مهلة الاستقبال، الرجاء المحاولة مرة أخرى!');
      case DioExceptionType.badCertificate:
        return ServiceFailure('شهادة غير صالحة، الرجاء المحاولة مرة أخرى!');
      case DioExceptionType.badResponse:
        return ServiceFailure('عذرًا، حدث خطأ ما، الرجاء المحاولة مرة أخرى!');

      case DioExceptionType.cancel:
        return ServiceFailure('تم إلغاء الطلب، الرجاء المحاولة مرة أخرى!');
      case DioExceptionType.connectionError:
        return ServiceFailure(
            'لا يوجد اتصال بالإنترنت، الرجاء المحاولة مرة أخرى!');
      case DioExceptionType.unknown:
        return ServiceFailure('بعض البيانات خاطئة او مسجلة من قبل');
    }
  }

  factory ServiceFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 403 || statusCode == 422) {
      String errMsg = '';

      if (response is String) {
        return ServiceFailure(response);
      }
      for (int i = 0; i < response.length; i++) {
        errMsg = '${response[i].toString()}\n';
      }
      return ServiceFailure(errMsg);
    } else if (statusCode == 401) {
      return ServiceFailure(response.toString());
    } else if (statusCode == 404) {
      return ServiceFailure('الطلب غير موجود، الرجاء المحاولة مرة أخرى!');
    } else if (statusCode >= 500) {
      return ServiceFailure('خطأ في الخادم الداخلي، الرجاء المحاولة مرة أخرى!');
    } else {
      return ServiceFailure('بعض البيانات خاطئة او مسجلة من قبل');
    }
  }
}
