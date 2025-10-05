---
description: Comprehensive code analysis
allowed-tools: Bash(find:*), Bash(grep:*), Read, Grep, Glob
argument-hint: "Specify files, directories, or patterns to analyze"
---

Analyze the code specified in $ARGUMENTS with comprehensive assessment across multiple dimensions.

## Context Analysis
- Current working directory: !`pwd`
- File structure: !`find . -type f -name "*.js" -o -name "*.ts" -o -name "*.jsx" -o -name "*.tsx" -o -name "*.vue" -o -name "*.py" -o -name "*.php" | head -20`

## Analysis Modes

**Flags:**
- --code: Quality review → naming, structure, DRY, complexity | Bugs → null checks, boundaries, types
- --arch: System design & patterns | Layer coupling | Scalability bottlenecks  
- --security: OWASP top 10 | Auth & authorization | Data handling & encryption
- --perf: Bottleneck analysis | Algorithm complexity | Memory usage optimization
- --watch: Continuous file monitoring | Real-time quality tracking
- --interactive: Guided exploration | Step-by-step fixes

## Process
1. **Context Understanding**: Map codebase structure and patterns
2. **Multi-Dimensional Scan**: Quality assessment across all specified dimensions  
3. **Evidence-Based Report**: Specific findings with line numbers and recommendations
4. **Actionable Solutions**: Concrete steps to address identified issues

Perform thorough analysis focusing on maintainability, performance, security, and architectural soundness.