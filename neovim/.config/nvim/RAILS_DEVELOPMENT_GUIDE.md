# 🚀 The Ultimate Ruby on Rails Development Experience in Neovim

Welcome to a development environment that will transform how you write Ruby and Rails applications! This isn't just an editor—it's a carefully crafted ecosystem that anticipates your needs, accelerates your workflow, and makes coding genuinely enjoyable.

## 🎯 Why This Setup Will Change Your Life

Imagine having:
- **Instant file navigation** across massive Rails codebases
- **AI-powered code completion** that understands Rails conventions
- **Visual debugging** that rivals any IDE
- **Database exploration** without leaving your editor
- **Smart code actions** that refactor with confidence
- **Seamless terminal integration** for Rails commands

This setup delivers all of this and more, with keybindings so intuitive they become second nature.

---

## 🗺️ Navigation: Moving at the Speed of Thought

### Finding Files Like a Pro

Your Telescope integration transforms file discovery from a chore into a superpower:

```
<leader>ff  - Find any file in your project (including hidden files like .env)
<leader>fg  - Search text across your entire codebase
<leader>fa  - Find absolutely everything (ignores .gitignore)
<leader>fd  - Focus on current directory only
<leader>fb  - Jump between open buffers
```

**Pro Tip**: Use `<leader>ff` and start typing partial filenames. Looking for a user model? Type "user" and see `app/models/user.rb` instantly appear. Need that specific migration? Type "add_user" and find `20231215_add_user_index.rb` in milliseconds.

### Rails-Specific Navigation Magic

The real magic happens with Rails-aware navigation:

```
<leader>rv  - Jump between controller and view (the most used command!)
<leader>rm  - Go directly to the model
<leader>rg  - Jump to migrations
<leader>rV  - View all Rails routes
<leader>rS  - Examine your database schema
```

**Workflow Example**: You're in `users_controller.rb` editing the `show` action. Press `<leader>rv` and you're instantly in `users/show.html.haml`. Make your view changes, press `<leader>rv` again, and you're back in the controller. No more manual file hunting!

### Harpoon: Your Favorite Files at Your Fingertips

```
<leader>ma  - Add current file to harpoon
<leader>mh  - View your harpoon menu
<leader>1-4 - Jump instantly to your most-used files
```

**Power Move**: In any Rails project, harpoon your core files—maybe `routes.rb`, your main model, primary controller, and application layout. Now you can jump to any of them with a single keystroke.

### Marks: Bookmarking Your Code Journey

Marks are like bookmarks within and across files - perfect for Rails development where you frequently jump between related code sections.

```
ma-mz   - Set local marks (within current file)
mA-mZ   - Set global marks (across all files)
'a-'z   - Jump to local mark
'A-'Z   - Jump to global mark
''      - Jump back to previous position
'.      - Jump to last edit location
'^      - Jump to last insert location
```

#### Rails-Specific Mark Strategies

**Controller Development Pattern**:
```ruby
class UsersController < ApplicationController
  def index
    # Set mark 'i' here: mi
    @users = User.all
  end

  def show
    # Set mark 's' here: ms  
    @user = User.find(params[:id])
  end

  def create
    # Set mark 'c' here: mc
    @user = User.new(user_params)
    # Jump between actions: 'i, 's, 'c
  end
end
```

**Cross-File Rails Workflow**:
```bash
# Set strategic global marks across your Rails app:
mM  # In your main model (User.rb)
mC  # In your primary controller (UsersController)
mV  # In your main view (users/index.html.haml)
mT  # In your test file (user_spec.rb)
mR  # In routes.rb
mS  # In schema.rb

# Now jump instantly anywhere:
'M  # Jump to User model
'C  # Jump to Users controller
'V  # Jump to users view
'T  # Jump to tests
'R  # Jump to routes
'S  # Jump to schema
```

**Feature Development Marks**:
```bash
# When building a complex feature:
mF  # Mark the main feature file
mH  # Mark helper methods
mL  # Mark lib files
mI  # Mark initializer
mM  # Mark migration

# Jump through your feature implementation:
'F -> 'H -> 'L -> 'I -> 'M
```

#### Advanced Mark Techniques

**The "Investigation Trail"**:
```bash
# When debugging a Rails issue:
mi  # Mark where the issue occurs
md  # Mark debugging entry point  
mf  # Mark fix location
mt  # Mark test location

# Retrace your investigation: 'i -> 'd -> 'f -> 't
```

**Code Review Preparation**:
```bash
# Mark areas that need attention:
mr  # Code that needs refactoring
mt  # Missing tests
md  # Documentation needed
mp  # Performance concerns

# Systematically address each: 'r, 't, 'd, 'p
```

### Folds: Organizing Complex Rails Files

Folds let you collapse code sections to focus on what matters, essential for large Rails files.

```
zf{motion}  - Create fold (e.g., zfap for paragraph)
zd          - Delete fold under cursor
zD          - Delete all folds in current line
zo          - Open fold under cursor
zc          - Close fold under cursor
za          - Toggle fold under cursor
zR          - Open all folds in file
zM          - Close all folds in file
zj          - Move to next fold
zk          - Move to previous fold
```

#### Rails File Organization with Folds

**Large Model Files**:
```ruby
class User < ApplicationRecord
  # Associations {{{
  has_many :posts
  has_many :comments
  belongs_to :organization
  # }}}

  # Validations {{{
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :age, numericality: { greater_than: 0 }
  # }}}

  # Scopes {{{
  scope :active, -> { where(active: true) }
  scope :premium, -> { where(premium: true) }
  scope :recent, -> { where('created_at > ?', 1.week.ago) }
  # }}}

  # Instance Methods {{{
  def full_name
    "#{first_name} #{last_name}"
  end

  def avatar_url
    # implementation
  end
  # }}}

  # Class Methods {{{
  def self.find_by_email_or_username(identifier)
    # implementation
  end
  # }}}

  private

  # Private Methods {{{
  def normalize_email
    # implementation
  end
  # }}}
end

# Use zM to collapse all sections, then zo to open what you need
# Navigate with zj/zk between folded sections
```

**Controller Organization**:
```ruby
class UsersController < ApplicationController
  # Filters and Setup {{{
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # }}}

  # CRUD Actions {{{
  def index
    # implementation
  end

  def show
    # implementation  
  end

  def create
    # implementation
  end
  # }}}

  # Custom Actions {{{
  def activate
    # implementation
  end

  def deactivate
    # implementation
  end
  # }}}

  private

  # Private Methods {{{
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
  # }}}
end
```

**Migration Files**:
```ruby
class CreateComplexUserSystem < ActiveRecord::Migration[7.0]
  def up
    # User Table {{{
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
    # }}}

    # Indexes {{{
    add_index :users, :email, unique: true
    add_index :users, [:first_name, :last_name]
    # }}}

    # Foreign Keys {{{
    add_foreign_key :posts, :users
    add_foreign_key :comments, :users
    # }}}
  end

  def down
    # Rollback {{{
    drop_table :users
    # }}}
  end
end
```

#### Automatic Folding Strategies

**Method-Based Folding**:
```vim
" In your Neovim config, set up automatic folding
set foldmethod=indent
set foldlevel=1

" This automatically folds based on indentation
" Perfect for Ruby's consistent indentation
```

**Syntax-Based Folding**:
```bash
# Treesitter can create intelligent folds
# Automatically fold methods, classes, blocks
# Navigate with zj/zk between logical code sections
```

#### Rails Development Fold Workflows

**The "Code Review" Workflow**:
```bash
# Open a large Rails file
zM          # Collapse everything
# See file structure at a glance
zo          # Open sections you're reviewing
zj/zk       # Jump between folded sections
```

**The "Refactoring" Workflow**:
```bash
# In a complex controller
zM          # Collapse all methods
# Identify which methods are too long (visible even when folded)
zo          # Open method to refactor
# Work on one method at a time
zc          # Close when done, move to next
```

**The "Learning" Workflow**:
```bash
# When exploring a new Rails codebase
zM          # Collapse everything
# Get high-level view of file organization
zj          # Jump through major sections
zo          # Open sections relevant to your task
```

