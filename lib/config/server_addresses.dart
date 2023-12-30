class ServerAddresses {

  ServerAddresses._privateConstructor();
  static final ServerAddresses _instance = ServerAddresses._privateConstructor();
  static ServerAddresses get instance => _instance;

  static const _baseUrl = "https://apitest.smartsoft-bd.com";
  static const _userLogin = "/api/login";

  static get baseUrl => _baseUrl;
  static get userLogin => _userLogin;
}