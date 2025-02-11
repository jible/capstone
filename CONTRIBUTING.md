# CODE STYLE

- Sources (including AI conversations) are cited in-line when used (ex: `## src = link`).
  - When using generative AI, code is not copied, but instead rewritten and tested before commiting.
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

# COMMITS AND PULL REQUESTS

Nothing should be commited directly into main.

All commits should be made on branches with the following format:
`firstname-planned-changes`

When you're making a commit, your commit title should be easily readable and a decent reflection of the changes that have been made. In the case of a large commit, the description box should be used to give more detail into what has been changed and why.

commit: `added enemy to scene`

description: `enemy sprite is 240x240 but hit box is circular and slightly smaller: 220x220`

When you've made your changes and are ready to make your pull request, check what the most recent version was named and incrament the decimal by one. As we are still in pre-production, the version should always start with 0.

pull request title: `version 0.XX`

description: `added enemy to scene, altered player controls to fit new design, added temporary visuals to indicate damage taken`

Your pull request should include a change to the CHANGELOG.md file like so:

```
## verson 0.XX

- Added enemy
- Hitbox updates
- Added m1 attack option
- Added death state to player
- Custom camera fixes
```

All pull requests should have reviewers. 

If changes are being made to the code-base, add James (programming lead), Jack (production lead) and Rozy (design lead) as reviewers. If you're impacting a part of the code that overlaps with anyone elses role, add them as well. For instance, anything that involves changes to UI should be reviewed by Phoebe and/or Jackson. Any changes to audio should be reviewed by Jack and/or Carter. Anything that would impact balance should go through Carter. Use your best judgement here.

> 📑 markdown file specifications
>
> If changes are being made to markdown files (aside from CHANGELOG.md), add Jack and Rozy as reviewers. If changes are being made to markdown files **only**, the version number does not need to be incramented. Do not add markdown changes to `CHANGELOG.md` and name the pull request according to how the markdown files are being updated.

**Nothing should be pushed to main without approval from the at least half of reviewers.**

Here's an example of what this workflow looks like:

https://youtu.be/GQdR1RUy6bI

*The video does not include the change to the CHANGELOG.md.*

## Conflicting Versions

In the case that multiple pull requests are open at the same time, choose which to push first. Once you've done that, update the other open PR title(s) to the appropriate version number. Update the branch if there are now conflicts. *There should always be a conflict in the `CHANGELOG.md` file. Update the section headings appropriately.*

# GITHUB ISSUES

## Creating a new Issue

- Ensure the issue to be made is also in the project [timeline spreadsheet](https://docs.google.com/spreadsheets/d/1dZAdF-VlB1Vsa7J4WZNaotAaQ00rfg6UreA8IbdnRlg/edit?gid=891834841#gid=891834841)
- In the [repo](https://github.com/jible/capstone), create a new issue
  - Include a title and description of what needs to be done to close the issue, using task list format
	- Task list format: `- [ ] your text here`
  - Assign people to the issue
  - Assign tags to the issue

## Closing an Issue

- Include a link to a commit when closing an issue
- Leave any relevant comments needed
