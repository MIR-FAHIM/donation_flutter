import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/api_providers/api_manager.dart';
import 'package:latest_payplus_agent/app/api_providers/api_url.dart';
import 'package:latest_payplus_agent/app/models/buticket_model/coachList_model.dart';
import 'package:latest_payplus_agent/app/models/buticket_model/coach_details_seat_layout_model.dart';
import 'package:latest_payplus_agent/app/models/buticket_model/stationlist_model.dart';




class TicketRepository {
  Future<StationList> getFromLocation() async {
    Map<String, String> header =
    {'token': "FixedTokenForPGWUsingAsCredentialsCanNotBeChanged"} ;

    APIManager _manager = APIManager();
    final response = await _manager.multipartPostAPI(
      ApiClient.busStationList,

      {
      },
      [],

      '',
      header,

    );

    return StationList.fromJson(response);
  }

  Future<CoachListModel> getCoachList(DateTime date, String fromStation, String toStation) async {
    Map<String, String> header =
    {'token': "FixedTokenForPGWUsingAsCredentialsCanNotBeChanged"} ;
    print("date from bus ticket ${date.toString()}");

    Map<String, String> param =
    {
      'date': date.toString().substring(0,10),
      'from_station' : fromStation,
      'to_station': toStation

    } ;

    APIManager _manager = APIManager();
    final response = await _manager.multipartPostAPI(
      ApiClient.coachList,

      param,
      [],

      '',
      header,

    );

    return CoachListModel.fromJson(response);
  }

  Future seatStatus(String seatId, ticketId, triprouteID) async {
    print("seat book status call in repository $seatId -------- $ticketId ------ $triprouteID");
    Map<String, String> header =
    {'token': "FixedTokenForPGWUsingAsCredentialsCanNotBeChanged"} ;

    Map<String, String> param =
    {
      'seat_ids': seatId,
      'provider' : "shohoz",
      'ticket_id': ticketId,
      "trip_route_id": triprouteID,
      "current_selection_status": "0"

    } ;

    APIManager _manager = APIManager();
    final response = await _manager.multipartPostAPI(
      ApiClient.seatStatus,

      param,
      [],

      '',
      header,

    );

    return response;
  }

  Future confirmBookSeat(String ref) async {
    print("seat book method call in repository");
    Map<String, String> header =
    {'token': "FixedTokenForPGWUsingAsCredentialsCanNotBeChanged"} ;

    Map<String, String> param =
    {

      'provider' : "shohoz",
      'reference': ref,



    } ;

    APIManager _manager = APIManager();
    final response = await _manager.multipartPostAPI(
      ApiClient.confirmSeatBook,

      param,
      [],

      '',
      header,

    );

    return response;
  }

  Future bookSeat(
      {
    String? ticketID,
    String? tripID,
    String? tripRouteID,
    String? boardingPointID,
        String? mobile,
        String? passengerFirstName,
        String? lastName,
        String? email,
        String? gender,
  }) async {
    print("seat book method call in repository");
    Map<String, String> header =
    {'token': "FixedTokenForPGWUsingAsCredentialsCanNotBeChanged"} ;

    Map<String, String> param =
    {
      'trip_id': tripID!,
      'trip_route_id' : tripRouteID!,
      'boarding_point_id': boardingPointID!,
      "ticket_ids": ticketID!.toString(),
      "passenger_name": passengerFirstName!,
      "passenger_email": email!,
      "passenger_mobile": mobile!,
      "passenger_age": "30",
      "passenger_gender" : gender!,
      "provider": "shohoz"



    } ;

    APIManager _manager = APIManager();
    final response = await _manager.multipartPostAPI(
      ApiClient.seatBook,

      param,
      [],

      '',
      header,

    );

    return response;
  }

  Future<CoachDetailsSeatLayout> getCoachDetailsSeatLayout({DateTime? date, String? fromStation, String? toStation, String? tripID, String? tripRouteID, }) async {
    Map<String, String> header =
    {'token': "FixedTokenForPGWUsingAsCredentialsCanNotBeChanged"} ;
    print("all body data from getCoachDetailsSeatLayout $tripID, ____ $tripRouteID, ____ $fromStation, ___ $toStation----- ${date.toString()}");
    Map<String, String> param =
    {
      'date': date.toString().substring(0,10),
      'from_station' : fromStation!,
      'to_station': toStation!,
      'provider': "shohoz",
      'trip_id': tripID!,
      'trip_route_id': tripRouteID!,
      'departure_id': "101",

    } ;

    APIManager _manager = APIManager();
    final response = await _manager.multipartPostAPI(
      ApiClient.coachDetailsSeatLayout,

     param,
      [],

      '',
      header,

    );

    return CoachDetailsSeatLayout.fromJson(response);
  }


}