---
description: Code improvement and optimization assistance
allowed-tools: Read, Edit, MultiEdit, Grep, Glob, Bash(npm:*)
argument-hint: "Code files or components to improve"
---

Improve and optimize the code specified in $ARGUMENTS with comprehensive enhancement strategies.

## Code Analysis Context
- Target files: !`find . -name "$ARGUMENTS*" -type f | head -10`
- Project dependencies: @package.json
- Code patterns: !`grep -r "TODO\|FIXME\|HACK" . --include="*.js" --include="*.ts" --include="*.jsx" --include="*.tsx" | head -5`

## Improvement Dimensions

**Code Quality:**
- Naming conventions and clarity improvement
- Function decomposition and modularity
- DRY principle application
- Code complexity reduction
- Error handling enhancement

**Performance Optimization:**
- Algorithm efficiency improvements
- Memory usage optimization
- Caching strategy implementation
- Database query optimization
- Bundle size reduction

**Architecture Enhancement:**
- Design pattern implementation
- Separation of concerns
- Dependency injection
- Interface abstraction
- Scalability improvements

**Security Hardening:**
- Input validation strengthening
- Authentication mechanism improvement
- Data encryption implementation
- Vulnerability patching
- Access control enhancement

## Improvement Process
1. **Current State Analysis**: Identify improvement opportunities
2. **Priority Assessment**: Rank improvements by impact and effort
3. **Incremental Enhancement**: Apply improvements systematically
4. **Validation**: Verify improvements don't break functionality
5. **Documentation**: Update documentation for changes

**Flags:**
- --quality: Focus on code quality and maintainability
- --performance: Emphasize performance optimization
- --security: Prioritize security improvements
- --architecture: Restructure for better design
- --refactor: Major code restructuring and modernization
- --incremental: Apply improvements step-by-step
- --aggressive: Apply all possible improvements
- --safe: Conservative improvements with minimal risk

**Improvement Types:**
- Legacy code modernization
- Framework/library upgrades
- TypeScript migration
- Test coverage improvement
- Documentation enhancement
- Accessibility improvements