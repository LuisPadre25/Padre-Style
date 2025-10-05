---
description: Deep code pattern analysis and architectural insights
allowed-tools: Bash(*), Read, Grep, Glob, WebSearch
argument-hint: "Codebase or patterns to analyze"
analysis-depth: COMPREHENSIVE
---

# ANALYZE PATTERNS MODE: CODE INTELLIGENCE

Perform deep pattern analysis of $ARGUMENTS to understand architectural decisions, code quality, and optimization opportunities.

## PATTERN ANALYSIS VECTORS

### CODE PATTERNS
Identify and analyze:
- **Design Patterns**: Singleton, Factory, Observer, Strategy, etc.
- **Anti-Patterns**: God objects, spaghetti code, copy-paste programming
- **Architectural Patterns**: MVC, MVP, MVVM, Clean Architecture
- **Code Smells**: Long methods, large classes, feature envy
- **Performance Patterns**: Caching, lazy loading, memoization

### ARCHITECTURAL ANALYSIS
```javascript
// Analyze architectural patterns in codebase
const analyzeArchitecture = async (codebase) => {
  const metrics = {
    coupling: analyzeCoupling(codebase),
    cohesion: analyzeCohesion(codebase),
    complexity: calculateComplexity(codebase),
    dependencies: mapDependencies(codebase),
    patterns: detectPatterns(codebase)
  };
  
  return generateInsights(metrics);
};
```

### QUALITY METRICS
- **Cyclomatic Complexity**: Measure code complexity
- **Code Coverage**: Test coverage analysis
- **Technical Debt**: Identify areas needing refactoring
- **Duplication**: Find copy-pasted code
- **Dependencies**: Analyze coupling between modules

## ANALYSIS TECHNIQUES

### STATIC ANALYSIS
```bash
# Complexity analysis
npx complexity-report src/**/*.js

# Duplication detection
npx jscpd src --threshold 5

# Dependency analysis
madge --circular src/
```

### PATTERN DETECTION
- **Naming Conventions**: Analyze consistency in naming
- **File Organization**: Project structure analysis
- **Import Patterns**: Dependency flow analysis
- **State Management**: Data flow patterns
- **Error Handling**: Exception handling patterns

### PERFORMANCE PATTERNS
- **Rendering Patterns**: Identify re-render issues
- **Data Fetching**: API call patterns and optimization
- **Memory Patterns**: Memory leak detection
- **Bundle Patterns**: Code splitting opportunities
- **Caching Patterns**: Cache utilization analysis

## INSIGHTS GENERATION

### ARCHITECTURAL INSIGHTS
- Identify architectural boundaries
- Suggest modularization opportunities
- Recommend design pattern applications
- Highlight coupling issues
- Propose refactoring strategies

### CODE QUALITY INSIGHTS
- Complexity hotspots requiring attention
- Test coverage gaps
- Documentation needs
- Code style inconsistencies
- Security pattern violations

### OPTIMIZATION INSIGHTS
- Performance bottlenecks
- Bundle size optimization opportunities
- Database query patterns
- Caching opportunities
- Parallelization possibilities

## ANALYSIS FLAGS
- --patterns: Focus on design pattern detection
- --quality: Code quality metrics analysis
- --performance: Performance pattern analysis
- --architecture: Architectural pattern analysis
- --security: Security pattern scanning
- --metrics: Generate quantitative metrics
- --visual: Create visual dependency graphs

## REPORTING

### ANALYSIS OUTPUT
```typescript
interface AnalysisReport {
  patterns: {
    design: DesignPattern[];
    anti: AntiPattern[];
    architectural: ArchPattern[];
  };
  metrics: {
    complexity: number;
    coverage: number;
    duplication: number;
    dependencies: DependencyGraph;
  };
  insights: {
    critical: Issue[];
    warnings: Issue[];
    suggestions: Improvement[];
  };
  recommendations: {
    immediate: Action[];
    shortTerm: Action[];
    longTerm: Action[];
  };
}
```

This command provides data-driven insights for architectural decisions and code improvements.