**The "Feature Development" Workflow**:
```bash
# Working on a new feature
zM          # Collapse existing code
# Focus only on the sections you're modifying
zo          # Open relevant methods/sections
# Keep context minimal and focused
```

### Combining Marks and Folds for Ultimate Rails Productivity

#### The "Rails Architecture Explorer" Pattern

```bash
# Set up your exploration session:
mM  # Mark model file
mC  # Mark controller  
mV  # Mark view
mT  # Mark test

# In each file, use folds strategically:
'M  # Jump to model
zM  # Collapse all sections
zo  # Open associations section
mA  # Mark interesting association

'C  # Jump to controller
zM  # Collapse all methods
zj  # Jump through actions
mo  # Mark complex action

'T  # Jump to test
zM  # Collapse all test groups
zo  # Open relevant test group
```

#### The "Bug Hunt" Pattern

```bash
# When tracking down a Rails bug:
1. Set marks at each investigation point:
   mi  # Mark where issue manifests
   ms  # Mark suspected cause
   mt  # Mark test that should catch this

2. Use folds to focus:
   'mi -> zM -> zo  # Focus on issue area
   'ms -> zM -> zo  # Focus on suspected code
   'mt -> zM -> zo  # Focus on test logic

3. Navigate efficiently:
   ''  # Jump back to previous position
   '.  # Jump to last edit
   'mi # Return to issue location
```

#### The "Feature Implementation" Pattern

```bash
# Building a complex Rails feature:
1. Mark your implementation checkpoints:
   mm  # Migration
   mo  # Model changes
   mc  # Controller implementation  
   mv  # View updates
   mt  # Test coverage

2. Use folds to maintain focus:
   'mm -> zM -> zo  # Focus on schema changes
   'mo -> zM -> zo  # Focus on model logic
   'mc -> zM -> zo  # Focus on controller action

3. Track progress:
   - Jump between marks to verify consistency
   - Use folds to hide completed sections
   - Maintain clean mental model of changes
```

### Power User Mark and Fold Combinations

#### Rapid Context Switching

```bash
# Save your current context:
mm  # Mark current position

# Quickly investigate something else:
/some_method<CR>  # Search for method
# Do investigation work

# Return instantly:
'mm  # Back to where you were
zo   # Open the fold if needed
```

#### Code Organization Sessions

```bash
# Start of coding session - set up your workspace:
zM          # Collapse everything
mS          # Mark session start point

# As you work:
- Use local marks (ma-mz) for temporary navigation
- Use folds to hide distracting code
- Use global marks (mA-mZ) for cross-file jumps

# End of session:
'S          # Return to session start
zR          # Open all folds (clean slate)
```

#### Rails Convention Navigation

```bash
# Navigate Rails apps by convention:
mI  # app/models (I for Instance)
mA  # app/controllers (A for Actions)  
mV  # app/views (V for Views)
mH  # app/helpers (H for Helpers)
mL  # lib/ (L for Library)
mC  # config/ (C for Config)
mD  # db/ (D for Database)
mS  # spec/ or test/ (S for Specs)

# Jump through Rails architecture:
'I -> 'A -> 'V -> 'H -> 'L -> 'C -> 'D -> 'S
```

### UFO: Next-Generation Code Folding

UFO (nvim-ufo) provides intelligent, modern folding capabilities that far exceed Vim's basic folding. It uses Treesitter and LSP information to create semantic folds.

```bash
# Core UFO Commands
zR          - Open ALL folds in buffer
zM          - Close ALL folds in buffer  
zr          - Open folds except certain kinds
zm          - Close folds with specific criteria
zp          - Peek inside fold (or show hover if not a fold)
zO          - Close other folds, open current only
[z          - Go to previous fold (centered)
]z          - Go to next fold (centered)

# Standard fold commands still work:
za          - Toggle current fold
zo          - Open current fold
zc          - Close current fold
zj          - Move to next fold
zk          - Move to previous fold
```

#### Advanced UFO Features

**1. Semantic Folding**
UFO understands code structure through Treesitter and LSP:
```ruby
class UsersController < ApplicationController
  # UFO creates intelligent folds for:
  # - Entire class definition
  # - Each method definition  
  # - Conditional blocks
  # - Loop constructs
  # - Comment blocks
end
```

**2. Fold Preview with `zp`**
Instead of opening a fold, peek inside without losing context:
```bash
# Cursor on a folded method
zp  # Shows method contents in floating window
    # If not on fold, shows LSP hover info
    # Navigate preview with Ctrl-u/Ctrl-d
    # Press [ or ] to jump in preview
```

**3. Custom Fold Text**
UFO shows helpful information in fold lines:
```ruby
# Standard Vim folding might show:
def create_user # +12 lines

# UFO shows:
def create_user  󰁂 12  # Shows icon + line count
```

**4. Fold Column Integration**
UFO displays fold levels in the fold column (left gutter):
- Shows fold depth visually
- Click to toggle folds
- Hover for fold information

#### Rails-Specific UFO Workflows

**Large Model Management**:
```ruby
class User < ApplicationRecord
  # UFO automatically folds sections:
  
  # Associations {{{
  has_many :posts
  has_many :comments
  belongs_to :organization
  # }}} # This entire block can be folded
  
  # Validations {{{
  validates :email, presence: true
  validates :name, presence: true
  # }}} # Folded to one line
  
  # Methods are automatically foldable by UFO
  def complex_calculation
    # Long implementation
    # UFO folds this entire method
  end
end

# Workflow:
zM    # Collapse everything - see class structure
zr    # Open top-level folds (associations, validations)
]z    # Jump to next major section
zp    # Peek at method implementations
```

**Controller Organization**:
```ruby
class UsersController < ApplicationController
  # UFO intelligently folds:
  
  before_action :authenticate_user!  # Can be part of setup fold
  before_action :set_user, only: [:show, :edit]
  
  def index  # Entire method folds
    @users = User.all.includes(:posts)
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end  # UFO shows: def index  󰁂 6
  
  def show  # Another foldable method
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end
  
  private  # UFO can fold entire private section
  
  def set_user
    @user = User.find(params[:id])
  end
end

# UFO Workflow:
zM         # See all method signatures at once
zp         # Peek at method implementation
]z         # Jump between methods
zO         # Close all other folds, focus on current method
```

**Migration File Navigation**:
```ruby
class CreateComplexUserSystem < ActiveRecord::Migration[7.0]
  def up  # UFO folds entire method
    create_table :users do |t|  # This block is foldable
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
    
    add_index :users, :email, unique: true  # Individual statements
    add_index :users, [:first_name, :last_name]
    
    # UFO can fold comment blocks
    # This is a long explanation
    # of what this migration does
    # and why it's structured this way
    
    add_foreign_key :posts, :users
  end  # Shows: def up  󰁂 15
  
  def down  # Another foldable method
    drop_table :users
  end
end
```

**Spec File Organization**:
```ruby
RSpec.describe User, type: :model do  # Entire describe block folds
  context 'validations' do  # Context blocks fold
    it 'requires an email' do  # Individual test folds
      user = User.new(name: 'John')
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end  # Shows: it 'requires an email'  󰁂 4
    
    it 'requires a unique email' do
      existing_user = create(:user, email: 'test@example.com')
      user = User.new(email: 'test@example.com')
      expect(user).to_not be_valid
    end
  end  # Shows: context 'validations'  󰁂 12
  
  context 'associations' do
    # More tests
  end
end  # Shows: RSpec.describe User  󰁂 25

# UFO Testing Workflow:
zM    # See test structure overview
]z    # Jump between contexts
zp    # Peek at test implementation
zr    # Open contexts, keep tests folded
```

#### Advanced UFO Techniques

**1. Conditional Folding**
```bash
# Open folds except certain types:
zr    # Might open classes but keep methods folded
      # UFO is smart about what to show

# Close folds with specific criteria:
zm    # Progressive folding - close based on complexity
```

