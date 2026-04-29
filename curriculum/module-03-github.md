# Module 03: GitHub and Repo Basics for PMs

## Learning Objective

Understand what a Git repository is, and be able to perform the four operations that matter most for PMs: clone, pull, edit, and push.

## Why It Matters for PMs

GitHub is where this playbook lives. It is where your team's product context will live. You need to be able to get the latest version of a repository, make changes, and contribute them back. These four operations cover 90% of what a PM needs to do with Git on a day-to-day basis.

You do not need to understand branching strategies, rebasing, conflict resolution, or CI/CD pipelines. Those are engineering concerns. This module covers the minimum viable Git literacy for a Product Manager working with AI-assisted workflows.

---

## Concepts Covered

- What a repository is
- The relationship between your local copy and the remote (GitHub)
- Cloning a repository to your machine
- Pulling to get the latest changes
- Staging and committing changes
- Pushing changes back to GitHub
- Reading a basic `git status`
- What to do when something goes wrong

---

## What Is a Repository?

A repository (repo) is a folder whose contents are tracked by Git. Every change to every file inside it is recorded: what changed, when, and who changed it.

You can think of a repository as a Google Doc with an infinitely detailed, queryable version history — except it works for any number of files simultaneously, and AI agents can read it directly.

This playbook is a repository. Your product project will be a repository. Your team's shared context will be a repository.

---

## Local vs Remote

When you work with a Git repository, you always have two copies:

**Remote**: The version stored on GitHub (github.com). This is the shared, authoritative copy that everyone accesses.

**Local**: The copy on your own machine. This is where you make changes.

Your workflow will be:
1. **Clone** — download a copy of the remote repo to your machine (done once)
2. **Pull** — get the latest changes from the remote into your local copy
3. **Edit** — make changes to your local files
4. **Stage + Commit** — record those changes in your local Git history
5. **Push** — send your committed changes back to the remote so others can see them

---

## Step 1: Clone a Repository

Cloning downloads a repository from GitHub to your machine.

First, find the repository URL on GitHub. It looks like:
```
https://github.com/your-org/your-repo.git
```

On the GitHub page for a repo, click the green **Code** button, then copy the HTTPS URL.

Then in Terminal:
```bash
cd ~/Documents            # go somewhere sensible first
git clone https://github.com/your-org/your-repo.git
```

This creates a folder named after the repository in your current location. Navigate into it:
```bash
cd your-repo
```

To clone this playbook specifically:
```bash
git clone https://github.com/Alex-862/claude-pm-playbook.git
cd claude-pm-playbook
```

---

## Step 2: Pull the Latest Changes

Before you start working, always pull to make sure you have the latest version:

```bash
git pull
```

This fetches any changes made by your teammates (or any updates to the playbook) and merges them into your local copy.

If you see "Already up to date." — great, you have the latest version. If you see a list of changed files — those updates have been applied to your local copy.

**Make pulling a habit**: do it at the start of every work session.

---

## Step 3: Check What Has Changed — `git status`

At any point, you can ask Git what state your working folder is in:

```bash
git status
```

This will show you:
- Files you have changed but not yet committed
- Files you have created but not yet tracked
- Whether your local copy is ahead of or behind the remote

Learning to read `git status` is one of the most useful Git skills. It is always honest, and it always tells you what to do next.

Example output:
```
On branch main
Changes not staged for commit:
  modified:   docs/prd/my-feature.md

Untracked files:
  docs/bdd/my-feature.feature
```

This means: you modified one file and created a new one. Neither has been committed yet.

---

## Step 4: Stage Your Changes

Staging is how you tell Git "I want to include this change in my next commit."

To stage a specific file:
```bash
git add docs/prd/my-feature.md
```

To stage all changed files at once:
```bash
git add .
```

The `.` means "everything in the current folder and below." Use this carefully — make sure you only have changes you intend to commit.

---

## Step 5: Commit Your Changes

A commit is a saved checkpoint in your Git history. Every commit should have a short, meaningful message describing what changed.

```bash
git commit -m "Add initial PRD for payment limits feature"
```

