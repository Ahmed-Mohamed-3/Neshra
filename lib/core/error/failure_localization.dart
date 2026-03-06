import 'package:easy_localization/easy_localization.dart';
import 'package:neshra/core/error/failure.dart';

extension FailureL10n on Failure {
  String trMessage() {
    return switch (this) {
      NoInternetFailure() => 'errors.no_internet'.tr(),
      TimeoutFailure() => 'errors.timeout'.tr(),
      NotFoundFailure() => 'errors.not_found'.tr(),
      ServerFailure(:final statusCode) => 'errors.server_with_code'.tr(
        namedArgs: {'code': (statusCode ?? 0).toString()},
      ),
      UnknownFailure() => 'errors.unknown'.tr(),
    };
  }
}
