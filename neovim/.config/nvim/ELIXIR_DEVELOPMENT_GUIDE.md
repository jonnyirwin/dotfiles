# 🧪 The Ultimate Elixir & Phoenix Development Experience in Neovim

Welcome to a development environment that transforms how you write Elixir and Phoenix applications! This setup combines the power of functional programming with modern development tools, creating an ecosystem that anticipates your needs, accelerates your workflow, and makes concurrent programming genuinely enjoyable.

## 🎯 Why This Setup Will Transform Your Elixir Development

Imagine having:
- **Instant Phoenix navigation** across massive codebases with contexts, schemas, and LiveView
- **AI-powered code completion** that understands Elixir patterns and OTP conventions
- **Visual debugging** with IEx integration that rivals any IDE
- **LiveBook integration** for interactive development and documentation
- **Smart code actions** that refactor with functional programming best practices
- **Seamless Mix task execution** from within your editor
- **Comprehensive testing** with ExUnit integration and Phoenix LiveView testing

This setup delivers all of this and more, with keybindings so intuitive they become second nature for the Elixir ecosystem.

---

## 🗺️ Navigation: Moving Through Phoenix Like a Pro

### Finding Files in Phoenix Projects

Your Telescope integration transforms file discovery across Phoenix's structured architecture:

```
<leader>ff  - Find files (includes hidden files, respects gitignore)
<leader>fi  - Find files (includes ignored files)  
<leader>fg  - Search text across your entire codebase
<leader>fa  - Find all files (ignores gitignore completely)
<leader>fd  - Focus on current directory only
<leader>fb  - Jump between open buffers
<leader>fh  - Find help tags
```

**Pro Tip**: Your configuration shows hidden files like `.env`, `.credo.exs`, and `.dialyzer_ignore.exs` while ignoring performance-heavy directories. Looking for that Phoenix configuration? Type `<leader>ff` and start typing `config/` - it appears instantly.

### Phoenix-Specific Navigation Magic

The real magic happens with Phoenix-aware navigation using the Phoenix.vim plugin:

```
<leader>ev  - Jump to related view/template
<leader>ec  - Go to controller
<leader>em  - Jump to model/schema  
<leader>et  - Jump to test file
<leader>es  - Jump to schema
<leader>el  - Jump to LiveView
<leader>eC  - Jump to context
<leader>eM  - Jump to migration
<leader>eR  - Jump to router
<leader>eE  - Jump to endpoint
<leader>eV  - View router file
<leader>eS  - View database structure
```

**Workflow Example**: You're in `user_controller.ex` editing the `show` action. Press `<leader>ev` and you're instantly in `user/show.html.heex`. Make your template changes, press `<leader>ec` again, and you're back in the controller. No more manual Phoenix file hunting!

### Intelligent Projectionist Navigation

Your setup includes intelligent file relationships that understand Phoenix conventions:

```bash
# From anywhere in your Phoenix app:
:Euser          # Opens lib/myapp/accounts/user.ex  
:Euser!         # Creates the schema if it doesn't exist
:ESuser         # Opens user.ex in horizontal split
:EVuser         # Opens user.ex in vertical split
:ETuser         # Opens user.ex in new tab
```

**Enhanced `gf` command** - Press `gf` on Phoenix references:
```elixir
# Press 'gf' on any of these:
MyApp.User            # → lib/myapp/accounts/user.ex
UserController        # → lib/myapp_web/controllers/user_controller.ex
UserLive              # → lib/myapp_web/live/user_live.ex
"user/show.html"      # → lib/myapp_web/templates/user/show.html.heex
```

---

## 🧪 Elixir & Phoenix Integration: Deep Language Understanding

### **Mix Task Integration**

Your setup includes comprehensive Mix integration for all Phoenix and Elixir development needs:

```bash
<leader>mx  - Run any Mix task
<leader>mt  - Run all tests (mix test)
<leader>mf  - Test current file
<leader>mc  - Compile project
<leader>md  - Get dependencies
<leader>ms  - Start Phoenix server
<leader>mi  - Start IEx session
<leader>mp  - Create new Phoenix project
<leader>mg  - Generate LiveView
<leader>mh  - Generate HTML context
<leader>mj  - Generate JSON API
<leader>mn  - Create new migration
<leader>mm  - Run migrations
<leader>mr  - Rollback migration
<leader>me  - Reset database
```

