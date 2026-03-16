#!/bin/bash
# Setup script for easyploy-n8da-ci
# Run this on your n8n server

set -e

echo "🔧 Setting up easyploy-n8da-ci..."

# 1. Create working directory
mkdir -p /tmp/ci/easyploy
cd /tmp/ci/easyploy

# 2. Clone easyploy repo (for testing)
if [ ! -d ".git" ]; then
  git clone https://github.com/iamthamanic/easyploy.git .
fi

# 3. Install dependencies
echo "📦 Installing dependencies..."
pnpm install

# 4. Install global tools
echo "🛠️ Installing global tools..."
npm install -g semgrep @stryker-mutator/core complexity-report

# 5. Create .env file
echo "📝 Creating .env file..."
cat > /tmp/ci/easyploy/.env << 'EOF'
NODE_ENV=production
CI=true
TURBO_TELEMETRY_DISABLED=1
GITHUB_TOKEN=your-github-token-here
TELEGRAM_BOT_TOKEN=your-telegram-token-here
EOF

echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Import n8n-workflow.json into n8n"
echo "2. Configure credentials (SSH, GitHub, Telegram)"
echo "3. Set up GitHub webhook"
echo "4. Test with a push to easyploy"
