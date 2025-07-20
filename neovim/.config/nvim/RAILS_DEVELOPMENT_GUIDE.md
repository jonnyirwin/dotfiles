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
<leader>ff  - Find files (includes hidden files, respects gitignore)
<leader>fi  - Find files (includes ignored files)
<leader>fg  - Search text across your entire codebase (includes hidden files)
<leader>fa  - Find all files (ignores gitignore completely)
<leader>fd  - Focus on current directory only
<leader>fb  - Jump between open buffers
<leader>fh  - Find help tags
```

**Pro Tip**: Your configuration now shows hidden files by default while respecting `.gitignore` for performance. Type `<leader>ff` and start typing partial filenames. Looking for `.env.example`? It appears immediately. Need that `.rubocop.yml` config? Telescope finds it instantly.

**Enhanced Hidden File Support**: Unlike basic setups, your Telescope configuration intelligently handles hidden files - showing useful ones like `.env`, `.rubocop.yml`, and `.github/workflows/` while ignoring performance-heavy directories like `.git/` contents.

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

---

## 🚂 Vim-Rails: The Ultimate Rails Integration

Your setup includes **vim-rails** by Tim Pope, which transforms Neovim into a Rails-native editor. This isn't just syntax highlighting—it's deep Rails understanding.

### **Intelligent File Navigation**

**The `:R` command family** - Navigate Rails files by convention:
```bash
:R              # Related file (controller ↔ view, model ↔ test)
:A              # Alternate file (implementation ↔ test)
:Rcontroller    # Jump to controller
:Rmodel         # Jump to model  
:Rview          # Jump to view
:Rmigration     # Jump to migration
:Rspec          # Jump to spec file
```

**Context-Aware Commands**:
```bash
# From anywhere in your Rails app:
:Ruser          # Opens app/models/user.rb
:Ruser!         # Creates app/models/user.rb if it doesn't exist
:RSuser         # Opens user.rb in horizontal split
:RVuser         # Opens user.rb in vertical split
:RTuser         # Opens user.rb in new tab
```

### **Rails-Aware Gf (Go to File)**

**Enhanced `gf` command** - Press `gf` on Rails references:
```ruby
# Press 'gf' on any of these:
User            # → app/models/user.rb
UsersController # → app/controllers/users_controller.rb
'users/show'    # → app/views/users/show.html.erb
partial 'form'  # → app/views/users/_form.html.erb
```

### **Automatic File Type Detection**

**Smart file recognition**:
- Detects Rails file types automatically
- Sets appropriate syntax highlighting
- Configures buffer-local settings
- Enables Rails-specific commands

### **Command Integration**

**Rails command shortcuts**:
```bash
:Rails console  # Start Rails console
:Rails server   # Start Rails server  
:Rails generate # Run Rails generators
:Rails dbconsole # Database console
:Rake          # Run rake tasks with completion
```

### **Enhanced Syntax & Highlighting**

**Rails-specific syntax support**:
- ERB templates with Ruby highlighting
- HAML with proper indentation
- Rails keywords and methods
- Association and validation highlighting
- Route syntax recognition

### **Projectionist Integration**

**Custom file relationships** (via vim-projectionist):
```json
{
  "app/models/*.rb": {
    "type": "model",
    "alternate": "spec/models/{}_spec.rb"
  },
  "app/controllers/*_controller.rb": {
    "type": "controller", 
    "alternate": "spec/controllers/{}_controller_spec.rb"
  }
}
```

### **RSpec Integration**

**vim-rspec commands** (configured with vim-dispatch):
```bash
:RunCurrentSpecFile    # Run current spec file
:RunNearestSpec        # Run spec under cursor
:RunLastSpec           # Re-run last spec
:RunAllSpecs           # Run entire suite
```

**Your configuration runs tests asynchronously** using vim-dispatch, so you can continue coding while tests run in the background!

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

**3. Clean Fold Text**
UFO shows streamlined information in fold lines:
```ruby
# Your configuration shows clean fold indicators:
def create_user  󰁂   # Clean icon without line counts
```

**4. Fold Column Integration**
UFO displays fold levels with triangle icons:
- **▼** - Open fold (expanded)
- **►** - Closed fold (collapsed)
- Click triangles to toggle folds
- Clear visual hierarchy

#### Manual Folding with Comments

You can create **custom fold regions** using special comments that work perfectly with Rails code organization:

```ruby
class User < ApplicationRecord
  # Associations {{{
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts
  belongs_to :organization, optional: true
  # }}}

  # Validations {{{
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { minimum: 2 }
  validates :age, numericality: { greater_than: 0 }, allow_nil: true
  # }}}

  # Scopes {{{
  scope :active, -> { where(active: true) }
  scope :premium, -> { where(subscription_type: 'premium') }
  scope :recent, -> { where('created_at > ?', 1.week.ago) }
  # }}}

  # Instance Methods {{{
  def full_name
    "#{first_name} #{last_name}"
  end

  def avatar_url(size: :medium)
    # Avatar logic here
  end
  # }}}

  # Class Methods {{{
  def self.find_by_email_or_username(identifier)
    where('email = ? OR username = ?', identifier, identifier).first
  end
  # }}}

  private

  # Private Methods {{{
  def normalize_email
    self.email = email.downcase.strip if email.present?
  end
  # }}}
