import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:bookmark_manager/src/model/bookmark.dart';

@Component(
    selector: 'bm-form',
    templateUrl: 'bm_form_component.html',
    directives: [coreDirectives, formDirectives])
class BookmarkFormComponent implements OnInit {
  @Input()
  Bookmark bookmark;
  Bookmark editedBookmark;

  final _formDeleteCtrl = StreamController();
  @Output('onDelete')
  Stream get formDelete => _formDeleteCtrl.stream;

  final _formUpdateCtrl = StreamController();
  @Output('onUpdate')
  Stream get formUpdate => _formUpdateCtrl.stream;

  bool submitted = false;

  @override
  Future<void> ngOnInit() async {
    editedBookmark = Bookmark()..update(bookmark);
  }

  void updateBookmark(NgForm form) {
    submitted = true;
    if (form.valid) {
      bookmark
        ..update(editedBookmark)
        ..edit = false;
      _formUpdateCtrl.add(null);
    }
  }

  void removeBookmark() {
    _formDeleteCtrl.add(null);
  }
}
