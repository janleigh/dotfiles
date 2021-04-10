let s:theme = 'kizu'

" To highlight when the buffer is modified:
"     let g:airline_minimalist_showmod = 1
let s:want_showmod = get(g:, 'airline_minimalist_showmod', 0)

function! airline#themes#{s:theme}#refresh()
    if &background == "dark"
        " Normal
        let N1 = [ '#cfd1dd', '#161825', 254, 237 ]
        let N2 = [ '#cfd1dd', '#13141d', 254, 239 ]
        let N3 = [ '#cfd1dd', '#13141d', 255, 235 ]

        " Inactive
        let IA = [ N1[0], '#161825', 242, N3[3] ]

        " Error
        let ER = [ '#cfd1dd', '#e27878', 234, 167 ]

        " Warning
        let WI = [ '#13141d', '#ebcb8b', ER[2], 215 ]
    endif

    " Terminal
    let TE = [ ER[0], N1[1], N1[2], N1[3] ]

    " Reverse
    let NR = [ N2[1], N2[0], N2[3], N2[2], 'bold' ]


    let palette = {}

    let palette.normal = airline#themes#generate_color_map(N1, N2, N3)
    let palette.normal.airline_error   = ER
    let palette.normal.airline_warning = WI
    let palette.normal.airline_term    = TE

    let palette.insert   = palette.normal
    let palette.replace  = palette.normal
    let palette.visual   = palette.normal
    let palette.inactive = airline#themes#generate_color_map(IA, IA, IA)

    if s:want_showmod
        let palette.normal_modified = { 'airline_a': NR, 'airline_z': NR }
    endif

    " Accents
    let palette.accents = {
                \ 'red': [ ER[1], '', ER[3], '' ]
                \ }

    " CtrlP
    if get(g:, 'loaded_ctrlp', 0)
        let palette.ctrlp = airline#extensions#ctrlp#generate_color_map(N3, N2, NR)
    endif

    let g:airline#themes#{s:theme}#palette = palette
endfunction

call airline#themes#{s:theme}#refresh()
