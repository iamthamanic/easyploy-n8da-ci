# GitHub Webhook Setup

## Schritt 1: Webhook in GitHub konfigurieren

1. Gehe zu: https://github.com/iamthamanic/easyploy/settings/hooks
2. Klicke "Add webhook"
3. **Payload URL:** `https://n8n-xpip.srv1492167.hstgr.cloud/webhook/ci-easyploy`
4. **Content type:** `application/json`
5. **Secret:** (optional, aber empfohlen)
6. **Events:** Wähle "Let me select individual events"
   - ✅ Pushes
   - ✅ Pull requests
   - ✅ Releases
7. Klicke "Add webhook"

## Schritt 2: n8n Credentials konfigurieren

### SSH Credential
- **Name:** `ssh-easyploy-runner`
- **Host:** `srv1492167.hstgr.cloud`
- **Port:** `22`
- **User:** `root`
- **Private Key:** Inhalt von `~/.ssh/id_ed25519`

### GitHub API Credential
- **Name:** `github-api`
- **Token:** Dein GitHub Personal Access Token
- **Scopes:** `repo`, `repo:status`

### Telegram Bot Credential
- **Name:** `telegram-bot`
- **Bot Token:** Dein Telegram Bot Token

## Schritt 3: Workflow importieren

1. Öffne n8n Dashboard: `https://n8n-xpip.srv1492167.hstgr.cloud`
2. Gehe zu "Workflows" → "Import from File"
3. Wähle `n8n-workflow.json`
4. Aktiviere den Workflow

## Schritt 4: Testen

```bash
# Test Push
cd /path/to/easyploy
git commit --allow-empty -m "test: CI trigger"
git push origin main
```

## Troubleshooting

### Webhook nicht erreichbar
- Prüfe Firewall: Port 5678 muss offen sein
- Prüfe n8n: Läuft der Service? `systemctl status n8n`

### SSH Fehler
- Prüfe SSH Key: `ssh -i ~/.ssh/id_ed25519 root@srv1492167.hstgr.cloud`
- Berechtigungen: `chmod 600 ~/.ssh/id_ed25519`

### Checks schlagen fehl
- Logs prüfen: `/tmp/ci/easyploy/logs/`
- Manuell testen: `cd /tmp/ci/easyploy && pnpm run lint`
