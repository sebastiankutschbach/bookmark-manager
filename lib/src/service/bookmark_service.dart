import 'package:angular/core.dart';
import 'package:bookmark_manager/src/credentials.dart';
import 'package:bookmark_manager/src/model/bookmark.dart';

import 'package:firebase/firebase.dart';

@Injectable()
class BookmarkService {
  Database _db;
  DatabaseReference _ref;

  BookmarkService() {
    initializeApp(
      apiKey: firebaseConfiguration.apiKey,
      authDomain: firebaseConfiguration.authDomain,
      databaseURL: firebaseConfiguration.databaseURL,
      projectId: firebaseConfiguration.projectId,
      storageBucket: firebaseConfiguration.storageBucket,
      messagingSenderId: firebaseConfiguration.messagingSenderId,
    );

    _db = database();
    _ref = _db.ref('bookmarks');
  }

  Future<List> getBookmarks() async {
    List<Bookmark> bookmarks = [];
    final queryEvent = await _ref.once('value');
    final snapshot = queryEvent.snapshot;

    final bmData = snapshot.val();
    bmData.forEach((key, value) {
      var details = value as Map<String, dynamic>;
      details['id'] = key;
      bookmarks.add(Bookmark.fromJson(details));
    });

    return bookmarks;
  }

  Future<String> addBookmark(Bookmark bookmark) async {
    var res = await _ref.push(bookmark.asMap());
    return res.key;
  }

  Future updateBookmark(Bookmark bookmark) async {
    return await _ref.child(bookmark.id).set(bookmark.asMap());
  }

  Future removeBookmark(Bookmark bookmark) async {
    return await _ref.child(bookmark.id).remove();
  }
}
