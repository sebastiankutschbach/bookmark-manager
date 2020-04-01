class FirebaseConfig {
  final String apiKey;
  final String authDomain;
  final String databaseURL;
  final String projectId;
  final String storageBucket;
  final String messagingSenderId;

  FirebaseConfig(
      {this.apiKey,
      this.authDomain,
      this.databaseURL,
      this.projectId,
      this.storageBucket,
      this.messagingSenderId});
}