**Power Move**: In any Phoenix project, use `<leader>ms` to start your server, `<leader>mi` for an IEx session, and `<leader>mt` to run tests. All running in separate terminal buffers you can toggle back to instantly.

### **Context-Aware File Templates**

When you create new files, your setup provides intelligent templates:

**Controllers**:
```elixir
# :Econtroller MyController creates:
defmodule MyAppWeb.MyController do
  use MyAppWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
```

**LiveViews**:
```elixir  
# :Elive MyLive creates:
defmodule MyAppWeb.MyLive do
  use MyAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
```

**Schemas**:
```elixir
# :Eschema User creates:
defmodule MyApp.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
```

---

## 🔍 Code Intelligence: AI-Powered Elixir Development

### Elixir/Phoenix Code Snippets: Turbocharge Your Development

Your snippet collection includes comprehensive Elixir and Phoenix patterns:

```bash
# Core snippet expansion with Tab or Ctrl-k
# Navigate placeholders with Tab/Shift-Tab
```

#### **Essential Elixir Snippet Categories**

### **1. Debugging & Inspection Snippets**

**The Most Used Elixir Snippets**:
```elixir
# Type "io" + Tab
io  →  IO.inspect(variable, label: "debug")

# Type "iop" + Tab  
iop  →  IO.puts("Debug message")

# Type "dbg" + Tab
dbg  →  require IEx; IEx.pry()

# Type "log" + Tab
log  →  Logger.info("Debug message")
```

**Pro Debugging Workflow**:
```elixir
def complex_function(user_params) do
  # Type: io + Tab, then type 'user_params' to inspect
  IO.inspect(user_params, label: "debug")
  
  user = MyApp.Accounts.create_user(user_params)
  # Type: dbg + Tab for breakpoint
  require IEx; IEx.pry()
  
  # Continue with logic...
end
```

### **2. Phoenix Development Snippets**

**Controllers Made Easy**:
```elixir
# Type "controller" + Tab
controller  →  Full controller template with use statement

# Type "action" + Tab
action  →  def index(conn, params) do template

# Type "render" + Tab
render  →  render(conn, :index)

# Type "redirect" + Tab
redirect  →  redirect(conn, to: ~p"/")

# Type "json" + Tab
json  →  json(conn, %{data: data})
```

**Real Controller Building Workflow**:
```elixir
# Type: controller + Tab → creates full controller structure
defmodule MyAppWeb.UserController do
  use MyAppWeb, :controller
  
  # Type: action + Tab → creates action template
  def index(conn, _params) do
    # Type: render + Tab
    render(conn, :index)
  end
end
```

### **3. LiveView Development Snippets**

**LiveView Rapid Development**:
```elixir
# Type "liveview" + Tab
liveview  →  Complete LiveView module with mount and handle_event

# Type "mount" + Tab
mount  →  @impl true mount function template

# Type "handle_event" + Tab
handle_event  →  Event handler template

# Type "assign" + Tab
assign  →  assign(socket, key: value)

# Type "push_event" + Tab
push_event  →  push_event(socket, "event_name", %{})
```

**LiveView Development Workflow**:
```elixir
# Type: liveview + Tab
defmodule MyAppWeb.UserLive do
  use MyAppWeb, :live_view

  # Type: mount + Tab
  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, users: [])}
  end
  
  # Type: handle_event + Tab
  @impl true
  def handle_event("load_users", _params, socket) do
    # Type: assign + Tab
    {:noreply, assign(socket, users: MyApp.Accounts.list_users())}
  end
end
```

### **4. Ecto Schema & Query Snippets**

**Schema Development**:
```elixir
# Type "schema" + Tab
schema  →  Complete Ecto schema with changeset

# Type "field" + Tab
field  →  field :name, :string

# Type "belongs_to" + Tab
belongs_to  →  belongs_to :user, MyApp.User

# Type "has_many" + Tab
has_many  →  has_many :posts, MyApp.Post

# Type "changeset" + Tab
changeset  →  Complete changeset function
```

**Query Building**:
```elixir
# Type "from" + Tab
from  →  from u in User, select: u

# Type "where" + Tab  
where  →  where: u.active == true

# Type "preload" + Tab
preload  →  preload: :posts
```

### **5. GenServer & OTP Snippets**

**OTP Development Acceleration**:
```elixir
# Type "genserver" + Tab
genserver  →  Complete GenServer module with callbacks

# Type "gencall" + Tab
gencall  →  GenServer.call(server, message)

# Type "gencast" + Tab
gencast  →  GenServer.cast(server, message)
```

