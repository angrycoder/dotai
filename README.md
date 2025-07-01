# dotai

AI-powered development template with Claude Code, Task Master, and Cursor integration.

## What is this?

A project template that combines three powerful AI development tools:

- [**Claude Code**](https://docs.anthropic.com/en/docs/claude-code/overview) - Anthropic's CLI for Claude
- [**Task Master**](https://github.com/eyaltoledano/claude-task-master) - Tagged task management system
- [**Cursor**](https://www.cursor.com/) - AI-powered IDE for precise code review workflows (optional)

## Getting Started

1. **Launch Claude Code**

   ```bash
   claude
   ```

2. **Open Task Studio** (optional web interface)

   ```bash
   npx task-studio@latest
   ```

3. **Follow the workflow:**
   - `/app-design:create` - Explain your app
   - `/tech-stack:create` - Choose technologies
   - `/prd:create-interactive` - Write feature requirements
   - `/prd:parse` - Convert to tasks
   - `/task:next` - Start coding

## How It Works

Claude Code understands your project through:

- **CLAUDE.md** - Auto-loaded project context and rules
- **Task Master** - Manages tasks through MCP integration
- **Natural language** - Just describe what you want to do

You don't need to memorize commands. Simply ask Claude to:

- "Create a new feature tag for authentication"
- "Show me the next task"
- "Mark this task as complete"
- "What tasks are left in this feature?"

## Commands

### Quick Reference

| Command                    | Description                                                              | Category |
| -------------------------- | ------------------------------------------------------------------------ | -------- |
| `/app-design:create`       | Generate comprehensive app design document with project stage assessment | Planning |
| `/app-design:update`       | Update app design document based on codebase changes                     | Planning |
| `/tech-stack:create`       | Generate technical stack documentation from codebase analysis            | Planning |
| `/tech-stack:update`       | Update tech stack documentation after dependency changes                 | Planning |
| `/prd:create-interactive`  | Create PRD interactively with clarifying questions                       | Planning |
| `/prd:create`              | Create PRD directly without questions for simple features                | Planning |
| `/prd:parse`               | Parse PRD into Task Master tasks with optional tag creation              | Tasks    |
| `/task:next`               | Get next task and start implementing immediately                         | Tasks    |
| `/task:done`               | Mark task complete and optionally get next task                          | Tasks    |
| `/task:show`               | Show specific task details (e.g., `/task:show 2.1`)                      | Tasks    |
| `/task:list`               | List all tasks in current tag                                            | Tasks    |
| `/task:add`                | Add one or more tasks to current tag                                     | Tasks    |
| `/task:add-interactive`    | Add tasks interactively with questions                                   | Tasks    |
| `/task:update`             | Update tasks based on implementation changes                             | Tasks    |
| `/task:update-interactive` | Update tasks interactively with questions                                | Tasks    |
| `/task:expand`             | Break down tasks into subtasks                                           | Tasks    |
| `/task:move`               | Reorganize task structure                                                | Tasks    |
| `/task:research`           | Research best practices and update tasks                                 | Tasks    |
| `/rules:create`            | Create new Cursor rule file with proper structure                        | Rules    |
| `/rules:update`            | Synchronize Cursor rules to CLAUDE.md                                    | Rules    |
| `/research:task`           | Research best practices for specific tasks                               | Research |
| `/research:tech`           | Research technologies, frameworks, and tools                             | Research |
| `/research:security`       | Research security best practices and vulnerabilities                     | Research |
| `/research:architecture`   | Research architectural patterns and best practices                       | Research |
| `/debug`                   | Systematic debugging process for complex issues                          | Support  |

### Command Details

All commands follow a pattern of analyzing your project context and providing intelligent assistance. Commands in the Planning category typically ask clarifying questions to ensure accurate output. Task commands work within your current tag context. Research commands leverage web search for up-to-date information beyond the knowledge cutoff.

## Tips

### Claude Code vs Cursor

**Use Claude Code by default** for most development work:

✅ **Better for:**

- Long-term project understanding and context retention
- All Task Master AI commands
- Parallel development
- Cheapest plan for extensive usage of Claude Opus

❌ **Limitations:**

- No chat history persistence between sessions
- Less granular control over individual file changes

**Switch to Cursor when you need:**

✅ **Granular code review control:**

- Accept/reject specific diffs on a file-by-file basis
- Visual diff review with inline code navigation
- Restore points and easy change reversal
- Complex refactoring requiring careful code inspection

❌ **Limitations:**

- Becomes slow and unstable with long conversations
- Only supports non-AI Task Master commands
- Project context management is less efficient than in Claude Code
- Requires creating new chats frequently

**Recommended Plans:**

**Claude Max ($100/month)**

- Start with Pro plan ($20/month) for basic usage
- Upgrade to **Max 5x** ($100/month) for serious projects: much higher usage limits, unlocks Claude Opus model for deeper research
- Upgrade to **Max 20x** ($200/month) if you hit limits frequently. Best value for extensive usage of Claude Opus.

**Cursor Pro ($20/month)**

- Optional, but essential for granular code review workflows
- Visual diff management and restore points
- Complements Claude Code perfectly for precision editing

### Context Management

- **Claude Code**: Use `/clear` between different tasks to maintain focus
- **Claude Code**: Automatically reads `CLAUDE.md` for project context
- **Both tools**: Task Master state is preserved across sessions

### Quick Commands

- "What's next?" - Get the next task
- "Show task 2.1" - View specific task details
- "Mark as done" - Complete current task
- "Create auth feature tag" - New feature context
- "Switch to payments tag" - Change context

### Creating Custom Commands

Create your own slash commands by adding them to `.claude/commands/`

### Multi-task and Multi-feature Development

Work on multiple tasks within the same feature or across different features:

```bash
# Multi-task development (same feature)
"Show me all tasks in the current tag"
"Show task 2.1" - Review specific task
"Mark as done" - Complete task and move to next

# Multi-feature development
"Switch to the payments tag and show me what's next"
"Create a new tag for mobile development"
"Show me all tags with their progress"
```

### Parallel Development with Git Worktrees

```bash
# Create worktrees for parallel development
git worktree add ../project-api feature/api
git worktree add ../project-components feature/components

# Run Claude Code in each worktree with different tags
cd ../project-api && claude    # Terminal 1: API work
cd ../project-components && claude     # Terminal 2: Components work
```

### Troubleshooting

```bash
# Check current tag
"What tag am I on?"

# Fix task file sync
"Regenerate task files"

# Configure AI models
task-master models --setup
```

## Key Files & Project Structure

### Core Files

- `.taskmaster/tasks/tasks.json` - Tagged task database (auto-managed)
- `.taskmaster/state.json` - Current tag context
- `.taskmaster/config.json` - AI model configuration
- `.taskmaster/docs/prd-<tag>.md` - Product Requirements Documents per tag
- `.taskmaster/tasks/*.md` - Individual task files (auto-generated)

### Claude Code Integration Files

- `CLAUDE.md` - Auto-loaded context for Claude Code
- `.claude/settings.json` - Claude Code tool allowlist and preferences
- `.claude/commands/` - Custom slash commands for repeated workflows
- `.mcp.json` - MCP server configuration

### Directory Structure

```
project/
├── .taskmaster/
│   ├── tasks/              # Tagged task files
│   │   ├── tasks.json      # Task database
│   │   ├── task-1.md      # Individual tasks
│   │   └── task-2.md
│   ├── docs/              # Documentation
│   │   ├── app-design-document.md
│   │   ├── tech-stack.md
│   │   └── prd-<tag>.md
│   ├── reports/           # Analysis reports
│   ├── templates/         # PRD templates
│   ├── state.json         # Current tag context
│   └── config.json        # AI models config
├── .claude/
│   ├── settings.json      # Claude Code config
│   └── commands/         # Custom commands
├── .cursor/              # Cursor IDE rules
│   └── rules/           # Coding standards
├── .mcp.json            # MCP configuration
└── CLAUDE.md            # Project context
```

## License

MIT
