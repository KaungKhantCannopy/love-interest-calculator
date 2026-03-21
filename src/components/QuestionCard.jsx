/**
 * QuestionCard — Renders a single question with option cards.
 *
 * Props:
 *   question   {Object}  — { id, label, options }
 *   value      {string}  — currently selected value (or undefined)
 *   onChange   {fn}      — (questionId, value) => void
 *   delay      {number}  — animation delay in ms
 */
import React from 'react';

export default function QuestionCard({ question, value, onChange, delay = 0 }) {
    return (
        <div
            className="animate-fade-in-up mb-6"
            style={{ animationDelay: `${delay}ms`, animationFillMode: 'both' }}
        >
            <p className="text-sm font-semibold mb-3" style={{ color: '#dbe4ff' }}>
                {question.label}
            </p>

            <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
                {question.options.map((opt) => {
                    const isSelected = value === opt.value;
                    return (
                        <button
                            key={opt.value}
                            type="button"
                            className={`option-card text-left ${isSelected ? 'selected' : ''}`}
                            onClick={() => onChange(question.id, opt.value)}
                            aria-pressed={isSelected}
                        >
                            <span className="text-sm font-medium" style={{ color: isSelected ? '#dbe4ff' : '#a0aec0' }}>
                                {opt.label}
                            </span>
                        </button>
                    );
                })}
            </div>
        </div>
    );
}
