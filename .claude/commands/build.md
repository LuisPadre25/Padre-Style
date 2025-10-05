---
description: Intelligent project building and compilation
allowed-tools: Bash(npm:*), Bash(yarn:*), Bash(pnpm:*), Bash(pip:*), Bash(cargo:*), Read, Grep
argument-hint: "Build target or specific components"
---

Perform intelligent project building and compilation for $ARGUMENTS.

## Build Context
- Package manager: !`which npm yarn pnpm | head -1`
- Build scripts: @package.json
- Current directory: !`pwd`
- Node version: !`node --version 2>/dev/null || echo "Node not found"`

## Build Process
1. **Environment Detection**: Identify build tools and configuration
2. **Dependency Management**: Install/update required dependencies  
3. **Build Execution**: Run appropriate build commands
4. **Validation**: Verify build success and output quality
5. **Optimization**: Apply performance and size optimizations

## Supported Build Systems
**Frontend:**
- Webpack, Vite, Parcel, Rollup
- Create React App, Next.js, Vue CLI, Angular CLI
- TypeScript compilation
- Asset optimization and bundling

**Backend:**
- Node.js applications
- Python (pip, poetry, pipenv)
- Rust (cargo)
- Go builds

**Universal:**
- Docker container builds
- CI/CD pipeline integration
- Production optimization
- Testing integration

**Flags:**
- --prod: Production build with optimizations
- --dev: Development build with debugging
- --watch: Continuous build with file watching
- --clean: Clean build artifacts before building
- --analyze: Bundle analysis and optimization recommendations
- --docker: Docker container build
- --test: Include test execution in build process
- --deploy: Prepare for deployment with all optimizations

**Build Targets:**
- Specify components, modules, or entire application
- Support for monorepo and multi-package builds
- Selective building based on changed files