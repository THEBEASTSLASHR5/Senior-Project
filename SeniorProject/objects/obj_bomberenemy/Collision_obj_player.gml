if (other.rolltimer > 0) {
    exit; 
}

// Deal the contact damage
other.hitpoints -= 5;

// Trigger the player's hit flash
other.hit_flash_timer = 7;

// Create the explosion
instance_create_layer(x, y, "lay_bullets", obj_bomberexplosion);

// Drop the gem
instance_create_layer(x, y, "Instances", obj_gem);

// Destroy the bomber
instance_destroy();