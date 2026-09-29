# Integration tests

Smoke coverage for the full app shell lives in `app_smoke_test.dart`.

## Run

```bash
# Prefer a connected device / simulator (recommended):
flutter test integration_test/app_smoke_test.dart

# Or target a specific device:
flutter test integration_test/app_smoke_test.dart -d <deviceId>
```

## Notes

- The smoke test uses `sqflite_common_ffi` with an in-memory database (same
  approach as `test/widget_test.dart`) so it can run without a seeded on-device DB.
- If `flutter test integration_test/` fails with a missing device / platform
  plugin error, use a simulator/emulator or run the unit + widget suite under
  `test/` instead — those remain the primary CI gate.
