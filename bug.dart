```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Handle exception (including network errors and JSON decoding errors)
    print('Error: $e');
    //Consider rethrowing the exception if it needs to be handled by a higher-level function
    rethrow; //This will propagate the error to the caller function
  }
}
```