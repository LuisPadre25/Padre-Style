---
description: Perform comprehensive code review with quality analysis
allowed-tools: Bash(git:*), Read, Grep, Glob, Edit
argument-hint: "Files, commits, or directories to review"
---

Perform comprehensive code review and quality analysis on $ARGUMENTS.

## Context Gathering
- Git status: !`git status --porcelain`
- Recent commits: !`git log --oneline -5`
- Modified files: !`git diff --name-only HEAD~1 HEAD`

## Review Process
1. **Context Analysis**: Understanding codebase patterns and conventions
2. **Multi-Dimensional Assessment**: Quality evaluation across critical dimensions
3. **Evidence-Based Findings**: Specific issues with line references
4. **Actionable Recommendations**: Concrete improvement suggestions

## Review Dimensions
**Code Quality:**
- Naming conventions and clarity
- Function/class structure and organization
- DRY principle adherence
- Code complexity and readability

**Architecture & Design:**
- Design patterns usage
- Separation of concerns
- Module coupling and cohesion
- Scalability considerations

**Security:**
- Input validation and sanitization
- Authentication and authorization
- Data encryption and protection
- Common vulnerability patterns (OWASP Top 10)

**Performance:**
- Algorithm efficiency
- Database query optimization
- Memory usage patterns
- Caching strategies

**Flags:**
- --files: Review specific files or directories
- --commit: Review changes in specified commit hash
- --pr: Review pull request changes  
- --quality: Focus on code quality and best practices
- --security: Emphasize security vulnerability assessment
- --performance: Focus on performance optimization opportunities
- --evidence: Include detailed sources and documentation references
- --fix: Generate specific code fixes and improvements