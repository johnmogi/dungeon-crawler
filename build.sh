#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🎮 Complete Dungeon Crawler Setup${NC}"

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo -e "${RED}Node.js not found. Installing NVM and Node.js...${NC}"
    
    # Download and install NVM
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    
    # Load NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    # Install Node.js LTS version
    nvm install --lts
    nvm use --lts
fi

# Check Node.js and npm versions
echo -e "${GREEN}Node.js version:${NC}"
node --version
echo -e "${GREEN}npm version:${NC}"
npm --version

# Set project paths
BASE_DIR="$HOME/OneDrive/Desktop/DEV"
PROJECT_DIR="$BASE_DIR/dungeon-crawler"
PROJECT_NAME="dungeon-crawler"

# Create project directory
echo -e "${GREEN}Creating project directory...${NC}"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR" || exit

# Install create-react-app globally if not installed
if ! command -v create-react-app &> /dev/null; then
    echo -e "${GREEN}Installing create-react-app globally...${NC}"
    npm install -g create-react-app
fi

# Create new React project
echo -e "${GREEN}Creating new React project...${NC}"
npx create-react-app $PROJECT_NAME

# Navigate to project directory
cd $PROJECT_NAME || exit

# Install additional dependencies
echo -e "${GREEN}Installing additional dependencies...${NC}"
npm install \
    tailwindcss \
    postcss \
    autoprefixer \
    @babel/plugin-proposal-private-property-in-object

# Initialize Tailwind CSS
echo -e "${GREEN}Initializing Tailwind CSS...${NC}"
npx tailwindcss init -p

# Update package.json with correct name and version
npm pkg set name="dungeon-crawler"
npm pkg set version="0.1.0"

# Add additional scripts
npm pkg set scripts.dev="react-scripts start"
npm pkg set scripts.build="react-scripts build"

# Update browserslist
npm pkg set browserslist.production[0]=">0.2%"
npm pkg set browserslist.production[1]="not dead"
npm pkg set browserslist.production[2]="not op_mini all"
npm pkg set browserslist.development[0]="last 1 chrome version"
npm pkg set browserslist.development[1]="last 1 firefox version"
npm pkg set browserslist.development[2]="last 1 safari version"

# Initialize Git
echo -e "${GREEN}Initializing Git repository...${NC}"
git init

# Create .gitignore
cat > .gitignore << 'EOF'
# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
/build

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*
EOF

echo -e "${BLUE}✅ Basic setup complete!${NC}"
echo -e "${GREEN}Would you like to proceed with creating game components?${NC}"
echo "y/n"
read -r response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    echo -e "${GREEN}Creating game components...${NC}"
    # Here we would continue with creating the game components
#!/bin/bash

[Previous installation code remains the same until the component creation part]

if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    echo -e "${GREEN}Creating game components...${NC}"
    
    # Create project structure
    mkdir -p src/components/DungeonGame/{components,config,hooks,utils}

    # Clean up default files
    rm -f src/App.test.js src/logo.svg src/reportWebVitals.js src/setupTests.js public/logo* public/manifest.json public/robots.txt

    # Update index.css
    cat > src/index.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, sans-serif;
}
EOF

    # Update App.js
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

    # Create game components
    echo -e "${GREEN}Creating DungeonGame components...${NC}"

    # Main DungeonGame component
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

    # Create game components
    cat > src/components/DungeonGame/components/GameIntro.jsx << 'EOF'
import React from 'react';

