# neovim config SWE/FI keyboard layout
This is my neovim config optimzed for a Swedish/Finnish keyboard layout. 
In order to be able to use this properly you need to deactivate all deadkeys. 
In windows 10 you can use this tool by microsoft: https://www.microsoft.com/en-us/download/details.aspx?id=102134

## Keymappings
In general I've tried to map the keys in such a way that you press the same keys
as you would on a English keyboard layout. So for instance, by pressing 
`shift + 4` on a default vim config using a English keyboard in normal mode will
send the cursor to the end of the line. In order to do that using a Swedish
keyboard layout you would have to press `alt gr + 4`. This has been mapped such
that it's `shift + 4` on a Swedish keyboard as well.

Apart from that I've mapped the []{} to a much more convenient place:

`å` -> `[`

`¨` -> `]`

`Å` -> `{`

`^` -> `}`

## TODO
* Add support for JSON
* Make <tab> do the same thing as <C-j> when autocomplete
* Disable mouse: https://vi.stackexchange.com/questions/31125/how-to-disable-mouse-in-neovim
* Add autoclose {}[]''
