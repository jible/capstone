# STYLE GUIDELINES

- Sources (including AI conversations) are cited in-line when used (ex: `## src = link`).
  - When using generative AI, code is not copied, but instead rewritten and tested before commiting.
- Branches are sorted via their author and (ex: first-name:branch-name).
- Major commits are labelled with their version number and tagged `version-update`.
  - Changes made inbetween each version are listed in the CHANGELOG.md file.
  - _Nothing_ is commited to main if it is not fully functional and without major bugs.
  - Changes made to markdown files can be made directly in the main branch.
- To ensure bugs are caught early, the assert function is used frequently throughout each program (ex: num_enemies >= 0 and num_enemies < 25)
- Coding style is built off of GDScript's [official style guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html).

| Type         | Convention    | Example                   |
| ------------ | ------------- | ------------------------- |
| File names   | snake_case    | yaml_parser.gd            |
| Class names  | PascalCase    | class_name YAMLParser     |
| Node names   | PascalCase    | Camera3D, Player          |
| Functions    | snake_case    | func load_level():        |
| Variables    | snake_case    | var particle_effect       |
| Signals      | snake_case    | signal door_opened        |
| Constants    | CONSTANT_CASE | const MAX_SPEED = 200     |
| Enum names   | PascalCase    | enum Element              |
| Enum members | CONSTANT_CASE | {EARTH, WATER, AIR, FIRE} |

## How to make tag a version update commit

- The merge commit should be contain 'version' and the version number (ex. version x.x).
- The merge commit should be tagged `version-update`.
  - [Here](https://docs.github.com/en/desktop/managing-commits/managing-tags-in-github-desktop) is a guide to tagging commits.
- The commit details should contain updates made, and those updates should be listed in CHANGELOG.md as bullet points under their relevant header.

## Github Issues Guide

### Creating a new Issue

- Ensure the issue to be made is also in the project [timeline spreadsheet](https://docs.google.com/spreadsheets/d/1dZAdF-VlB1Vsa7J4WZNaotAaQ00rfg6UreA8IbdnRlg/edit?gid=891834841#gid=891834841)
- In the [repo](https://github.com/jible/capstone), create a new issue
  - Include a title and description of what needs to be done to close the issue, using task list format
    - Task list format: `- [ ] your text here`
  - Assign people to the issue
  - Assign tags to the issue

### Closing an Issue

- Include a link to a commit when closing an issue
- Leave any relevant comments needed
