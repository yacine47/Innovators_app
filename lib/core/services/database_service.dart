abstract class DatabaseService {
  // Create operation
  Future<Map<String, dynamic>> create(String table, Map<String, dynamic> data);

  Future<Map<String, dynamic>?> read(String table, String id);

  Future<List<Map<String, dynamic>>> readMany(
    String table, {
    Map<String, dynamic>? filters,
    List<String>? columns,
    String? orderBy,
    bool ascending = true,
    int? limit,
    int? offset,
  });

  Future<Map<String, dynamic>> update(
      String table, String id, Map<String, dynamic> data);

  // Delete operation
  Future<void> delete(String table, String id);

  Future<List<Map<String, dynamic>>> customQuery(
      String query, List<dynamic> params);
}
