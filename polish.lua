return function()
  -- 打开时自动定位到上次关闭位置
  vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = "*",
    command = [[if line("'\"") >= 1 && line("'\"") <= line("$") |   exe "normal! g`\"" | endif]],
  })

  -- 文件运行
  vim.api.nvim_exec(
    [[
    func! CompileRunGccA()
      exec "w"
      for i in ["c","cpp","python","sh","html","go","lua","rust","r","nix","javascript","java","typescript"]
        if &filetype == i
          exec "RunFile float"
       	elseif &filetype == 'markdown'
    		  exec "MarkdownPreview"
    	  elseif &filetype == 'tex'
    		  silent! exec "VimtexStop"
    		  silent! exec "VimtexCompile"
    		  " silent! exec "latexrun"
        endif
      endfor
    endfunc
  ]],
    false
  )
  -- 项目运行
  vim.api.nvim_exec(
    [[
    func! CompileRunGccB()
      exec "w"
      for i in ["c","cpp","python","sh","html","go","lua","rust","r","nix","javascript","java","typescript"]
        if &filetype == i
          exec "RunProject"
       	elseif &filetype == 'markdown'
    		  exec "MarkdownPreview"
    	  elseif &filetype == 'tex'
    		  silent! exec "VimtexStop"
    		  silent! exec "VimtexCompile"
        endif
      endfor
    endfunc
  ]],
    false
  )
end