**2. Fold-Aware Navigation**
```bash
# UFO enhances fold navigation:
[z    # Previous fold (auto-centers screen)
]z    # Next fold (auto-centers screen)
zj    # Jump down through fold hierarchy
zk    # Jump up through fold hierarchy
```

**3. Preview Navigation**
```bash
# When using zp to preview:
Ctrl-u    # Scroll up in preview
Ctrl-d    # Scroll down in preview
[         # Jump to start of preview content
]         # Jump to end of preview content
Esc       # Close preview
```

**4. Multi-Level Folding**
```ruby
class ComplexService
  def process  # Level 1 fold
    users.each do |user|  # Level 2 fold
      if user.active?  # Level 3 fold
        send_notification(user)
        update_status(user)
      end
    end
  end
end

# Navigate levels:
zM    # Close all levels
zr    # Open level 1 (see method signatures)
zr    # Open level 2 (see loop structures)  
zr    # Open level 3 (see conditionals)
```

#### UFO + Marks Powerful Combinations

**Code Review with UFO + Marks**:
```bash
# Set up review session:
zM          # Fold everything
mr          # Mark current review position
]z          # Jump to next major section
zp          # Peek at implementation
mo          # Mark if needs work
]z          # Continue through code
'r          # Return to review start
```

**Refactoring Session**:
```bash
# Before refactoring:
zM          # See class structure
mf          # Mark method to refactor
]z          # Survey other methods
'f          # Return to target method
zO          # Focus only on this method
# Refactor with full context
```

**Learning New Codebase**:
```bash
# Systematic exploration:
zM          # High-level view
zr          # Open major sections
]z          # Jump through sections
zp          # Preview without commitment
ml          # Mark interesting methods
# Build mental map efficiently
```

#### UFO Performance Benefits

**Memory Efficiency**: UFO only computes folds for visible content
**Speed**: Treesitter-based folding is fast and responsive  
**Context**: Preserves editing context while navigating
**Intelligence**: Understands Rails patterns and conventions

#### Customizing UFO for Rails

Your UFO configuration is optimized for Rails development:
- **Treesitter + LSP**: Best fold detection for Ruby code
- **Custom fold text**: Shows helpful line counts and icons
- **Peek functionality**: Quick code inspection without losing place
- **Rails-aware**: Understands Ruby/Rails syntax patterns

UFO transforms code navigation from linear scrolling to semantic jumping, making large Rails codebases manageable and enjoyable to work with.

---

## 🔍 Code Intelligence: Your AI-Powered Coding Assistant

### Code Snippets: Turbocharge Your Rails Development

Code snippets are your secret weapon for writing Rails code at lightning speed. Think of them as intelligent templates that expand into full code blocks with just a few keystrokes.

```bash
# Core Snippet Commands
Ctrl-k    - Expand snippet or jump to next placeholder
Ctrl-j    - Jump back to previous placeholder
Tab       - In some contexts, expand snippet (via completion)
```

#### Essential Rails Snippet Categories

### **1. Debugging & Inspection Snippets**

**The Most Used Rails Snippets**:
```ruby
# Type "pry" + Ctrl-k
pry  →  require 'pry'; binding.pry

# Type "dbg" + Ctrl-k  
dbg  →  require 'debug'; debugger

# Type "pp" + Ctrl-k
pp   →  puts variable.inspect  # cursor on 'variable'

# Type "log" + Ctrl-k
log  →  Rails.logger.info "Debug message"  # cursor on message
```

**Pro Debugging Workflow**:
```ruby
def complex_method
  # Type: pry + Ctrl-k for instant breakpoint
  user = User.find(params[:id])
  # Type: pp + Ctrl-k, then type 'user' to inspect
  puts user.inspect
  
  # Continue with logic...
end
```

### **2. Model Development Snippets**

**Associations Made Easy**:
```ruby
# Type "has_many" + Ctrl-k
has_many  →  has_many :association  # cursor on 'association'

# Type "belongs_to" + Ctrl-k  
belongs_to  →  belongs_to :association

# Type "val" + Ctrl-k
val  →  validates :attribute, presence: true
```

**Real Model Building Workflow**:
```ruby
class User < ApplicationRecord
  # Type: belongs_to + Ctrl-k → belongs_to :organization
  belongs_to :organization
  
  # Type: has_many + Ctrl-k → has_many :posts  
  has_many :posts
  
  # Type: val + Ctrl-k → validates :email, presence: true
  validates :email, presence: true
  # Ctrl-k jumps to next field, type: uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  # Type: scope + Ctrl-k
  scope :active, -> { where(active: true) }
end
```

### **3. Controller Action Snippets**

**Rapid Controller Development**:
```ruby
class UsersController < ApplicationController
  # Type: before + Ctrl-k
  before_action :authenticate_user!
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      # Type: redirect + Ctrl-k
      redirect_to @user, notice: 'User created successfully'
    else  
      # Type: render + Ctrl-k
      render :new, status: :unprocessable_entity
    end
  end
  
  # Type: private + Ctrl-k (creates private section)
  private
  
  def user_params
    # Type: strong + Ctrl-k  
    params.require(:user).permit(:name, :email)
  end
end
```

### **4. Migration Snippets**

**Database Changes at Speed**:
```ruby
# Type: migration + Ctrl-k
class AddEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    # Type: add_column + Ctrl-k
    add_column :users, :email, :string
  end
end

# Type: create_table + Ctrl-k
create_table :posts do |t|
  t.string :title
  t.text :content
  t.timestamps
end
```

### **5. Route Definition Snippets**

**Routes Configuration**:
```ruby
Rails.application.routes.draw do
  # Type: resources + Ctrl-k
  resources :users
  
  # Type: get + Ctrl-k  
  get 'dashboard', to: 'pages#dashboard'
  
  # Type: post + Ctrl-k
  post 'contact', to: 'contact#create'
end
```

### **6. Testing Snippets (RSpec)**

**Test-Driven Development Acceleration**:
```ruby
# Type: describe + Ctrl-k
describe 'User authentication' do
  # Type: context + Ctrl-k
  context 'when user is valid' do
    # Type: let + Ctrl-k
    let(:user) { create(:user) }
    
    # Type: it + Ctrl-k
    it 'should authenticate successfully' do
      # Type: expect + Ctrl-k
      expect(user.valid?).to eq(true)
    end
  end
end

# Type: factory + Ctrl-k (in factories file)
factory :user do
  name { 'John Doe' }
  email { 'john@example.com' }
end
```

### **7. Rails Console Snippets**

**Interactive Development**:
```ruby
# In Rails console:
# Type: reload! + Ctrl-k
reload!

# Type: User.find + Ctrl-k  
User.find(1)

# Type: where + Ctrl-k
User.where(active: true)
```

#### Advanced Snippet Strategies

### **The "Snippet-First" Development Approach**

**1. Model Development Pattern**:
```bash
# Start new model:
1. val + Ctrl-k → add validations quickly
2. has_many + Ctrl-k → define associations  
3. scope + Ctrl-k → add common queries
4. def + Ctrl-k → custom methods
```

**2. Controller TDD Pattern**:
```bash
# Write controller action:
1. before + Ctrl-k → add filters
2. strong + Ctrl-k → parameter filtering
3. redirect + Ctrl-k → success case
4. render + Ctrl-k → error handling
```

**3. Testing First Pattern**:
```bash
# Write tests rapidly:
1. describe + Ctrl-k → test group
2. context + Ctrl-k → scenarios
3. let + Ctrl-k → test data
4. it + Ctrl-k → individual tests
5. expect + Ctrl-k → assertions
```

### **Snippet Workflow Integration**

**With LSP Completion**:
```bash
# Snippets work alongside LSP:
1. Type snippet trigger (e.g., "val")
2. See snippet in completion menu
3. Tab or Ctrl-k to expand
4. Use Ctrl-k/Ctrl-j to navigate placeholders
5. LSP provides method/class completions within snippet
```

**With AI Coding**:
```bash
# Combine snippets with CodeCompanion:
1. Use snippet for boilerplate (val + Ctrl-k)
2. Select generated code
3. <leader>cf → Ask AI to enhance/refactor
4. Iterate quickly between snippets and AI suggestions
```

