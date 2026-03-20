### 2 Deployment
```ps1
# Auth
vercel login # can remove session in vercel-cloud-service ui
vercel logout

# Displays the username and team of the currently authenticated user
vercel whoami

# Deployment
# preview : generate new-link to access but need auth of project-team
vercel
# production : deploy to public 
vercel --prod
```
### 1 Header
- do not allow "if-none-match"="*" in request, by omit evey request contain this header.
```md
 effect to s3-policy to prevent overwrite presign-url put request
```
- solution : fix cors
```ts
// XMLHttpRequest
xhr.withCredentials = true; // Reason: Credential is not supported if the CORS header 'Access-Control-Allow-Origin' is '*'
```

