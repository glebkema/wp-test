<?php
/**
 * Template for displaying search forms
 *
 * @package WordPress
 * @subpackage Test_Theme
 * @since 0.1
 */

?>

<form role="search" method="get" class="form-inline my-2 my-lg-0 search-form" action="<?php echo home_url( '/' ); ?>">
	<input type="search" class="form-control px-4 py-2 border-0 shadow-none search-field" placeholder="<?php echo esc_attr_x( 'Search', 'submit button' ) ?>" value="<?php echo get_search_query() ?>" name="s"  aria-label="<?php echo esc_attr_x( 'Search for:', 'label' ) ?>" />
	<input type="submit" class="btn d-none search-submit" value="<?php echo esc_attr_x( 'Search', 'submit button' ) ?>" />
</form>
