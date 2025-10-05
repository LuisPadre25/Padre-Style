---
description: Advanced system architecture design with LLM agents
allowed-tools: Bash(*), Read, Write, Edit, MultiEdit, Grep, Glob, WebSearch
argument-hint: "System requirements for architecture design"
architecture-level: ENTERPRISE
---

# ARCHITECT MODE: SYSTEM DESIGN WITH LLM AGENTS

Design complete system architecture for $ARGUMENTS using specialized LLM agents.

## ARCHITECTURE PATTERNS

### AGENT-BASED ARCHITECTURE
Design systems with specialized agents:
- **Frontend Agent**: React/Vue/Angular architecture decisions
- **Backend Agent**: API design, microservices, data flow
- **Database Agent**: Schema design, optimization, migrations
- **Infrastructure Agent**: Deployment, scaling, monitoring
- **Security Agent**: Authentication, authorization, encryption

### SYSTEM DESIGN PRINCIPLES
- **Separation of Concerns**: Each agent handles specific domain
- **Loose Coupling**: Agents communicate through well-defined interfaces
- **High Cohesion**: Related functionality grouped within agents
- **Scalability First**: Design for horizontal scaling from start
- **Event-Driven**: Asynchronous communication between components

## TECHNICAL ARCHITECTURE

### FRONTEND ARCHITECTURE
```typescript
// Component-based architecture with streaming updates
interface FrontendArchitecture {
  framework: 'React' | 'Vue' | 'Angular' | 'Svelte';
  stateManagement: 'Redux' | 'Zustand' | 'Pinia' | 'MobX';
  styling: 'TailwindCSS' | 'CSS-in-JS' | 'CSS Modules';
  buildTool: 'Vite' | 'Webpack' | 'Parcel' | 'esbuild';
  testing: 'Jest' | 'Vitest' | 'Cypress' | 'Playwright';
}

// Real-time component generation
const componentGenerator = {
  generateComponent: async (spec: ComponentSpec) => {
    const template = await selectOptimalTemplate(spec);
    const code = await generateWithLLM(template, spec);
    return optimizeComponent(code);
  }
};
```

### BACKEND ARCHITECTURE
```typescript
// Microservices with API Gateway pattern
interface BackendArchitecture {
  pattern: 'Microservices' | 'Monolith' | 'Serverless';
  apiDesign: 'REST' | 'GraphQL' | 'gRPC' | 'WebSocket';
  database: 'PostgreSQL' | 'MongoDB' | 'Redis' | 'DynamoDB';
  messageQueue: 'RabbitMQ' | 'Kafka' | 'Redis' | 'SQS';
  caching: 'Redis' | 'Memcached' | 'CDN';
}
```

### STREAMING ARCHITECTURE
```typescript
// LLM streaming coordination
interface StreamingArchitecture {
  protocol: 'WebSocket' | 'SSE' | 'HTTP2-Push';
  encoding: 'JSON' | 'MessagePack' | 'Protobuf';
  buffering: 'Adaptive' | 'Fixed' | 'None';
  errorHandling: 'Retry' | 'Fallback' | 'Circuit-Breaker';
}
```

## IMPLEMENTATION STRATEGY

### PHASE 1: REQUIREMENTS ANALYSIS
- Parse natural language requirements
- Identify technical constraints
- Define non-functional requirements
- Create architecture decision records (ADRs)

### PHASE 2: AGENT COORDINATION
```javascript
// Coordinate multiple LLM agents
const architectureCoordinator = {
  async designSystem(requirements) {
    const agents = {
      frontend: new FrontendAgent(),
      backend: new BackendAgent(),
      database: new DatabaseAgent(),
      infrastructure: new InfrastructureAgent()
    };
    
    // Parallel design generation
    const designs = await Promise.all([
      agents.frontend.design(requirements),
      agents.backend.design(requirements),
      agents.database.design(requirements),
      agents.infrastructure.design(requirements)
    ]);
    
    // Resolve conflicts and dependencies
    return reconcileDesigns(designs);
  }
};
```

### PHASE 3: CODE GENERATION
- Generate boilerplate code for each component
- Create integration points between services
- Implement communication protocols
- Set up development environment

## ARCHITECTURE FLAGS
- --microservices: Design microservices architecture
- --serverless: Optimize for serverless deployment
- --real-time: Include WebSocket/streaming capabilities
- --scalable: Design for horizontal scaling
- --secure: Security-first architecture
- --cloud: Cloud-native architecture (AWS/GCP/Azure)
- --monitoring: Include observability from start

## ADVANCED PATTERNS
- **CQRS**: Command Query Responsibility Segregation
- **Event Sourcing**: Audit trail and time travel
- **Saga Pattern**: Distributed transaction management
- **Circuit Breaker**: Fault tolerance
- **API Gateway**: Unified entry point
- **Service Mesh**: Inter-service communication