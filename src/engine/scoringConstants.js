/**
 * ═══════════════════════════════════════════════════════════════
 *  SCORING CONSTANTS - All question definitions & point values
 * ═══════════════════════════════════════════════════════════════
 *
 *  Each step groups related questions. Each question has:
 *    - id:      unique key for state tracking
 *    - label:   display text
 *    - options: array of { value, label, points, sentiment }
 *
 *  Sentiment values:
 *    "positive"  ->  +2 points
 *    "neutral"   ->  +1 point
 *    "negative"  ->   0 or -1 points
 */

export const STEPS = [
  {
    id: 'chat',
    title: 'Chat Behavior',
    subtitle: 'How do they communicate with you digitally?',
    icon: '\u{1F4AC}',
    questions: [
      {
        id: 'replySpeed',
        label: 'How fast do they reply?',
        options: [
          { value: 'fast', label: '\u26A1 Fast', points: 2, sentiment: 'positive' },
          { value: 'medium', label: '\u23F1\uFE0F Medium', points: 1, sentiment: 'neutral' },
          { value: 'slow', label: '\u{1F40C} Slow', points: 0, sentiment: 'negative' },
        ],
      },
      {
        id: 'initiator',
        label: 'Who starts conversations?',
        options: [
          { value: 'both', label: '\u{1F91D} Both of us', points: 2, sentiment: 'positive' },
          { value: 'her', label: '\u{1F48C} Them', points: 1, sentiment: 'neutral' },
          { value: 'me', label: '\u{1F4E4} Always me', points: -1, sentiment: 'negative' },
        ],
      },
      {
        id: 'messageStyle',
        label: "What's their message style?",
        options: [
          { value: 'long', label: '\u{1F4DD} Long & detailed', points: 2, sentiment: 'positive' },
          { value: 'normal', label: '\u{1F4AC} Normal length', points: 1, sentiment: 'neutral' },
          { value: 'short', label: '\u{1F4E9} Short / dry', points: 0, sentiment: 'negative' },
        ],
      },
    ],
  },
  {
    id: 'realLife',
    title: 'Real Life Interaction',
    subtitle: 'How do they act around you in person?',
    icon: '\u{1F440}',
    questions: [
      {
        id: 'eyeContact',
        label: 'Do they maintain eye contact?',
        options: [
          { value: 'yes', label: '\u{1F441}\uFE0F Yes, often', points: 2, sentiment: 'positive' },
          { value: 'sometimes', label: '\u{1F610} Sometimes', points: 1, sentiment: 'neutral' },
          { value: 'no', label: '\u{1F6AB} Rarely / never', points: -1, sentiment: 'negative' },
        ],
      },
      {
        id: 'engagement',
        label: 'How engaged are they in conversation?',
        options: [
          { value: 'high', label: '\u{1F525} Very engaged', points: 2, sentiment: 'positive' },
          { value: 'low', label: '\u{1F636} Low energy / distracted', points: 0, sentiment: 'negative' },
        ],
      },
      {
        id: 'comfort',
        label: 'How comfortable are they around you?',
        options: [
          { value: 'comfortable', label: '\u{1F60A} Very comfortable', points: 2, sentiment: 'positive' },
          { value: 'neutral', label: '\u{1F610} Neutral', points: 1, sentiment: 'neutral' },
          { value: 'distant', label: '\u{1F9CA} Distant / guarded', points: -1, sentiment: 'negative' },
        ],
      },
    ],
  },
  {
    id: 'effort',
    title: 'Effort Level',
    subtitle: 'How much effort do they put in?',
    icon: '\u{1F4AA}',
    questions: [
      {
        id: 'willingnessToMeet',
        label: 'Are they willing to meet up?',
        options: [
          { value: 'yes', label: '\u2705 Yes, enthusiastically', points: 2, sentiment: 'positive' },
          { value: 'sometimes', label: '\u{1F937} Sometimes', points: 1, sentiment: 'neutral' },
          { value: 'no', label: '\u274C Not really', points: -1, sentiment: 'negative' },
        ],
      },
      {
        id: 'cancellationFreq',
        label: 'How often do they cancel plans?',
        options: [
          { value: 'rare', label: '\u2728 Rarely / never', points: 2, sentiment: 'positive' },
          { value: 'sometimes', label: '\u{1F615} Sometimes', points: 1, sentiment: 'neutral' },
          { value: 'often', label: '\u{1F4A8} Often', points: -1, sentiment: 'negative' },
        ],
      },
      {
        id: 'priority',
        label: 'Do you feel like a priority to them?',
        options: [
          { value: 'yes', label: '\u2B50 Yes, definitely', points: 2, sentiment: 'positive' },
          { value: 'unsure', label: '\u{1F914} Unsure', points: 1, sentiment: 'neutral' },
          { value: 'no', label: '\u{1F614} No', points: -1, sentiment: 'negative' },
        ],
      },
    ],
  },
  {
    id: 'social',
    title: 'Social Media',
    subtitle: 'How do they interact with you online?',
    icon: '\u{1F4F1}',
    questions: [
      {
        id: 'storyInteraction',
        label: 'Do they watch / react to your stories?',
        options: [
          { value: 'yes', label: '\u{1F440} Yes, regularly', points: 2, sentiment: 'positive' },
          { value: 'no', label: '\u{1F648} No / rarely', points: 0, sentiment: 'negative' },
        ],
      },
      {
        id: 'postEngagement',
        label: 'Do they engage with your posts?',
        options: [
          { value: 'likeComment', label: '\u2764\uFE0F Like & comment', points: 2, sentiment: 'positive' },
          { value: 'none', label: '\u{1F636} Nothing', points: 0, sentiment: 'negative' },
        ],
      },
      {
        id: 'ignoring',
        label: 'Do they ignore your messages?',
        options: [
          { value: 'no', label: '\u2705 No, they always respond', points: 2, sentiment: 'positive' },
          { value: 'yes', label: '\u{1F6A9} Yes, sometimes', points: -1, sentiment: 'negative' },
        ],
      },
    ],
  },
  {
    id: 'special',
    title: 'Special Signals',
    subtitle: 'The subtle signs that matter most',
    icon: '\u2728',
    questions: [
      {
        id: 'teasing',
        label: 'Do they tease or joke with you?',
        options: [
          { value: 'yes', label: '\u{1F602} Yes, playfully', points: 2, sentiment: 'positive' },
          { value: 'no', label: '\u{1F610} Not really', points: 0, sentiment: 'negative' },
        ],
      },
      {
        id: 'personalQuestions',
        label: 'Do they ask personal questions?',
        options: [
          { value: 'yes', label: "\u{1F9D0} Yes, they're curious", points: 2, sentiment: 'positive' },
          { value: 'no', label: '\u{1F636} No', points: 0, sentiment: 'negative' },
        ],
      },
      {
        id: 'remembersDetails',
        label: 'Do they remember small details about you?',
        options: [
          { value: 'yes', label: '\u{1F9E0} Yes!', points: 2, sentiment: 'positive' },
          { value: 'no', label: '\u{1F937} Not really', points: 0, sentiment: 'negative' },
        ],
      },
    ],
  },
];

