/**
 * ScoreReveal — Animated score counter with glowing circle.
 *
 * Counts from 0 → finalScore over ~2 seconds, then holds.
 *
 * Props:
 *   score   {number}  — 0–100 final score
 *   level   {string}  — 'high' | 'medium' | 'low'
 */
import React, { useState, useEffect, useRef } from 'react';

export default function ScoreReveal({ score, level }) {
    const [displayed, setDisplayed] = useState(0);
    const rafRef = useRef(null);

    useEffect(() => {
        const duration = 2000; // 2s count-up
        const start = performance.now();

        function tick(now) {
            const elapsed = now - start;
            const progress = Math.min(elapsed / duration, 1);
            // Ease-out cubic
            const eased = 1 - Math.pow(1 - progress, 3);
            setDisplayed(Math.round(eased * score));

            if (progress < 1) {
                rafRef.current = requestAnimationFrame(tick);
            }
        }

        rafRef.current = requestAnimationFrame(tick);
        return () => cancelAnimationFrame(rafRef.current);
    }, [score]);

    return (
        <div className="flex flex-col items-center animate-fade-in-scale">
            <div className={`score-circle ${level}`}>
                <div className="text-center">
                    <span
                        className="text-5xl font-black tabular-nums"
                        style={{
                            color: level === 'high' ? '#51cf66' : level === 'medium' ? '#fcc419' : '#ff6b6b',
                        }}
                    >
                        {displayed}
                    </span>
                    <p className="text-xs font-medium mt-1" style={{ color: '#8b95b3' }}>
                        out of 100
                    </p>
                </div>
            </div>
        </div>
    );
}
