---
description: Implement features with intelligent expert activation
allowed-tools: Read, Write, Edit, MultiEdit, Bash(npm:*), Bash(git:*), Bash(yarn:*), Glob, Grep
argument-hint: "Describe the feature or component to implement"
---

Implement the feature or component specified in $ARGUMENTS.

## Context
- Current project structure: !`find . -maxdepth 2 -type d | head -10`
- Package.json dependencies: @package.json
- Existing components/modules: !`find ./src -name "*.js" -o -name "*.ts" -o -name "*.jsx" -o -name "*.tsx" -o -name "*.vue" | head -15`

## Auto-Expert Activation
SuperClaude automatically activates the right specialists based on implementation needs:
- **Frontend Expert**: React, Vue, Angular components and UI logic
- **Backend Expert**: APIs, databases, server logic
- **Security Expert**: Authentication, authorization, data protection
- **Performance Expert**: Optimization, caching, efficiency

## Implementation Process
1. **Requirements Analysis**: Break down feature requirements
2. **Architecture Planning**: Design component structure and data flow
3. **Progressive Implementation**: Build incrementally with testing
4. **Integration & Validation**: Ensure compatibility with existing code

**Flags:**
- --type: Specify implementation type (feature, component, api, service, util)
- --framework: Target framework (react, vue, express, fastapi, etc.)
- --with-tests: Include comprehensive test implementation
- --iterative: Step-by-step implementation with user feedback
- --secure: Apply security-first implementation patterns

**Examples:**
- User authentication system with JWT tokens
- Dashboard component with data visualization
- REST API with CRUD operations
- Real-time chat functionality