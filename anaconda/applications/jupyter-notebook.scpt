on run {input, parameters}
    
    tell application "Terminal"
        if not (exists window 1) then reopen
        activate
        
        do script with command "/usr/local/anaconda3/bin/jupyter-notebook" in window 1
        
    end tell
    
end run
