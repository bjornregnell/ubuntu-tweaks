# Fix slow thunderbird

1. Shut down Thunderbird
2. In folder `~/.thunderbird/<randomstring>.defaults/` do

    mv global-messages-db.sqlite OLD-global-messages-db.sqlite
    
3. Restar Thunderbird

Based on tip here:
  
  * https://support.mozilla.org/en-US/questions/1234832
  
  * https://wiki.mozilla.org/Thunderbird:Testing:Memory_Usage_Problems
  
    - See point number 9 in the long list of issues
    
  
