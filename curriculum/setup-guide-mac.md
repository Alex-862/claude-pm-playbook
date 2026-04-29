# Setup Guide for Mac — Non-Technical PMs

**This guide is written for Product Managers who have never used the terminal before. Every step is explained. Nothing is assumed.**

If you have already completed the setup in Module 01, this is the same content in a more reassuring format. Use whichever you prefer.

---

## Before You Start

You will need:
- A Mac (any recent MacBook)
- Admin access to install software (if your Mac is managed by IT, check whether you can install via Homebrew, or ask IT to do the Homebrew and Git steps)
- A GitHub account (you will create one during this guide)
- Claude Code credentials (your organisation should provide these — ask your manager or champion)
- About 60–90 minutes for the first-time setup

---

## Part 1: Understanding the Tools

### What Is the Terminal?

The Terminal is a text-based way of giving instructions to your Mac. Instead of clicking on icons, you type commands.

It looks more intimidating than it is. Every command in this guide is given to you exactly as you should type it (or paste it). You do not need to memorise anything.

**How to open Terminal:**
1. Press `Command + Space` on your keyboard (the magnifying glass search opens)
2. Type: `Terminal`
3. Press `Enter`

A window will open with text that looks something like:
```
alex@MacBook-Pro ~ %
```

This is your prompt. The Mac is waiting for you to type something. The `~` tells you that you are in your home folder (the one named after you, where your Desktop and Documents live).

**Important**: When you make a mistake in the terminal (and you will, everyone does), nothing catastrophic happens. If a command fails, you will get an error message that tells you what went wrong. Close the terminal and reopen it if you are ever completely stuck — it resets to a clean state.

---

### What Is Homebrew?

Homebrew is a tool that installs other tools for you.

Instead of going to a website, downloading something, clicking through an installer wizard, and hoping it ends up in the right place — you type one command and Homebrew handles everything.

Developers use it universally on Macs. You will use it to install Git and Claude Code.

---

### What Is Git?

Git is software that tracks changes to files over time.

Think of it as a supercharged version history. In Google Docs, you can see who changed what — but it is limited to one document at a time, and the history is hard to search. Git tracks changes across hundreds of files simultaneously, lets you write a note explaining each change, and makes the full history searchable.

Git runs on your Mac. It does not require internet access to track changes on your machine.

---

### What Is GitHub?

GitHub is a website that stores Git repositories online so teams can share them.

- **Git** is the tool on your computer
- **GitHub** is the website where your team's shared files live

The playbook you are about to use lives on GitHub. You will download it to your Mac, use it, and (optionally) contribute changes back.

---

### What Is Claude Code?

Claude Code is an AI assistant that runs in your terminal and can read the files in your project.

This is different from Claude.ai (the website) or Gemini in important ways:
- It reads your actual files — documents, specs, templates
- It can run structured workflows (called skills) on your behalf
- It saves its outputs back into your project files as Markdown documents
- Everything it produces is version-controlled

You are not just having a conversation — you are running a structured, repeatable workflow inside your knowledge base.

---

## Part 2: Installation

Work through these steps in order. Do not skip ahead.

---

### Step 1: Install Homebrew

Open Terminal (Command + Space, type Terminal, press Enter).

Copy the entire command below and paste it into Terminal. Then press Enter.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**What will happen:**
- Your Mac will ask for your password. Type it and press Enter. (Nothing appears as you type — this is normal and intentional.)
- The installation will run for a few minutes, showing output as it goes.
- At the end, it may show you two additional commands to run. If it does, run them exactly as shown.

**How to check it worked:**
```bash
brew --version
```

You should see something like `Homebrew 4.x.x`. If you see an error instead, stop here and ask your champion for help.

---

### Step 2: Install Git

```bash
brew install git
```

**How to check it worked:**
```bash
git --version
```

You should see something like `git version 2.x.x`.

---

### Step 3: Tell Git Who You Are

Git records who makes each change. Tell it your name and work email:

```bash
git config --global user.name "Your Name"
```

Replace `Your Name` with your actual name (keep the quotation marks).

```bash
git config --global user.email "your.email@company.com"
```

Replace `your.email@company.com` with your work email address.

**Check it worked:**
```bash
git config user.name
git config user.email
```

Both should show what you just entered.

---

### Step 4: Create a GitHub Account

