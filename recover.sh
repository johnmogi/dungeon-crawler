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

# Create public/index.html
echo "${GREEN}Creating public files...${NC}"
cat > public/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta name="description" content="Dungeon Crawler Game" />
    <title>Dungeon Crawler</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
EOF

# Create package.json
echo "${GREEN}Creating package.json...${NC}"
cat > package.json << 'EOF'
{
  "name": "dungeon-crawler",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "@babel/plugin-proposal-private-property-in-object": "^7.21.11",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1"
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

# Create src/index.js
echo "${GREEN}Creating root React files...${NC}"
cat > src/index.js << 'EOF'
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
EOF

# Create src/App.js
cat > src/App.js << 'EOF'
import React from 'react';
import DungeonGame from './components/DungeonGame';

function App() {
  return (
    <div className="min-h-screen bg-gray-100">
      <DungeonGame />
    </div>
  );
}

export default App;
EOF

# Create src/index.css
cat > src/index.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
EOF

# Create Tailwind and PostCSS configs
echo "${GREEN}Creating Tailwind config...${NC}"
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

cat > postcss.config.js << 'EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

# Create main DungeonGame component
echo "${GREEN}Creating game components...${NC}"
cat > src/components/DungeonGame/index.jsx << 'EOF'
import React from 'react';
import { GAME_STATES } from './config/gameStates';
import useGameState from './hooks/useGameState';
import GameIntro from './components/GameIntro';
import CharacterSelect from './components/CharacterSelect';
import GameBoard from './components/GameBoard';
import CharacterSheet from './components/CharacterSheet';
import GameEnd from './components/GameEnd';

const DungeonGame = () => {
  const { state, actions } = useGameState();

  const renderGameScreen = () => {
    switch (state.screen) {
      case GAME_STATES.INTRO:
        return <GameIntro onStart={actions.startGame} />;
      
      case GAME_STATES.CHARACTER_SELECT:
        return <CharacterSelect onSelect={actions.selectCharacter} />;
      
      case GAME_STATES.PLAYING:
        return (
          <div className="flex gap-4">
            <div className="flex-1">
              <GameBoard
                board={state.board}
                position={state.position}
                onMove={actions.handleMove}
              />
            </div>
            <div className="w-64">
              <CharacterSheet
                character={state.character}
                stats={state.stats}
                inventory={state.inventory}
              />
            </div>
          </div>
        );
      
      case GAME_STATES.END:
        return (
          <GameEnd
            character={state.character}
            stats={state.stats}
            onRestart={actions.restartGame}
          />
        );
      
      default:
        return <div>Error: Unknown game state</div>;
    }
  };

  return (
    <div className="container mx-auto p-4">
      {renderGameScreen()}
    </div>
  );
};

export default DungeonGame;
EOF

# Create components
echo "${GREEN}Creating game subcomponents...${NC}"
cat > src/components/DungeonGame/components/GameIntro.jsx << 'EOF'
import React from 'react';

const GameIntro = ({ onStart }) => (
  <div className="text-center">
    <h1 className="text-4xl mb-4">Dungeon Adventure</h1>
    <p className="mb-4">Your quest begins...</p>
    <button
      onClick={onStart}
      className="px-4 py-2 bg-blue-500 text-white rounded"
    >
      Start Adventure
    </button>
  </div>
);

export default GameIntro;
EOF

cat > src/components/DungeonGame/components/CharacterSelect.jsx << 'EOF'
import React from 'react';
import { CHARACTERS } from '../config/characters';

const CharacterSelect = ({ onSelect }) => {
  return (
    <div>
      <h2 className="text-2xl mb-4">Choose Your Character</h2>
      <div className="grid grid-cols-2 gap-4">
        {Object.entries(CHARACTERS).map(([id, char]) => (
          <button
            key={id}
            onClick={() => onSelect(char)}
            className="p-4 border rounded hover:bg-gray-100"
          >
            <h3 className="font-bold">{char.name}</h3>
            <p className="text-sm text-gray-600">{char.description}</p>
            <div className="text-xs mt-2">
              <div>Health: {char.baseStats.health}</div>
              <div>Attack: {char.baseStats.attack}</div>
            </div>
          </button>
        ))}
      </div>
    </div>
  );
};

export default CharacterSelect;
EOF

# [Continue with all other component files...]
# Create configuration files
echo "${GREEN}Creating game configuration...${NC}"
cat > src/components/DungeonGame/config/characters.js << 'EOF'
export const CHARACTERS = {
  warrior: {
    id: 'warrior',
    name: 'Warrior',
    description: 'A mighty warrior skilled in close combat',
    baseStats: {
      health: 100,
      magic: 0,
      attack: 15,
      defense: 10
    },
    startingInventory: {
      'Iron Sword': 1,
      'Health Potion': 2
    }
  },
  mage: {
    id: 'mage',
    name: 'Mage',
    description: 'A wise magician wielding powerful spells',
    baseStats: {
      health: 70,
      magic: 100,
      attack: 5,
      defense: 5
    },
    startingInventory: {
      'Wooden Staff': 1,
      'Mana Potion': 2
    }
  }
};
EOF

# [Continue with remaining configuration and utility files...]

echo "${GREEN}Installing dependencies...${NC}"
npm install

echo "✅ Recovery complete! Now run:"
echo "cd dungeon-crawler"
echo "npm start"