# 💘 Love Interest Analyzer

A modern, responsive web application that helps you analyze your relationship situation based on behavioral inputs. It turns subjective relationship signals into a structured interest score, highlights potential red flags, and provides actionable advice for your next move.

## ✨ Features
- **Multi-step Questionnaire**: 15 carefully curated questions across 5 categories (Chat Behavior, Real Life Interaction, Effort Level, Social Media, Special Signals).
- **Scoring Engine**: Converts inputs into a robust scoring system (+2 for positive, +1 for neutral, 0/-1 for negative signals). 
- **Detailed Results**: 
  - Interest Level (High / Medium / Low) with color psychology
  - Confidence explanation detailing why you got this score
  - Identified red flags
  - Actionable "Next Move" recommendations
- **Beautiful UI/UX**: Premium glassmorphism design, smooth entry animations, engaging score reveal counter, and a floating particle background.
- **Sharable Results**: Easily copy your results to the clipboard to share with friends.

## 🛠️ Tech Stack
- **Framework**: React 18
- **Build Tool**: Vite 5
- **Styling**: Tailwind CSS 3
- **Animations**: CSS Transitions & Keyframes
- **State Management**: React Hooks (no complex global state needed)

---

## 🚀 How to Run Locally

Follow these steps to get the project running on your local machine.

### 1. Prerequisites
Ensure you have [Node.js](https://nodejs.org/) installed on your computer.

### 2. Install Dependencies
Open your terminal, navigate to the project directory, and run:
```bash
npm install
```

### 3. Start the Development Server
Run the following command to start the Vite development server:
```bash
npm run dev
```

### 4. Open in Browser
Once the server starts, it will display a local URL in your terminal (typically `http://localhost:5173` or `http://localhost:5174`). Open that link in your web browser to view the application.

---

## 🏗️ Building for Production

To create a production-ready build of the app, run:
```bash
npm run build
```
This will generate optimized static assets in the `dist/` folder. You can preview the production build locally with:
```bash
npm run preview
```

---

## 🧠 Architecture Overview
- **`src/engine/`**: Contains pure JavaScript logic detached from the UI.
  - `scoringConstants.js`: Definitions of all questions, point values, options, and red-flag maps.
  - `scoringEngine.js`: Core calculation functions (score normalization, interest level mapping, feedback generation).
- **`src/components/`**: Modular React components for each section of the app (Form Steps, Progress Bar, Result View, etc.).
- **`src/App.jsx`**: The main orchestrator that handles the flow from the Landing page to the Quiz, and finally to the Results.
