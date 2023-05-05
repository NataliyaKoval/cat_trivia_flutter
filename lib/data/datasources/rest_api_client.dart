import 'package:cat_trivia/data/entity/fact_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// flutter pub run build_runner build
part 'rest_api_client.g.dart';

@RestApi(baseUrl: 'https://cat-fact.herokuapp.com')
abstract class RestApiClient {
  factory RestApiClient(Dio dio) = _RestApiClient;

  @GET('/facts/random')
  Future<FactEntity> getRandomFact();
}