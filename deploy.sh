#!/bin/bash
# Deploy Rational-Z.github.io to GitHub Pages
# Run this command in Terminal:
# cd /Users/iris/Rational-Z.github.io && bash deploy.sh

set -e

REPO_DIR="/Users/iris/Rational-Z.github.io"
REPO_URL="https://github.com/Rational-Z/Rational-Z.github.io.git"

echo "🚀 Deploying Rational Z to GitHub Pages..."

# Initialize git if needed
if [ ! -d "$REPO_DIR/.git" ]; then
  echo "📦 Initializing git repository..."
  cd "$REPO_DIR"
  git init
  git config user.name "Rational-Z"
  git config user.email "irisliu2005@126.com"
else
  cd "$REPO_DIR"
fi

# Add all files
echo "📝 Adding files..."
git add -A

# Commit
echo "💾 Committing..."
git commit -m "Initial launch: Rational Z - The Science of Awakening

5 articles covering:
- Why meditation works (neuroscience)
- Anxiety in smart people
- Neuroscience of awakening
- Meditation for skeptics
- Science of breaking habits"

# Add remote if not exists
if ! git remote | grep -q "origin"; then
  echo "🔗 Adding remote..."
  git remote add origin "$REPO_URL"
fi

# Push
echo "🌐 Pushing to GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "✅ Done! Your site will be live at:"
echo "   https://rational-z.github.io"
echo ""
echo "⏱️  It may take 1-5 minutes for GitHub Pages to build."
echo "   You can check status at: https://github.com/Rational-Z/Rational-Z.github.io/settings/pages"
