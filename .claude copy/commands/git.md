---
description: Intelligent git operations and workflow management
allowed-tools: Bash(git:*)
argument-hint: "Git operation or workflow to execute"
---

Perform intelligent git operations and workflow management for $ARGUMENTS.

## Git Context
- Current status: !`git status --porcelain`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -5`
- Staged changes: !`git diff --cached --stat`
- Unstaged changes: !`git diff --stat`

## Git Operations

**Branch Management:**
- Create feature/bugfix/hotfix branches
- Merge strategies and conflict resolution
- Branch cleanup and organization
- Remote branch synchronization

**Commit Management:**
- Intelligent commit message generation
- Staged changes analysis and grouping
- Commit squashing and rewriting
- Interactive rebase operations

**Workflow Automation:**
- GitFlow and GitHub Flow implementation
- Pull request preparation
- Code review integration
- Release management

**Advanced Operations:**
- Cherry-picking and backporting
- Submodule management
- Git hooks configuration
- Repository maintenance

## Smart Commit Messages
Generate conventional commit messages based on changes:
- `feat:` new features
- `fix:` bug fixes  
- `docs:` documentation changes
- `style:` formatting changes
- `refactor:` code restructuring
- `test:` test additions/modifications
- `chore:` maintenance tasks

**Flags:**
- --commit: Create intelligent commit with generated message
- --branch: Create and switch to new branch with naming convention
- --merge: Merge branches with conflict resolution
- --rebase: Interactive rebase with commit cleanup
- --push: Push changes with upstream tracking
- --pull: Pull with merge/rebase strategy
- --stash: Stash management and organization
- --tag: Release tagging with version management
- --hooks: Configure git hooks for workflow automation

**Examples:**
- `/git --commit "user authentication system"`
- `/git --branch feature/user-profile`
- `/git --merge develop --strategy recursive`