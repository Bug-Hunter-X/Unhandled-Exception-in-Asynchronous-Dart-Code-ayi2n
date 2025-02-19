```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      //Custom Exception for HTTP errors
      throw HttpException('HTTP request failed with status: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    // Handle SocketException (network issues)
    print('Network Error: $e');
    // Consider custom exception for network errors.
    throw NetworkException('Network request failed: $e');
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('JSON decoding error: $e');
    throw JsonFormatException('Invalid JSON format: $e');
  } catch (e) {
    // Handle other exceptions
    print('An unexpected error occurred: $e');
    rethrow; //Rethrow to allow handling at a higher level
  }
}

//Custom Exception Classes (Optional but recommended)
class HttpException implements Exception {
  final String message;
  HttpException(this.message);
  @override
  String toString() => message;
}
class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
  @override
  String toString() => message;
}
class JsonFormatException implements Exception {
  final String message;
  JsonFormatException(this.message);
  @override
  String toString() => message;
}
```