end
```

**Manual Folding Commands:**
```bash
# Create folds
zf{motion}  # Create fold (e.g., zfap for paragraph, zf} for to closing brace)
zfa{        # Fold everything inside braces
zfat        # Fold HTML/XML tag contents

# The {{{ and }}} markers
# - Automatically create folds between matching markers
# - Perfect for organizing large Rails files
# - Work with any indentation level
# - Can be nested for complex organization
```

**Rails File Organization Strategy:**
```ruby
# In controllers - organize by responsibility
class UsersController < ApplicationController
  # Setup & Filters {{{
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  # }}}

  # CRUD Actions {{{
  def index
    # ...
  end

  def show
    # ...
  end
  # }}}

  # Custom Actions {{{
  def activate
    # ...
  end
  # }}}

  private

  # Private Methods {{{
  def set_user
    # ...
  end
  # }}}
end
```

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
  def complex_calculation  󰁂
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
  
  def index  󰁂  # Entire method folds cleanly
    @users = User.all.includes(:posts)
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end
  
  def show  󰁂  # Another foldable method
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
  end  # Shows: def up  󰁂
  
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
    end  # Shows: it 'requires an email'  󰁂
    
    it 'requires a unique email' do
      existing_user = create(:user, email: 'test@example.com')
      user = User.new(email: 'test@example.com')
      expect(user).to_not be_valid
    end
  end  # Shows: context 'validations'  󰁂
  
  context 'associations' do
    # More tests
  end
end  # Shows: RSpec.describe User  󰁂

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

Code snippets are your secret weapon for writing Rails code at lightning speed. Your setup includes comprehensive Rails snippets from multiple sources: **friendly-snippets**, **vim-snippets**, and **custom Rails-specific snippets**.

```bash
# Core Snippet Commands
Ctrl-k    - Expand snippet or jump to next placeholder
Ctrl-j    - Jump back to previous placeholder
```

#### **Essential Rails Snippet Categories**

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

# Type "scope" + Ctrl-k
scope  →  scope :name, -> { where(active: true) }
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

### **6. Testing Snippets (RSpec & Factory Bot)**

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

# Type: create + Ctrl-k (in tests)
create(:user)

# Type: build + Ctrl-k (in tests)
build(:user)
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

### **Complete Snippet Reference**

**Debugging**: `pry`, `dbg`, `pp`, `log`
**Models**: `val`, `has_many`, `belongs_to`, `scope`
**Controllers**: `before`, `private`, `strong`, `redirect`, `render`
**Routes**: `resources`, `get`, `post`
**Migrations**: `migration`, `add_column`, `create_table`
**Testing**: `describe`, `context`, `it`, `expect`, `let`, `factory`, `create`, `build`
**Console**: `reload!`, `User.find`, `where`

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

**Dual-plugin setup** - Your configuration uses both official GitHub Copilot for fast inline suggestions and CopilotChat.nvim for conversational AI assistance.

### **Inline Suggestions (Insert Mode)**
```
Ctrl+Y        - Accept full suggestion (most used)
Ctrl+Right    - Accept next word only
Ctrl+Shift+Right - Accept current line
Alt+[         - Previous suggestion
Alt+]         - Next suggestion  
Ctrl+E        - Dismiss suggestion
Ctrl+\        - Manual trigger
```

### **Chat & Management (Normal Mode)**
```
<leader>cc  - Toggle Copilot Chat
<leader>cr  - Reset Chat
<leader>cs  - Copilot Setup
<leader>c?  - Copilot Status
<leader>cp  - Copilot Panel
<leader>cE  - Enable Copilot
<leader>cD  - Disable Copilot
```

### **Code Analysis (Visual Mode)**
```
<leader>ce  - Explain selected code
<leader>cf  - Fix issues in selection
<leader>co  - Optimize performance
<leader>cd  - Add documentation
<leader>ct  - Generate tests
<leader>cR  - Comprehensive code review
```

### Rails-Specific AI Workflows

**Specialized Rails Commands (Visual Mode)**:
```
<leader>cre - Rails-focused explanation
<leader>cro - Rails performance optimization  
<leader>crt - Generate RSpec tests
<leader>crs - Rails security review
<leader>crr - Rails refactoring suggestions
```

### Enhanced Chat Experience

**Beautiful Interface**: CopilotChat features enhanced visuals with Nerd Font icons:
- **Headers**: ` User ` and ` Copilot ` with clean styling
- **Window Title**: ` Copilot Chat ` with helpful footer
- **Rails-Aware Prompts**: Pre-built prompts understand Rails conventions

### Rails Development Example Workflow

```ruby
# Select problematic code and press <leader>cf
def create
  @user = User.new(params[:user])
  @user.save
end

# Copilot with Rails expertise suggests:
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

**Powerful Chat Capabilities**:
- **Context-aware conversations** about your Rails codebase
- **Code explanations** tailored to Rails patterns
- **Performance optimization** with Rails-specific suggestions
- **Test generation** following Rails conventions
- **Security reviews** for common Rails vulnerabilities

**Daily Development Integration**:
1. **Code while typing** - Copilot suggests Rails-appropriate code
2. **Select and analyze** - Use visual mode commands for deeper insights  
3. **Chat for complex questions** - Open discussions about architecture
4. **Generate comprehensive tests** - RSpec tests that follow Rails patterns

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

## 🔍 Diagnostic Viewing: All the Ways to See Code Issues

Your setup provides comprehensive diagnostic viewing options that go far beyond simple error messages. You have multiple powerful ways to view, navigate, and fix code issues.

### Built-in Diagnostic Methods

#### **1. Gutter Signs** (Always Active)
Visual indicators in the sign column showing diagnostic severity:
- **E** - Errors (red)
- **W** - Warnings (yellow)  
- **I** - Information (blue)
- **H** - Hints (gray)

#### **2. Code Underlines** (Always Active)
Text underlines indicating problematic code:
- **Wavy red** - Errors
- **Wavy yellow** - Warnings
- **Dotted blue** - Information
- **Dotted gray** - Hints

#### **3. Diagnostic Popup** - `<leader>le`
Shows detailed diagnostic information in a floating window:
```
• Error details at cursor position
• Full diagnostic message
• Source (ruby_lsp, rubocop, etc.)
• Diagnostic code/rule name
• Quick access without leaving current position
```

#### **4. Virtual Text Toggle** - `<leader>lv`
Inline diagnostic messages at end of lines:
```ruby
def broken_method
  undefined_variable.call  # Error: undefined local variable
end
```
**Note**: Can be visually noisy, so it's toggleable.

#### **5. Location List** - `<leader>lq`
Buffer-specific diagnostic list in a split window:
- Shows all diagnostics for current file only
- Navigate with `:lnext` and `:lprev` (or `]l` and `[l`)
- Automatically updates as you fix issues
- Perfect for working through file-specific problems

#### **6. Quickfix List** - `<leader>lQ`
Global diagnostic list across all open buffers:
- Shows diagnostics from entire workspace
- Navigate with `:cnext` and `:cprev` (or `]q` and `[q`)
- Great for project-wide issue resolution
- Persistent across buffer switches

### Enhanced Plugin-Based Viewing

#### **7. Trouble.nvim** - Dedicated Diagnostics Window
Your most powerful diagnostic viewing tool with multiple modes:

**General Diagnostics**:
```
<leader>xx  - All diagnostics (workspace overview)
<leader>xw  - Workspace diagnostics (project-wide)
<leader>xd  - Document diagnostics (current file only)
```

**List Views**:
```
<leader>xl  - Location list in Trouble format
<leader>xq  - Quickfix list in Trouble format
```

**Advanced Features**:
- **Grouping**: By file, by severity, by diagnostic source
- **Filtering**: Focus on errors only, specific file types, etc.
- **Context**: Shows surrounding code for each diagnostic
- **Jump Navigation**: Click or press enter to jump to issues
- **Auto-refresh**: Updates as you fix problems

#### **8. Telescope Diagnostics** - Fuzzy Search Interface
Powerful search and navigation for diagnostics:

**Workspace Diagnostics** - `<leader>fe`:
```
• Search all diagnostics across entire project
• Fuzzy search by error message content
• Filter by file, severity, or diagnostic text
• Preview problematic code before jumping
• Great for finding similar issues across files
```

**Current Buffer Diagnostics** - `<leader>fE`:
```
• Focus only on current file issues
• Same fuzzy search capabilities
• Perfect for file-specific debugging
• Less overwhelming than workspace view
```

**LSP Symbol Integration**:
```
<leader>fs  - Document symbols (navigate by methods/classes)
<leader>fS  - Workspace symbols (find definitions across project)
```

### Navigation Between Diagnostics

#### **Quick Navigation**
```
]d  - Next diagnostic (any severity)
[d  - Previous diagnostic (any severity)
]e  - Next error (errors only)
[e  - Previous error (errors only)
```

#### **Location List Navigation**
```
]l  - Next location list item
[l  - Previous location list item
```

#### **Quickfix Navigation**
```
]q  - Next quickfix item
[q  - Previous quickfix item
```

### Ruby LSP Specific Diagnostics

With all Ruby LSP features enabled, you get comprehensive diagnostics for:

**Syntax Errors**:
- Missing `end` statements
- Unclosed parentheses/brackets
- Invalid Ruby syntax

**Semantic Analysis**:
- Undefined methods/variables
- Type mismatches (when possible to detect)
- Unused variables

**Style and Formatting**:
- Code style violations (via RuboCop integration)
- Indentation issues
- Line length violations

**Rails-Specific Issues**:
- Missing associations
- Invalid route definitions
- Deprecated Rails methods

### Choosing the Right Diagnostic View

#### **For Quick Fixes** (Most Common)
1. **Gutter signs** - See issues at a glance
2. **`]d` and `[d`** - Navigate quickly between issues
3. **`<leader>le`** - Get details without losing context

#### **For File-Focused Work**
1. **Location List** (`<leader>lq`) - All issues in current file
2. **Telescope Buffer Diagnostics** (`<leader>fE`) - Searchable file issues
3. **Trouble Document** (`<leader>xd`) - Rich file diagnostic view

#### **For Project-Wide Issues**
1. **Trouble Workspace** (`<leader>xw`) - Comprehensive project overview  
2. **Telescope Workspace Diagnostics** (`<leader>fe`) - Searchable project issues
3. **Quickfix List** (`<leader>lQ`) - Traditional project error list

#### **For Deep Investigation**
1. **Trouble with filtering** - Group by severity or source
2. **Telescope with search** - Find specific error patterns
3. **Virtual text** (`<leader>lv`) - See all issues inline

### Advanced Diagnostic Workflows

#### **The "Clean Sweep" Workflow**
```bash
# 1. Get project overview
<leader>xw          # See all workspace issues in Trouble

# 2. Focus on errors first  
Filter by severity  # In Trouble, focus on red errors

# 3. Tackle file by file
Jump to file        # From Trouble, press Enter
<leader>lq          # Open location list for file
]l                  # Navigate through file issues
```

#### **The "Pattern Hunt" Workflow**  
```bash
# 1. Search for specific error patterns
<leader>fe          # Open workspace diagnostics in Telescope

# 2. Search for error text
Type: "undefined"   # Find all undefined variable errors
                   # Or "missing" for missing method errors

# 3. Fix systematically
Jump to each        # Preview and fix similar issues
```

#### **The "Context Focus" Workflow**
```bash
# 1. Start with inline context
<leader>le          # Popup diagnostic at cursor

# 2. Need more context?
<leader>xd          # Trouble document view with code context

# 3. Need project context?
<leader>fe          # Search diagnostics across project
```

#### **The "Performance Debug" Workflow**
```bash
# 1. Find performance issues
<leader>fe          # Telescope diagnostics
Type: "performance" # Search for performance warnings

# 2. Group similar issues  
<leader>xw          # Trouble workspace view
Group by source     # See RuboCop performance issues together
```

### Ruby-Specific Diagnostic Patterns

#### **Common Ruby LSP Diagnostics**
```ruby
# Undefined method calls
user.nonexistent_method  # Error: undefined method

# Unused variables
def process(data, unused) # Warning: unused parameter
  data.process
end

# Missing require statements  
JSON.parse(data)  # Error: uninitialized constant JSON

# Type-related issues
"string".length.to_s.length.invalid # Error: undefined method
```

#### **Rails-Specific Diagnostics**
```ruby
# Missing associations
class Post < ApplicationRecord
  belongs_to :nonexistent  # Error: undefined association
end

# Invalid route references
redirect_to nonexistent_path  # Error: undefined route

# Deprecated Rails methods
Post.find_by_sql(sql)  # Warning: deprecated method
```

### Diagnostic Configuration Tips

#### **Adjusting Diagnostic Display**
Your configuration supports customization:
- **Sign priority**: Control which signs show in gutter
- **Virtual text**: Toggle inline messages on/off
- **Underline styles**: Customize error underline appearance
- **Floating window**: Adjust popup diagnostic styling

#### **Performance Considerations**
- **Location list**: Lightweight, updates quickly
- **Quickfix list**: More memory usage with many diagnostics  
- **Trouble**: Rich features but heavier resource usage
- **Virtual text**: Can slow editing with many inline diagnostics

### Integration with Other Tools

#### **With Testing**
```bash
# Diagnostics work alongside testing:
<leader>tn          # Run test under cursor
# See test failures as diagnostics
<leader>xd          # View test failures in Trouble
```

#### **With Debugging**
```bash  
# Diagnostics guide debugging focus:
<leader>fe          # Find error patterns
Jump to error       # Set breakpoint at problematic line
<leader>db          # Set DAP breakpoint  
<leader>rd          # Debug test that triggers error
```

#### **With Git Workflow**
```bash
# Fix diagnostics before commits:
<leader>xw          # See all project issues
Fix critical errors # Address red errors first
git add/commit      # Commit clean code
```

Now you have **8 different ways** to view diagnostics, from quick inline popups to comprehensive project overviews. Each method serves different workflows, and you can seamlessly switch between them based on your current debugging needs!

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
<leader>db  - Toggle breakpoint (● appears in the gutter)
<leader>dB  - Conditional breakpoint (◐ for conditional)
<leader>dc  - Continue execution
<leader>ds  - Step over (next line)
<leader>di  - Step into (dive into methods)
<leader>do  - Step out (back to caller)
<leader>du  - Toggle the visual debug UI
<leader>de  - Evaluate any expression
<leader>dt  - Terminate debugging session
```

**Enhanced Visual Indicators**:
- **●** - Active breakpoint (red)
- **◐** - Conditional breakpoint (orange)
- **◆** - Log point (blue)  
- **▶** - Current execution line (green)
- **○** - Rejected/disabled breakpoint (gray)

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

**Pro Rails Debugging Scenario**: Your user creation is failing. Set a breakpoint in the `create` action with `<leader>db`, debug the test with `<leader>rd`, and when it hits your breakpoint, press `<leader>de` and type `params` to see exactly what data was submitted. Type `@user.errors.full_messages` to see validation failures. No more `puts` debugging!

---

## 🔧 Complete DAP Setup Guide for Rails Development

Your DAP configuration provides **professional-grade debugging** for Rails applications. Here's the complete setup and workflow to get the most out of visual debugging.

### **Required Rails Configuration**

#### 1. **Development Environment Setup**

Add this line to the **top** of `config/environments/development.rb`:

```ruby
require "debug/open_nonstop"

Rails.application.configure do
  # ... rest of your development config
end
```

**Why at the top?** This ensures the debug server starts immediately when Rails loads, before any application code runs.

#### 2. **Environment Variables (.env file)**

Add these variables to your `.env` file:

```bash
# Enable Ruby debug server
RUBY_DEBUG_OPEN=true
RUBY_DEBUG_HOST=127.0.0.1
RUBY_DEBUG_PORT=38698
RUBY_DEBUG_SOCK_PATH=
```

**Critical Detail**: `RUBY_DEBUG_SOCK_PATH` **must be blank**! Here's why:

- **When set**: Ruby debug uses Unix sockets (file-based communication)
- **When blank**: Ruby debug uses TCP connections (network-based communication)
- **DAP requirement**: DAP (Debug Adapter Protocol) requires TCP connections to communicate between Neovim and the Ruby debugger
- **Unix sockets**: Only work for local, same-machine debugging
- **TCP connections**: Work across networks and with external debugging tools like DAP

### **How the Debugging Flow Works**

#### **The Complete Debug Chain**

```
1. Rails Server (with debug/open_nonstop)
   ↓ (listens on TCP port 38698)
2. Your Ruby Code (with breakpoints)
   ↓ (hits breakpoint, sends debug info)
3. Ruby Debug Server 
   ↓ (communicates via TCP)
4. DAP Adapter (nvim-dap-ruby)
   ↓ (translates debug protocol)
5. Neovim DAP UI
   ↓ (shows variables, stack, etc.)
6. You (inspect, step, continue)
```

### **Setting Up Debug Sessions**

#### **Method 1: Debug Rails Server Directly**

```bash
# 1. Start Rails with debug support
rails server

# 2. In Neovim, set breakpoints in your code
# Open a controller: app/controllers/users_controller.rb
def create
  @user = User.new(user_params)  # <- Press <leader>db here
  
  if @user.save
    redirect_to @user
  else
    render :new
  end
end

# 3. Attach DAP to the running server
# Use the "debug with binding.break" configuration
# When prompted, enter port: 38698
```

#### **Method 2: Debug via RSpec Tests**

```bash
# 1. Set breakpoints in your code (models, controllers, etc.)
# 2. Set breakpoints in your test files
# 3. Use Rails-specific debug commands:

<leader>rd  # Debug the RSpec test under your cursor
<leader>rD  # Debug all tests in current file
```

### **Advanced Debugging Techniques**

#### **Debugging Rails Controllers**

```ruby
class UsersController < ApplicationController
  def create
    # Set breakpoint here: <leader>db
    @user = User.new(user_params)
    
    # When breakpoint hits, you can:
    # - Press <leader>de and type: params
    # - Press <leader>de and type: @user.attributes
    # - Press <leader>de and type: @user.valid?
    # - Press <leader>de and type: @user.errors.full_messages
    
    if @user.save
      # Another breakpoint location
      redirect_to @user, notice: 'User created successfully'
    else
      # Debug validation failures here
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    # Breakpoint here to inspect parameter filtering
    params.require(:user).permit(:name, :email, :age)
  end
end
```

#### **Debugging Rails Models**

```ruby
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  
  def full_name
    # Set breakpoint: <leader>db
    # Inspect: first_name, last_name variables
    # Check for nil values, formatting issues
    "#{first_name} #{last_name}".strip
  end
  
  def calculate_age
    # Complex business logic debugging
    return nil unless birth_date
    
    # Breakpoint here: <leader>db
    today = Date.current
    age = today.year - birth_date.year
    
    # Step through logic: <leader>ds
    age -= 1 if today < birth_date + age.years
    
    age
  end
end
```

#### **Debugging Database Queries**

```ruby
def index
  # Set breakpoint before query: <leader>db
  @users = User.includes(:posts)
              .where(active: true)
              .order(:name)
  
  # When breakpoint hits:
  # <leader>de → @users.to_sql  (see generated SQL)
  # <leader>de → @users.explain (see query execution plan)
  # <leader>ds to step to next line
  # <leader>de → @users.count   (see how many records)
end
```

### **DAP UI Features During Debug Sessions**

When debugging is active, your DAP UI shows:

#### **Variables Panel** (Left Side)
- **Local variables**: Method parameters, local assignments
- **Instance variables**: `@user`, `@posts`, etc.
- **Class variables**: Shared across instances
- **Global variables**: Application-wide state

#### **Call Stack Panel** (Left Side)
- **Current method**: Where execution is paused
- **Calling method**: How you got here
- **Full stack trace**: Complete execution path
- **Click any frame**: Jump to that level in the stack

#### **Watches Panel** (Left Side)
Add expressions to monitor:
```bash
# Add watches for Rails-specific monitoring:
@user.errors.full_messages
params[:user]
current_user&.id
session[:user_id]
```

#### **Console Panel** (Bottom)
Interactive Ruby evaluation:
```ruby
# Type any Ruby code:
User.count
Rails.env
@user.attributes
params.to_unsafe_h
```

### **Common Rails Debugging Scenarios**

#### **1. Authentication Issues**
```ruby
# In ApplicationController or Devise setup
def authenticate_user!
  # Breakpoint: <leader>db
  # Inspect: session, current_user, request headers
  unless user_signed_in?
    redirect_to new_user_session_path
  end
end

# Debug session:
# <leader>de → session.to_h
# <leader>de → cookies.to_h  
# <leader>de → request.headers['Authorization']
```

#### **2. N+1 Query Problems**
```ruby
def index
  # Breakpoint before query: <leader>db
  @posts = Post.all  # Suspected N+1 query
  
  # Step to view rendering: <leader>ds
  # In view, breakpoint on: @posts.each do |post|
  #   post.user.name  # <- This triggers N+1
  
  # Solution: @posts = Post.includes(:user)
end
```

#### **3. Validation Failures**
```ruby
def create
  @user = User.new(user_params)
  
  # Breakpoint: <leader>db
  if @user.save
    # Success path
  else
    # Breakpoint here: <leader>db
    # Inspect validation errors:
    # <leader>de → @user.errors.full_messages
    # <leader>de → @user.errors.details
    render :new
  end
end
```

#### **4. Complex Business Logic**
```ruby
class OrderProcessor
  def process_payment(order)
    # Multiple breakpoints for complex flow
    return false unless order.valid?  # <- Breakpoint 1
    
    payment_result = charge_card(order.total)  # <- Breakpoint 2
    
    if payment_result.success?  # <- Breakpoint 3
      order.update!(status: 'paid')
      send_confirmation_email(order)  # <- Breakpoint 4
      true
    else
      order.errors.add(:payment, payment_result.error)  # <- Breakpoint 5
      false
    end
  end
end
```

### **Debugging Best Practices**

#### **Strategic Breakpoint Placement**
1. **Entry points**: Controller action beginnings
2. **Decision points**: Before if/unless statements
3. **Data transformation**: Before complex calculations
4. **Error boundaries**: In rescue blocks
5. **Exit points**: Before redirects/renders

#### **Efficient Debug Sessions**
```bash
# Quick debug workflow:
<leader>db   # Set breakpoint
<leader>rd   # Start debug session (via test)
<leader>de   # Evaluate expressions
<leader>ds   # Step through code
<leader>dc   # Continue to next breakpoint
<leader>dt   # Terminate when done
```

#### **Information Gathering Commands**
```ruby
# Essential Rails debugging expressions:
params.to_unsafe_h           # All parameters
session.to_h                 # Current session data
current_user&.attributes     # User details (if using Devise)
@instance_variable.inspect   # Any instance variable
ActionController::Base.logger.debug("Debug message")
Rails.logger.info(variable.inspect)
```

### **Troubleshooting Common Issues**

#### **DAP Won't Connect**
```bash
# Check if debug server is running:
lsof -i :38698

# Verify environment variables:
echo $RUBY_DEBUG_OPEN
echo $RUBY_DEBUG_HOST  
echo $RUBY_DEBUG_PORT

# Restart Rails server:
rails server
```

#### **Breakpoints Not Hit**
1. **Verify file path**: DAP uses absolute paths
2. **Check Rails loading**: Ensure code is actually executed
3. **Restart debug session**: Sometimes connection gets stale
4. **Verify environment**: Must be in development mode

#### **Performance Considerations**
- **Remove breakpoints**: When not debugging (they slow down code)
- **Close DAP UI**: When not needed (`<leader>du`)
- **Terminate sessions**: Don't leave debug sessions running (`<leader>dt`)

This setup transforms Rails debugging from guesswork into **surgical precision**. You can inspect every variable, step through every line, and understand exactly what your Rails application is doing at any moment! 🎯

---

## � The Complete Rails Development Workflow

Your development environment extends far beyond Neovim. Here's how to create the ultimate Rails development workflow using tmux, mise, Rails console, and essential Rails commands.

---

## 📊 Tmux: Orchestrating Your Development Session

Tmux transforms your terminal into a powerful development workspace where you can manage multiple Rails processes, maintain persistent sessions, and organize your work efficiently.

### Essential Tmux Setup for Rails

#### **Basic Tmux Commands**
```bash
# Session management
tmux new-session -s rails-project    # Create named session
tmux attach-session -t rails-project # Attach to existing session  
tmux list-sessions                    # See all sessions
tmux kill-session -t rails-project   # End session

# Within tmux session:
Ctrl+b c        # Create new window
Ctrl+b n        # Next window
Ctrl+b p        # Previous window
Ctrl+b 0-9      # Jump to window number
Ctrl+b ,        # Rename current window
Ctrl+b %        # Split pane vertically
Ctrl+b "        # Split pane horizontally
Ctrl+b x        # Kill current pane
Ctrl+b d        # Detach from session (keeps running)
```

### The Ultimate Rails Development Tmux Layout

Create a comprehensive Rails development environment with dedicated panes for different tasks:

```bash
#!/bin/bash
# Save as: ~/bin/rails-tmux-setup.sh
# Make executable: chmod +x ~/bin/rails-tmux-setup.sh

PROJECT_NAME=$1
if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: rails-tmux-setup.sh <project-name>"
    exit 1
fi

# Create new tmux session
tmux new-session -d -s "$PROJECT_NAME"

# Window 1: Editor (Neovim)
tmux rename-window -t "$PROJECT_NAME:0" "editor"
tmux send-keys -t "$PROJECT_NAME:editor" "nvim ." C-m

# Window 2: Rails Server
tmux new-window -t "$PROJECT_NAME" -n "server"
tmux send-keys -t "$PROJECT_NAME:server" "rails server" C-m

# Window 3: Rails Console & Database
tmux new-window -t "$PROJECT_NAME" -n "console"
tmux split-window -t "$PROJECT_NAME:console" -h
tmux send-keys -t "$PROJECT_NAME:console.0" "rails console" C-m
tmux send-keys -t "$PROJECT_NAME:console.1" "# Database commands ready" C-m

# Window 4: Tests & Background Jobs
tmux new-window -t "$PROJECT_NAME" -n "testing"
tmux split-window -t "$PROJECT_NAME:testing" -h
tmux send-keys -t "$PROJECT_NAME:testing.0" "# Tests ready" C-m
tmux send-keys -t "$PROJECT_NAME:testing.1" "# Background jobs ready" C-m

# Window 5: Git & System
tmux new-window -t "$PROJECT_NAME" -n "git"
tmux send-keys -t "$PROJECT_NAME:git" "git status" C-m

# Window 6: Logs & Monitoring  
tmux new-window -t "$PROJECT_NAME" -n "logs"
tmux split-window -t "$PROJECT_NAME:logs" -h
tmux send-keys -t "$PROJECT_NAME:logs.0" "tail -f log/development.log" C-m
tmux send-keys -t "$PROJECT_NAME:logs.1" "# System monitoring ready" C-m

# Return to editor window
tmux select-window -t "$PROJECT_NAME:editor"

# Attach to session
tmux attach-session -t "$PROJECT_NAME"
```

#### **Usage**:
```bash
# Start your Rails development session
./rails-tmux-setup.sh my-rails-app

# You now have:
# Window 0: Neovim with your project open
# Window 1: Rails server running
# Window 2: Rails console + database terminal
# Window 3: Testing + background job terminal
# Window 4: Git commands
# Window 5: Log monitoring + system monitoring
```

### Advanced Tmux Rails Workflows

#### **The "Feature Development" Layout**
```bash
# Create specialized layout for feature work
tmux new-session -d -s feature-work

# Split into quarters for comprehensive development
tmux split-window -v    # Top/bottom split
tmux split-window -h    # Bottom right split  
tmux select-pane -t 0
tmux split-window -h    # Top right split

# Pane 0 (top-left): Neovim
tmux send-keys -t 0 "nvim app/controllers/users_controller.rb" C-m

# Pane 1 (top-right): Tests
tmux send-keys -t 1 "# Test commands ready" C-m

# Pane 2 (bottom-left): Rails console
tmux send-keys -t 2 "rails console" C-m

# Pane 3 (bottom-right): Server/logs
tmux send-keys -t 3 "rails server" C-m
```

#### **The "Debugging Session" Layout**
```bash
# Specialized layout for debugging complex issues
tmux new-session -d -s debug-session

# Three-pane horizontal layout
tmux split-window -v
tmux split-window -v
tmux select-layout even-vertical

# Pane 0: Neovim with breakpoints
tmux send-keys -t 0 "nvim" C-m

# Pane 1: Rails console for investigation  
tmux send-keys -t 1 "rails console" C-m

# Pane 2: Test execution with debugging
tmux send-keys -t 2 "# Debug tests here" C-m
```

### Tmux Session Persistence

#### **Save and Restore Sessions**
```bash
# Install tmux-resurrect plugin (add to ~/.tmux.conf):
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# Save current session
Ctrl+b Ctrl+s

# Restore saved session  
Ctrl+b Ctrl+r

# Auto-save every 15 minutes
set -g @continuum-save-interval '15'
```

#### **Project-Specific Tmux Scripts**
```bash
# Create project-specific tmux startup script
# ~/.tmux-sessions/my-rails-app.sh

#!/bin/bash
cd ~/projects/my-rails-app

tmux new-session -d -s my-rails-app -x 120 -y 40

# Set up development environment
tmux new-window -n editor
tmux send-keys 'nvim .' C-m

tmux new-window -n server  
tmux send-keys 'bundle exec rails server' C-m

tmux new-window -n console
tmux send-keys 'bundle exec rails console' C-m

tmux new-window -n tests
tmux send-keys 'bundle exec rspec' C-m

tmux attach-session -t my-rails-app
```

### Rails-Specific Tmux Productivity Tips

#### **Quick Commands in Tmux**
```bash
# Set up tmux aliases for common Rails commands
# Add to ~/.bashrc or ~/.zshrc

alias rs='rails server'
alias rc='rails console'  
alias rr='rails routes'
alias rg='rails generate'
alias rdb='rails db:migrate'
alias rtest='rails test'
alias rspec='bundle exec rspec'

# Tmux-specific Rails shortcuts
alias tmux-rails='tmux new-session -s $(basename $(pwd))'
alias tmux-attach='tmux attach-session -t $(basename $(pwd))'
```

#### **Background Process Management**
```bash
# Window for background jobs (in tmux)
# Pane 1: Sidekiq
bundle exec sidekiq

# Pane 2: Rails server
bundle exec rails server

# Pane 3: Webpacker dev server (if using)  
./bin/webpack-dev-server

# Pane 4: Database monitoring
watch -n 2 'echo "SELECT COUNT(*) FROM users;" | rails dbconsole'
```

---

## 🛠️ Mise: Ruby Version and Environment Management

Mise (formerly rtx) is a fast, polyglot tool version manager that makes managing Ruby versions and project environments effortless.

### Basic Mise Setup for Rails

#### **Installing Ruby Versions**
```bash
# Install latest Ruby
mise install ruby@latest

# Install specific Ruby version
mise install ruby@3.2.0
mise install ruby@3.1.4

# List available Ruby versions
mise list-all ruby

# List installed versions  
mise list ruby

# Set global Ruby version
mise use -g ruby@3.2.0

# Set local Ruby version for project
cd my-rails-project
mise use ruby@3.2.0
```

#### **Project-Specific Configuration**
Create a `.mise.toml` file in your Rails project root:

```toml
# .mise.toml - Project configuration
[tools]
ruby = "3.2.0"
node = "18.17.0"    # For asset pipeline
bundler = "2.4.15"  # Specific Bundler version

[env]  
RAILS_ENV = "development"
DATABASE_URL = "postgresql://localhost/myapp_development"
REDIS_URL = "redis://localhost:6379/0"

# Rails-specific environment variables
RAILS_LOG_LEVEL = "debug"
RAILS_MAX_THREADS = "5"

# Development-specific settings
DISABLE_SPRING = "true"  # Disable Spring for consistency
```

#### **Environment Variables Management**
```bash
# Create environment-specific configs

# .mise.production.toml
[env]
RAILS_ENV = "production"
DATABASE_URL = "postgresql://prod-server/myapp_production"
RAILS_LOG_LEVEL = "info"
RAILS_SERVE_STATIC_FILES = "true"

# .mise.test.toml  
[env]
RAILS_ENV = "test"
DATABASE_URL = "postgresql://localhost/myapp_test"
DISABLE_SPRING = "true"
```

### Advanced Mise Rails Workflows

#### **Multi-Project Ruby Management**
```bash
# Different Rails projects with different Ruby versions
cd rails-app-legacy
mise use ruby@2.7.6    # Older Rails app

cd rails-app-modern  
mise use ruby@3.2.0    # Modern Rails app

cd rails-app-edge
mise use ruby@3.3.0    # Cutting edge Rails app

# Mise automatically switches when you cd between projects
```

#### **Mise with Rails New Projects**
```bash
# Create new Rails project with specific versions
mise use ruby@3.2.0
gem install rails -v 7.0.6

# Create new app with mise configuration
rails new my-app --database=postgresql

cd my-app

# Set up mise for the new project
mise use ruby@3.2.0
mise use node@18.17.0

# Create .mise.toml with project settings
echo '[tools]
ruby = "3.2.0"
node = "18.17.0"

[env]
RAILS_ENV = "development"
DATABASE_URL = "postgresql://localhost/my_app_development"' > .mise.toml
```

#### **Mise + Bundler Integration**
```bash
# Install project-specific Bundler
mise install bundler@2.4.15
mise use bundler@2.4.15

# Install gems with mise-managed Bundler
bundle install

# Run Rails commands with proper environment
mise exec -- rails server
mise exec -- rails console
mise exec -- bundle exec rspec
```

### Mise Development Workflows

#### **The "Clean Environment" Approach**
```bash
# Start with fresh shell environment
mise deactivate     # Clear current mise environment
cd my-rails-project # Activates project-specific mise config
mise current        # Verify correct versions loaded

# Now your environment is exactly what .mise.toml specifies
rails server        # Uses project Ruby/Bundler/Node versions
```

#### **Environment Debugging with Mise**
```bash
# Check what mise has loaded
mise current
mise env            # Show all environment variables
mise which ruby     # Show path to Ruby executable
mise which bundle   # Show path to Bundler

# Troubleshoot environment issues
mise doctor         # Check mise installation
mise env | grep -i rails  # Check Rails-specific variables
```

#### **Mise + Docker Integration**
```dockerfile
# Dockerfile using mise
FROM ubuntu:22.04

# Install mise
RUN curl https://mise.run | sh
ENV PATH="/root/.local/share/mise/bin:$PATH"

# Install project tools from mise config
COPY .mise.toml .
RUN mise install

# Use mise to run Rails
CMD ["mise", "exec", "--", "rails", "server", "-b", "0.0.0.0"]
```

---

## 🎯 Rails Console: Your Interactive Development Powerhouse

The Rails console is your direct line to your application. Master it for debugging, data exploration, testing ideas, and rapid development.

### Essential Rails Console Techniques

#### **Starting and Configuring Console**
```bash
# Basic console startup
rails console
rails c                    # Shortcut

# Environment-specific consoles  
rails console production   # Production console (be careful!)
rails console test        # Test environment console
rails console staging     # Staging environment console

# Console with specific options
rails console --sandbox   # Rollback all changes on exit
rails console --help      # See all options
```

#### **Console Configuration**
Add to `~/.irbrc` for enhanced console experience:
```ruby
# ~/.irbrc - IRB configuration
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:LOAD_MODULES] = []