### **Custom Snippet Development**

**Creating Your Own Rails Snippets**:
```lua
-- Add to your snippets.lua file:
luasnip.snippet("controller", {
    luasnip.text_node("class "),
    luasnip.insert_node(1, "Name"),
    luasnip.text_node({"Controller < ApplicationController", "  def index", "    "}),
    luasnip.insert_node(2, "# TODO"),
    luasnip.text_node({"", "  end", "end"}),
}),
```

**Snippet Design Principles**:
1. **Frequency**: Snippet what you type most often
2. **Placeholders**: Use insert nodes for customizable parts  
3. **Context**: Make snippets context-aware
4. **Consistency**: Follow Rails conventions in snippets

### **Team Snippet Strategies**

**Shared Rails Patterns**:
```bash
# Create team-wide snippets for:
- Company-specific authentication patterns
- Standard API response formats  
- Common validation patterns
- Project-specific debugging helpers
- Standard factory definitions
```

### **Snippet Performance Tips**

**Memory Efficient Usage**:
```bash
# Snippets are lazy-loaded
# Only active when needed
# No performance impact on startup
# Fast expansion and navigation
```

**Muscle Memory Development**:
```bash
# Practice common patterns:
1. val → validates (most used in models)
2. pry → debugging (most used everywhere)
3. strong → params (every controller action)
4. expect → testing (every spec)
5. let → test setup (every describe block)
```

### **Real-World Rails Development Flow**

**Building a Feature with Snippets**:
```bash
# 1. Model (app/models/post.rb)
belongs_to :user     # belongs_to + Ctrl-k
val :title           # val + Ctrl-k → validates :title, presence: true
scope :published     # scope + Ctrl-k

# 2. Controller (app/controllers/posts_controller.rb)  
before :auth         # before + Ctrl-k → before_action :authenticate_user!
strong params        # strong + Ctrl-k → params.require(:post).permit(...)
redirect success     # redirect + Ctrl-k → redirect_to @post, notice: '...'

# 3. Routes (config/routes.rb)
resources :posts     # resources + Ctrl-k

# 4. Tests (spec/models/post_spec.rb)
describe 'Post'      # describe + Ctrl-k
let user            # let + Ctrl-k → let(:user) { create(:user) }
expect valid        # expect + Ctrl-k → expect(post.valid?).to eq(true)
```

**Time Savings**:
- **90% less typing** for common Rails patterns
- **Faster muscle memory** than remembering full syntax
- **Consistent code style** across team
- **Reduced syntax errors** from templates
- **Focus on logic** instead of boilerplate

Snippets transform Rails development from typing-heavy to thought-heavy, letting you focus on solving problems rather than remembering syntax!

### GitHub Copilot: Your Rails-Aware Partner

**Now powered by codecompanion.nvim** - A superior AI experience that uses your existing Copilot subscription but provides enhanced chat capabilities, agents, and Rails-specific workflows.

```
<leader>cc  - Toggle CodeCompanion Chat (persistent conversations)
<leader>ca  - CodeCompanion Action Palette (pre-built prompts)
<leader>ci  - Inline CodeCompanion (direct buffer editing)
<leader>ce  - Add to CodeCompanion Chat
<leader>cs  - New CodeCompanion Chat session
<leader>cl  - Load previous chat session
```

### Rails-Specific AI Workflows

**Specialized Rails Commands**:
```
<leader>cr  - Rails best practices review (visual mode)
<leader>ct  - Generate Rails tests (visual mode)  
<leader>cf  - Refactor Rails code (visual mode)
<leader>cm  - Generate Rails migration
```

### Agentic Coding with CodeCompanion

**The Game-Changer**: CodeCompanion transforms from simple autocomplete to an agentic coding assistant:

1. **Persistent Chat Sessions** - Conversations continue across sessions
2. **Multiple Chat Windows** - Work on different features simultaneously  
3. **File Context Integration** - Reference files directly in conversations
4. **Agents and Tools** - LLM can execute actions like running tests, editing files
5. **Rails-Aware Prompts** - Built-in understanding of Rails conventions

### Understanding Agentic AI: Your Autonomous Coding Partner

**What Makes It "Agentic"?**

Traditional AI assistants provide suggestions. Agentic AI takes *action*. CodeCompanion can:
- **Execute terminal commands** to run tests, start servers, or install gems
- **Edit multiple files** simultaneously across your Rails application
- **Navigate your codebase** to understand context and relationships
- **Apply changes** based on test results and error feedback
- **Iterate on solutions** until they work correctly

### Core Agentic Features

#### 1. **Autonomous Code Execution**
```bash
# You can say to CodeCompanion:
"Run the test suite and fix any failing tests"

# The agent will:
1. Execute: bundle exec rspec
2. Analyze failing tests
3. Identify root causes
4. Edit relevant files
5. Run tests again
6. Repeat until tests pass
```

#### 2. **Multi-File Refactoring**
```bash
# Request: "Extract this method into a service object"
# The agent will:
1. Create app/services/user_service.rb
2. Move method logic to the service
3. Update the controller to use the service
4. Update related tests
5. Ensure all references are updated
```

#### 3. **Context-Aware Problem Solving**
```bash
# Agent maintains context across conversations:
- Remembers previous discussions about your codebase
- Understands your Rails app structure
- Knows your coding patterns and preferences
- Can reference earlier solutions
```

#### 4. **Iterative Development**
```bash
# Agent can work through complex problems:
1. "Let's add user authentication to this Rails app"
2. Agent analyzes current state
3. Plans authentication strategy
4. Implements step-by-step
5. Tests each step
6. Adjusts based on results
```

### Advanced Agentic Workflows

#### **The "Feature Development" Agent**
```bash
# Command: "Implement password reset functionality"

# Agent's autonomous workflow:
1. Analyze existing user model and authentication
2. Generate password reset migration
3. Add routes for password reset
4. Create controller actions
5. Generate views (email, reset form)
6. Add mailer for reset emails
7. Write comprehensive tests
8. Run test suite and fix any issues
9. Update documentation
```

#### **The "Bug Investigation" Agent**
```bash
# Command: "Fix the N+1 query issue in the users index"

# Agent's autonomous workflow:
1. Analyze the users controller
2. Identify N+1 queries using includes/joins
3. Examine related models and associations
4. Implement optimized queries
5. Run performance tests
6. Verify memory usage improvements
7. Update related views if needed
```

#### **The "Code Quality" Agent**
```bash
# Command: "Refactor this controller to follow Rails best practices"

# Agent's autonomous workflow:
1. Analyze controller complexity
2. Identify violations of Rails conventions
3. Extract service objects for complex logic
4. Implement proper error handling
5. Add missing validations
6. Update tests to match new structure
7. Ensure all tests pass
```

### Rails-Specific Agentic Capabilities

#### **Database Operations**
```bash
# The agent can:
- Analyze your schema and suggest improvements
- Generate migrations based on model changes
- Optimize database queries automatically
- Handle data migrations safely
- Update seeds and fixtures
```

#### **Test Generation and Maintenance**
```bash
# The agent can:
- Generate comprehensive RSpec tests
- Update tests when code changes
- Create factory definitions
- Generate integration tests
- Maintain test data consistency
```

#### **Security and Performance**
```bash
# The agent can:
- Identify security vulnerabilities
- Implement proper authorization
- Optimize slow queries
- Add caching strategies
- Update gems and handle deprecations
```

### Using Agents with Tools

#### **Available Tools**
- **@cmd_runner** - Execute terminal commands
- **@file_editor** - Edit files directly
- **@rails_console** - Interact with Rails console
- **@test_runner** - Run and analyze tests
- **@git_helper** - Git operations and analysis
- **@docs_generator** - Generate documentation

#### **Tool Combinations**
```bash
# Example: "Set up a new Rails feature with tests"
# Agent uses multiple tools:

@file_editor: Create new controller
@cmd_runner: Generate migration
@rails_console: Test data relationships
@test_runner: Run new tests
@git_helper: Commit changes
@docs_generator: Update API docs
```

