## 1. Wrangler
```md
# install
npm i -D wrangler@latest
# list scope
npx wrangler login --scopes-list
# login
# - who am i
npx wrangler whoami
# - limited scope
npx wrangler login --scopes workers:write --browser false
# - full scope
npx wrangler login --browser false
# - need to logout, because Cloudflare support revoke authorization from dashboard now.
npx wrangler logout
# Deployment
npm run preview # test api in local
npm run deploy
```
## 2. R2
- #### 2 - CORS Policy
- work with vercel [https://github.com/Phnom-Project/projectNote-/blob/main/vercel/readme.md#1-header]
```
[
  {
    "AllowedOrigins": [
      "*"
    ],
    "AllowedMethods": [
      "GET",
      "PUT",
      "POST"
    ],
    "AllowedHeaders": [
      "*"
    ],
    "ExposeHeaders": [
      "*"
    ]
  }
]
```
- #### 1 - bucket lock policy
  - can protect delete and overwrite object in cloudflare r2 web-ui.
```md
Prevents objects in a Cloudflare R2 storage bucket from being deleted or overwritten for a specified period or indefinitely
- Prefix : Leave the Prefix field blank or empty to apply the rule to all objects in the bucket.
- Retention period : specific duration, until a certain date, or indefinitely
```
