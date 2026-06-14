# playWithFly

Shadowsocks-libev server deployed on Render.

## Deploy

```sh
./deploy.sh          # prints setup instructions
```

Or use Render Blueprint (auto):
1. `git push origin main`
2. Go to https://dashboard.render.com/blueprints — connect repo
3. Render reads `render.yaml` and deploys automatically

Manual:
1. `git push origin main`
2. https://dashboard.render.com/select-repo → Docker → set env vars → deploy

## Key files

| File | Role |
|------|------|
| `Dockerfile` | Alpine 3.19 + `shadowsocks-libev` from apk; runs `ss-server` on `$SSPORT` with `$SSPASSWORD` |
| `render.yaml` | Render Blueprint: service `playwithsh-ss`, Docker runtime, free plan, port 8388 |
| `deploy.sh` | Prints Render deployment steps |

## Gotchas

- **Default password `123456`** — always override via Render Dashboard → Environment Variables → `SSPASSWORD` before production use. Hardcoded in `Dockerfile` and `deploy.sh`.
- **Render free plan spins down** — after 15 min of inactivity the service sleeps. Connections will drop. Upgrade to a paid plan for 24/7 proxy.
- **No tests, no CI, no linting** — this repo has exactly one operation (deploy). No local dev setup needed.
- **No `.gitignore`** — the 4 committed files are the entire repo.
- **Port env var** — Dockerfile uses `SSPORT` (not `PORT`) to avoid collision with Render's auto-injected `$PORT`.