/**
 * Total number of questions across all steps.
 */
export const TOTAL_QUESTIONS = STEPS.reduce(
  (sum, step) => sum + step.questions.length, 0
);

/**
 * Maximum possible raw score if every answer is "positive" (+2).
 */
export const MAX_RAW_SCORE = TOTAL_QUESTIONS * 2;

/**
 * Red-flag descriptions mapped to question ID + negative value.
 * Used to generate human-readable warnings.
 */
export const RED_FLAG_MAP = {
  replySpeed_slow: "They take a long time to reply - low priority signal.",
  initiator_me: "You always initiate - the effort isn't mutual.",
  messageStyle_short: "Short / dry messages suggest low engagement.",
  eyeContact_no: "Avoiding eye contact can indicate discomfort or disinterest.",
  engagement_low: "Low engagement in person is a significant red flag.",
  comfort_distant: "They seem guarded or distant around you.",
  willingnessToMeet_no: "They avoid meeting up - a strong disinterest signal.",
  cancellationFreq_often: "Frequent cancellations show you're not a priority.",
  priority_no: "You don't feel like a priority - trust that instinct.",
  storyInteraction_no: "No story interaction suggests low digital awareness of you.",
  postEngagement_none: "Zero post engagement means they're not invested online.",
  ignoring_yes: "Ignoring messages is a major red flag \u{1F6A9}",
  teasing_no: "No playful banter can indicate a lack of romantic chemistry.",
  personalQuestions_no: "They aren't curious about your life.",
  remembersDetails_no: "Not remembering details means they're not paying attention.",
};
