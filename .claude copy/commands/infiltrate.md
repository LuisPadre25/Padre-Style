---
description: Technical intelligence gathering and competitive analysis
allowed-tools: WebSearch, WebFetch, Grep, Bash(*), Read
argument-hint: "Target technology/framework/system to analyze"
analysis-level: COMPREHENSIVE
---

# INFILTRATE MODE: TECHNICAL INTELLIGENCE

Execute technical analysis of $ARGUMENTS to understand architecture, identify best practices, and learn from existing implementations.

## INTELLIGENCE GATHERING

### TECHNICAL RECONNAISSANCE
- Study open-source codebases for architectural patterns
- Analyze documentation for implementation insights
- Learn from successful features and implementations
- Identify performance optimization techniques
- Map technology stacks and dependencies

### FRAMEWORK ANALYSIS
```bash
# Analyze framework internals
find node_modules -name "*.js" -path "*/$FRAMEWORK/*" | head -20

# Study bundle composition
npm ls --depth=0 --json | jq '.dependencies'

# Examine configuration patterns
find . -name "*.config.*" -o -name ".*rc*" | grep -v node_modules
```

### ARCHITECTURE PATTERNS
- Study component organization strategies
- Analyze state management patterns
- Examine API design and data flow
- Investigate build and deployment setups

## TECHNICAL ANALYSIS VECTORS

### CODE INVESTIGATION
Analyze:
- Repository structure and organization
- Commit history for development patterns
- Issue discussions for design decisions
- Pull requests for code quality standards

### PERFORMANCE ANALYSIS
- Benchmark performance metrics
- Analyze optimization strategies
- Study caching implementations
- Examine loading strategies

### IMPLEMENTATION PATTERNS
- Authentication and authorization flows
- Error handling and logging patterns
- Testing strategies and coverage
- CI/CD pipeline configurations

## ANALYSIS COMMANDS

**REPOSITORY ANALYSIS:**
```bash
# Analyze code statistics
cloc . --exclude-dir=node_modules,dist,build

# Study dependency tree
npm ls --depth=2

# Examine build processes
find . -name "package.json" -exec grep -H "scripts" {} \;
```

**PATTERN DETECTION:**
- Component composition patterns
- State management approaches
- API integration methods
- Performance optimization techniques

**ARCHITECTURE STUDY:**
- Module boundaries and interfaces
- Service communication patterns
- Data flow architectures
- Scalability strategies

## LEARNING STRATEGIES

### BEST PRACTICES EXTRACTION
- Identify successful patterns worth adopting
- Learn from architectural decisions
- Understand trade-offs made
- Extract reusable concepts

### INNOVATION OPPORTUNITIES
- Find gaps in current solutions
- Identify areas for improvement
- Discover unmet needs
- Propose innovative approaches

**FLAGS:**
- --technical: Focus on technical implementation details
- --architecture: Analyze system architecture
- --performance: Study performance optimizations
- --patterns: Extract design patterns
- --dependencies: Analyze dependency choices
- --metrics: Generate comparison metrics
- --learn: Educational analysis mode

## ETHICAL ANALYSIS
This mode focuses on:
- Learning from open-source projects
- Understanding industry best practices
- Identifying innovation opportunities
- Respecting intellectual property
- Contributing back to the community

**PURPOSE:** This command helps understand and learn from existing solutions to build better systems.