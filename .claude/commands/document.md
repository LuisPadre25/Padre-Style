---
description: Generate comprehensive documentation
allowed-tools: Read, Write, Edit, Grep, Glob
argument-hint: "Files or components to document"
---

Generate comprehensive documentation for $ARGUMENTS.

## Context Analysis
- Project structure: !`find . -name "*.md" -o -name "README*" -o -name "package.json" | head -10`
- Code files to document: !`find . -name "*.js" -o -name "*.ts" -o -name "*.jsx" -o -name "*.tsx" -o -name "*.py" -o -name "*.vue" | head -15`

## Documentation Types

**API Documentation:**
- Function signatures and parameters
- Return types and possible errors
- Usage examples and best practices
- Integration guidelines

**Component Documentation:**
- Props/parameters and their types
- Event handlers and callbacks
- Styling and theming options
- Interactive examples

**Architecture Documentation:**
- System overview and data flow
- Module relationships and dependencies
- Design decisions and rationale
- Deployment and configuration

**User Documentation:**
- Installation and setup instructions
- Feature descriptions and workflows
- Troubleshooting and FAQ
- Changelog and version history

## Documentation Standards
- Clear, concise language accessible to target audience
- Comprehensive examples with real-world use cases
- Proper markdown formatting with syntax highlighting
- Links to related documentation and external resources
- Version compatibility and migration notes

**Flags:**
- --api: Focus on API reference documentation
- --user: Generate user-facing documentation
- --dev: Create developer/contributor documentation  
- --inline: Add inline code comments and JSDoc
- --readme: Generate or update README files
- --changelog: Create version changelog documentation
- --interactive: Include interactive examples and demos