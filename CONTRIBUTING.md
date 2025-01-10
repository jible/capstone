# STYLE GUIDELINES
- Sources (including AI conversations) are cited in-line when used (ex: `## src = link`).
  - When using generative AI, code is not copied, but instead rewritten and tested before commiting.
- Branches are sorted via their author and  (ex: first-name:branch-name).
- Major commits are tagged when pushed to main as 'version-update'.
  - Changes made inbetween each version are listed in the CHANGELOG.md file.
  - _Nothing_ is commited to main if it is not fully functional and without major bugs.
- To ensure bugs are caught early, the assert function is used frequently throughout each program (ex: num_enemies >= 0 and num_enemies < 25)
- Coding style is built off of GDScript's [official style guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html).

| Type | Convention | Example |
| ---- | ---------- | ------- |
| File names | snake_case | yaml_parser.gd |
| Class names | PascalCase | class_name YAMLParser |
| Node names | PascalCase | Camera3D, Player |
| Functions | snake_case | func load_level(): |
| Variables | snake_case | var particle_effect |
| Signals | snake_case | signal door_opened |
| Constants | CONSTANT_CASE | const MAX_SPEED = 200 |
| Enum names | PascalCase | enum Element |
| Enum members | CONSTANT_CASE | {EARTH, WATER, AIR, FIRE} |
