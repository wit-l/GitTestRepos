$PSStyle.FileInfo.Directory="`e[34;1m"
$VIMRC="D:\software\vim\_vimrc"
$VIMRUNTIME="D:\software\vim\vim91"
$CODE="D:\Users\witty\Documents\code"
Set-Alias -Name vi -Value vim
Set-Alias -Name ghl -Value Get-Help
function ll {Get-ChildItem -Force}
#------------------------------- Import Modules BEGIN -------------------------------
#Import-Module posh-git
#Import-Module PSReadLine
#------------------------------- Import Modules END -------------------------------
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/montys.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/zash.omp.json" | Invoke-Expression

#------------------------------- Set Hot-keys BEGIN -------------------------------
# 设置预测文本来源为历史记录
Set-PSReadLineOption -PredictionSource History -HistorySearchCursorMovesToEnd -EditMode Vi -PredictionViewStyle InlineView -BellStyle None -ViModeIndicator Cursor

# 设置 Tab 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete

# 设置 Ctrl+d 为退出 PowerShell
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function ViExit
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Key "Alt+n" -Function AcceptNextSuggestionWord
# 退出到Normal模式 remote comment out
Set-PSReadLineKeyHandler -Key "Alt+q" -Function ViCommandMode
Set-PSReadLineKeyHandler -Key "Alt+h" -Function BackwardWord
Set-PSReadLineKeyHandler -Key "Alt+l" -Function ForwardWord
# 历史搜索选择键绑定为jk
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function HistorySearchBackward
# 删除前一个单词：Ctrl+w
Set-PSReadlineKeyHandler -Key "Ctrl+w" -Function BackwardDeleteWord
Set-PSReadlineKeyHandler -Key "Ctrl+c" -Function Copy
Set-PSReadlineKeyHandler -Key "Ctrl+a" -Function SelectAll
# 光标前后移动一个单词：Ctrl+
# Set-PSReadlineKeyHandler -Key "Spacebar+j" -Function ForwardWord
# Set-PSReadlineKeyHandler -Key "Spacebar+k" -Function BackwardWord
#------------------------------- Set Hot-keys END -------------------------------
# neofetch