### Advanced Agent Prompting

#### **Contextual Instructions**
```bash
# Instead of: "Fix this code"
# Use: "Refactor this Rails controller following DRY principles, 
#       extracting common patterns into private methods, 
#       and ensuring proper error handling"
```

#### **Multi-Step Workflows**
```bash
# Complex request example:
"I need to add API versioning to this Rails app. 
 Please:
 1. Set up v1 and v2 API namespaces
 2. Move existing API endpoints to v1
 3. Create v2 with enhanced responses
 4. Add proper documentation
 5. Ensure backward compatibility
 6. Add integration tests for both versions"
```

#### **Continuous Improvement**
```bash
# The agent learns from your codebase:
- Understands your architectural patterns
- Follows your naming conventions
- Maintains your code style
- Respects your testing approach
- Adapts to your Rails configuration
```

### Agent Supervision and Control

#### **Approval Workflows**
```bash
# For safety, agents can ask for approval:
- Before running destructive commands
- When making significant architectural changes
- Before committing code to git
- When installing new dependencies
```

#### **Monitoring Agent Actions**
```bash
# You can:
- See all agent actions in real-time
- Interrupt long-running operations
- Review changes before applying
- Rollback agent modifications
- Guide agent decision-making
```

### Best Practices for Agentic Development

#### **1. Clear Problem Definition**
```bash
# Good: "Add user roles (admin, moderator, user) with proper authorization"
# Bad: "Make users better"
```

#### **2. Incremental Requests**
```bash
# Start with: "Add basic user authentication"
# Then: "Add role-based permissions"
# Finally: "Add admin dashboard for user management"
```

#### **3. Context Preservation**
```bash
# Reference previous work:
"Building on the authentication system we just added, 
 now implement password complexity requirements"
```

#### **4. Verification Steps**
```bash
# Always include: "Run the full test suite and fix any failures"
# This ensures agent changes don't break existing functionality
```

### Enhanced Rails Workflow
```ruby
# Select problematic code and press <leader>cr
def create
  @user = User.new(params[:user])
  @user.save
end

# CodeCompanion with Rails expertise suggests:
def create
  @user = User.new(user_params)
  
  if @user.save
    redirect_to @user, notice: 'User was successfully created.'
  else
    render :new, status: :unprocessable_entity
  end
end

private

def user_params
  params.require(:user).permit(:name, :email)
end
```

**Advanced Features**:
- **Slash Commands**: `/rails`, `/test`, `/migrate`, `/refactor`
- **Variables**: Inject dynamic content like `{{selection}}`, `{{buffer}}`
- **Workflows**: Pre-configured automation sequences
- **Multiple Models**: Switch between different AI models as needed

### LSP: Intelligent Code Understanding

Your Ruby LSP provides IDE-level intelligence:

```
<leader>ld  - Go to definition (jump to method definitions)
<leader>lr  - Find all references (where is this method used?)
<leader>lh  - Hover for documentation
<leader>la  - Code actions (automatic fixes and refactoring)
<leader>lc  - Rename symbol across entire codebase
<leader>lf  - Format code to Ruby standards
```

**Mind-Blowing Example**: Cursor on a method name, press `<leader>lr`, and see every place that method is called across your entire Rails app. Press `<leader>lc` to rename it everywhere at once.

---

## 🌳 Treesitter Text Objects: Code Structure Mastery

### Understanding Your Code's Anatomy

Treesitter text objects transform how you select, navigate, and manipulate code by understanding its semantic structure. Instead of working with raw text, you work with logical code components like functions, classes, and parameters.

### Smart Selection: Beyond Words and Lines

```
af  - Select entire function (outer)      | if  - Select function body (inner)
ac  - Select entire class (outer)         | ic  - Select class body (inner)
al  - Select entire loop (outer)          | il  - Select loop body (inner)
aa  - Select parameter with comma (outer) | ia  - Select parameter only (inner)
ab  - Select entire block (outer)         | ib  - Select block contents (inner)
ad  - Select conditional (outer)          | id  - Select conditional body (inner)
ar  - Select return statement (outer)     | ir  - Select return value (inner)
as  - Select statement (outer)            | is  - Select statement inner (inner)
```

### Rails-Specific Text Object Examples

**Working with Controller Actions**:
```ruby
class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end
end

# Cursor anywhere in the create method:
# vaf - Select the entire method including 'def' and 'end'
# vif - Select just the method body
# cif - Change the method body
# daf - Delete the entire method
```

**Manipulating Model Validations**:
```ruby
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { minimum: 2 }
end

# Cursor on validates line:
# vas - Select the entire statement
# das - Delete the validation
# cas - Change the validation
```

**Working with Rails Blocks**:
```ruby
User.where(active: true).each do |user|
  user.send_notification
  user.update(last_seen: Time.current)
end

# Cursor anywhere in the block:
# vab - Select entire block including 'do' and 'end'
# vib - Select just the block contents
# dab - Delete the entire block
# cab - Change the block contents
```

### Navigation: Jump Through Code Structure

```
]m  - Next method start                   | [m  - Previous method start
]M  - Next method end                     | [M  - Previous method end
]]  - Next class start                    | [[  - Previous class start
][  - Next class end                      | []  - Previous class end
]l  - Next loop start                     | [l  - Previous loop start
]L  - Next loop end                       | [L  - Previous loop end
]a  - Next parameter                      | [a  - Previous parameter
]d  - Next conditional                    | [d  - Previous conditional
```

### Rails Navigation Patterns

**Controller Navigation**:
```ruby
class UsersController < ApplicationController
  def index
    # ]m brings you here from above
  end

  def show
    # ]m brings you here from index
  end

  def create
    # ]m brings you here from show
  end
end

# Start at the top, press ]m repeatedly to jump through all actions
# Use [m to go backwards through actions
```

**Model Method Jumping**:
```ruby
class User < ApplicationRecord
  def full_name
    # [m from here goes to previous method
  end

  def avatar_url
    # ]m from full_name brings you here
  end

  def send_welcome_email
    # ]m from avatar_url brings you here
  end
end
```

### Code Reorganization: Swap and Rearrange

```
<leader>na  - Swap current parameter with next
<leader>pa  - Swap current parameter with previous
<leader>nf  - Swap current function with next
<leader>pf  - Swap current function with previous
```

### Rails Refactoring Examples

**Reordering Method Parameters**:
```ruby
def create_user(name, email, age, role)
  # Cursor on 'email' parameter
  # <leader>na swaps email and age
  # Result: create_user(name, age, email, role)
end
```

**Reordering Controller Actions**:
```ruby
class UsersController < ApplicationController
  def show
    # <leader>nf swaps show and create methods
  end

  def create
    # Methods get swapped automatically
  end
end
```

**Reordering Model Methods**:
```ruby
class User < ApplicationRecord
  def send_email
    # <leader>nf moves this method down
  end

  def full_name  # This method moves up
    "#{first_name} #{last_name}"
  end
end
```

### Advanced Text Object Workflows

### The "Extract Method" Pattern

```ruby
# Original messy controller action:
def create
  @user = User.new(params[:user])
  @user.email = params[:user][:email].downcase
  @user.role = 'member' if @user.role.blank?
  
  if @user.save
    UserMailer.welcome(@user).deliver_now
    redirect_to @user
  else
    render :new
  end
end

# 1. Select validation logic with text objects:
# vib (select block contents) on the assignment lines
# 2. Cut with 'x'
# 3. Create new private method
# 4. Paste and refactor
```

### The "Conditional Extraction" Pattern

```ruby
# Complex conditional:
if user.active? && user.premium? && user.subscription_valid?
  # Complex logic here
end

# 1. Select the conditional: vid (inner conditional)
# 2. Extract to a method: user.can_access_premium_features?
# 3. Replace original condition
```

### Rails Template Text Objects

**Working with ERB/HAML**:
```erb
<% @users.each do |user| %>
  <div class="user-card">
    <%= user.name %>
    <%= user.email %>
  </div>
<% end %>

# Text objects work in templates too:
# vab - Select the entire each block
# vil - Select the inner loop contents
# ]l  - Jump to next loop
```

