nmap \f :%s/^---\s\?/\t\t\t  - /e\|%s/^--\s\?/\t\t  - /e\|%s/^-\s\?/\t  - /e\|%s/^\*\*\*\s\?\(.*\)/\r\t\t\t*** \1 ***/e\|%s/^\*\*\s\?\(.*\)/\r\t\t** \1 **/e\|%s/^\*\s\?\(.*\)/\r\t* \1 */e<CR><CR>
imap f <Esc>\f

nmap \t :t.\|s/./=/g<CR>
imap t <Esc>:t.\|s/./=/g<CR>o

" Set tabs to be 4 spaces wide
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Set no line wrapping
set nowrap