1. Open a web browser and go to [github.com](https://github.com)
2. Click **Sign up**
3. Use your work email address
4. Choose a username (your name or initials are fine)
5. Complete email verification

> **Enterprise note**: Your organisation may have GitHub Enterprise. Check with your engineering team whether you should be using github.com or a company-specific URL, and whether to use Single Sign-On.

---

### Step 5: Install Node.js (needed for Claude Code)

```bash
brew install node
```

**Check it worked:**
```bash
node --version
```

You should see a version number like `v20.x.x`.

---

### Step 6: Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

**Check it worked:**
```bash
claude --version
```

You should see a version number.

---

### Step 7: Log In to Claude Code

```bash
claude
```

The first time you run this, it will ask you to authenticate. Follow the on-screen prompts.

> **Enterprise note**: Your organisation may provide a specific API key or SSO login method for Claude Code. Use only the enterprise-approved credentials — do not use a personal Anthropic account for work tasks.

---

### Step 8: Install Visual Studio Code (Recommended)

VS Code is a free text editor that makes working with Markdown files much more comfortable. It shows you a formatted preview of your documents.

```bash
brew install --cask visual-studio-code
```

To open a file in VS Code from Terminal:
```bash
code my-file.md
```

To open the current folder in VS Code:
```bash
code .
```

---

## Part 3: Getting the Playbook

### Download (Clone) the Playbook Repository

Navigate to your Documents folder and download the playbook:

```bash
cd ~/Documents
git clone https://github.com/Alex-862/claude-pm-playbook.git
```

This creates a folder called `claude-pm-playbook` in your Documents folder. Navigate into it:

```bash
cd claude-pm-playbook
```

Have a look at what is inside:
```bash
ls
```

---

### Get the Latest Version (Pull)

Before you use the playbook each time, get the latest version:

```bash
git pull
```

If it says "Already up to date" — you have the latest version.

---

### Make a Simple Edit

Open the playbook folder in VS Code:
```bash
code .
```

In VS Code, find the `templates/CLAUDE.md` file and open it. Read it. This is the starter template for your project context file.

---

## Part 4: Your First Session with Claude Code

Navigate to a project folder (or create one for practice):

```bash
mkdir ~/Documents/my-pm-project
cd ~/Documents/my-pm-project
```

Copy the CLAUDE.md template:
```bash
cp ~/Documents/claude-pm-playbook/templates/CLAUDE.md ./CLAUDE.md
```

Start Claude Code:
```bash
claude
```

Type `/help` to see the available skills.

Type `exit` or press `Control + C` to exit Claude Code.

---

## Troubleshooting

### "brew: command not found"

Homebrew was installed but not added to your PATH. Run:
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Then close and reopen Terminal.

### "git: command not found"

Git is not installed yet, or the PATH is not set correctly. Try closing Terminal, reopening it, and running `brew install git` again.

### "claude: command not found"

Claude Code is not installed or the PATH needs updating. Run:
```bash
npm install -g @anthropic-ai/claude-code
```

If npm itself is not found, install Node.js first: `brew install node`.

### "Permission denied"

You may not have admin access. Contact your IT team and ask them to install Homebrew, Git, and Node.js, or ask them to grant you local admin rights for software installation.

### Terminal shows strange characters or garbled text

Your terminal font or encoding may be set incorrectly. In Terminal, go to Terminal > Preferences > Profiles and set the encoding to Unicode (UTF-8).

### I closed Terminal and now nothing works

Most things should still work after reopening Terminal. Run `brew --version` — if that works, everything should be fine. If it does not, run the PATH fix above.

### I don't know where I am

```bash
pwd
```

This always tells you exactly which folder you are in.

---

## Quick Reference

| Command | What it does |
|---------|-------------|
| `pwd` | Show current folder |
| `ls` | List contents of current folder |
| `cd folder-name` | Move into a folder |
| `cd ..` | Go up one folder |
| `cd ~` | Go to home folder |
| `git pull` | Get latest changes from GitHub |
| `git status` | See what has changed |
| `git add file.md` | Stage a file for commit |
| `git commit -m "message"` | Save a checkpoint with a message |
| `git push` | Send your commits to GitHub |
| `claude` | Start Claude Code |
| `code .` | Open current folder in VS Code |

---

## You Are Ready

If all of these return a version number without errors, your machine is ready:

```bash
brew --version
git --version
node --version
claude --version
```

Go back to [Module 01](module-01-machine-readiness.md) to complete the machine readiness checklist, then continue with [Module 02](module-02-command-line.md).
