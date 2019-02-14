import 'package:test/test.dart';

final Matcher isAssertionError = TypeMatcher<AssertionError>();
final Matcher throwsAssertionError = throwsA(isAssertionError);