### Testing with Text Objects

**RSpec Example Navigation**:
```ruby
describe User do
  context 'validations' do
    it 'requires an email' do
      # ]d jumps to next describe/context/it
    end

    it 'requires a unique email' do
      # [d jumps to previous describe/context/it
    end
  end
end

# Navigate through test structure:
# ]] - Next describe block
# [[ - Previous describe block
# ]d - Next it/context block
```

### Performance Tips for Large Rails Files

**Quick File Navigation**:
```ruby
# In a large model file:
class User < ApplicationRecord
  # 50+ methods...

# Use ]] to jump to next class (end of file)
# Use ]m repeatedly to scan through all methods
# Use /method_name to search, then ]m to see the next one
```

### Power User Combinations

**The "Refactor Method" Combo**:
```bash
# 1. Jump to method: ]m
# 2. Select entire method: vaf
# 3. Copy it: y
# 4. Jump to destination: ]m (or wherever)
# 5. Paste: p
# 6. Go back and delete original: <C-o> then daf
```

**The "Extract Validation" Combo**:
```bash
# In a model with complex validations:
# 1. Select validation: vas
# 2. Cut it: x
# 3. Jump to private methods: ]m until you reach private
# 4. Create new method and paste
```

**The "Reorganize Controller" Combo**:
```bash
# Reorder controller actions to follow Rails conventions:
# 1. Jump to each action: ]m
# 2. Swap actions as needed: <leader>nf
# 3. Result: index, show, new, create, edit, update, destroy
```

---

## 🧪 Testing: Making TDD Effortless

### Neotest: Visual Test Running

```
<leader>tf  - Run all tests in current file
<leader>tn  - Run the test under your cursor
<leader>ts  - Run your entire test suite
<leader>tl  - Re-run the last test
<leader>tv  - Toggle test output panel
<leader>tS  - Show test summary
<leader>to  - Open detailed test output
```

**TDD Workflow**: Write a failing test, press `<leader>tn` to run just that test. See it fail. Write the code. Press `<leader>tn` again. Watch it pass. The instant feedback loop keeps you in flow state.

**Visual Magic**: Neotest shows test status directly in your code with icons. Green checkmarks for passing tests, red X's for failures. You can see your test coverage at a glance.

---

## 🐛 Debugging: X-Ray Vision for Your Code

### DAP: Professional Debugging Experience

```
<leader>db  - Toggle breakpoint (the red dot appears in the gutter)
<leader>dc  - Continue execution
<leader>ds  - Step over (next line)
<leader>di  - Step into (dive into methods)
<leader>do  - Step out (back to caller)
<leader>du  - Toggle the visual debug UI
<leader>de  - Evaluate any expression
```

**Rails-Specific Debugging**:
```
<leader>rd  - Debug the RSpec test under your cursor
<leader>rD  - Debug all tests in the current file
```

**Debugging Superpowers**: Set a breakpoint in your controller action with `<leader>db`. Start debugging with `<leader>rd`. When code hits your breakpoint, you get a visual interface showing:
- All local variables and their values
- The call stack (how you got here)
- The ability to evaluate any Ruby expression
- Step-by-step execution control

**Pro Debugging Scenario**: Your user creation is failing. Set a breakpoint in the `create` action, debug the test, and when it hits your breakpoint, press `<leader>de` and type `params` to see exactly what data was submitted. Type `@user.errors` to see validation failures. No more `puts` debugging!

---

## 🗄️ Database: Explore Your Data Visually

### Dadbod: Database Explorer

```
<leader>md  - Toggle the database UI
```

**Database Superpowers**: The database UI gives you:
- **Visual schema exploration**: See all tables, columns, and relationships
- **Query interface**: Write and execute SQL directly
- **Data browsing**: Click through your data like a native app
- **Connection management**: Connect to different environments

**Rails Workflow**: Building a feature and need to understand the data model? Press `<leader>md`, explore your tables visually, run queries to understand the data, then jump back to coding with perfect context.

---

## 🎨 Code Quality: Automatic Excellence

### Formatting and Linting

Your code automatically stays clean and consistent:

```
<leader>lf  - Format current file with RuboCop
<leader>dr  - Refresh diagnostics (run all linters)
```

**Automatic Magic**: As you code, RuboCop, HAML-lint, and other tools automatically highlight style issues. Your code gets formatted to Ruby community standards without thinking about it.

**Rails-Specific Quality**:
- ERB templates get properly formatted
- HAML indentation stays perfect
- Ruby code follows Rails conventions
- SQL in your migrations is properly formatted

---

## 🚂 Rails Commands: Terminal Integration Done Right

### Smart Terminal Management

```
<leader>rc  - Rails console in a floating terminal
<leader>rs  - Rails server in a split terminal
<leader>rt  - Run any Rake task
<leader>xf  - Floating terminal for any command
<leader>xh  - Horizontal terminal split
<leader>xv  - Vertical terminal split
```

### When to Use Rails Console

**Perfect Scenarios for `<leader>rc`**:

1. **Data Exploration**: `User.where(created_at: 1.week.ago..)` 
2. **Testing Code**: Copy a method from your model and test it interactively
3. **Debugging Production Issues**: Reproduce the exact conditions
4. **Learning**: Experiment with Rails methods without writing throwaway files
5. **Quick Fixes**: Update data directly when appropriate

**Pro Console Workflow**: Working on a user authentication feature? Press `<leader>rc`, create a test user: `user = User.create!(email: 'test@example.com', password: 'password')`, test your authentication logic interactively, then implement it in your code with confidence.

### Server Management

**Development Workflow**: Press `<leader>rs` to start your Rails server in a split. See your server logs in real-time while coding. No more switching between terminal windows or losing log output.

---

## 📁 File Management: Organized and Efficient

### Oil: File Explorer Reimagined

```
<leader>e   - Float file explorer
<leader>eh  - Horizontal split explorer  
<leader>ev  - Vertical split explorer
-           - Quick parent directory access
```

**File Operations**: Oil lets you create, rename, and organize files like a native file manager, but with Vim motions. Need to create a new controller? Press `<leader>e`, navigate to `app/controllers/`, press `%` to create a new file, and you're coding immediately.

---

## 🔧 Error Management & Code Quality: Master Your Linting Workflow

### Trouble: Your Error Command Center

Trouble transforms error and warning management from a frustrating hunt into a systematic workflow. Think of it as your "mission control" for code quality.

```
<leader>xx  - Show all diagnostics across the project
<leader>xX  - Show diagnostics for current file only
<leader>xs  - Show code symbols (classes, methods, etc.)
<leader>xl  - Show LSP references and definitions
<leader>xQ  - Show quickfix list (from searches, etc.)
<leader>xL  - Show location list
```

### The Power of Systematic Error Fixing

**The Trouble Workflow**:

1. **Press `<leader>xx`** - See ALL errors and warnings across your Rails app
2. **Navigate with `j/k`** - Move through the list
3. **Press `<CR>`** - Jump directly to the problematic code
4. **Fix the issue** - Use LSP actions with `<leader>la`
5. **Press `<leader>xx`** again - See your progress in real-time

**Pro Tip**: Use `<leader>xX` when you want to focus on just the current file's issues, perfect for systematic cleanup.

### Rails-Specific Error Scenarios

**RuboCop Violations Made Easy**:
```bash
# You have 15 style violations across your Rails app
# Press <leader>xx to see them all organized
# Jump through each one systematically
# Many can be auto-fixed with <leader>la (code actions)
```

**HAML Template Issues**:
```bash
# HAML-lint finds indentation problems
# <leader>xx shows exact line numbers
# Jump directly to each issue
# Fix with proper HAML indentation
```

**Database Migration Problems**:
```bash
# Schema inconsistencies show up in diagnostics
# <leader>xx reveals all migration issues
# Jump to each migration file
# Fix schema problems systematically
```

### Advanced Trouble Techniques

