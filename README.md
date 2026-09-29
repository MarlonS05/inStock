# inStock

Mobile inventory app for tracking materials, defining product recipes, and
building on a workbench that reserves stock until a product is finished.

## Features

- Materials inventory
- Custom presets (bill of materials)
- Availability checking before you build
- Workbench with reservation → subtract-on-finish flow
- Cocktail-named color themes
- Multi-language UI (English, German)
- Inspirational quote of the day on the home screen

See [docs/product-overview.md](docs/product-overview.md) for purpose, terminology,
and implementation status.

## Development

```bash
flutter analyze
flutter test
```

Architecture and agent rules: [docs/architecture.md](docs/architecture.md),
[AGENTS.md](AGENTS.md).
