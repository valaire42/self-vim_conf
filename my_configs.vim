set number
set background=light
function! s:ReplaceTemplateVarsAndGo()
  " 替换 %:t 为当前文件名
  silent! %s/%:t/\=expand('%:t')/g

  " 寻找 Description: 所在行，定位光标到冒号后第一个非空字符
  let lnum = search('^# Description:', 'nw')
  if lnum > 0
    " 获取这一行内容
    let line = getline(lnum)
    " 定位冒号位置，光标列数（col）要+1，因为col计数从1开始
    let col = match(line, ':') + 2
    call cursor(lnum, col)
  endif
endfunction

augroup templates
  autocmd!
  autocmd BufNewFile *.sh 0r ~/.vim_runtime/templates/template.sh | call <SID>ReplaceTemplateVarsAndGo()
  autocmd BufNewFile *.py 0r ~/.vim_runtime/templates/template.py | call <SID>ReplaceTemplateVarsAndGo()
augroup END