Good commit messages are short, present-tense, and specific. They answer the question "What does this commit do?"

- Good: `Add BDD scenarios for address update flow`
- Good: `Update payment limits PRD with compliance constraints`
- Not useful: `changes` or `update` or `WIP`

After committing, your changes are saved in your local history. They are not yet on GitHub.

---

## Step 6: Push Your Changes

Pushing sends your committed changes to the remote repository on GitHub:

```bash
git push
```

If this is the first time pushing a new branch, you may need:
```bash
git push --set-upstream origin main
```

After pushing, your changes are visible on GitHub to anyone with access.

---

## The Complete Workflow in Order

```bash
git pull                          # get latest before you start
# ... make your edits in the files ...
git status                        # check what changed
git add docs/prd/my-feature.md   # stage the changes
git commit -m "Add feature PRD"   # commit with a message
git push                          # send to GitHub
```

Repeat this loop whenever you make a meaningful set of changes.

---

## Branches: A Brief Note

You may hear engineers talk about branches. A branch is a parallel version of the repository where you can make changes without affecting the main version.

For most PM workflows in this curriculum, you will work on the `main` branch directly. As your team matures, you may adopt a branch-per-feature workflow — but that is not a requirement at this stage.

If you want to check which branch you are on:
```bash
git branch
```

The branch with a `*` beside it is your current branch.

---

## What GitHub.com Shows You

Beyond storing your files, GitHub's website gives you:

- **Commit history**: Every change ever made, with messages and dates
- **File viewer**: Browse files without opening Terminal
- **Blame view**: See who last changed each line of a file and when
- **Pull Requests**: A way to propose changes and get review before merging
- **Issues**: A simple ticketing system (your team may use Jira instead)
- **Actions**: Automated workflows (engineering territory for now)

For PMs, the commit history and file viewer are the most immediately useful.

---

## Practical Exercise

**Part 1: Clone the playbook**

```bash
cd ~/Documents
git clone https://github.com/Alex-862/claude-pm-playbook.git
cd claude-pm-playbook
ls
```

Explore the folder structure. Open some files in a text editor.

**Part 2: Pull and check status**

```bash
git pull
git status
```

Confirm you are up to date.

**Part 3: Make a small edit and commit it**

Create a new file in the appropriate folder:

```bash
echo "# Test Artefact" > docs/prd/my-test.md
git status                          # observe the untracked file
git add docs/prd/my-test.md
git status                          # observe it is now staged
git commit -m "Add test PRD file"
git status                          # observe clean state
```

> **Note**: Do not push this to the shared playbook repo — this is just a local practice exercise. Delete the file afterwards with `rm docs/prd/my-test.md` and a cleanup commit if you want to tidy up.

**Part 4: Read the commit history**

```bash
git log --oneline
```

This shows recent commits in a compact format. Read the messages and dates to get a sense of how the repo has evolved.

---

## Expected Output

The ability to clone a repository, pull the latest changes, make a file edit, stage it, commit it, and push it. Comfort reading `git status` to understand the current state of your working folder.

---

## Common Mistakes

- **Not pulling before making changes** — If two people edit the same file without pulling first, you get a conflict. Always pull first.

- **Committing everything with `git add .` without checking** — Use `git status` first to confirm you only have the changes you intend to commit.

- **Vague commit messages** — `updated stuff` tells no one anything. Write messages you would be happy to read six months later.

- **Pushing directly to main on a shared team repo** — On team repositories, check whether there is a convention about using branches and pull requests. When in doubt, ask an engineer.

- **Confusing clone (one-time) with pull (ongoing)** — You clone once. You pull every time you want the latest changes.

---

## Confidence Checklist

- [ ] I can explain the difference between local and remote
- [ ] I can clone a repository from GitHub
- [ ] I run `git pull` at the start of every work session
- [ ] I can use `git status` to understand the current state
- [ ] I can stage specific files with `git add`
- [ ] I can write a meaningful commit message
- [ ] I can push committed changes to GitHub
- [ ] I have completed the clone-edit-commit exercise
