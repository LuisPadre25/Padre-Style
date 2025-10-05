---
description: Advanced LLM streaming architecture for real-time code generation
allowed-tools: Bash(*), Read, Write, Edit, MultiEdit, Grep, Glob, WebSocket, WebFetch
argument-hint: "Project specification for streaming code generation"
streaming-enabled: true
---

# STREAM MODE: REAL-TIME LLM CODE GENERATION

Implement advanced streaming architecture for $ARGUMENTS with multi-agent LLM coordination.

## STREAMING ARCHITECTURE

### LLM AGENT ORCHESTRATION
Configure multiple specialized agents working in parallel:
- **UI Agent**: Generates component structure and styling
- **Logic Agent**: Implements business logic and state management
- **API Agent**: Creates backend integration and data fetching
- **Optimization Agent**: Refactors and optimizes generated code
- **Testing Agent**: Generates tests alongside implementation

### STREAMING PIPELINE
```javascript
// Real-time code generation pipeline
const StreamingPipeline = {
  // Parallel agent processing
  agents: {
    ui: 'Generate UI components with real-time preview',
    logic: 'Implement state management and business rules',
    api: 'Create API endpoints and integrations',
    optimization: 'Continuous performance improvements',
    testing: 'Generate tests in parallel with code'
  },
  
  // Streaming coordination
  coordination: {
    type: 'parallel-sequential-hybrid',
    bufferSize: 'adaptive',
    errorRecovery: 'graceful-degradation'
  }
};
```

### TECHNICAL IMPLEMENTATION

**WebSocket Streaming:**
```javascript
// Establish WebSocket for real-time streaming
const ws = new WebSocket('ws://localhost:8080/stream');

// Stream code chunks as they're generated
ws.on('message', (chunk) => {
  const { agentId, code, metadata } = JSON.parse(chunk);
  updateEditor(agentId, code);
  updateProgress(metadata);
});
```

**Server-Sent Events (SSE):**
```javascript
// Alternative streaming with SSE
const eventSource = new EventSource('/api/stream-generation');

eventSource.onmessage = (event) => {
  const { type, content, progress } = JSON.parse(event.data);
  handleStreamUpdate(type, content, progress);
};
```

## STREAMING FEATURES

### PROGRESSIVE GENERATION
- Start with skeleton → Add features → Optimize → Test
- Show generation progress in real-time
- Allow user intervention during generation
- Rollback capabilities for each generation step

### INTELLIGENT BUFFERING
- Adaptive buffer sizes based on generation speed
- Chunk aggregation for coherent updates
- Syntax-aware streaming (complete statements)
- Error boundary handling

### PARALLEL PROCESSING
- Multiple agents work simultaneously
- Dependency resolution between agents
- Conflict resolution for overlapping code
- Merge strategies for parallel outputs

## IMPLEMENTATION PATTERNS

### AGENT COMMUNICATION
```javascript
// Inter-agent message passing
const agentBus = new EventEmitter();

// UI agent notifies about component structure
agentBus.emit('ui:component-created', {
  name: 'Dashboard',
  props: ['data', 'onUpdate'],
  requires: ['api:fetchData', 'logic:processData']
});

// Logic agent responds to UI requirements
agentBus.on('ui:component-created', ({ requires }) => {
  requires.forEach(requirement => generateRequirement(requirement));
});
```

### STREAMING OPTIMIZATION
- Token-efficient prompting strategies
- Context window management
- Incremental generation with checkpoints
- Caching for common patterns

**STREAMING FLAGS:**
- --parallel: Enable parallel agent processing
- --buffer-size: Set streaming buffer size
- --preview: Real-time preview during generation
- --checkpoint: Save generation checkpoints
- --optimize: Enable optimization agent
- --test: Generate tests in parallel
- --verbose: Show detailed streaming progress

## ADVANCED STREAMING PATTERNS
- Backpressure handling for slow consumers
- Stream transformation and filtering
- Multi-model ensemble streaming
- Adaptive quality based on generation speed
- Streaming metrics and analytics