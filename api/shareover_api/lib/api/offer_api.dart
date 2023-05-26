//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class OfferApi {
  OfferApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Claim offer parts
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [int] amount:
  Future<Response> offerIdPostWithHttpInfo(int id, { int? amount, }) async {
    // ignore: prefer_const_declarations
    final path = r'/offer/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (amount != null) {
      queryParams.addAll(_queryParams('', 'amount', amount));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Claim offer parts
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [int] amount:
  Future<void> offerIdPost(int id, { int? amount, }) async {
    final response = await offerIdPostWithHttpInfo(id,  amount: amount, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Gets all open offers for a user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<Response> offerListIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/offer/list/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Gets all open offers for a user
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  Future<List<Offer>?> offerListIdGet(int id,) async {
    final response = await offerListIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Offer>') as List)
        .cast<Offer>()
        .toList();

    }
    return null;
  }

  /// Get all offers near to current location
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> offerListNearbyGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/offer/list/nearby';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get all offers near to current location
  Future<List<OfferLocation>?> offerListNearbyGet() async {
    final response = await offerListNearbyGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<OfferLocation>') as List)
        .cast<OfferLocation>()
        .toList();

    }
    return null;
  }

  /// Performs an HTTP 'PUT /offer' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [OfferPutRequest] offerPutRequest:
  Future<Response> offerPutWithHttpInfo({ OfferPutRequest? offerPutRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/offer';

    // ignore: prefer_final_locals
    Object? postBody = offerPutRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [OfferPutRequest] offerPutRequest:
  Future<num?> offerPut({ OfferPutRequest? offerPutRequest, }) async {
    final response = await offerPutWithHttpInfo( offerPutRequest: offerPutRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'num',) as num;
    
    }
    return null;
  }
}