**GenServer Development Workflow**:
```elixir
# Type: genserver + Tab → creates full GenServer structure
defmodule MyApp.UserServer do
  use GenServer

  # Client API
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  # Server Callbacks
  @impl true
  def init(opts) do
    {:ok, %{}}  # ← cursor here for initial state
  end
  
  # Type: gencall + Tab for client functions
  # Type: gencast + Tab for async operations
end
```

### **6. Testing Snippets (ExUnit)**

**Test-Driven Development Acceleration**:
```elixir
# Type "test" + Tab
test  →  test "description" do template

# Type "describe" + Tab
describe  →  describe "feature" do block

# Type "assert" + Tab
assert  →  assert condition

# Type "assert_eq" + Tab
assert_eq  →  assert actual == expected

# Type "setup" + Tab
setup  →  setup do block for test preparation
```

**Testing Workflow**:
```elixir
# Type: describe + Tab
describe "user creation" do
  # Type: setup + Tab
  setup do
    {:ok, user: %User{name: "Test"}}
  end
  
  # Type: test + Tab
  test "creates user with valid params", %{user: user} do
    # Type: assert_eq + Tab
    assert user.name == "Test"
  end
end
```

### **7. Phoenix Router Snippets**

**Route Definition**:
```elixir
# Type "resources" + Tab
resources  →  resources "/users", UserController

# Type "get" + Tab
get  →  get "/path", Controller, :action

# Type "live" + Tab
live  →  live "/path", PageLive, :index
```

### **8. Common Elixir Patterns**

**Functional Programming Patterns**:
```elixir
# Type "pipe" + Tab
pipe  →  value |> function() template

# Type "case" + Tab
case  →  case expression do pattern matching template

# Type "with" + Tab  
with  →  with {:ok, value} <- function() do happy path

# Type "try" + Tab
try  →  try/rescue block for error handling
```

### **Complete Snippet Reference**

**Debugging**: `io`, `iop`, `dbg`, `log`
**Phoenix Controllers**: `controller`, `action`, `render`, `redirect`, `json`
**LiveView**: `liveview`, `mount`, `handle_event`, `assign`, `push_event`
**Ecto**: `schema`, `field`, `belongs_to`, `has_many`, `changeset`, `from`, `where`, `preload`
**OTP**: `genserver`, `gencall`, `gencast`
**Testing**: `test`, `describe`, `assert`, `assert_eq`, `setup`
**Router**: `resources`, `get`, `post`, `live`
**Patterns**: `pipe`, `case`, `with`, `try`

#### Advanced Snippet Strategies

### **The "Snippet-First" Phoenix Development**

**1. LiveView Development Pattern**:
```bash
# Start new LiveView:
1. liveview + Tab → create module structure
2. mount + Tab → set up initial state
3. handle_event + Tab → add interactivity
4. assign + Tab → manage state updates
```

**2. Context Development Pattern**:
```bash
# Build Phoenix context:
1. schema + Tab → define data structure
2. changeset + Tab → add validation
3. context + Tab → create CRUD operations
4. test + Tab → verify functionality
```

**3. GenServer Pattern**:
```bash
# Build OTP process:
1. genserver + Tab → create server structure
2. gencall + Tab → add synchronous operations
3. gencast + Tab → add asynchronous operations
4. test + Tab → verify behavior
```

### **Snippet Workflow Integration**

**With LSP Completion**:
```bash
# Snippets work alongside Elixir LSP:
1. Type snippet trigger (e.g., "liveview")
2. See snippet in completion menu
3. Tab to expand
4. Navigate with Tab/Shift-Tab
5. LSP provides module/function completions within snippet
```

**With AI Coding**:
```bash
# Combine snippets with Copilot:
1. Use snippet for boilerplate (liveview + Tab)
2. Select generated code
3. <leader>cee → Ask AI to enhance with Elixir best practices
4. <leader>ceo → Optimize for performance
5. <leader>cet → Generate comprehensive tests
```

---

## 🔍 Diagnostic Viewing: Comprehensive Elixir Code Analysis

Your setup provides multiple ways to view and fix Elixir code issues, leveraging the Elixir Language Server and additional tools:

### Elixir LSP Specific Diagnostics

With Lexical (or ElixirLS) enabled, you get comprehensive analysis for:

**Syntax Errors**:
- Missing `end` statements
- Unclosed parentheses/brackets  
- Invalid Elixir syntax
- Pattern matching issues