# Rails-specific helpers (only loaded in Rails context)
if defined?(Rails)
  # Custom helper methods
  def reload!
    Rails.application.reloader.reload!
  end
  
  def sql_last
    ActiveRecord::Base.connection.execute("SELECT last_query FROM pg_stat_activity WHERE application_name = 'Rails Console'").first
  end
  
  # Quick access to common models (customize for your app)
  def u(id = nil)
    id ? User.find(id) : User
  end
  
  def p(id = nil)  
    id ? Post.find(id) : Post
  end
end
```

### Rails Console Mastery for Development

#### **Model Exploration and Testing**
```ruby
# Quick model inspection
User.column_names
User.attribute_names  
User.validators
User.reflections.keys  # See associations

# Test validations quickly
user = User.new
user.valid?
user.errors.full_messages

# Explore associations
user = User.first
user.posts.count
user.posts.where(published: true).count

# Test scopes and queries
User.where(active: true).to_sql  # See generated SQL
User.joins(:posts).explain       # See query execution plan
```

#### **Rapid Data Creation and Testing**
```ruby
# Create test data quickly
user = User.create!(
  name: 'Test User', 
  email: 'test@example.com',
  role: 'admin'
)

# Test associations
user.posts.create!(
  title: 'Test Post',
  content: 'Test content',
  published: true
)

