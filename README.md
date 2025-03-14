# Music Guessing Game

A multiplayer music guessing game built with Flask and React where players can join lobbies and compete by guessing songs from the Deezer music catalog.

## Features

- Real-time multiplayer gameplay using Socket.IO
- Create and join game lobbies with up to 8 players
- Song preview playback from Deezer API
- Score tracking and winner determination
- Fuzzy matching for song title guesses
- Responsive React frontend

## Tech Stack

### Backend
- Python 3.x
- Flask
- Flask-SocketIO
- Flask-CORS
- Gevent

### Frontend
- React 18
- Socket.IO Client
- React Router
- Axios

## Installation

### Prerequisites
- Python 3.x
- Node.js and npm

### Backend Setup

1. Clone the repository
2. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```

### Frontend Setup

1. Navigate to the React app directory:
   ```bash
   cd my-react-app
   ```

2. Install Node dependencies:
   ```bash
   npm install
   ```

3. Build the frontend:
   ```bash
   npm run build
   ```

## Running the Application

1. Start the Flask backend server:
   ```bash
   python app.py
   ```
   The server will start on `http://localhost:8000`

2. For development, you can run the React frontend separately:
   ```bash
   cd my-react-app
   npm start
   ```
   The development server will start on `http://localhost:3000`

## Game Rules

1. Create or join a lobby with up to 8 players
2. Each game consists of 10 rounds
3. In each round:
   - Players listen to a song preview
   - Players have 30 seconds to guess the song title
   - Points are awarded for correct guesses
4. The player with the highest score at the end wins

## API Integration

The game uses the Deezer API to fetch song data and previews. No API key is required for basic functionality.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the MIT License.