#!/bin/bash

# Stop execution if any command fails
set -e

echo "🏗️ Creating new React project..."

# Project name
PROJECT_NAME="dungeon-crawler"

# Create project directory if it doesn't exist
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# Initialize package.json
echo "📦 Initializing package.json..."
cat > package.json << EOF
{
  "name": "dungeon-crawler",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "@testing-library/jest-dom": "^5.16.5",
    "@testing-library/react": "^13.4.0",
    "@testing-library/user-event": "^13.5.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1",
    "web-vitals": "^2.1.4"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app",
      "react-app/jest"
    ]
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
  }
}
EOF

# Create project structure
echo "📁 Creating project structure..."
mkdir -p src/components
mkdir -p src/assets
mkdir -p public

# Create index.html
echo "🌐 Creating index.html..."
cat > public/index.html << EOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
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

# Create index.js
echo "📝 Creating index.js..."
cat > src/index.js << EOF
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

# Create index.css
echo "🎨 Creating index.css..."
cat > src/index.css << EOF
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

# Create App.js with the game component
echo "🎮 Creating App.js with game component..."
cat > src/App.js << EOF
import React from 'react';
import DungeonGame from './components/DungeonGame';

function App() {
  return (
    <div className="min-h-screen bg-gray-100 p-4">
      <DungeonGame />
    </div>
  );
}

export default App;
EOF

# Create DungeonGame component
echo "🎲 Creating DungeonGame component..."
cat > src/components/DungeonGame.jsx << EOF
$(cat << 'END_OF_GAME'
// Copy the entire DungeonGame component code here
// This is where you'll paste the React component we created earlier
END_OF_GAME
)
EOF

# Create components for UI elements
echo "🎨 Creating UI components..."
mkdir -p src/components/ui

# Create Card component
cat > src/components/ui/card.jsx << EOF
import * as React from "react"

const Card = React.forwardRef(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={\`rounded-lg border bg-card text-card-foreground shadow-sm \${className}\`}
    {...props}
  />
))
Card.displayName = "Card"

const CardHeader = React.forwardRef(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={\`flex flex-col space-y-1.5 p-6 \${className}\`}
    {...props}
  />
))
CardHeader.displayName = "CardHeader"

const CardTitle = React.forwardRef(({ className, ...props }, ref) => (
  <h3
    ref={ref}
    className={\`text-2xl font-semibold leading-none tracking-tight \${className}\`}
    {...props}
  />
))
CardTitle.displayName = "CardTitle"

const CardContent = React.forwardRef(({ className, ...props }, ref) => (
  <div ref={ref} className={\`p-6 pt-0 \${className}\`} {...props} />
))
CardContent.displayName = "CardContent"

export { Card, CardHeader, CardTitle, CardContent }
EOF

# Initialize git repository
echo "📚 Initializing git repository..."
git init
cat > .gitignore << EOF
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

# Install dependencies
echo "📦 Installing dependencies..."
npm install

echo "✨ Project setup complete! You can now run:"
echo "   cd $PROJECT_NAME"
echo "   npm start"