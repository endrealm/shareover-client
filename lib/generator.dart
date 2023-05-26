import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
    additionalProperties:
    AdditionalProperties(pubName: 'shareover_api', pubAuthor: 'EndRealm'),
    inputSpecFile: 'openapi-spec.yaml',
    generatorName: Generator.dart,
    outputDirectory: 'api/shareover_api')
class Example extends OpenapiGeneratorConfig {}