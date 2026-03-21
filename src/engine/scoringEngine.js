/**
 * ═══════════════════════════════════════════════════════════════
 *  SCORING ENGINE - Pure logic, zero UI dependencies
 * ═══════════════════════════════════════════════════════════════
 *
 *  All functions accept a plain `answers` object:
 *    { replySpeed: 'fast', initiator: 'both', ... }
 *
 *  and the constants from scoringConstants.js.
 */

import { STEPS, MAX_RAW_SCORE, RED_FLAG_MAP } from './scoringConstants';

// --- Helpers ------------------------------------------------

/**
 * Look up the option object for a given questionId + selected value.
 */
function findOption(questionId, value) {
  for (const step of STEPS) {
    for (const q of step.questions) {
      if (q.id === questionId) {
        return q.options.find((o) => o.value === value) ?? null;
      }
    }
  }
  return null;
}

// --- Core Scoring -------------------------------------------

/**
 * Calculate the raw score (sum of points) from user answers.
 * @param {Object} answers - { questionId: selectedValue }
 * @returns {number} raw score
 */
export function calculateRawScore(answers) {
  let total = 0;
  for (const [qId, val] of Object.entries(answers)) {
    const option = findOption(qId, val);
    if (option) total += option.points;
  }
  return total;
}

/**
 * Normalize the raw score to a 0-100 scale.
 * Negative raw scores clamp to 0.
 */
export function normalizeScore(rawScore) {
  const clamped = Math.max(0, rawScore);
  return Math.round((clamped / MAX_RAW_SCORE) * 100);
}

/**
 * Full pipeline: answers -> normalized 0-100 score.
 */
export function calculateScore(answers) {
  return normalizeScore(calculateRawScore(answers));
}

// --- Interest Level -----------------------------------------

/**
 * Map a 0-100 score to an interest level descriptor.
 */
export function getInterestLevel(score) {
  if (score >= 80) {
    return {
      level: 'high',
      label: 'High Interest',
      emoji: '\u{1F7E2}',
      color: '#51cf66',
      description: 'They are clearly into you! The signals are strong.',
    };
  }
  if (score >= 50) {
    return {
      level: 'medium',
      label: 'Medium Interest',
      emoji: '\u{1F7E1}',
      color: '#fcc419',
      description: "There's potential, but the signals are mixed.",
    };
  }
  return {
    level: 'low',
    label: 'Low Interest',
    emoji: '\u{1F534}',
    color: '#ff6b6b',
    description: 'Unfortunately, the signs point to low interest.',
  };
}

// --- Red Flags -----------------------------------------------

/**
 * Identify negative signals and return human-readable warnings.
 * @returns {string[]} array of red-flag descriptions
 */
export function getRedFlags(answers) {
  const flags = [];
  for (const [qId, val] of Object.entries(answers)) {
    const option = findOption(qId, val);
    if (option && option.sentiment === 'negative') {
      const key = `${qId}_${val}`;
      if (RED_FLAG_MAP[key]) {
        flags.push(RED_FLAG_MAP[key]);
      }
    }
  }
  return flags;
}

// --- Next Move Recommendation --------------------------------

/**
 * Suggest the next action based on interest level.
 */
export function getNextMove(level) {
  switch (level) {
    case 'high':
      return {
        title: 'Go for it! \u{1F680}',
        advice: "The signs are in your favor. It's time to take things forward - be more direct, plan something special, and let them know how you feel. Confidence will take you far here.",
        actions: [
          'Plan a meaningful one-on-one date',
          'Be more open about your feelings',
          'Escalate the connection naturally',
          'Keep the momentum going',
        ],
      };
    case 'medium':
      return {
        title: 'Test the waters \u{1F30A}',
        advice: "There's interest, but it's not fully clear yet. Focus on building connection and creating shared experiences. Look for more signals before making a big move.",
        actions: [
          'Increase quality one-on-one time',
          'Pay attention to their responses when you invest more',
          'Create memorable shared experiences',
          "Be patient but don't wait forever",
        ],
      };
    default:
      return {
        title: 'Time to re-evaluate \u{1F4AD}',
        advice: "The signals suggest low interest. It's important to protect your energy and self-respect. Sometimes the bravest move is stepping back.",
        actions: [
          'Stop over-investing your energy',
          'Focus on yourself and your growth',
          'Keep your options open',
          'Accept the situation with grace',
        ],
      };
  }
}

// --- Confidence Explanation ----------------------------------

/**
 * Build a human-readable explanation of WHY the score landed where it did.
 * Summarizes the strongest positive & negative signals.
 */
export function getConfidenceExplanation(answers) {
  const positives = [];
  const negatives = [];

  for (const [qId, val] of Object.entries(answers)) {
    const option = findOption(qId, val);
    if (!option) continue;

    // Find the question label for context
    let questionLabel = '';
    for (const step of STEPS) {
      const found = step.questions.find((q) => q.id === qId);
      if (found) { questionLabel = found.label; break; }
    }

    if (option.sentiment === 'positive') {
      positives.push(questionLabel);
    } else if (option.sentiment === 'negative') {
      negatives.push(questionLabel);
    }
  }

  const parts = [];

  if (positives.length > 0) {
    parts.push(
      `Strong positive signals in ${positives.length} area${positives.length > 1 ? 's' : ''}: ${positives.slice(0, 3).join(', ')}${positives.length > 3 ? ` and ${positives.length - 3} more` : ''}.`
    );
  }

  if (negatives.length > 0) {
    parts.push(
      `Concerning patterns in ${negatives.length} area${negatives.length > 1 ? 's' : ''}: ${negatives.slice(0, 3).join(', ')}${negatives.length > 3 ? ` and ${negatives.length - 3} more` : ''}.`
    );
  }

  if (parts.length === 0) {
    parts.push('Mostly neutral signals - the situation is unclear.');
  }

  return parts.join(' ');
}

// --- Full Analysis (single call) ----------------------------

/**
 * Run the complete analysis and return a structured result object.
 * This is the main entry point for the UI.
 */
export function analyzeInterest(answers) {
  const score = calculateScore(answers);
  const interest = getInterestLevel(score);
  const redFlags = getRedFlags(answers);
  const nextMove = getNextMove(interest.level);
  const confidence = getConfidenceExplanation(answers);

  return {
    score,
    interest,
    redFlags,
    nextMove,
    confidence,
  };
}
