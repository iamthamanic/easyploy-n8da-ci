# easyploy-n8da-ci

**CI workflow for easyploy using n8n dev actions**

Dieses Repository enthält die CI/CD Konfiguration für [easyploy](https://github.com/iamthamanic/easyploy) - erstellt mit dem [n8n-dev-actions-template](https://github.com/iamthamanic/n8n-dev-actions-template).

## Naming Convention

`{repo-name}-n8da-{action-name}`

- **easyploy**: Das Ziel-Repository
- **n8da**: n8n dev actions (dieses Template-System)
- **ci**: Die spezifische Action (continuous integration)

## Status

| Check | Status |
|-------|--------|
| Install | ⏳ Warte auf ersten Run |
| Lint | ⏳ Warte auf ersten Run |
| Test | ⏳ Warte auf ersten Run |
| Build | ⏳ Warte auf ersten Run |
| Quality Gate | ⏳ Warte auf ersten Run |

## Konfiguration

- **Template:** Node.js (02-node-template.json)
- **Package Manager:** pnpm
- **Runner:** Hostinger VPS (srv1492167.hstgr.cloud)
- **n8n:** https://n8n-xpip.srv1492167.hstgr.cloud/
- **Webhook:** `/webhook/ci-easyploy`

## Stages

1. **Checkout** - Code vom GitHub Repo holen
2. **pnpm install** - Dependencies installieren
3. **ESLint** - Code-Style prüfen
4. **Jest Tests** - Tests ausführen
5. **Build** - TypeScript kompilieren
6. **Quality Gate** - AI Review mit ShimWrapperCheck + Kimi k2.5
7. **Report** - Status zu GitHub + Telegram

## Manuelle Ausführung

```bash
# Validierung
./scripts/validate-workflow.sh

# Webhook Setup
./scripts/setup-webhook.sh
```

## Troubleshooting

Siehe [docs/TROUBLESHOOTING.md](./docs/TROUBLESHOOTING.md)

## Sicherheit

Siehe [docs/SECURITY.md](./docs/SECURITY.md)

---

**Erstellt:** 2026-03-15  
**Template Version:** 1.0.0
