# JSON serialization

## Screen event/state (Freezed)

Presentation-layer BLoC inputs and outputs under `lib/screens/**` use
**Freezed** (`freezed_annotation` + `freezed` codegen) — not
`json_serializable`. Each screen keeps `*_event.dart` / `*_state.dart` with a
matching `*.freezed.dart` part file. After editing annotated sources, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Do not hand-edit `*.freezed.dart`. See [architecture.md](../architecture.md)
(core rules) and [project-structure.md](../project-structure.md).

## Remote DTOs (JSON)

HTTP / remote DTOs use `json_annotation` + `json_serializable` in the **repo**
(or dedicated DTO) layer. Persistence stays DAO-based: DAOs return **domain**
entities; repository impls map DTO ↔ domain (and DAO ↔ domain).

```dart
@JsonSerializable(fieldRename: FieldRename.snake)
class UserDto {
  final String firstName;
  final String lastName;
  UserDto({required this.firstName, required this.lastName});
  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
```

- Prefer `fieldRename: FieldRename.snake` when the API uses snake_case keys.
- After changing annotated files, run the project codegen rule
  (typically `dart run build_runner build --delete-conflicting-outputs`).
- Do not put `json_serializable` types in `db/daos/` or replace DAOs with
  generated JSON models.
