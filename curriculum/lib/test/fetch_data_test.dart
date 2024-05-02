import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';

import '../model/course.dart';
import '../model/get_teacher_list_request.dart';
import '../model/get_course_list_request.dart';
import '../model/create_course_request.dart';
import '../model/teacher.dart';
import 'mock/mock_api_service.dart';

void main() {
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
  });

  group('teacher list', () {
    test('- Get teacher list successfully.', () async {
      // Act
      final request = GetTeacherListRequest();
      final Response res = await mockApiService.request(request.toApiRequest());

      // Assert
      expect(res.statusCode, 200);

      final List<Teacher> teachers = request.handleResponse(res);
      expect(teachers.length, 10);
      expect(teachers[0].name, 'Mr. Smith');
      expect(teachers[0].title, 'Professor');
      expect(teachers[0].avatarUrl,
          'https://www.w3schools.com/howto/img_avatar.png');
      expect(teachers[0].courses!.length, 3);
    });
  });
  group('course list', () {
    test('- Get course list successfully.', () async {
      // Act
      final request = GetCourseListRequest();
      final Response res = await mockApiService.request(request.toApiRequest());

      // Assert
      expect(res.statusCode, 200);

      final List<Course> courses = request.handleResponse(res);
      expect(courses.length, 10);
      expect(courses[0].name, 'Mathematics');
      expect(courses[0].dayOfWeek, 1);
      expect(courses[0].startTime, '21:00');
      expect(courses[0].durationInMinutes, 90);
    });
  });
  group('create course', () {
    test('- Create a course successfully.', () async {
      // Act
      final request = CreateCourseRequest({
        "name": "Programming Practice",
        "dayOfWeek": 2,
        "startTime": "09:00",
        "durationInMinutes": 90,
      });
      final Response res = await mockApiService.request(request.toApiRequest());

      // Assert
      expect(res.statusCode, 200);
    });
  });
  group('create course', () {
    test('- Failed to create a course.', () async {
      // Act
      final request = CreateCourseRequest({});
      final Response res = await mockApiService.request(request.toApiRequest());

      // Assert
      expect(res.statusCode, 400);
    });
  });
}