**Semantic Analysis**:
- Undefined functions/modules
- Unused variables and imports
- Type spec mismatches (with Dialyzer)
- Unreachable code

**Style and Formatting**:
- Code style violations (via Credo integration)
- Indentation issues
- Line length violations

**Phoenix-Specific Issues**:
- Missing imports in contexts
- Invalid route definitions
- Deprecated Phoenix methods
- LiveView state management issues

### Enhanced Diagnostic Commands

**Elixir-Specific LSP Features**:
```bash
<leader>ep  - Add pipe operator (Elixir code action)
<leader>es  - Convert to string interpolation
```

**Diagnostic Navigation**:
```bash
]d  - Next diagnostic (any severity)
[d  - Previous diagnostic
]e  - Next error only
[e  - Previous error only
```

**Comprehensive Diagnostic Views**:
```bash
<leader>le  - Show diagnostic popup at cursor
<leader>xd  - Document diagnostics in Trouble
<leader>xw  - Workspace diagnostics overview
<leader>fe  - Search diagnostics with Telescope
```

### Elixir Development Patterns with Diagnostics

**The "Clean Code" Workflow**:
```bash
# 1. Get project overview
<leader>xw          # See all workspace issues

# 2. Focus on compilation errors first
Filter by "error"   # In Trouble, focus on red errors

# 3. Address warnings systematically  
Filter by "warning" # Handle unused variables, dead code

# 4. Check code style
Run mix credo       # Via LSP integration
```

**Common Elixir LSP Diagnostics**:
```elixir
# Unused variable
def process(data, _unused) do  # Warning: unused parameter
  data.process
end

# Missing require  
GenServer.call(server, :msg)  # Error: GenServer not imported

# Pattern matching issues
{:ok, result} = {:error, reason}  # Warning: pattern will never match

# Phoenix-specific
def show(conn, %{"id" => id}) do
  user = Accounts.get_user(id)  # Warning: might be nil
  render(conn, :show, user: user)
end
```

---

## 🧪 Testing: Comprehensive ExUnit Integration

### ExUnit with Neotest

Your setup includes the `neotest-elixir` adapter for seamless test integration:

```bash
<leader>tf  - Test current file
<leader>tn  - Test nearest (under cursor)
<leader>ts  - Test entire suite
<leader>tl  - Re-run last test
<leader>tv  - Toggle test output panel
<leader>tS  - Toggle test summary
<leader>to  - Open test output
```

### Phoenix-Specific Testing

**LiveView Testing**:
```elixir
test "increments counter", %{conn: conn} do
  {:ok, view, html} = live(conn, "/counter")
  
  assert html =~ "Count: 0"
  
  view
  |> element("button", "Increment")
  |> render_click()
  
  assert render(view) =~ "Count: 1"
end
```

**Controller Testing**:
```elixir
test "GET /users", %{conn: conn} do
  user = insert(:user)
  
  conn = get(conn, ~p"/users")
  
  assert html_response(conn, 200) =~ user.name
end
```

**Context Testing**:
```elixir
describe "create_user/1" do
  test "with valid data creates a user" do
    valid_attrs = %{email: "test@example.com", name: "Test User"}
    
    assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
    assert user.email == "test@example.com"
  end
end
```

---

## 🐛 Debugging: Advanced Elixir Debug Support

### DAP Integration for Elixir

Your setup includes comprehensive debugging configurations:

```bash
<leader>db  - Toggle breakpoint
<leader>dc  - Continue execution
<leader>ds  - Step over
<leader>di  - Step into
<leader>do  - Step out
<leader>dr  - Open debug REPL
<leader>du  - Toggle debug UI
```

### Elixir-Specific Debug Commands

```bash
<leader>ed  - Debug nearest ExUnit test
<leader>eD  - Debug all tests
<leader>eP  - Debug Phoenix server
```

### IEx Integration

**Interactive Development**:
```bash
<leader>ic  - Open IEx console
# In IEx:
iex> recompile()           # Reload code changes
iex> MyApp.function()      # Test functions interactively
iex> :observer.start()     # GUI process monitor
```

**LiveBook Integration**:
```bash
<leader>il  - Start LiveBook server
# Access at http://localhost:8080
# Interactive notebooks for Elixir exploration
```

---

## ⚡ Essential Mix Commands: Your CLI Toolkit

### Terminal Integration

Your setup provides dedicated terminals for Elixir development:

