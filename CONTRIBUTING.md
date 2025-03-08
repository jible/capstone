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

When you've made your changes and are ready to make your pull request, check what the most recent version was named and increment the decimal by one. As we are still in pre-production, the version should always start with 0.

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

Keep in mind, there is an empty line between the header and the list, there is a single space between the hyphen and the content of the sentence, the first letter of each list item is capitalized, and there is no period at the end of each sentence.

## Adding Reviewers

All pull requests should have reviewers. 

If changes are being made to the code-base, add James (programming lead), Jack (production lead) and Rozy (design lead) as reviewers. If you're impacting a part of the code that overlaps with anyone elses role, add them as well. For instance, anything that involves changes to UI should be reviewed by Phoebe and/or Jackson. Any changes to audio should be reviewed by Jack and/or Carter. Anything that would impact balance should go through Carter. Use your best judgement here.

> [!IMPORTANT]
>
> If changes are being made to markdown files (aside from CHANGELOG.md) **only**, add Jack, Carter and Rozy as reviewers. If changes are being made to markdown files **only**, the version number does not need to be incremented. Do not add markdown changes to `CHANGELOG.md` and name the pull request according to how the markdown files are being updated.

**Nothing should be pushed to main without approval from the at least half of reviewers.**

Here's an example of what this workflow looks like:

https://youtu.be/GQdR1RUy6bI

*The video does not include the change to the CHANGELOG.md.*

> [!TIP]
>
> CONFLICTING VERSIONS
> In the case that multiple pull requests are open at the same time, choose which to push first. Once you've done that, update the other open PR title(s) to the appropriate version number. Update the branch if there are now conflicts. *There should always be a conflict in the `CHANGELOG.md` file. Update the section headings appropriately.*

## What am I looking for when I review a pull request?

When you notice a problem or something that needs editing: start a review, add your comments, and make sure that you've marked the review with "request changes". The pull request should not be merged while these have gone unaddressed.

- ***Why are these changes here?*** For example, you might be looking at a pull request labeled in relation to enemy movement and see spacing changes, comments, or minor changes in an unrelated file. These should be noted in the changelog or moved to a seperate pull request.
- ***Why were these changes made?*** Sometimes, changes are made unintentionally, or should not actually make it into the game. For instance, if a file is created automatically or changed without intention by the creator, those changes should be discarded.
- ***Would this be immediately readable by someone not deeply familiar with the code-base?*** Pay attention to variable names, code comments, magic numbers, etc. Code should be written with the ability of future contributers to involve themselves in mind.
- ***What small improvements can I make in browser?*** If there are spacing issues, unclear comments, etc. you should feel free to make those edits yourself (if you have the time and ability).

For more information on how to take advantage of all of Git's PR capabilities, please reference [this page](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/reviewing-proposed-changes-in-a-pull-request).