**Filter by Severity**:
- In Trouble window, press `f` to filter by severity
- Focus on errors first, then warnings
- Tackle issues by priority

**Bulk Operations**:
- Select multiple issues in Trouble
- Apply fixes across multiple files
- Perfect for large refactoring sessions

**Integration with LSP**:
- `<leader>xl` shows method definitions and references
- Perfect for understanding code relationships
- Use when refactoring affects multiple files

### Quick Fix List Integration

The quickfix list works seamlessly with Trouble for advanced workflows:

```
<leader>xQ  - View quickfix in Trouble interface
:copen      - Traditional quickfix window
:cnext      - Next quickfix item
:cprev      - Previous quickfix item
:cfirst     - First quickfix item
:clast      - Last quickfix item
```

**Powerful Search-to-Fix Workflow**:
```bash
# Search for all TODO comments
<leader>fg  # Search for "TODO"
# Results go to quickfix list
<leader>xQ  # View in Trouble
# Systematically address each TODO
```

**Find and Replace Pattern**:
```bash
# Find deprecated Rails methods
<leader>fg  # Search for "find_by_sql"
<leader>xQ  # See all occurrences
# Jump to each and refactor to modern Rails
```

---

## � Session Management: Vim Obsession for Rails Development

### Never Lose Your Development Context

Vim Obsession automatically saves and restores your entire Neovim session, including open files, window layouts, cursor positions, and more. This is incredibly powerful for Rails development where you often work with multiple related files across the MVC architecture.

```
<leader>ob  - Toggle Obsession (start/stop session tracking)
:Obsession  - Start tracking session (saves to Session.vim)
:Obsession! - Stop tracking session
```

### Rails-Specific Session Patterns

**The "Feature Development" Session**:
```bash
# When starting work on a new Rails feature:
1. Open your core files:
   - Model: app/models/user.rb
   - Controller: app/controllers/users_controller.rb  
   - View: app/views/users/index.html.haml
   - Test: spec/models/user_spec.rb
   - Routes: config/routes.rb

2. Arrange windows optimally:
   - Vertical split with model and controller
   - Horizontal split for tests
   - Terminal at bottom for Rails console/server

3. Start Obsession: <leader>ob
   # Your entire workspace is now automatically saved
```

**The "Bug Investigation" Session**:
```bash
# When debugging a complex Rails issue:
1. Open relevant files across the stack:
   - Error logs
   - Failing controller action
   - Related model methods
   - Database migration files
   - Test files that expose the bug

2. Set up debugging layout:
   - Main editing window
   - Terminal for Rails console
   - Log files in splits
   - Test output visible

3. Start Obsession: <leader>ob
   # Return to exact same debugging context tomorrow
```

### Automatic Session Management

**Session Persistence**:
- Obsession automatically saves your session every time you make changes
- Includes all open buffers, window sizes, and cursor positions
- Preserves terminal states and working directories
- Maintains fold states and marks

**Restoration Workflow**:
```bash
# Return to your Rails project
cd ~/projects/my-rails-app
nvim -S Session.vim
# Everything exactly as you left it:
# - Same files open
# - Same window layout  
# - Same cursor positions
# - Same folds and marks
```

### Advanced Session Strategies

**Multiple Rails Projects**:
```bash
# Each Rails project gets its own session
cd ~/projects/rails-app-1
nvim
<leader>ob  # Start session for app-1

cd ~/projects/rails-app-2  
nvim
<leader>ob  # Separate session for app-2

# Switch between projects seamlessly
# Each maintains its own context
```

**Feature-Specific Sessions**:
```bash
# Create named sessions for different features
:Obsession features/authentication.vim
:Obsession features/user-management.vim  
:Obsession features/payment-system.vim

# Load specific feature context
nvim -S features/authentication.vim
```

**Context Switching Mastery**:
```bash
# Working on multiple Rails features simultaneously:
1. Feature A session: authentication work
   - User model open
   - Sessions controller
   - Authentication tests
   - Devise configuration

2. Feature B session: payment integration
   - Payment model
   - Stripe controller  
   - Payment tests
   - API documentation

# Switch contexts instantly without losing progress
```

### Rails Development Session Templates

**New Feature Template**:
```bash
# Standard Rails feature development setup:
Files typically open:
- app/models/[feature].rb
- app/controllers/[feature]_controller.rb
- app/views/[feature]/
- spec/models/[feature]_spec.rb
- spec/controllers/[feature]_controller_spec.rb
- config/routes.rb

Windows arranged:
- Left: Model and controller (vertical split)
- Right: Tests (vertical split)
- Bottom: Terminal (horizontal split)
```

**Debugging Session Template**:
```bash
# Bug investigation and fixing setup:
Files typically open:
- Failing code files
- Related test files
- Log files (development.log)
- Database schema or migrations
- Documentation or API references

Windows arranged:
- Main: Code being debugged
- Side: Tests and logs
- Bottom: Rails console and server output
```

**Code Review Template**:
```bash
# Code review and refactoring setup:
Files typically open:
- Files under review
- Related context files
- Test coverage reports
- Documentation files

Windows arranged:
- Focus on code being reviewed
- Reference materials in splits
- Notes and TODO tracking
```

### Integration with Other Tools

**With Git Workflows**:
```bash
# Before switching Git branches:
<leader>ob  # Ensure session is saved

# After branch switch:
nvim -S Session.vim  # Restore context for new branch work
```

**With Rails Server/Console**:
```bash
# Obsession preserves terminal states:
- Rails server running in background terminal
- Rails console session with loaded data
- Test runners in watch mode
- Database connections maintained
```

**With Debugging Sessions**:
```bash
# Debugging context preservation:
- Breakpoints remain set
- Debug watches maintained  
- Variable inspection windows
- Call stack examination state
```

### Session Management Best Practices

**Daily Development Workflow**:
```bash
# Start of day:
cd my-rails-project
nvim -S Session.vim  # Resume exactly where you left off

# During development:
<leader>ob           # Ensure session tracking is active
# Work normally - everything auto-saves

# End of day:
# Just close Neovim - session is already saved
```

**Session Hygiene**:
```bash
# Periodically clean up sessions:
:Obsession!          # Stop current session
:!rm Session.vim     # Remove old session
<leader>ob           # Start fresh session

# Useful when project structure changes significantly
```

**Backup Strategies**:
```bash
# Create session snapshots for important milestones:
:Obsession backup/before-refactor.vim
:Obsession backup/feature-complete.vim
:Obsession backup/pre-deployment.vim
```

### Troubleshooting Sessions

**Common Issues and Solutions**:

**Files moved or renamed**:
```bash
# Session tries to open non-existent files
# Solution: Clean up session manually or start fresh
:Obsession!
:!rm Session.vim
<leader>ob
```

**Plugin conflicts**:
```bash
# Some plugins don't restore properly
# Solution: Restart session after plugin updates
<leader>ob  # Stop
<leader>ob  # Start fresh
```

**Large sessions**:
```bash
# Too many open buffers slow down restoration
# Solution: Periodic session cleanup
:bufdo bd   # Close unnecessary buffers
<leader>ob  # Save cleaner session
```

### Power User Session Techniques

**Session Scripting**:
```bash
# Create custom session initialization
# In Session.vim, add custom commands:
# :Rails console &
# :Rails server &
# :split | terminal
```

**Session Sharing**:
```bash
# Share debugging context with team members
# Copy Session.vim to shared location
# Team member can reproduce exact environment
```

**Session Analytics**:
```bash
# Track development patterns
# Analyze which files you work with most
# Optimize your Rails workflow based on session data
```

Vim Obsession transforms Rails development from constantly reconstructing your workspace to seamlessly continuing where you left off. It's like having a perfect memory of your development context, allowing you to focus on code instead of setup.

---

## �🚀 Workflow Optimization: Advanced Rails Development Patterns

### The "Feature Branch" Workflow

**Starting a New Feature**:
```bash
# 1. Explore the codebase first
<leader>ff  # Find related files
<leader>fg  # Search for similar implementations
<leader>rv  # Jump between MVC components

# 2. Set up your workspace
<leader>ma  # Harpoon key files (model, controller, view, test)
<leader>1-4 # Quick access to your core files

# 3. Check code quality baseline
<leader>xx  # See current errors (fix these first!)
```

