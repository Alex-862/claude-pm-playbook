# Module 01: Machine Readiness

## Learning Objective

Get your Mac set up with the tools needed to run this curriculum: Homebrew, Git, Claude Code, and a basic understanding of what each one does and why.

## Why It Matters for PMs

You cannot use these workflows without the right tools installed. This module gets you past the setup hurdle as quickly as possible. Every step here is one-time effort. Once done, you will not need to repeat it.

This module is deliberately practical. Do not worry about fully understanding every tool — that comes in later modules. The goal here is: working machine, ready to learn.

> **Before you start**: Read [Setup Guide for Mac](setup-guide-mac.md) — it covers the same steps in more detail with reassurance for nervous terminal users. Use whichever format works better for you.

---

## Concepts Covered

- What the Terminal is and how to open it
- What Homebrew is and why developers (and now PMs) use it
- What Git is and why it matters
- What GitHub is (the website) vs Git (the tool)
- What Claude Code is and how it differs from Claude.ai
- How to verify everything is installed correctly

---

## What Is the Terminal?

The Terminal is a text-based way of giving instructions to your Mac. Instead of clicking icons, you type commands. It feels unfamiliar at first. That feeling fades quickly.

On a Mac, find it by pressing `Command + Space`, typing `Terminal`, and pressing Enter.

When it opens, you will see a prompt that looks something like this:

```
alex@MacBook-Pro ~ %
```

This is just your Mac saying "I'm ready. What do you want me to do?" Type a command and press Enter to execute it.

**Important**: The terminal is not dangerous if you follow instructions. The commands in this curriculum are safe and reversible. If you are ever unsure about a command, do not run it — ask first.

---

## What Is Homebrew?

Homebrew is a package manager for Mac. A package manager is a tool that installs other tools for you.

Instead of going to a website, downloading an installer, clicking through setup screens, and hoping it works — you type one command and Homebrew handles everything.

It is the standard way developers install tools on a Mac. You will use it to install Git and Claude Code.

---

## What Is Git?

Git is version control software. It tracks changes to files over time — what changed, when, and who made the change.

Think of it as a very powerful "Track Changes" feature that works across any number of files and multiple people simultaneously. Unlike Google Docs' version history, Git's history is explicit and meaningful: you choose when to record a "checkpoint" (called a commit) and you write a short message describing what changed and why.

Git runs on your local machine. It does not require internet access to track changes.

---

## What Is GitHub?

GitHub is a website that hosts Git repositories. It is where you store your version-controlled files so others can access them, and where you can access others' work.

- **Git** is the tool that runs on your machine
- **GitHub** is the website where repositories live in the cloud

You will use GitHub to access this playbook repository and any project repositories your team creates.

---

## What Is Claude Code?

Claude Code is an AI assistant that runs in your terminal and has access to the files in your project. Unlike Claude.ai (the website), Claude Code:

- Reads your actual files
- Understands the structure of your repository
- Runs pre-built workflows (called skills) on your behalf
- Saves its outputs back into your project files

It is the difference between asking a consultant to advise you with no preparation, versus briefing them thoroughly and giving them access to all the relevant documents. Claude Code works within your context.

---

## Step-by-Step Setup

### Step 1: Open Terminal

Press `Command + Space`, type `Terminal`, press `Enter`.

### Step 2: Install Homebrew

Copy and paste this command into Terminal, then press Enter:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

You will be asked for your Mac password. Type it (nothing will appear as you type — this is normal) and press Enter.

The installation takes a few minutes. When it finishes, follow any instructions it prints about adding Homebrew to your PATH. These look like:

```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Run those commands exactly as shown if prompted.

**Verify it worked**:
```bash
brew --version
```
You should see something like `Homebrew 4.x.x`.

### Step 3: Install Git

```bash
brew install git
```

**Verify it worked**:
```bash
git --version
```
You should see something like `git version 2.x.x`.

### Step 4: Configure Git with Your Identity

Git needs to know who you are so that changes you make are attributed to you:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@company.com"
```

Replace `Your Name` and `your.email@company.com` with your actual name and work email address.

### Step 5: Create a GitHub Account

Go to [github.com](https://github.com) and create an account if you do not already have one. Use your work email address.

> **Note for enterprise environments**: Your organisation may have a GitHub Enterprise instance. Check with your engineering team for the correct URL and whether you should use SSO to log in.

### Step 6: Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

If you get an error about `npm not found`, you need to install Node.js first:

```bash
brew install node
```

Then retry the Claude Code install.

**Verify it worked**:
```bash
claude --version
```

### Step 7: Log In to Claude Code

```bash
claude
```

The first time you run this, it will ask you to authenticate. Follow the prompts. You will need an Anthropic account or an enterprise API key provided by your organisation.

> **Enterprise note**: If your organisation has an enterprise Claude licence, you will be given a specific API key or login method. Do not use a personal API key for work projects — use only the approved enterprise credentials.

---

## Practical Exercise

Work through each step above and verify each tool is installed. When you are done, run the following commands and confirm they all produce sensible output:

```bash
brew --version
git --version
git config user.name
git config user.email
claude --version
```

Take a screenshot of the Terminal showing all five outputs. Share it with your manager or champion to confirm your setup is complete.

---

## Expected Output

A fully configured Mac with Homebrew, Git, and Claude Code installed. Your Git identity configured. A GitHub account created. Confirmation that `claude --version` runs without errors.

---

## Common Mistakes

- **Skipping the PATH setup for Homebrew** — If you close Terminal and `brew` stops working, you likely skipped the step that adds Homebrew to your PATH. Reopen Terminal and run: `eval "$(/opt/homebrew/bin/brew shellenv)"`

- **Using personal credentials for enterprise work** — Always use your work email for Git config and organisation-approved credentials for Claude Code.

- **Typing commands with typos** — Commands are case-sensitive and spacing matters. When in doubt, copy-paste rather than type.

- **Panicking when nothing appears as you type your password** — This is normal. MacOS hides password characters in the terminal. Keep typing and press Enter.

- **Running Homebrew as root (with sudo)** — Homebrew does not need `sudo`. If a command asks you to use `sudo brew`, stop and ask for help.

---

## Confidence Checklist

- [ ] I can open Terminal on my Mac
- [ ] `brew --version` shows a version number
- [ ] `git --version` shows a version number
- [ ] `git config user.name` shows my name
- [ ] `git config user.email` shows my work email
- [ ] I have a GitHub account with my work email
- [ ] `claude --version` shows a version number
- [ ] I can log in to Claude Code successfully
