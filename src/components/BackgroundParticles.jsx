/**
 * BackgroundParticles — Decorative floating particles for the background.
 * Pure aesthetics, no interaction.
 */
import React, { useMemo } from 'react';

export default function BackgroundParticles() {
    // Generate random particle positions (stable across re-renders)
    const particles = useMemo(() => {
        return Array.from({ length: 30 }, (_, i) => ({
            id: i,
            left: `${Math.random() * 100}%`,
            top: `${Math.random() * 100}%`,
            size: 2 + Math.random() * 4,
            delay: Math.random() * 6,
            duration: 4 + Math.random() * 6,
            opacity: 0.1 + Math.random() * 0.25,
        }));
    }, []);

    return (
        <div className="bg-particles">
            {particles.map((p) => (
                <span
                    key={p.id}
                    style={{
                        left: p.left,
                        top: p.top,
                        width: p.size,
                        height: p.size,
                        opacity: p.opacity,
                        animationDelay: `${p.delay}s`,
                        animationDuration: `${p.duration}s`,
                    }}
                />
            ))}
        </div>
    );
}
