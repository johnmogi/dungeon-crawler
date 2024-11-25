# Dungeon Crawler React Game

A modular and extensible browser-based dungeon crawler game built with React. Navigate through randomly generated dungeons, battle monsters, collect treasures, and try to find your way to the exit.

![Dungeon Crawler Game](public/game-preview.png)

previous version:
https://johnmogi.github.io/GAMES/Dungeon/index.html


## 🎮 Features

### Core Gameplay
- Randomly generated dungeon layouts (3x3, 6x6, 9x9)
- Unique path generation from start to finish
- Progressive room discovery system
- Various room types (monster, treasure, trap, dark rooms)

### Character System
- **4 Classic Character Classes:**
  - Warrior (Melee Combat Specialist)
  - Magician (Spell Caster)
  - Dwarf (Mining Expert)
  - Elf (Ranged Combat Master)
- Class-specific starting equipment
- Health and gold management
- Equipment system (including crucial items like lanterns)

### Room Types
- 🏰 Start Room: Beginning of your journey
- 👻 Monster Rooms: Combat encounters
- 💎 Treasure Rooms: Valuable loot
- ⚡ Trap Rooms: Dangerous hazards
- 🌑 Dark Rooms: Requires lantern
- 🚪 Exit: Victory condition

## 🚀 Getting Started

### Prerequisites
- Node.js (v14.0.0 or higher)
- npm (v6.0.0 or higher)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/johnmogi/dungeon-crawler.git
cd dungeon-crawler
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm start
```

4. Open [http://localhost:3000](http://localhost:3000) in your browser

### Building for Production

```bash
npm run build
```

## 🛠️ Project Structure

```
dungeon-crawler/
├── public/
│   └── index.html
├── src/
│   ├── components/
│   │   ├── DungeonGame.jsx
│   │   └── ui/
│   │       └── card.jsx
│   ├── App.js
│   ├── index.js
│   └── index.css
└── package.json
```

## 🎯 Game Mechanics

### Movement
- Click on adjacent rooms to move
- Only connected rooms are accessible
- Rooms are revealed as you explore

### Combat
- Monster encounters reduce health
- Dark rooms without lantern increase damage taken
- Different classes have varying combat effectiveness

### Items
- Lantern: Required for safe dark room navigation
- Starting weapons based on class
- Gold can be collected from treasure rooms

## 🔧 Configuration

### Game Settings
```javascript
const GAME_CONFIG = {
  boardSizes: [3, 6, 9],
  defaultSize: 3,
  minGold: 5,
  maxGold: 15,
  darkRoomPenalty: 2,
  trapDamage: 10,
};
```

### Character Classes
```javascript
const CHARACTER_CLASSES = {
  warrior: {
    startingHealth: 100,
    startingGold: 10,
    // ...
  },
  // ... other classes
};
```

## 🎨 Customization

### Adding New Room Types
1. Define the room type in `ROOM_TYPES`
2. Add room logic in the `handleMove` function
3. Update the room generation probability in `generateBoard`

### Creating New Character Classes
1. Add class definition to `CHARACTER_CLASSES`
2. Define starting attributes and equipment
3. Create corresponding icon component

## 🔄 Future Enhancements

### Planned Features
- [ ] Advanced combat system
- [ ] Inventory management
- [ ] Character progression
- [ ] Multiple levels
- [ ] Boss battles
- [ ] Save/Load system

### Improvement Ideas
- Enhanced visual effects
- Sound effects and background music
- Additional character classes
- More room types and events
- Quest system
- Multiplayer support

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## 👏 Acknowledgments

- React team for the amazing framework
- Tailwind CSS for the styling utilities
- The open-source community for inspiration and resources

## 📧 Contact

Your Name - [@johnmogi](https://twitter.com/johnmogi)

Project Link: [https://github.com/johnmogi/dungeon-crawler](https://github.com/johnmogi/dungeon-crawler)