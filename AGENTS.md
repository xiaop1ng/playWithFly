# playWithFly

Shadowsocks-libev server deployed on Fly.io.

## Deploy

```sh
./deploy.sh          # full deploy (install flyctl, auth, create app, set secrets, deploy)
flyctl secrets set SSPASSWORD=yourpass && flyctl deploy   # change password after initial deploy
flyctl deploy --remote-only   # deploy only (skip secret update)
```

## Key files

| File | Role |
|------|------|
| `Dockerfile` | Alpine 3.19 + `shadowsocks-libev` from apk; runs `ss-server` on `$PORT` with `$SSPASSWORD` |
| `fly.toml` | App `playwithsh-ss`, TCP port 8388 |
| `deploy.sh` | Automation: installs flyctl, auth, creates app, sets default password, deploys |

## Gotchas

- **Default password `123456`** -- always override with `flyctl secrets set SSPASSWORD=...` before deploying to production. The default is hardcoded in both `Dockerfile` and `deploy.sh`.
- **Fly.io org machine limit** -- if `flyctl launch` fails with `requested machine count exceeds organization limit`, destroy unused machines or use a different org. The free org tier has a low machine cap.
- **No tests, no CI, no linting** -- this repo has exactly one operation (deploy). No local dev setup needed.
- **Remote-only build** -- Docker builds happen on Fly's servers, not locally.
- **No `.gitignore`** -- the 3 committed files are the entire repo.
