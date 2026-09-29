const createMaterialsTable = '''
CREATE TABLE materials (
  id TEXT PRIMARY KEY NOT NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  quantity REAL NOT NULL,
  image TEXT
);
''';

const createPresetsTable = '''
CREATE TABLE presets (
  id TEXT PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  image TEXT
);
''';

const createPresetMaterialsTable = '''
CREATE TABLE preset_materials (
  id TEXT PRIMARY KEY NOT NULL,
  material_id TEXT NOT NULL,
  preset_id TEXT NOT NULL,
  quantity REAL NOT NULL,
  FOREIGN KEY (material_id) REFERENCES materials (id) ON DELETE CASCADE,
  FOREIGN KEY (preset_id) REFERENCES presets (id) ON DELETE CASCADE
);
''';

const createProductsTable = '''
CREATE TABLE products (
  id TEXT PRIMARY KEY NOT NULL,
  state TEXT NOT NULL,
  preset_id TEXT NOT NULL,
  preset_name TEXT NOT NULL,
  preset_description TEXT NOT NULL,
  customer TEXT NOT NULL,
  updated_at INTEGER NOT NULL
);
''';

const createUsedMaterialsTable = '''
CREATE TABLE used_materials (
  id TEXT PRIMARY KEY NOT NULL,
  product_id TEXT NOT NULL,
  material_id TEXT NOT NULL,
  quantity REAL NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
  FOREIGN KEY (material_id) REFERENCES materials (id) ON DELETE RESTRICT
);
''';

const createUsedMaterialsMaterialIdIndex =
    'CREATE INDEX IF NOT EXISTS idx_used_materials_material_id '
    'ON used_materials (material_id);';

const createUsedMaterialsProductIdIndex =
    'CREATE INDEX IF NOT EXISTS idx_used_materials_product_id '
    'ON used_materials (product_id);';

const createPresetMaterialsPresetIdIndex =
    'CREATE INDEX IF NOT EXISTS idx_preset_materials_preset_id '
    'ON preset_materials (preset_id);';

const createProductsStateUpdatedAtIndex =
    'CREATE INDEX IF NOT EXISTS idx_products_state_updated_at '
    'ON products (state, updated_at);';

const createSchemaStatements = [
  createMaterialsTable,
  createPresetsTable,
  createPresetMaterialsTable,
  createProductsTable,
  createUsedMaterialsTable,
  createUsedMaterialsMaterialIdIndex,
  createUsedMaterialsProductIdIndex,
  createPresetMaterialsPresetIdIndex,
  createProductsStateUpdatedAtIndex,
];