# Bulk data creation
10.times do |i|
  User.create!(
    name: "User #{i}",
    email: "user#{i}@example.com"
  )
end
```

#### **Debugging with Console**
```ruby
# Inspect objects in detail
user.inspect
user.attributes
user.changes          # See what changed before save
user.changed?          # Has anything changed?
user.previous_changes  # What changed after last save

# Query debugging
User.joins(:posts).to_sql
User.includes(:posts).load  # Force query execution
ActiveRecord::Base.logger = Logger.new(STDOUT)  # See all SQL

# Performance analysis  
Benchmark.measure { User.all.to_a }
User.count vs User.all.size vs User.all.length
```

#### **Testing Controllers and Routes**
```ruby
# Test routes
app.users_path
app.user_path(1)
app.get '/users'
app.response.status
app.response.body

# Test helpers
helper.number_to_currency(1234.56)
helper.time_ago_in_words(2.days.ago)
helper.pluralize(2, 'user')

# Access controller instance
controller = UsersController.new
controller.params = { id: 1 }
```

### Advanced Console Workflows

#### **Database Administration**
```ruby
# Connection management
ActiveRecord::Base.connection.execute("SELECT version()")
ActiveRecord::Base.connection.tables
ActiveRecord::Base.connection.indexes(:users)

# Migration testing
ActiveRecord::Migration.check_pending!
ActiveRecord::Migrator.current_version

