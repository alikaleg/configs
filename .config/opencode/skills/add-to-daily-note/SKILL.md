---
name: add-to-daily-note
description: Use when the user wants to add a something to today's Obsidian daily note, create today's daily note if it does not exist
---

# Obsidian Add to Daily Note

## When to Use

- The user mentions Obsidian, daily notes, today's note, or daily todo.

Do not use this skill for generic Markdown todo edits outside an Obsidian vault.

## Workflow

### 1. Find the vault

my vault is in here `~/obsidian/`

If more vault not found, you MUST ask the user which vault to use.
Do not auto-select a vault, even if one candidate looks more likely.

### 2. Read daily note settings

Inspect these files when present:

- `.obsidian/daily-notes.json`
- `.obsidian/core-plugins.json`
- `.obsidian/community-plugins.json`

Use `daily-notes.json` to determine:

- daily note folder
- template file
- date format, if present

Important defaults from Obsidian docs:

- Daily Notes creates today's note if it does not exist.
- Default file name format is `YYYY-MM-DD`.
- The daily note location can be changed by plugin settings.
- The date format can generate nested paths such as `YYYY/MMMM/YYYY-MMM-DD`.

If `daily-notes.json` is missing or incomplete:

- default folder to vault root
- default file name to `YYYY-MM-DD.md`

If no explicit date format is stored, inspect recent files in the configured daily note folder and infer the naming pattern when it is obvious. Otherwise fall back to `YYYY-MM-DD.md`.

### 3. Create today's daily note if missing

Compute today's note path from:

- vault root
- configured daily note folder, if any
- resolved date-based file name

Create parent directories if the date format implies nested folders.

If the note does not exist:

- If a template file is configured, initialize the note from that template.
- Replace simple core-template tokens of the form `{{date:FORMAT}}` with today's date rendered in that format.
- If the template cannot be safely resolved, fall back to a minimal structure:

```markdown
# 2026-03-13

## Tasks

```

Do not overwrite an existing daily note.

### 4. Insert the task in the right section

Add text to the end of note

## Quick Reference

```bash
# Check daily note settings
sed -n '1,200p' <vault>/.obsidian/daily-notes.json
```

## Safety Rules

- Never write outside the selected vault.
- Never overwrite an existing daily note or file when the goal is to append a todo.
- If editing outside the current writable workspace requires permission, request it before writing.

## Common Mistakes

- Writing to a vault-like directory that does not actually contain `.obsidian/`.
- Ignoring `daily-notes.json` and hardcoding `Daily/YYYY-MM-DD.md`.
- Appending escaped date text that does not match Obsidian Tasks syntax.
- Replacing the whole daily note when only one task should be added.

