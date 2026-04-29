# Module 02: Command Line Foundations

## Learning Objective

Become comfortable enough with the terminal to navigate folders, manage files, and run the commands needed throughout this curriculum — without needing to memorise everything.

## Why It Matters for PMs

Every workflow in this curriculum happens in the terminal. You do not need to become a command-line power user. You need to be able to: know where you are, move around, create folders, and run commands confidently. That is genuinely achievable in a single session.

The terminal will feel awkward at first. That is normal. It is a new interface, not a new concept. The commands you will use most often can be counted on two hands.

---

## Concepts Covered

- How the terminal thinks about files and folders (directory structure)
- Essential navigation commands: `pwd`, `ls`, `cd`
- Creating and organising folders: `mkdir`
- Moving and copying files: `mv`, `cp`
- Viewing file contents without opening an app: `cat`
- Running a script
- Reading error messages without panicking
- Using tab-completion to avoid typos
- Command history with the up arrow

---

## How the Terminal Thinks About Files

Your Mac has a file system — a hierarchy of folders containing files. You already know this from Finder. The terminal uses the same structure, just expressed differently.

Instead of clicking through folders in a window, you navigate by typing folder names separated by `/`.

For example, the path to a file on your Desktop might look like:

```
/Users/alex/Desktop/my-document.md
```

This means: start at the root of the hard drive (`/`), go into `Users`, then `alex`, then `Desktop`, and find the file `my-document.md`.

Your "home folder" (the one named after you, where Desktop, Downloads, and Documents live) can be referred to with a shortcut: `~`

So `/Users/alex/Desktop` can also be written as `~/Desktop`.

---

## Essential Commands

### Where am I? — `pwd`

`pwd` stands for "print working directory." It tells you which folder you are currently in.

```bash
pwd
```

Example output:
```
/Users/alex
```

You are in your home folder.

### What is in this folder? — `ls`

`ls` lists the contents of the current folder.

```bash
ls
```

To see more detail (file sizes, dates, hidden files):
```bash
ls -la
```

### Move to a different folder — `cd`

`cd` stands for "change directory." It moves you into a folder.

```bash
cd Desktop
```

To go up one level (back to the parent folder):
```bash
cd ..
```

To go to your home folder from anywhere:
```bash
cd ~
```

To go to a specific path directly:
```bash
cd ~/Documents/my-project
```

**Tip**: Press the `Tab` key after typing a few letters of a folder name and the terminal will complete it for you. This prevents typos and saves time.

### Create a folder — `mkdir`

`mkdir` stands for "make directory." It creates a new folder.

```bash
mkdir my-new-folder
```

To create nested folders in one command (for example, creating `docs/prd/` inside your project):
```bash
mkdir -p docs/prd
```

### View the contents of a file — `cat`

`cat` prints the contents of a file to the terminal. Useful for quickly checking a Markdown file.

```bash
cat README.md
```

### Move or rename a file — `mv`

```bash
mv old-name.md new-name.md
```

Or move a file to a different folder:
```bash
mv my-file.md docs/prd/my-file.md
```

### Copy a file — `cp`

```bash
cp original.md copy.md
```

### Run a script — `bash`

When you need to run a setup script (like the bootstrap for this repo):
```bash
bash bootstrap.sh
```

---

## Tab Completion

This is the single most useful terminal trick. Instead of typing a full folder or file name, type the first few characters and press `Tab`. The terminal will complete the name for you.

If there are multiple matches, press `Tab` twice to see all options.

Example:
```bash
cd Doc    # press Tab
cd Documents/    # terminal completes it
```

This eliminates most typos.

---

## Command History

Press the `↑` (up arrow) key to cycle through previous commands. Press `↓` to go forward. This means you never need to retype a command you have already run.

---

## Reading Error Messages

Error messages in the terminal look alarming but usually contain clear information. Read them from the beginning. Common causes:

| Error message | What it usually means |
|--------------|----------------------|
| `command not found` | The tool is not installed, or the name is misspelled |
| `No such file or directory` | The path you typed does not exist — check spelling |
| `Permission denied` | You do not have access to this file or folder |
| `already exists` | You are trying to create something that already exists |

If you see an error, read it fully before asking for help. The message usually tells you exactly what went wrong.

---

## Practical Exercise

Open Terminal and work through the following steps. Each one builds on the previous.

**Part 1: Navigate**

```bash
pwd                          # where am I?
ls                           # what is here?
cd ~/Desktop                 # go to Desktop
pwd                          # confirm you moved
cd ~                         # go back home
```

**Part 2: Create a folder structure**

```bash
mkdir ~/pm-practice
cd ~/pm-practice
mkdir -p docs/prd docs/bdd docs/summaries
ls docs/                     # verify the folders were created
```

**Part 3: Create a simple file and view it**

```bash
echo "# My First Markdown File" > docs/prd/test.md
cat docs/prd/test.md          # view the contents
```

**Part 4: Move and copy**

```bash
cp docs/prd/test.md docs/bdd/test-copy.md
ls docs/bdd/                 # confirm the copy exists
```

**Part 5: Practice tab completion**

```bash
cd ~/pm-pr    # press Tab here
```

The terminal should complete to `pm-practice/`.

---

## Expected Output

Comfort navigating the file system from the terminal. Ability to create folders, view files, and run simple commands without help. Recognition that error messages are informative, not catastrophic.

---

## Common Mistakes

- **Forgetting which folder you are in** — Run `pwd` whenever you are unsure. It always tells you the truth.

- **Confusing `cd` with `ls`** — `ls` shows you what is in the current folder. `cd` moves you into a folder. You often use them together.

- **Using spaces in folder or file names** — Spaces in names confuse the terminal. Use hyphens (`my-folder`) or underscores (`my_folder`) instead. `My Folder` becomes a headache.

- **Not using tab completion** — Typos in file paths are the most common source of errors. Tab completion prevents almost all of them.

- **Closing the terminal when things go wrong** — Closing and reopening Terminal does not fix most problems. Read the error message first.

---

## Confidence Checklist

- [ ] I can open Terminal and know what `~` means
- [ ] I can use `pwd` to find out where I am
- [ ] I can use `ls` to see what is in the current folder
- [ ] I can use `cd` to move between folders
- [ ] I can use `mkdir` to create a new folder
- [ ] I can use `cat` to view a file's contents
- [ ] I use Tab to complete folder and file names
- [ ] I use the up arrow to recall previous commands
- [ ] I can read an error message without panicking and identify the cause
