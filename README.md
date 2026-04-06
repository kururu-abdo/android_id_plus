# android_id_plus

A highly reliable Flutter plugin to securely fetch the unique `ANDROID_ID` without depending on deprecated libraries.

## Usage

```dart
import 'package:android_id_plus/android_id_plus.dart';

void fetchId() async {
  String? deviceId = await AndroidIdPlus.androidId;
  print('Device ID: $deviceId');
}
```markdown
## 0.0.1
* Initial release: Added support for fetching stable Android ID.# android_id_plus
