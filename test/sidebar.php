<?php
/**
 * The sidebar
 *
 * @package WordPress
 * @subpackage Test_Theme
 * @since 0.1
 */

if ( test_have_aside_sidebars() ) :
?>

<aside class="col-md-4 order-md-first mt-5 sidebar">
	<?php dynamic_sidebar( 'aside-sidebar-about' ); ?>
	<?php dynamic_sidebar( 'aside-sidebar-bottom' ); ?>
</aside>

<?php
endif;
