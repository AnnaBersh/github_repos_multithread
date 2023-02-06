abstract class BaseNetworkResponse {
  final bool isSuccess;
  final String? error;

  BaseNetworkResponse({required this.isSuccess, this.error});
}
