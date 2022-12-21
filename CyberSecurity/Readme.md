## CyberSecurity
- ####  Cross-site scripting (xxs)
    cross-site scripting attacks, whereby an 
    attacker injects JavaScript into the pages of your site when users view them. 
    Attackers usually inject malicious JavaScript into dynamic content that 
    comes from a database, from the HTTP request, or from the URI fragment. 
    You can defeat cross-site scripting attacks by escaping any HTML control 
    characters in dynamic content, and by setting a content security policy that 
    prevents the execution of inline JavaScript.
    - **Database** : attacker can insert **(<script></script>)** in field like as by post-comment, post .. then i will save in database, and when user get these comment, post (that script will execute).
    - **Client browser** : attacker send link with script can execute in user browser when click on it.
