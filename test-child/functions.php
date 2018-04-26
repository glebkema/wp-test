<?php

add_action( 'wp_enqueue_scripts', 'wptest_child_enqueue_scripts' );
function wptest_child_enqueue_scripts() {
	if ( ! is_admin() ) {
		wp_enqueue_style( 'test-child', get_stylesheet_directory_uri() . '/style.css', array( 'test' ), TEST_THEME_VERSION );
	}
}