# Database queries
ActiveRecord::Base.connection.execute(
  "SELECT COUNT(*) FROM users WHERE created_at > '#{1.week.ago}'"
).first

# Index analysis  
ActiveRecord::Base.connection.execute("EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'test@example.com'")
```

#### **Performance Profiling**
```ruby
# Memory usage analysis
require 'objspace'
ObjectSpace.count_objects

# Query performance
ActiveRecord::QueryTrace.enabled = true  # If gem installed
User.all.to_a  # Shows stack trace for queries

# Benchmark different approaches
Benchmark.bm do |x|
  x.report("joins") { User.joins(:posts).count }
  x.report("includes") { User.includes(:posts).map(&:posts).flatten.count }
end
```

#### **Testing and Mocking**
```ruby
# Time manipulation
Time.stub(:current, 1.year.from_now) do
  User.create!(name: 'Future User')
end

# Environment simulation
Rails.stub(:env, 'production') do
  # Test production-only code paths
end

# Factory testing (if using FactoryBot)
FactoryBot.create(:user)
FactoryBot.build(:user, email: 'custom@example.com')
```

### Console Productivity Tips

#### **History and Shortcuts**
```ruby
# Access command history
hist            # Show history (if configured)
_               # Result of last expression
exit            # Leave console (Ctrl+D also works)

