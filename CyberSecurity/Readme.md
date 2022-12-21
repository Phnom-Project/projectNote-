## CyberSecurity
- ####  Cross-site scripting (xxs)
    cross-site scripting attacks, whereby an 
    attacker injects JavaScript into the pages of your site when users view them. 
    Attackers usually inject malicious JavaScript into dynamic content that 
    comes from a database, from the HTTP request, or from the URI fragment. 
    You can defeat cross-site scripting attacks by escaping any HTML control 
    characters in dynamic content, and by setting a content security policy that 
    prevents the execution of inline JavaScript.
    - **Database** : attacker can insert **(<script></script>)** in field like as **comment sections, search results, and URLs ...** then i will save in database, and when user get these comment, post (that script will execute).
    - **Client browser** : attacker send link with script can execute in user browser when click on it.
- ####  Cross-site Request Forgery Attacks (CRFA)
    Attackers can use web requests from other sites to trick your users into performing undesired actions. 
    The solution to such cross-site request forgery attacks is threefold. 
    - First, make sure your GET requests are side-effect free, so the server state is not changed when a user clicks malicious links.
      ```
      GET/RegisterStudent.asp?user=value1&pass=value2
      ```  
      
      ```
      POST/RegisterStudent.asp HTTP/1.1  
      Host: www.guru99.com
      user=value1&pass=value2
      ```
        
