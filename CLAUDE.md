# CLAUDE.md

## Project Overview

<!-- Run /project:app-design:create to generate app design document -->
<!-- Run /project:tech-stack:create to generate tech stack documentation -->

- App Design: @.taskmaster/docs/app-design-document.md
- Tech Stack: @.taskmaster/docs/tech-stack.md

## Project Status

<!-- **Current Stage**: Pre-MVP -->

### DO Care About

<!-- - **Security**: Authentication, authorization, input validation
- **Core Functionality**: Essential features that deliver primary value
- **Data Integrity**: Proper database design and constraints
- **Error Handling**: Basic error boundaries and user feedback -->

### DO NOT Care About

<!-- - **Unit Tests**: Focus on manual testing for now
- **Performance Optimization**: Premature optimization
- **Perfect Code**: Working implementation over perfect abstractions
- **Comprehensive Logging**: Basic console.error is enough -->

### Development Approach

<!-- - **Focus**: Ship working features quickly
- **Iterate**: Get user feedback early and often
- **Refactor**: Clean up after validation, not before -->

## Commands

### Development

<!-- - `pnpm typecheck` - Run TypeScript type checking (must pass without errors)
- `pnpm lint` - Run ESLint
- `pnpm format` - Format code with Prettier -->

### Database

<!-- - `pnpm db:generate` - Generate Prisma client from schema
- `pnpm db:push` - Push schema changes to database
- `pnpm db:seed` - Seed database with initial data -->

### Testing

<!-- - `pnpm test` - Run unit tests
- `pnpm test:e2e` - Run end-to-end tests -->

## Available Slash Commands

### Task Management

- `/next` - Get next task and start implementing
- `/list` - List all tasks
- `/show <id>` - Show task details
- `/done <id>` - Mark task complete
- `/add` - Add one or more tasks
- `/add-interactive` - Add tasks with clarifying questions
- `/parse` - Parse PRD into tasks
- `/expand <id>` - Break down complex tasks
- `/move <from> to <to>` - Reorganize tasks

### Task Updates

- `/project:task:update` - Update tasks based on changes
- `/project:task:update-interactive` - Update tasks with clarifying questions
- `/project:task:research` - Research best practices

### Research

- `/project:research:task` - Research for specific tasks
- `/project:research:architecture` - Research system design
- `/project:research:tech` - Research technologies
- `/project:research:security` - Research security practices

### Documentation

- `/project:app-design:create` - Create app design document
- `/project:app-design:update` - Update app design document
- `/project:tech-stack:create` - Create tech stack documentation
- `/project:tech-stack:update` - Update tech stack documentation
- `/project:prd:interactive` - Create PRD with Q&A
- `/project:prd:direct` - Create PRD without questions

### Development Tools

- `/project:rules:create` - Create new Cursor rule
- `/project:rules:update` - Update existing Cursor rule

## Development Guidelines

This project uses a unified approach to development patterns across Claude Code and Cursor:

### Core Rules

- @.cursor/rules/cursor-rules.mdc - Rule creation guidelines
- @.cursor/rules/project-status.mdc - Stage-based development priorities
- @.cursor/rules/self-improve.mdc - Continuous improvement patterns

### Task Management

- @.cursor/rules/taskmaster/taskmaster.mdc - Task Master command reference
- @.cursor/rules/taskmaster/dev-workflow.mdc - Development workflow patterns

### Complete Task Master Guide

- .taskmaster/docs/taskmaster-guide.md - Full tagged task management documentation, if needed

## Project Structure

```
project/
├── .taskmaster/          # Task management files
│   ├── tasks/           # Task database and files
│   ├── docs/            # PRDs and documentation
│   └── config.json      # AI model configuration
├── .cursor/             # Cursor-specific rules
│   └── rules/           # Development patterns
├── .claude/             # Claude Code configuration
│   ├── commands/        # Custom slash commands
│   └── settings.json    # Tool preferences
└── src/                 # Application source code
```

## Notes

- Never work directly on the `master` tag - always create feature tags
- Run typecheck before committing
- Use `/next` to automatically get and start implementing tasks