# Multi-line editing
def test_method
  puts "This is"
  puts "a multi-line"
  puts "method"
end
```

#### **Loading External Scripts**
```ruby
# Load external Ruby file
load 'script/data_migration.rb'
load 'lib/utility_methods.rb'

# Require gems not in Gemfile (temporarily)  
require 'benchmark'
require 'csv'
```

#### **Console-Specific Debugging**
```ruby
# Enable detailed logging
ActiveRecord::Base.logger.level = 0  # Show all SQL queries

# Debug specific components
Rails.logger.level = :debug
ActionController::Base.logger.level = :debug

# Clear cache (for development)
Rails.cache.clear
```

---

## ⚡ Essential Rails Commands: Your CLI Toolkit

Master these Rails commands for efficient development, from project creation to database management.

### Rails New: Project Creation

#### **Basic Project Creation**
```bash
# Standard Rails application
rails new my_app

# Rails API (no views, minimal features)
rails new my_api --api

# Rails with specific database
rails new my_app --database=postgresql
rails new my_app --database=mysql
rails new my_app --database=sqlite3

# Skip specific features
rails new my_app --skip-test        # Skip test framework
rails new my_app --skip-bundle      # Skip bundle install
rails new my_app --skip-git         # Skip git init
rails new my_app --skip-coffee      # Skip CoffeeScript
rails new my_app --skip-javascript  # Skip JavaScript
rails new my_app --skip-turbolinks  # Skip Turbolinks
```

#### **Advanced Project Creation**
```bash
# Modern Rails setup with multiple options
rails new my_modern_app \
  --database=postgresql \
  --skip-test \
  --css=tailwind \
  --javascript=esbuild \
  --git \
  --force

