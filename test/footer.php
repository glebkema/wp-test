<?php
/**
 * The template for displaying the footer
 *
 * @package WordPress
 * @subpackage Test_Theme
 * @since 0.1
 */

?>

	<footer class="d-flex align-items-center mt-5 pt-4 pb-5 footer">
		<div class="container">
			<div class="row">
				<div class="col-md align-self-center footer-column-left">
					<?php test_the_custom_logo( 'footer' ); ?>
				</div>
				<?php
				if ( is_active_sidebar( 'footer-sidebar-center' ) ) :
				?>
				<div class="col-md footer-column-center">
					<?php dynamic_sidebar( 'footer-sidebar-center' ); ?>
				</div>
				<?php
				endif;
				if ( is_active_sidebar( 'footer-sidebar-right' ) ) :
				?>
				<div class="col-md footer-column-right">
					<?php dynamic_sidebar( 'footer-sidebar-right' ); ?>
				</div>
				<?php
				endif;
				?>
			</div>
		</div>
	</footer>

<?php wp_footer(); ?>

</body>
</html>