```bash
<leader>ic  - IEx console (iex -S mix)
<leader>is  - Phoenix server (mix phx.server)
<leader>it  - Test runner (mix test --stale)
<leader>il  - LiveBook server
```

### Mix Task Integration

**Development Commands**:
```bash
<leader>mx  - Run custom Mix task
<leader>mt  - Run all tests
<leader>mf  - Test current file
<leader>mc  - Compile project
<leader>md  - Get dependencies (mix deps.get)
```

**Phoenix Generation**:
```bash
<leader>mg  - Generate LiveView (mix phx.gen.live)
<leader>mh  - Generate HTML context (mix phx.gen.html)
<leader>mj  - Generate JSON API (mix phx.gen.json)
```

**Database Operations**:
```bash
<leader>mn  - New migration (mix ecto.gen.migration)
<leader>mm  - Run migrations (mix ecto.migrate)
<leader>mr  - Rollback (mix ecto.rollback)
<leader>me  - Reset database (mix ecto.reset)
```

### When to Use Each Terminal

**Perfect Scenarios**:

1. **IEx Console** (`<leader>ic`): Interactive development, testing functions, exploring APIs
2. **Phoenix Server** (`<leader>is`): Local development server with live reloading
3. **Test Runner** (`<leader>it`): Continuous testing with file watching
4. **LiveBook** (`<leader>il`): Documentation, tutorials, data exploration

**Pro Workflow**: Working on a new Phoenix feature? Start with `<leader>is` for the server, `<leader>ic` for an IEx session to test functions interactively, and `<leader>it` to run tests continuously as you develop.

---

## 🤖 AI-Powered Elixir Development

### Elixir-Specific Copilot Commands

**Code Analysis (Visual Mode)**:
```bash
<leader>cee  - Elixir code explanation
<leader>ceo  - Elixir performance optimization
<leader>cet  - Generate ExUnit tests
<leader>cep  - OTP design review
<leader>cer  - Elixir refactoring
<leader>cel  - LiveView optimization
<leader>ceq  - Ecto query optimization
```

### Elixir AI Workflows

**LiveView Development with AI**:
```elixir
# Select LiveView code and press <leader>cel
defmodule MyAppWeb.UserLive do
  def handle_event("filter", %{"search" => search}, socket) do
    # AI suggests: optimizations for state management,
    # debouncing search input, and efficient filtering
  end
end
```

**OTP Design Review**:
```elixir
# Select GenServer code and press <leader>cep
defmodule MyApp.UserServer do
  # AI analyzes: supervision tree design,
  # state management patterns, error handling,
  # and concurrent access patterns
end
```

**Performance Optimization**:
```elixir
# Select query code and press <leader>ceq
users = 
  from u in User,
    join: p in assoc(u, :posts),
    where: p.published == true,
    select: u
# AI suggests: preloading strategies, query optimization,
# database indexing, and N+1 query prevention
```

---

## 🔧 Code Quality Tools

### Integrated Tools

Your setup includes comprehensive code quality tools:

**Formatting**:
- **mix format** - Automatic Elixir code formatting via LSP
- Configured to run on save

**Linting**:
- **Credo** - Elixir code analysis (via LSP integration)
- **Dialyzer** - Static type analysis (when configured)

**Testing**:
- **ExUnit** - Full test integration with Neotest
- **ExUnitProperties** - Property-based testing support

### Code Quality Workflow

**The "Quality Gate" Process**:
```bash
# Before committing:
1. mix format          # Format code (automatic on save)
2. mix credo --strict  # Check code quality
3. mix dialyzer        # Static analysis (if configured)
4. mix test            # Run all tests
5. <leader>xw          # Check LSP diagnostics
```

**Real-time Quality Feedback**:
- LSP provides instant feedback for syntax errors
- Credo integration shows style issues
- ExUnit runs tests on save
- Formatting happens automatically

---

## 🚀 Advanced Elixir Workflows

### Phoenix Feature Development

**The "Phoenix Context" Workflow**:
```bash
# 1. Design the context
mix phx.gen.context Accounts User users email:string name:string

# 2. Navigate and customize
<leader>es    # Jump to schema
<leader>eC    # Jump to context
<leader>et    # Jump to tests

# 3. Add controller and views
mix phx.gen.html Accounts User users email:string name:string

# 4. Navigate Phoenix files
<leader>ec    # Controller
<leader>ev    # Views/templates
<leader>eR    # Router (add routes)

# 5. Test everything
<leader>tn    # Test nearest
<leader>tf    # Test file
<leader>ts    # Test suite
```