### The "Red-Green-Refactor" Enhanced

**Test-First Development with Visual Feedback**:
```bash
# Write failing test
<leader>tn  # Run test (see red)
# Implement minimal code
<leader>tn  # Run test (see green)
# Refactor with confidence
<leader>xx  # Check for new issues
<leader>lf  # Format code
<leader>ts  # Run full suite
```

### The "Database-First" Design Pattern

**Understanding Your Data Model**:
```bash
# Start with database exploration
<leader>md  # Open database UI
# Explore relationships and constraints
# Plan your models based on actual data
<leader>rS  # Check current schema
# Design migrations thoughtfully
```

### The "Documentation-Driven" Development

**Using Copilot for Better Documentation**:
```bash
# Select complex method
<leader>cD  # Generate documentation (visual mode)
# Ask Copilot about patterns
<leader>cc  # "Explain this Rails pattern"
# Generate comprehensive tests
<leader>ct  # Generate tests for selection
```

### Advanced File Management Patterns

**Project Organization Mastery**:
```bash
# Create related files efficiently
<leader>e   # Open Oil file manager
# Navigate to app/controllers/
%           # Create new file (Oil keybinding)
# Follow Rails conventions automatically

# Bulk file operations
<leader>eh  # Horizontal split for file management
# Rename, move, organize files visually
```

### Performance Monitoring Workflow

**Keeping Your Rails App Fast**:
```bash
# Monitor server performance
<leader>rs  # Start Rails server in split
# Watch logs in real-time
# Identify N+1 queries immediately

# Use console for performance testing
<leader>rc  # Rails console
# Test query performance: 
# Benchmark.measure { User.includes(:posts).limit(100) }
```

### Git Integration Workflow

**Smart Version Control**:
```bash
# Before committing, clean up
<leader>xx  # Fix all linting issues
<leader>ts  # Run full test suite
<leader>lf  # Format all changed files

# Use Telescope for git workflow
<leader>fg  # Search for "FIXME" or "TODO"
# Clean up before committing
```

### Environment-Specific Development

**Managing Multiple Rails Environments**:
```bash
# Database per environment
<leader>md  # Switch between dev/test/prod databases
# Different connection strings
# Verify data in each environment

# Console per environment
<leader>rc  # RAILS_ENV=development rails console
# Test environment-specific behavior
```

### Debugging Complex Rails Issues

**Systematic Debugging Approach**:
```bash
# 1. Reproduce the issue
<leader>tn  # Write a failing test first

# 2. Set strategic breakpoints
<leader>db  # In controller action
<leader>db  # In model method
<leader>db  # In view helper

# 3. Debug the test
<leader>rd  # Debug RSpec test
# Step through execution
<leader>ds  # Step over
<leader>di  # Step into methods
<leader>de  # Evaluate expressions

# 4. Verify the fix
<leader>tn  # Test passes
<leader>ts  # Full suite passes
<leader>xx  # No new errors
```

### Code Review Preparation

**Before Creating Pull Requests**:
```bash
# 1. Self-review checklist
<leader>xx  # Zero linting errors
<leader>ts  # All tests pass
<leader>lf  # Code properly formatted

# 2. Documentation check
<leader>fg  # Search for TODO/FIXME
<leader>cD  # Generate missing docs

# 3. Performance check
<leader>rc  # Test in Rails console
# Verify query performance
# Check memory usage patterns
```

---

## 🎢 Putting It All Together: A Day in the Life

Let's walk through building a feature to see how everything connects:

### 1. 🎯 Planning Phase
```bash
# Press <leader>rc to open Rails console
User.count  # Check current data
# Press <leader>rV to view routes
# Press <leader>rS to check schema
```

### 2. 🔍 Exploration Phase
```bash
# Press <leader>ff, type "user" to find user-related files
# Press <leader>rv to jump between controller and views
# Press <leader>rm to examine the User model
```

### 3. 🧪 TDD Phase
```bash
# Write your test first
# Press <leader>tn to run the test (watch it fail)
# Implement the feature
# Press <leader>tn again (watch it pass!)
```

### 4. 🤖 AI-Assisted Development
```bash
# Press <leader>cc and ask: "How should I structure this validation?"
# Get Rails-specific advice from Copilot
# Use suggestions with <Tab>
```

### 5. 🐛 Debugging Phase
```bash
# Press <leader>db to set a breakpoint
# Press <leader>rd to debug your test
# Use <leader>de to evaluate expressions
# Press <leader>dc to continue execution
```

### 6. 🗄️ Data Verification
```bash
# Press <leader>md to open database UI
# Verify your data changes visually
# Run queries to confirm behavior
```

### 7. ✨ Polish Phase
```bash
# Press <leader>lf to format your code
# Press <leader>la for code actions and refactoring
# Press <leader>ts to run full test suite
```

---

## 🚀 Advanced Power User Tips

### 1. **Harpoon Your Workspace**
At the start of each feature, harpoon your key files:
- The main model (`<leader>ma`)
- Primary controller (`<leader>ma`) 
- Main view file (`<leader>ma`)
- Related test file (`<leader>ma`)

Now use `<leader>1-4` to jump instantly between them.

### 2. **Copilot Pair Programming**
Use Copilot Chat as your pair programming partner:
- "What edge cases should I consider for this method?"
- "How can I make this more performant?"
- "What's the Rails convention for this pattern?"

### 3. **Database-Driven Development**
Use the database UI to understand existing data before coding:
- Explore relationships visually
- Run queries to understand data patterns
- Verify your changes immediately

### 4. **Visual Debugging Mastery**
Set conditional breakpoints with `<leader>dB`:
```ruby
# Only break when user.admin? is true
# Only break when params[:id] == '123'
```

### 5. **Test-Driven Exploration**
Use tests to explore Rails features:
- Write a test for Rails behavior you're unsure about
- Run it to see what happens
- Learn Rails by testing your assumptions

---

## 🎉 The Result: Development Nirvana

With this setup, you're not just writing Rails applications—you're *crafting* them with precision, confidence, and joy. Every keystroke is intentional, every workflow is optimized, and every tool works in harmony.

You'll find yourself:
- **Moving faster** through codebases
- **Making fewer mistakes** thanks to visual feedback
- **Learning more** through AI assistance and exploration tools
- **Enjoying coding more** because the tools don't get in your way
- **Delivering better software** through superior testing and debugging

This isn't just a development environment—it's a force multiplier for your Ruby and Rails expertise. Welcome to the future of development! 🚀

---

## 📚 Quick Reference Card

### Essential Daily Commands
```bash
<leader>ff  # Find files          | <leader>rv  # Controller/View toggle
<leader>fg  # Find text           | <leader>rc  # Rails console  
<leader>tn  # Test nearest        | <leader>db  # Debug breakpoint
<leader>cc  # Copilot Chat        | <leader>lf  # Format code
<leader>e   # File explorer       | <leader>md  # Database UI
<leader>xx  # All errors/warnings | <leader>xX  # File errors only
```

### Code Quality Commands
```bash
<leader>xx  # All diagnostics     | <leader>la  # Code actions
<leader>xX  # Current file only   | <leader>lc  # Rename symbol
<leader>xQ  # Quickfix list       | <leader>lr  # Find references
<leader>xl  # LSP definitions     | <leader>ld  # Go to definition
```

### Treesitter Navigation & Selection
```bash
]m / [m     # Next/prev method     | vaf / vif   # Select function
]] / [[     # Next/prev class      | vac / vic   # Select class
]l / [l     # Next/prev loop       | val / vil   # Select loop
]a / [a     # Next/prev parameter  | vaa / via   # Select parameter
<leader>na  # Swap param next      | <leader>nf  # Swap function next
```

**Remember**: Press `<leader>` and wait—Which-Key will show you all available options with descriptions. You're never lost!

---

*Now go forth and build amazing Rails applications with the power of modern tooling at your fingertips!* ⚡
