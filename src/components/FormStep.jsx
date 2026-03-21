/**
 * FormStep — Renders one step of the questionnaire.
 *
 * Props:
 *   step       {Object}   — { id, title, subtitle, icon, questions }
 *   answers    {Object}   — current answers state
 *   onChange   {fn}       — (questionId, value) => void
 */
import React from 'react';
import QuestionCard from './QuestionCard';

export default function FormStep({ step, answers, onChange }) {
    return (
        <div className="animate-fade-in-up">
            {/* Step Header */}
            <div className="text-center mb-8">
                <span className="text-4xl mb-3 block animate-float">{step.icon}</span>
                <h2 className="text-2xl font-bold mb-1" style={{ color: '#f1f3f9' }}>
                    {step.title}
                </h2>
                <p className="text-sm" style={{ color: '#8b95b3' }}>
                    {step.subtitle}
                </p>
            </div>

            {/* Questions */}
            {step.questions.map((q, idx) => (
                <QuestionCard
                    key={q.id}
                    question={q}
                    value={answers[q.id]}
                    onChange={onChange}
                    delay={idx * 100}
                />
            ))}
        </div>
    );
}