### LiveView Feature Development

**The "LiveView TDD" Workflow**:
```bash
# 1. Create test first
<leader>et    # Jump to test file
# Type: test + Tab → create test structure

# 2. Generate LiveView
mix phx.gen.live Accounts User users email:string name:string

# 3. Navigate and develop
<leader>el    # LiveView module
<leader>ev    # LiveView templates

# 4. Test interactively
<leader>ic    # IEx console
<leader>is    # Phoenix server
<leader>tn    # Run tests
```

### OTP Application Development

**The "OTP Supervision" Workflow**:
```bash
# 1. Design GenServer
# Type: genserver + Tab → create server structure

# 2. Add to supervision tree
<leader>eE    # Jump to application

# 3. Test thoroughly
<leader>et    # Test file
# Type: describe + Tab → test GenServer behavior

# 4. Debug if needed
<leader>ed    # Debug tests
<leader>ic    # IEx for manual testing
```

---

## 📚 Learning and Documentation

### LiveBook Integration

**Interactive Learning**:
```bash
<leader>il    # Start LiveBook server
# Navigate to http://localhost:8080

# Features:
- Interactive Elixir notebooks
- Rich documentation
- Data visualization
- Kino widgets for UI
- Smart cells for common tasks
```

**Documentation Access**:
```bash
# In IEx:
h Enum.map          # Function documentation
i SomeStruct        # Inspect data structure
v GenServer         # Version and source info

# In LSP:
<leader>lh          # Hover documentation
<leader>ld          # Go to definition
```

### Exploration Workflow

**The "Discovery" Pattern**:
```bash
# 1. Start with LiveBook
<leader>il          # Interactive exploration

# 2. Move to IEx for testing
<leader>ic          # Console testing

# 3. Implement in code
<leader>ec          # Navigate to implementation

# 4. Document and test
<leader>et          # Add tests
```

---

## 🎯 Power User Combinations

### The "Full-Stack Phoenix" Setup

**Development Session Startup**:
```bash
# Terminal setup:
<leader>is          # Phoenix server (tab 1)
<leader>ic          # IEx console (tab 2)  
<leader>it          # Test runner (tab 3)
<leader>il          # LiveBook (tab 4)

# Navigate efficiently:
<leader>el          # LiveView files
<leader>ec          # Controllers
<leader>es          # Schemas
<leader>eC          # Contexts
```

### The "Testing Master" Workflow

**Comprehensive Testing**:
```bash
# Test-driven development:
<leader>et          # Create test file
# Type: describe + Tab → structure tests
# Type: test + Tab → individual tests

# Run tests efficiently:
<leader>tn          # Test under cursor
<leader>tf          # Current file
<leader>ts          # Full suite

# Debug failing tests:
<leader>ed          # Debug test
<leader>du          # Debug UI
```

### The "Performance Expert" Workflow

**Optimization Process**:
```bash
# 1. Identify bottlenecks
<leader>fe          # Search for performance issues
<leader>ceo         # AI performance analysis

# 2. Profile with tools
<leader>ic          # IEx for :observer.start()
<leader>il          # LiveBook for benchmarking

# 3. Optimize queries
<leader>ceq         # Ecto optimization suggestions
<leader>es          # Navigate to schemas

# 4. Test improvements
<leader>it          # Run performance tests
```

---

## 🛠️ Customization and Extension

### Adding Custom Mix Tasks

**Create New Snippets**:
```lua
-- In your snippets configuration:
luasnip.snippet("mytask", {
    luasnip.text_node("defmodule Mix.Tasks."),
    luasnip.insert_node(1, "MyTask"),
    luasnip.text_node({" do", "  use Mix.Task", "", "  def run(args) do", "    "}),
    luasnip.insert_node(2, "# implementation"),
    luasnip.text_node({"", "  end", "end"}),
})
```

### Custom Phoenix Generators

**Project-Specific Shortcuts**:
```bash
# Add to your keymaps:
vim.keymap.set("n", "<leader>mG", ":!mix phx.gen.live.my_custom_generator ", { desc = "Custom generator" })
```

---

This comprehensive Elixir and Phoenix setup transforms your Neovim into a powerhouse for functional programming, OTP development, and modern web applications. Every tool and keybinding is designed to work together, creating a seamless flow from idea to production-ready Elixir code.

**Time to explore**: Start with `<leader>il` to launch LiveBook, create a new Phoenix project with `<leader>mp`, and experience the future of Elixir development! 🧪✨