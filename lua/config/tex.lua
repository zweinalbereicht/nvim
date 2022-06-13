-- Some useful cmds when opening a tex file
-- NOT WORKING FOR NOW

vim.api.nvim_exec(
	[[autocmd FileType tex,plaintex nnoremap <buffer> <leader>g :lua print('lala')<CR>]],
	false
)

vim.api.nvim_exec(
	[[autocmd FileType tex,plaintex nnoremap <buffer> :cmp<CR> !pdflatex -interaction=nonstopmode -synctex=1 $(ls | grep .tex$)<CR>]],
	false
)

