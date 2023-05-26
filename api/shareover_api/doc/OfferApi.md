# shareover_api.api.OfferApi

## Load the API package
```dart
import 'package:shareover_api/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**offerIdPost**](OfferApi.md#offeridpost) | **POST** /offer/{id} | Claim offer parts
[**offerListIdGet**](OfferApi.md#offerlistidget) | **GET** /offer/list/{id} | Gets all open offers for a user
[**offerListNearbyGet**](OfferApi.md#offerlistnearbyget) | **GET** /offer/list/nearby | Get all offers near to current location
[**offerPut**](OfferApi.md#offerput) | **PUT** /offer | 


# **offerIdPost**
> offerIdPost(id, amount)

Claim offer parts

### Example
```dart
import 'package:shareover_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OfferApi();
final id = 56; // int | 
final amount = 56; // int | 

try {
    api_instance.offerIdPost(id, amount);
} catch (e) {
    print('Exception when calling OfferApi->offerIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **amount** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **offerListIdGet**
> List<Offer> offerListIdGet(id)

Gets all open offers for a user

### Example
```dart
import 'package:shareover_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OfferApi();
final id = 56; // int | 

try {
    final result = api_instance.offerListIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling OfferApi->offerListIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**List<Offer>**](Offer.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **offerListNearbyGet**
> List<OfferLocation> offerListNearbyGet()

Get all offers near to current location

### Example
```dart
import 'package:shareover_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OfferApi();

try {
    final result = api_instance.offerListNearbyGet();
    print(result);
} catch (e) {
    print('Exception when calling OfferApi->offerListNearbyGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<OfferLocation>**](OfferLocation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **offerPut**
> offerPut(offerPutRequest)



### Example
```dart
import 'package:shareover_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = OfferApi();
final offerPutRequest = OfferPutRequest(); // OfferPutRequest | 

try {
    api_instance.offerPut(offerPutRequest);
} catch (e) {
    print('Exception when calling OfferApi->offerPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offerPutRequest** | [**OfferPutRequest**](OfferPutRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

