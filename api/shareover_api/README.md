# shareover_api
The api docs duh

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 1.0.0
- Build package: org.openapitools.codegen.languages.DartClientCodegen

## Requirements

Dart 2.12 or later

## Installation & Usage

### Github
If this Dart package is published to Github, add the following dependency to your pubspec.yaml
```
dependencies:
  shareover_api:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
```

### Local
To use the package in your local drive, add the following dependency to your pubspec.yaml
```
dependencies:
  shareover_api:
    path: /path/to/shareover_api
```

## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:shareover_api/api.dart';

// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = NotificationApi();

try {
    api_instance.notificationDelete();
} catch (e) {
    print('Exception when calling NotificationApi->notificationDelete: $e\n');
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost:3000*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*NotificationApi* | [**notificationDelete**](doc\/NotificationApi.md#notificationdelete) | **DELETE** /notification | 
*NotificationApi* | [**notificationGet**](doc\/NotificationApi.md#notificationget) | **GET** /notification | 
*NotificationApi* | [**notificationIdDelete**](doc\/NotificationApi.md#notificationiddelete) | **DELETE** /notification/{id} | 
*NotificationApi* | [**notificationPost**](doc\/NotificationApi.md#notificationpost) | **POST** /notification | 
*OfferApi* | [**offerIdPost**](doc\/OfferApi.md#offeridpost) | **POST** /offer/{id} | Claim offer parts
*OfferApi* | [**offerListIdGet**](doc\/OfferApi.md#offerlistidget) | **GET** /offer/list/{id} | Gets all open offers for a user
*OfferApi* | [**offerListNearbyGet**](doc\/OfferApi.md#offerlistnearbyget) | **GET** /offer/list/nearby | Get all offers near to current location
*OfferApi* | [**offerPut**](doc\/OfferApi.md#offerput) | **PUT** /offer | 
*UserApi* | [**createUser**](doc\/UserApi.md#createuser) | **PUT** /user/create | Create a user
*UserApi* | [**userIdGet**](doc\/UserApi.md#useridget) | **GET** /user/{id} | Get a users public info by id
*UserApi* | [**userMeGet**](doc\/UserApi.md#usermeget) | **GET** /user/me | Get current user


## Documentation For Models

 - [CreateUserRequest](doc\/CreateUserRequest.md)
 - [NotificationPostRequest](doc\/NotificationPostRequest.md)
 - [Offer](doc\/Offer.md)
 - [OfferLocation](doc\/OfferLocation.md)
 - [OfferPutRequest](doc\/OfferPutRequest.md)
 - [UserProfile](doc\/UserProfile.md)


## Documentation For Authorization


## bearerAuth

- **Type**: HTTP Bearer authentication


## Author



