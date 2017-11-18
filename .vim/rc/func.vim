" daily_reports
command! -nargs=0 DailyReports call s:open_write_daily_reports()
function! s:open_write_daily_reports()

    let language = v:lc_time
    execute ":silent! language time " . "C"
    let l:daily_reports_dir = $HOME . '/Documents/daily_reports'. strftime('/%Y/%m/%d-%a')
    execute ":silent! language time " . language
    if !isdirectory(l:daily_reports_dir)
        call mkdir(l:daily_reports_dir, 'p')
    endif

    let l:filename = strftime('%Y-%m-%d-%a') . '-reports.mkd'
    let l:filepath = input('title: ', l:daily_reports_dir.strftime('/') . l:filename)
    if l:filepath != ''
      autocmd BufNewFile,BufRead *-reports.mkd if getfsize(@%) <= 0 | 0read $HOME/.vim/templates/template_daily_reports.mkd | endif
      execute 'edit ' . l:filepath
    endif
endfunction

