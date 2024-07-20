// Alarm[2] Event for obj_test
// Check if the score incremented by the expected amount
if (global.score == global.orig_score + global.test_score) {
    show_debug_message("Test successful. Score: " + string(global.score));
} else {
    show_debug_message("Test failed. Expected score: " + string(global.orig_score + global.test_score) + ", Actual score: " + string(global.score));
}

// Destroy the test object after checking
instance_destroy();
