<?php
/**
 * The main template file
 *
 * @package WordPress
 * @subpackage Test_Theme
 * @since 0.1
 */

get_header(); 
?>

	<div class="container">
		<div class="row">
			<main class="<?php echo ( test_have_aside_sidebars() ? 'col-md-8 order-md-last' : 'col' ); ?> mt-5 content">
			    <?php if ( ! is_front_page() ) : ?>
					<h1 class="page-title">
						<?php 
						if ( is_search() ) :
							 _e( 'Search Results' );
						elseif ( is_archive() ) :
							 _e( 'Posts' );
						else :
							single_post_title();
						endif;
						?>
					</h1>
				<?php endif; ?>

				<?php
				if ( have_posts() ) :
					while ( have_posts() ) :
						the_post();
						get_template_part( 'template-parts/loop' );
					endwhile;
					the_posts_pagination();
				else :
					get_template_part( 'template-parts/not-found' );
				endif;
				?>
			</main>
			
			<?php get_sidebar(); ?>
		</div>
	</div>

<?php
get_footer();
