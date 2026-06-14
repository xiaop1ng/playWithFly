# playWithFly

Shadowsocks-libev server deployed on SnapDeploy.

## Deploy

```sh
./deploy.sh          # prints setup instructions
```

1. `git push origin main`
2. https://snapdeploy.dev → sign up → New Container → connect repo
3. Set env vars: `SSPASSWORD` (change from default!) and `SSPORT=8388`
4. Deploy

## Key files

| File | Role |
|------|------|
| `Dockerfile` | Alpine 3.19 + `shadowsocks-libev` from apk; runs `ss-server` on `$SSPORT` with `$SSPASSWORD` |
| `deploy.sh` | Prints SnapDeploy deployment steps |

## Gotchas

- **Default password `123456`** — always override via SnapDeploy Dashboard → Env Variables → `SSPASSWORD` before production use. Hardcoded in `Dockerfile` and `deploy.sh`.
- **Free tier sleeps** — after inactivity the container sleeps (auto-wake ~60s). Connections will drop. Upgrade to Always-On ($12/mo) for 24/7 proxy.
- **No tests, no CI, no linting** — this repo has exactly one operation (deploy). No local dev setup needed.
- **No `.gitignore`** — the 4 committed files are the entire repo.
- **Port env var** — Dockerfile uses `SSPORT` (not `PORT`) for clarity.
