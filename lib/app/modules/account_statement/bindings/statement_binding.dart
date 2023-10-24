import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/account_statement/controllers/statement_controller.dart';

class StatementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountStatementController>(
      () => AccountStatementController(),
    );
  }
}
