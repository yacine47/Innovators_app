// Supabase implementation of the DatabaseService
import 'package:linkdin_app/core/services/database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseService implements DatabaseService {
  final SupabaseClient _client;

  // Constructor to inject the Supabase client
  SupabaseDatabaseService(this._client);

  // Factory constructor for easy instantiation with the default client
  factory SupabaseDatabaseService.instance() {
    return SupabaseDatabaseService(Supabase.instance.client);
  }

  @override
  Future<Map<String, dynamic>> create(
      String table, Map<String, dynamic> data) async {
    final response = await _client.from(table).insert(data).select();

    if (response.isEmpty) {
      throw Exception('Failed to create record in $table');
    }

    if (response.isNotEmpty && response.first is Map<String, dynamic>) {
      return response.first;
    }

    return {};
  }

  @override
  Future<Map<String, dynamic>?> read(String table, String id) async {
    try {
      final response =
          await _client.from(table).select().eq('id', id).maybeSingle();

      return response;
    } catch (e) {
      // Handle specific exceptions
      if (e is PostgrestException) {
        return null;
      }
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> readMany(
    String table, {
    Map<String, dynamic>? filters,
    List<String>? columns,
    String? orderBy,
    bool ascending = true,
    int? limit,
    int? offset,
  }) async {
    // Start building the query
    var query = _client.from(table).select(columns?.join(',') ?? '*');

    // Apply filters if provided
    if (filters != null && filters.isNotEmpty) {
      filters.forEach((key, value) {
        // Check if the key contains an operator
        if (key.contains('_')) {
          final parts = key.split('_');
          final field = parts[0];
          final operator = parts[1];

          switch (operator) {
            case 'eq':
              query = query.eq(field, value);
              break;
            case 'neq':
              query = query.neq(field, value);
              break;
            case 'gt':
              query = query.gt(field, value);
              break;
            case 'gte':
              query = query.gte(field, value);
              break;
            case 'lt':
              query = query.lt(field, value);
              break;
            case 'lte':
              query = query.lte(field, value);
              break;
            case 'like':
              query = query.like(field, '%$value%');
              break;
            case 'ilike':
              query = query.ilike(field, '%$value%');
              break;
            default:
              query = query.eq(key, value);
          }
        } else {
          query = query.eq(key, value);
        }
      });
    }

    // Apply ordering if provided
    // if (orderBy != null) {
    //   query = query.order(orderBy, ascending: ascending);
    // }

    // // Apply pagination if provided
    // if (limit != null) {
    //   query = query.limit(limit);
    // }

    // if (offset != null) {
    //   query = query.range(offset, offset + (limit ?? 10) - 1);
    // }

    // Execute the query
    final response = await query;

    return List<Map<String, dynamic>>.from(response);
  }

  @override
  Future<Map<String, dynamic>> update(
      String table, String id, Map<String, dynamic> data) async {
    final response =
        await _client.from(table).update(data).eq('id', id).select();

    if (response.isEmpty) {
      throw Exception('Record with id $id not found in $table');
    }

    return response.first as Map<String, dynamic>;
  }

  @override
  Future<void> delete(String table, String id) async {
    await _client.from(table).delete().eq('id', id);
  }

  @override
  Future<List<Map<String, dynamic>>> customQuery(
      String query, List<dynamic> params) async {
    // Supabase Flutter SDK doesn't support direct SQL queries through the client
    // Use Supabase Functions or REST API for custom queries
    throw UnimplementedError(
        'Raw SQL queries are not directly supported in the Supabase Flutter SDK. '
        'Consider using Supabase Functions, Stored Procedures, or REST API for custom queries.');
  }
}
