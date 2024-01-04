import 'package:aircharge/app/core/constants/urls.dart';
import 'package:aircharge/app/data/network/api_controller.dart';
import 'package:aircharge/app/data/response_dto/find_charges_response.dart';

class ApiRepostory{
   final ApiControllerV1 apiControllerV1;

  ApiRepostory({required this.apiControllerV1});


  
  //MARK: findChargesLoctionsList
  Future<FindChargesResponceDto> findChargesLoctionsList(
      {String? type}) async {
    final response = await apiControllerV1.get(
        path:  ApiEndPoints.findChargesLoctionsList);
    return FindChargesResponceDto.fromJson(response);
  }

   
}