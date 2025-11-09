if (global.paused) {
    exit;
}

// Gem floating
bob_angle += 0.05; 
y = start_y + (sin(bob_angle) * 1); //move up and down

// Count down the gem's life
lifetime -= 1;

if (lifetime <= 0) {
    instance_destroy();
    exit; 
}

// Set default state
image_alpha = 1.0; 

// time to start flashing (last 3 seconds)
if (lifetime <= flash_time) {
    
    var blink_period = 20;  
    if (lifetime mod blink_period < 10) { 
        image_alpha = 0.0; // Flash OFF 
    } else {
        image_alpha = 1.0;  // Flash ON 
    }
}