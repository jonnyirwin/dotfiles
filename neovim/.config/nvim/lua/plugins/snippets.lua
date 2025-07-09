return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "honza/vim-snippets", -- Additional snippets including Rails
        },
        config = function()
            local luasnip = require("luasnip")
            
            -- Load snippets from friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()
            
            -- Load snippets from vim-snippets
            require("luasnip.loaders.from_snipmate").lazy_load()
            
            -- Custom Rails snippets
            luasnip.add_snippets("ruby", {
                -- Basic Ruby snippets
                luasnip.snippet("def", {
                    luasnip.text_node("def "),
                    luasnip.insert_node(1, "method_name"),
                    luasnip.text_node({"", "  "}),
                    luasnip.insert_node(2, "# TODO"),
                    luasnip.text_node({"", "end"}),
                }),
                
                -- Debugging snippets
                luasnip.snippet("pry", {
                    luasnip.text_node("require 'pry'; binding.pry"),
                }),
                luasnip.snippet("dbg", {
                    luasnip.text_node("require 'debug'; debugger"),
                }),
                luasnip.snippet("pp", {
                    luasnip.text_node("puts "),
                    luasnip.insert_node(1, "variable"),
                    luasnip.text_node(".inspect"),
                }),
                luasnip.snippet("log", {
                    luasnip.text_node("Rails.logger.info "),
                    luasnip.insert_node(1, '"Debug message"'),
                }),
                
                -- Rails Model snippets
                luasnip.snippet("val", {
                    luasnip.text_node("validates :"),
                    luasnip.insert_node(1, "attribute"),
                    luasnip.text_node(", "),
                    luasnip.insert_node(2, "presence: true"),
                }),
                luasnip.snippet("has_many", {
                    luasnip.text_node("has_many :"),
                    luasnip.insert_node(1, "association"),
                }),
                luasnip.snippet("belongs_to", {
                    luasnip.text_node("belongs_to :"),
                    luasnip.insert_node(1, "association"),
                }),
                luasnip.snippet("scope", {
                    luasnip.text_node("scope :"),
                    luasnip.insert_node(1, "name"),
                    luasnip.text_node(", -> { "),
                    luasnip.insert_node(2, "where(active: true)"),
                    luasnip.text_node(" }"),
                }),
                
                -- Rails Controller snippets
                luasnip.snippet("before", {
                    luasnip.text_node("before_action :"),
                    luasnip.insert_node(1, "method_name"),
                }),
                luasnip.snippet("private", {
                    luasnip.text_node({"", "private", "", ""}),
                    luasnip.insert_node(1),
                }),
                luasnip.snippet("strong", {
                    luasnip.text_node("params.require(:"),
                    luasnip.insert_node(1, "model"),
                    luasnip.text_node(").permit("),
                    luasnip.insert_node(2, ":name, :email"),
                    luasnip.text_node(")"),
                }),
                luasnip.snippet("redirect", {
                    luasnip.text_node("redirect_to "),
                    luasnip.insert_node(1, "path"),
                    luasnip.text_node(", notice: '"),
                    luasnip.insert_node(2, "Success message"),
                    luasnip.text_node("'"),
                }),
                luasnip.snippet("render", {
                    luasnip.text_node("render :"),
                    luasnip.insert_node(1, "template"),
                    luasnip.text_node(", status: :"),
                    luasnip.insert_node(2, "unprocessable_entity"),
                }),
                
                -- Rails Route snippets
                luasnip.snippet("resources", {
                    luasnip.text_node("resources :"),
                    luasnip.insert_node(1, "model"),
                }),
                luasnip.snippet("get", {
                    luasnip.text_node("get '"),
                    luasnip.insert_node(1, "path"),
                    luasnip.text_node("', to: '"),
                    luasnip.insert_node(2, "controller#action"),
                    luasnip.text_node("'"),
                }),
                luasnip.snippet("post", {
                    luasnip.text_node("post '"),
                    luasnip.insert_node(1, "path"),
                    luasnip.text_node("', to: '"),
                    luasnip.insert_node(2, "controller#action"),
                    luasnip.text_node("'"),
                }),
                
                -- Rails Migration snippets
                luasnip.snippet("migration", {
                    luasnip.text_node({"class ", ""}),
                    luasnip.insert_node(1, "MigrationName"),
                    luasnip.text_node({" < ActiveRecord::Migration[7.0]", "  def change", "    "}),
                    luasnip.insert_node(2, "# migration code"),
                    luasnip.text_node({"", "  end", "end"}),
                }),
                luasnip.snippet("add_column", {
                    luasnip.text_node("add_column :"),
                    luasnip.insert_node(1, "table"),
                    luasnip.text_node(", :"),
                    luasnip.insert_node(2, "column"),
                    luasnip.text_node(", :"),
                    luasnip.insert_node(3, "string"),
                }),
                luasnip.snippet("create_table", {
                    luasnip.text_node("create_table :"),
                    luasnip.insert_node(1, "table_name"),
                    luasnip.text_node({" do |t|", "  "}),
                    luasnip.insert_node(2, "t.string :name"),
                    luasnip.text_node({"", "  t.timestamps", "end"}),
                }),
                
                -- RSpec snippets
                luasnip.snippet("describe", {
                    luasnip.text_node("describe '"),
                    luasnip.insert_node(1, "feature"),
                    luasnip.text_node({"' do", "  "}),
                    luasnip.insert_node(2, "# tests"),
                    luasnip.text_node({"", "end"}),
                }),
                luasnip.snippet("context", {
                    luasnip.text_node("context '"),
                    luasnip.insert_node(1, "when condition"),
                    luasnip.text_node({"' do", "  "}),
                    luasnip.insert_node(2, "# tests"),
                    luasnip.text_node({"", "end"}),
                }),
                luasnip.snippet("it", {
                    luasnip.text_node("it '"),
                    luasnip.insert_node(1, "should do something"),
                    luasnip.text_node({"' do", "  "}),
                    luasnip.insert_node(2, "# test code"),
                    luasnip.text_node({"", "end"}),
                }),
                luasnip.snippet("expect", {
                    luasnip.text_node("expect("),
                    luasnip.insert_node(1, "subject"),
                    luasnip.text_node(").to "),
                    luasnip.insert_node(2, "eq(value)"),
                }),
                luasnip.snippet("let", {
                    luasnip.text_node("let(:"),
                    luasnip.insert_node(1, "variable"),
                    luasnip.text_node(") { "),
                    luasnip.insert_node(2, "value"),
                    luasnip.text_node(" }"),
                }),
                
                -- Factory Bot snippets
                luasnip.snippet("factory", {
                    luasnip.text_node("factory :"),
                    luasnip.insert_node(1, "model"),
                    luasnip.text_node({" do", "  "}),
                    luasnip.insert_node(2, "name { 'Test Name' }"),
                    luasnip.text_node({"", "end"}),
                }),
                luasnip.snippet("create", {
                    luasnip.text_node("create(:"),
                    luasnip.insert_node(1, "factory"),
                    luasnip.text_node(")"),
                }),
                luasnip.snippet("build", {
                    luasnip.text_node("build(:"),
                    luasnip.insert_node(1, "factory"),
                    luasnip.text_node(")"),
                }),
                
                -- Rails Console shortcuts
                luasnip.snippet("reload!", {
                    luasnip.text_node("reload!"),
                }),
                luasnip.snippet("User.find", {
                    luasnip.text_node("User.find("),
                    luasnip.insert_node(1, "id"),
                    luasnip.text_node(")"),
                }),
                luasnip.snippet("where", {
                    luasnip.text_node("where("),
                    luasnip.insert_node(1, "condition"),
                    luasnip.text_node(")"),
                }),
            })
            
            -- Keybindings for LuaSnip
            vim.keymap.set({"i", "s"}, "<C-k>", function()
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                end
            end, { desc = "Expand or jump snippet" })
            
            vim.keymap.set({"i", "s"}, "<C-j>", function()
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                end
            end, { desc = "Jump back in snippet" })
        end,
    },
}
