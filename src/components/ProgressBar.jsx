/**
 * ProgressBar — Animated step progress indicator with step labels.
 *
 * Props:
 *   currentStep {number}  — 0-indexed current step
 *   totalSteps  {number}  — total number of steps
 *   steps       {Array}   — step objects with { title, icon }
 */
import React from 'react';

export default function ProgressBar({ currentStep, totalSteps, steps }) {
    const progress = ((currentStep + 1) / totalSteps) * 100;

    return (
        <div className="w-full mb-8">
            {/* Step indicators */}
            <div className="flex justify-between mb-3 px-1">
                {steps.map((step, idx) => (
                    <div
                        key={step.id}
                        className="flex flex-col items-center gap-1"
                        style={{ opacity: idx <= currentStep ? 1 : 0.35, transition: 'opacity 0.3s' }}
                    >
                        <span className="text-lg" role="img" aria-label={step.title}>
                            {step.icon}
                        </span>
                        <span
                            className="text-[10px] font-medium tracking-wide hidden sm:block"
                            style={{ color: idx === currentStep ? '#bac8ff' : '#6b7280' }}
                        >
                            {step.title}
                        </span>
                    </div>
                ))}
            </div>

            {/* Track */}
            <div className="progress-track">
                <div className="progress-fill" style={{ width: `${progress}%` }} />
            </div>

            {/* Step counter */}
            <p className="text-center text-xs mt-2" style={{ color: '#8b95b3' }}>
                Step {currentStep + 1} of {totalSteps}
            </p>
        </div>
    );
}