# Rails with specific Ruby version (using mise/rbenv)
mise use ruby@3.2.0
rails new my_app --ruby=3.2.0

# Rails application template
rails new my_app -m https://raw.githubusercontent.com/user/rails-template/main/template.rb
rails new my_app -m ~/templates/my_template.rb
```

#### **Project Creation Best Practices**
```bash
# Complete modern Rails setup
rails new my_project \
  --database=postgresql \
  --skip-test \
  --css=tailwind \
  --javascript=importmap \
  --force

cd my_project

# Set up development environment
mise use ruby@3.2.0
bundle install
rails db:create
rails db:migrate

# Add testing framework (RSpec)
echo "gem 'rspec-rails', '~> 6.0'" >> Gemfile
bundle install
rails generate rspec:install

# Initialize git
git init
git add .
git commit -m "Initial Rails application"
```

### Rails Generate: Code Generation

#### **Model Generation**
```bash
# Basic model
rails generate model User name:string email:string

# Model with various field types
rails generate model Post \
  title:string \
  content:text \
  published:boolean \
  published_at:datetime \
  user:references \
  view_count:integer \
  rating:decimal{5,2}

# Model with indexes
rails generate model User \
  name:string \
  email:string:uniq \
  phone:string:index

# Generate migration only (no model file)
rails generate migration AddAgeToUsers age:integer
rails generate migration CreateJoinTableUsersRoles user:references role:references
```

#### **Controller Generation**
```bash
# Basic controller
rails generate controller Users

# Controller with actions
rails generate controller Users index show new create edit update destroy

# API controller
rails generate controller Api::Users index show create update destroy --no-template-engine

# Controller with specific route namespace
rails generate controller Admin::Users index show
```

#### **Resource Generation**
```bash
# Generate model + controller + routes + views
rails generate scaffold User name:string email:string age:integer

# API scaffold (JSON responses only)
rails generate scaffold User name:string email:string --api

# Resource without scaffolding (routes + controller)
rails generate resource User name:string email:string
```

#### **View and Helper Generation**
```bash
# Generate views for existing controller
rails generate controller Users index show --no-controller

# Generate helper
rails generate helper Users
rails generate helper Application
```

#### **Advanced Generators**
```bash
# Migration generators
rails generate migration AddIndexToUsers email:index
rails generate migration RemoveAgeFromUsers age:integer
rails generate migration ChangeUserEmailToNotNull
rails generate migration CreateJoinTableAuthorsBooks author:references book:references

# Mailer generation
rails generate mailer UserMailer welcome_email password_reset

# Job generation (Active Job)
rails generate job ProcessPayment
rails generate job EmailNotification

# Channel generation (Action Cable)
rails generate channel Chat
rails generate channel Notifications

# Stimulus controller (if using)
rails generate stimulus hello
```

#### **Custom Generators**
```bash
# Create custom generator
rails generate generator my_generator

# Use custom generator
rails generate my_generator ModelName field:type
```

### Rails Database Commands

#### **Basic Database Operations**
```bash
# Database creation and setup
rails db:create          # Create development and test databases
rails db:create:all      # Create all environment databases
rails db:drop           # Drop development and test databases  
rails db:drop:all       # Drop all environment databases

# Schema operations
rails db:migrate        # Run pending migrations
rails db:migrate:up VERSION=20210101000000    # Run specific migration
rails db:migrate:down VERSION=20210101000000  # Rollback specific migration
rails db:rollback       # Rollback last migration
rails db:rollback STEP=3  # Rollback last 3 migrations
rails db:migrate:redo   # Rollback and re-run last migration
rails db:migrate:status # Show migration status
```

#### **Advanced Database Management**
```bash
# Schema management
rails db:schema:load    # Load schema.rb into database
rails db:schema:dump    # Dump current database to schema.rb
rails db:structure:dump # Dump database structure (includes views, triggers, etc.)
rails db:structure:load # Load structure.sql into database

# Reset and setup
rails db:reset          # Drop, create, load schema, seed
rails db:setup          # Create, load schema, seed
rails db:prepare        # Create if needed, then migrate

# Environment-specific operations
rails db:create RAILS_ENV=production
rails db:migrate RAILS_ENV=test
rails db:seed RAILS_ENV=staging
```

#### **Database Seeding and Testing**
```bash
# Seed database
rails db:seed           # Run db/seeds.rb
rails db:seed:replant   # Truncate tables and re-seed

# Test database management
rails db:test:prepare   # Prepare test database
rails db:test:load      # Load schema into test database
rails db:test:purge     # Empty test database

# Custom seed files
rails db:seed:development  # If you have db/seeds/development.rb
rails db:seed:production   # If you have db/seeds/production.rb
```

### Rails Server and Console Commands

#### **Server Management**
```bash
# Start server
rails server            # Default (port 3000)
rails s                # Shortcut
rails server -p 4000   # Custom port
rails server -b 0.0.0.0  # Bind to all interfaces
rails server -e production  # Specific environment

