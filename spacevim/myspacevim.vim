function! myspacevim#before() abort
  noremap h k
  noremap j h
  noremap k j
  set tabstop = 2
  set shiftwidth = 2
  set list!
  set g:spacevim_expand_tab = 0
	set viminfo='100,n$HOME/.vim/files/info/viminfo'
	let g:spacevim_disabled_plugins = ['startify']
endfunction

function! myspacevim#after() abort
  set listchars=tab:>-,trail:·
  set noexpandtab
endfunction
