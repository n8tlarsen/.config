return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release &&\
                    cmake --build build --config Release && cmake --install build --prefix build'
            },
        },
        branch = '0.1.x',
        config = function ()
            function find_files_from_project_git_root()
                local function is_git_repo()
                    vim.fn.system("git rev-parse --is-inside-work-tree")
                    return vim.v.shell_error == 0
                end
                local function get_git_root()
                    local dot_git_path = vim.fn.finddir(".git", ".;")
                    return vim.fn.fnamemodify(dot_git_path, ":h")
                end
                local opts = {}
                if is_git_repo() then
                    opts = {
                        cwd = get_git_root(),
                    }
                end
                require("telescope.builtin").find_files(opts)
            end

            function live_grep_from_project_git_root()
                local function is_git_repo()
                    vim.fn.system("git rev-parse --is-inside-work-tree")

                    return vim.v.shell_error == 0
                end

                local function get_git_root()
                    local dot_git_path = vim.fn.finddir(".git", ".;")
                    return vim.fn.fnamemodify(dot_git_path, ":h")
                end

                local opts = {}

                if is_git_repo() then
                    opts = {
                        cwd = get_git_root(),
                    }
                end

                require("telescope.builtin").live_grep(opts)
            end

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', find_files_from_project_git_root, {})
            vim.keymap.set('n', '<leader>fg', live_grep_from_project_git_root, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            require('telescope').load_extension('fzf')
        end
    },
}

