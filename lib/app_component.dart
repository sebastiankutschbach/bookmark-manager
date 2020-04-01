import 'package:angular/angular.dart';
import 'package:bookmark_manager/src/bm-scaffold/bm_scaffold_component.dart';

@Component(
    selector: 'my-app',
    styleUrls: [
      'app_component.css',
    ],
    templateUrl: 'app_component.html',
    directives: [BmScaffoldComponent],
    providers: [])
class AppComponent {}