const GameIntro = ({ onStart }) => (
  <div className="text-center">
    <h1 className="text-4xl mb-4">Dungeon Adventure</h1>
    <p className="mb-4">Your quest begins...</p>
    <button
      onClick={onStart}
      className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
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

const CharacterSelect = ({ onSelect }) => (
  <div className="max-w-4xl mx-auto">
    <h2 className="text-2xl mb-4 text-center">Choose Your Character</h2>
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

export default CharacterSelect;
EOF

    cat > src/components/DungeonGame/components/GameBoard.jsx << 'EOF'
import React from 'react';

const GameBoard = ({ board, position, onMove }) => (
  <div className="grid gap-2" style={{ gridTemplateColumns: `repeat(${board.length}, minmax(0, 1fr))` }}>
    {board.map((row, y) => 
      row.map((cell, x) => (
        <button
          key={`${x}-${y}`}
          onClick={() => onMove([x, y])}
          className="w-20 h-20 bg-gray-200 rounded hover:bg-gray-300"
        >
          {position[0] === x && position[1] === y ? '🧙‍♂️' : ''}
        </button>
      ))
    )}
  </div>
);

export default GameBoard;
EOF

    cat > src/components/DungeonGame/components/CharacterSheet.jsx << 'EOF'
import React from 'react';

const CharacterSheet = ({ character, stats, inventory }) => (
  <div className="border p-4 rounded bg-white shadow">
    <h3 className="text-xl mb-2 font-bold">{character?.name}</h3>
    <div className="space-y-2">
      <div>Health: {stats?.health || 0}</div>
      <div>Magic: {stats?.magic || 0}</div>
      <div>Attack: {stats?.attack || 0}</div>
      <div className="mt-4">
        <h4 className="font-bold mb-2">Inventory:</h4>
        <ul className="space-y-1">
          {inventory && Object.entries(inventory).map(([item, count]) => (
            <li key={item} className="text-sm">
              {item}: {count}
            </li>
          ))}
        </ul>
      </div>
    </div>
  </div>
);

export default CharacterSheet;
EOF

    cat > src/components/DungeonGame/components/GameEnd.jsx << 'EOF'
import React from 'react';

const GameEnd = ({ character, stats, onRestart }) => (
  <div className="text-center">
    <h2 className="text-3xl mb-4">Game Over</h2>
    <p className="mb-4">
      {character?.name} finished with {stats?.health} health remaining
    </p>
    <button
      onClick={onRestart}
      className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
    >
      Play Again
    </button>
  </div>
);

export default GameEnd;
EOF

    # Create configuration files
    echo -e "${GREEN}Creating game configurations...${NC}"

    cat > src/components/DungeonGame/config/gameStates.js << 'EOF'
export const GAME_STATES = {
  INTRO: 'intro',
  CHARACTER_SELECT: 'characterSelect',
  PLAYING: 'playing',
  END: 'end'
};
EOF

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

    cat > src/components/DungeonGame/config/rooms.js << 'EOF'
export const ROOM_TYPES = {
  empty: {
    type: 'empty',
    description: 'An empty room',
    event: null
  },
  monster: {
    type: 'monster',
    description: 'A dangerous monster appears!',
    event: 'combat'
  },
  treasure: {
    type: 'treasure',
    description: 'You found a treasure chest!',
    event: 'loot'
  }
};
EOF

    # Create hooks
    echo -e "${GREEN}Creating game hooks...${NC}"

    cat > src/components/DungeonGame/hooks/useGameState.js << 'EOF'
import { useState } from 'react';
import { GAME_STATES } from '../config/gameStates';
import { generateBoard } from '../utils/boardGenerator';

const useGameState = () => {
  const [state, setState] = useState({
    screen: GAME_STATES.INTRO,
    character: null,
    board: [],
    position: null,
    stats: null,
    inventory: null
  });

  const actions = {
    startGame: () => {
      setState(prev => ({
        ...prev,
        screen: GAME_STATES.CHARACTER_SELECT
      }));
    },
    selectCharacter: (character) => {
      setState(prev => ({
        ...prev,
        screen: GAME_STATES.PLAYING,
        character,
        stats: character.baseStats,
        inventory: character.startingInventory,
        board: generateBoard(3),
        position: [0, 1]
      }));
    },
    handleMove: (newPosition) => {
      setState(prev => ({
        ...prev,
        position: newPosition
      }));
    },
    restartGame: () => {
      setState(prev => ({
        ...prev,
        screen: GAME_STATES.INTRO
      }));
    }
  };

  return { state, actions };
};

export default useGameState;
EOF

    # Create utilities
    echo -e "${GREEN}Creating game utilities...${NC}"

    cat > src/components/DungeonGame/utils/boardGenerator.js << 'EOF'
export const generateBoard = (size) => {
  const board = Array(size).fill().map(() => Array(size).fill('empty'));
  let x = 0;
  let y = Math.floor(size / 2);
  
  // Place start
  board[y][x] = 'start';
  
  while (x < size - 1) {
    const directions = [];
    if (y > 0) directions.push([0, -1]);
    if (y < size - 1) directions.push([0, 1]);
    directions.push([1, 0]);
    
    const [dx, dy] = directions[Math.floor(Math.random() * directions.length)];
    x += dx;
    y += dy;
    
    const roomType = Math.random();
    if (roomType < 0.3) board[y][x] = 'monster';
    else if (roomType < 0.5) board[y][x] = 'treasure';
    else board[y][x] = 'empty';
  }
  
  board[y][x] = 'end';
  return board;
};
EOF

    # Final steps
    echo -e "${BLUE}✅ Game components created successfully!${NC}"
    echo -e "${GREEN}Starting development server...${NC}"
    npm start
else
    echo -e "${BLUE}Basic React installation complete.${NC}"
    echo -e "You can now:"
    echo -e "1. cd $PROJECT_NAME"
    echo -e "2. npm start"
fi
else
    echo -e "${BLUE}Basic React installation complete.${NC}"
    echo -e "You can now:"
    echo -e "1. cd $PROJECT_NAME"
    echo -e "2. npm start"
fi

# Make the script executable
chmod +x setup.sh