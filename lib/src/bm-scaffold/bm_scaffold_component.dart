import 'package:angular/angular.dart';
import 'package:bookmark_manager/src/bm-form/bm_form_component.dart';
import 'package:bookmark_manager/src/model/bookmark.dart';
import 'package:bookmark_manager/src/service/bookmark_service.dart';

@Component(
    selector: 'bm-scaffold',
    templateUrl: 'bm_scaffold_component.html',
    directives: [coreDirectives, BookmarkFormComponent],
    providers: [BookmarkService])
class BmScaffoldComponent implements OnInit {
  final BookmarkService _bmService;
  List<Bookmark> bookmarks = [];

  Bookmark editedBookmark;

  BmScaffoldComponent(this._bmService);

  bool isLoading = true;

  @override
  Future<Null> ngOnInit() async {
    bookmarks = await _bmService.getBookmarks();
    isLoading = false;
  }

  void addBookmark() {
    bookmarks.add(Bookmark());
  }

  void editBookmark(int index) {
    bookmarks[index].edit = true;
  }

  void removeBookmark(int index) async {
    var bookmark = bookmarks.removeAt(index);
    await _bmService.removeBookmark(bookmark);
  }

  void updateBookmark(int index) async {
    var bookmark = bookmarks[index];
    if (bookmark.id == null) {
      var resId = await _bmService.addBookmark(bookmark);
      bookmark.id = resId;
    } else {
      await _bmService.updateBookmark(bookmark);
    }
  }
}
