//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationPostRequest {
  /// Returns a new [NotificationPostRequest] instance.
  NotificationPostRequest({
    this.range,
    this.categories = const [],
  });

  /// Range in meters to receive notifications from home
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? range;

  List<String> categories;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NotificationPostRequest &&
     other.range == range &&
     other.categories == categories;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (range == null ? 0 : range!.hashCode) +
    (categories.hashCode);

  @override
  String toString() => 'NotificationPostRequest[range=$range, categories=$categories]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.range != null) {
      json[r'range'] = this.range;
    } else {
      json[r'range'] = null;
    }
      json[r'categories'] = this.categories;
    return json;
  }

  /// Returns a new [NotificationPostRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationPostRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "NotificationPostRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "NotificationPostRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NotificationPostRequest(
        range: mapValueOfType<int>(json, r'range'),
        categories: json[r'categories'] is List
            ? (json[r'categories'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<NotificationPostRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NotificationPostRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationPostRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationPostRequest> mapFromJson(dynamic json) {
    final map = <String, NotificationPostRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationPostRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationPostRequest-objects as value to a dart map
  static Map<String, List<NotificationPostRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NotificationPostRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationPostRequest.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

