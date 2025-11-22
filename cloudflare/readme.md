## 1. Wrangler
```
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
