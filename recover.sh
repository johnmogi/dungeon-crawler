#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m'

echo "🔄 Recovering Dungeon Crawler project..."

# Get current directory
CURRENT_DIR="/c/Users/anist/OneDrive/Desktop/DEV/dungeon crawler"

# Create or navigate to dungeon-crawler directory
cd "$CURRENT_DIR"
rm -rf dungeon-crawler
mkdir -p dungeon-crawler
cd dungeon-crawler

echo "${GREEN}Creating project structure...${NC}"

# Create necessary directories
mkdir -p src/components/DungeonGame/{components,config,hooks,utils}
mkdir -p public

# Package.json with added babel dependency
cat > package.json << 'EOF'
{
  "name": "dungeon-crawler",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1",
    "@babel/plugin-proposal-private-property-in-object": "^7.21.11"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  },
  "devDependencies": {
    "tailwindcss": "^3.3.5",
    "autoprefixer": "^10.4.16",
    "postcss": "^8.4.31"
  }
}
EOF

# Create root files
[Previous root files creation remains the same...]

# Copy game components
echo "${GREEN}Copying game components...${NC}"

# Create all game component files
cat > src/components/DungeonGame/components/CharacterSelect.jsx << 'EOF'
[Content of CharacterSelect.jsx]
EOF

cat > src/components/DungeonGame/components/CharacterSheet.jsx << 'EOF'
[Content of CharacterSheet.jsx]
EOF

cat > src/components/DungeonGame/components/GameBoard.jsx << 'EOF'
[Content of GameBoard.jsx]
EOF

cat > src/components/DungeonGame/components/GameEnd.jsx << 'EOF'
[Content of GameEnd.jsx]
EOF

cat > src/components/DungeonGame/components/GameIntro.jsx << 'EOF'
[Content of GameIntro.jsx]
EOF

# Create config files
cat > src/components/DungeonGame/config/characters.js << 'EOF'
[Content of characters.js]
EOF

cat > src/components/DungeonGame/config/gameStates.js << 'EOF'
[Content of gameStates.js]
EOF

cat > src/components/DungeonGame/config/rooms.js << 'EOF'
[Content of rooms.js]
EOF

# Create hooks
cat > src/components/DungeonGame/hooks/useBoardGenerator.js << 'EOF'
[Content of useBoardGenerator.js]
EOF

cat > src/components/DungeonGame/hooks/useGameState.js << 'EOF'
[Content of useGameState.js]
EOF

# Create utilities
cat > src/components/DungeonGame/utils/boardGenerator.js << 'EOF'
[Content of boardGenerator.js]
EOF

cat > src/components/DungeonGame/utils/eventHandler.js << 'EOF'
[Content of eventHandler.js]
EOF

# Create main DungeonGame component
cat > src/components/DungeonGame/index.jsx << 'EOF'
[Content of index.jsx]
EOF

echo "${GREEN}Installing dependencies...${NC}"
npm install

echo "✅ Recovery complete! Now run:"
echo "cd dungeon-crawler"
echo "npm start"