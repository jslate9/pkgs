# Respond package installation using jamf-pro.

## Add package on jamf-pro
Add package at the below path.
- Setting -> Computer Management -> Packages
    <a href="https://imgur.com/imjvVWS"><img src="https://i.imgur.com/imjvVWS.png" title="source: imgur.com" /></a>

- if you do not see an upload button then you need to set "Cloud Distribution Point". For that goto:  
`Setting -> Server Infrastructure -> Cloud Distribution Point`
and set content delivery network to "Jamf Cloud".


## Set Policies
Install Respond policy.
- In General tab set `Display name` "Install respond",  `Trigger`  "recurring check-in"
- In Packages tab set `Distribustion point` "cloud distribution", and select package and then set `Action` "Install" 
- In Files and processes tab set `Execute Command`(To get installation log.)
    ```bash
        echo "$(</var/log/respondsensorinstall.log)"
    ```

Uninstall Respond policy.
- follow the same procedures as 'install respond policy'. Just change `Execute Command`.
    ```bash
        echo "$(</var/log/respondsensoruninstall.log)"
    ```