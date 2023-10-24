import 'package:get/get.dart';

import '../controllers/bus_ticket_controller.dart';

class BusTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusTicketController>(
      () => BusTicketController(),
    );
  }
}
