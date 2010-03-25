nmap \f :%s/^-/\t-/e\|%s/^*\s\?/\r  * /e<CR><CR>
imap f <Esc>:%s/^-/\t-/e\|%s/^*\s\?/\r  * /e<CR><CR>

nmap \t :t.\|s/./=/g<CR>
imap t <Esc>:t.\|s/./=/g<CR>