# Server with specific configurations
rails server --daemon   # Run as daemon (background)
rails server --debugger # With debugger support
rails server --pid=tmp/pids/server.pid  # Custom PID file
```

#### **Console Variations**
```bash
# Console access
rails console           # Development console
rails c                # Shortcut
rails console production  # Production console
rails console --sandbox  # Rollback changes on exit
rails console test      # Test environment console

# Database console
rails dbconsole         # Direct database access
rails db               # Shortcut
rails dbconsole -p     # Include password in connection
```

### Rails Maintenance Commands

#### **Application Information**
```bash
# Application details
rails about            # Show Rails and gem versions
rails version          # Show Rails version only
rails stats            # Show code statistics
rails routes           # Show all routes
rails routes -g user   # Filter routes containing 'user'
rails routes --expanded  # Show expanded route information

# Environment information
rails runner "puts Rails.env"  # Show current environment
rails runner "puts Rails.root" # Show application root
```

#### **Code Quality and Maintenance**  
```bash
# Notes and annotations
rails notes            # Show TODO, FIXME, OPTIMIZE comments
rails notes:todo       # Show only TODO comments
rails notes:fixme      # Show only FIXME comments
rails notes:optimize   # Show only OPTIMIZE comments
rails notes:custom ANNOTATION=REFACTOR  # Show custom annotations

# Security and updates
bundle audit           # Check for security vulnerabilities
rails security:check   # Check for security issues (if brakeman installed)
```

#### **Asset and Cache Management**
```bash
# Asset pipeline
rails assets:precompile    # Precompile assets
rails assets:clean         # Clean old assets
rails assets:clobber       # Delete all assets

# Cache management  
rails dev:cache           # Toggle development caching
rails cache:clear         # Clear application cache (if configured)
```

### Rails Testing Commands

#### **Test Execution**
```bash
# Rails test framework (Minitest)
rails test               # Run all tests
rails test test/models/  # Run model tests
rails test test/controllers/  # Run controller tests
rails test test/models/user_test.rb  # Run specific test file
rails test test/models/user_test.rb:test_should_be_valid  # Run specific test

# Test with options
rails test --verbose     # Verbose output
rails test --seed=1234   # Run with specific seed
rails test --profile     # Show slowest tests
```

#### **RSpec Integration**
```bash
# If using RSpec (after installing rspec-rails gem)
bundle exec rspec        # Run all specs
bundle exec rspec spec/models/  # Run model specs
bundle exec rspec spec/models/user_spec.rb  # Run specific spec file
bundle exec rspec --format documentation  # Detailed output
bundle exec rspec --tag focus  # Run specs tagged with :focus
```

### Environment-Specific Rails Commands

#### **Production Commands**
```bash
# Production-specific operations
RAILS_ENV=production rails assets:precompile
RAILS_ENV=production rails db:migrate
RAILS_ENV=production rails server -d  # Daemonize

# Production console (be careful!)
RAILS_ENV=production rails console --sandbox
```

#### **Development Helpers**
```bash
# Development-specific commands
rails generate controller welcome index
rails server --binding=0.0.0.0 --port=3000
rails runner "puts User.count"  # Run arbitrary Ruby code
```

### Creating Rails Command Aliases

Add these to your shell configuration (`~/.bashrc`, `~/.zshrc`):

```bash
# Rails aliases for speed
alias rs='rails server'
alias rc='rails console'
alias rr='rails routes'  
alias rg='rails generate'
alias rd='rails destroy'
alias rdb='rails db:migrate'
alias rdbc='rails dbconsole'
alias rdbr='rails db:rollback'
alias rdbs='rails db:seed'
alias rt='rails test'

# Environment-specific aliases
alias rcp='RAILS_ENV=production rails console --sandbox'
alias rsp='RAILS_ENV=production rails server'
alias rdbp='RAILS_ENV=production rails db:migrate'

# Complex operations
alias rsetup='rails db:drop db:create db:migrate db:seed'
alias rreset='rails db:reset'
alias rfresh='rails db:drop db:create db:schema:load db:seed'
```

### Rails Command Best Practices

#### **Safe Command Practices**
```bash
# Always use --sandbox in production console
RAILS_ENV=production rails console --sandbox

# Double-check environment before destructive operations
echo $RAILS_ENV  
rails db:drop    # Make sure you're not in production!

# Use version control before major changes
git add . && git commit -m "Before running migrations"
rails db:migrate
```

#### **Development Workflow Integration**
```bash
# Complete feature development cycle
git checkout -b new-feature
rails generate model Feature name:string description:text
rails db:migrate
rails test
git add . && git commit -m "Add Feature model"

rails generate controller Features index show new create
rails test test/controllers/features_controller_test.rb  
git add . && git commit -m "Add Features controller"
```

This comprehensive Rails workflow guide covers everything from tmux session management to essential Rails CLI commands, making it perfect for beginners who want to understand the complete development ecosystem beyond just the editor!

---

## �🗄️ Database: Explore Your Data Visually

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
# Select problematic code and press <leader>cf for fixes
# Use <leader>cre for Rails-specific explanations
# Accept inline suggestions with Ctrl+Y
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

### 2. **Copilot Partnership**
Use Copilot as your development partner:
- Let inline suggestions guide you with **Ctrl+Y** acceptance
- Select code and ask **"What edge cases should I consider?"** via `<leader>ce`
- Use **Rails-specific commands** like `<leader>cro` for performance advice
- Chat about architecture decisions with `<leader>cc`

### 3. **Enhanced File Discovery**
Your Telescope setup shows hidden files intelligently:
- `<leader>ff` finds `.env`, `.rubocop.yml`, and config files instantly
- `<leader>fi` includes ignored files when you need them
- `<leader>fg` searches inside hidden files for comprehensive results

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
<leader>ff  # Find files (inc. hidden)  | <leader>rv  # Controller/View toggle
<leader>fg  # Search text (inc. hidden) | <leader>rc  # Rails console  
<leader>tn  # Test nearest             | <leader>db  # Debug breakpoint
<leader>cc  # Copilot Chat             | <leader>lf  # Format code
<leader>e   # File explorer            | <leader>md  # Database UI
<leader>xx  # All errors/warnings      | <leader>xX  # File errors only
```

### AI & Code Analysis (Visual Mode)
```bash
<leader>ce  # Explain code             | <leader>cre # Rails explanation
<leader>cf  # Fix issues               | <leader>cro # Rails optimization
<leader>co  # Optimize performance     | <leader>crt # Rails RSpec tests
<leader>cd  # Add documentation        | <leader>crs # Rails security review
<leader>ct  # Generate tests           | <leader>crr # Rails refactoring
<leader>cR  # Code review              | <leader>cgc # Generate commit message
```

### Code Quality Commands
```bash
<leader>xx  # All diagnostics          | <leader>la  # Code actions
<leader>xX  # Current file only        | <leader>lc  # Rename symbol
<leader>xQ  # Quickfix list            | <leader>lr  # Find references
<leader>xl  # LSP definitions          | <leader>ld  # Go to definition
```

### Advanced Navigation & Folding
```bash
zM / zR     # Close/open all folds     | ]m / [m     # Next/prev method
zp          # Peek fold or hover       | ]] / [[     # Next/prev class  
]z / [z     # Next/prev fold (centered)| vaf / vif   # Select function
<leader>ma  # Mark with Harpoon        | <leader>1-4 # Jump to harpoon marks
```

**Remember**: Press `<leader>` and wait—Which-Key will show you all available options with descriptions. You're never lost!

---

*Now go forth and build amazing Rails applications with the power of modern tooling at your fingertips!* ⚡
