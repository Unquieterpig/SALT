// --- Tide Movement ---

time += tide_speed;

// Once a full 360-degree cycle is complete, reset it.
if (time >= 360) {
    time -= 360;
    // Trigger the alarm to get new random values for the next wave cycle.
    alarm[0] = 1;
}

// Apply calculation to the starting y position.
y = y_start + dsin(time) * tide_amplitude;