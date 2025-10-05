---
description: Comprehensive testing assistance and automation
allowed-tools: Bash(npm:*), Bash(yarn:*), Bash(pytest:*), Read, Write, Edit, Grep, Glob
argument-hint: "Test files, components, or test types to run"
---

Perform comprehensive testing for $ARGUMENTS with intelligent test selection and execution.

## Test Context
- Test configuration: @package.json
- Existing tests: !`find . -name "*.test.*" -o -name "*.spec.*" -o -name "__tests__" -type d | head -10`
- Test framework detection: !`grep -E "(jest|mocha|vitest|pytest|phpunit)" package.json 2>/dev/null || echo "Framework not detected"`

## Testing Strategies

**Unit Testing:**
- Function and method testing
- Component isolation testing
- Mock and stub implementation
- Edge case and boundary testing

**Integration Testing:**
- API endpoint testing
- Database integration testing
- Service interaction testing
- End-to-end workflow testing

**Performance Testing:**
- Load testing and stress testing
- Memory leak detection
- Response time optimization
- Scalability assessment

**Security Testing:**
- Input validation testing
- Authentication/authorization testing
- SQL injection and XSS prevention
- Data encryption verification

## Test Generation
- Automatic test case generation based on code analysis
- Test data factories and fixtures
- Mock service implementation
- Snapshot testing for UI components

**Flags:**
- --unit: Focus on unit test execution and generation
- --integration: Run integration and API tests
- --e2e: End-to-end testing with browser automation
- --coverage: Generate detailed test coverage reports
- --watch: Continuous testing with file monitoring  
- --generate: Generate test cases for specified components
- --mock: Create mock services and test data
- --performance: Run performance and load testing
- --security: Execute security-focused test suites
- --fix: Fix failing tests and improve test quality

**Examples:**
- `/test src/components/UserAuth --unit --coverage`
- `/test api/users --integration --mock`
- `/test --e2e --performance`