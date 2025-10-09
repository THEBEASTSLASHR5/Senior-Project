// --- Step Event for obj_pause_controller ---

// Make sure the global variable exists
if (!variable_global_exists("paused")) global.paused = false;

// When paused
if (global.paused)
{
    // Disable player/enemy/projectile logic
    with (all)
    {
        if (object_index == obj_pause_button || object_index == obj_resume_button) exit;

        // Stop sprite animations
        image_speed = 0;

        // Save position once
        if (!variable_instance_exists(id, "stored_x")) stored_x = x;
        if (!variable_instance_exists(id, "stored_y")) stored_y = y;

        // Freeze object in place
        x = stored_x;
        y = stored_y;

        // Prevent movement or actions
        speed = 0;
        hspeed = 0;
        vspeed = 0;

        // Prevent shooting / AI scripts from running
        event_perform(ev_step, ev_user0);
    }
}
else
{
    // Resume normal behavior
    with (all)
    {
        if (object_index == obj_pause_button || object_index == obj_resume_button) exit;

        // Re-enable animations
        image_speed = 1;

        // Update stored positions for next pause
        stored_x = x;
        stored_y = y;
    }
}
