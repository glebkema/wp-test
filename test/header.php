<?php
/**
 * The template for displaying the header
 *
 * @package WordPress
 * @subpackage Test_Theme
 * @since 0.1
 */

?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<?php wp_head(); ?>
	<!--[if lte IE 9]>
		<link href="https://cdn.jsdelivr.net/gh/coliff/bootstrap-ie8/css/bootstrap-ie9.min.css" rel="stylesheet" />
		<script src="https://cdn.jsdelivr.net/g/html5shiv@3.7.3"></script>
	<![endif]-->
	<!--[if lt IE 9]>
		<link href="https://cdn.jsdelivr.net/gh/coliff/bootstrap-ie8/css/bootstrap-ie8.min.css" rel="stylesheet" />
	<![endif]-->
</head>
<body <?php body_class(); ?>>

	<header class="d-flex align-items-center py-3 header">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-sm">
					<?php test_the_custom_logo( 'header' ); ?>
				</div>
				<div class="col-sm text-sm-right">
					<?php dynamic_sidebar( 'header-sidebar-contacts' ); ?>
				</div>
			</div>
		</div>
	</header>

	<div class="subheader<?php echo ( is_front_page() ? ' subheader-frontpage' : '' ); ?>">
		<div class="container">
			<nav class="navbar navbar-expand-md navbar-light subheader-navbar">
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#subheader-navbar" aria-controls="subheader-navbar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<?php 
				wp_nav_menu( array(
					'theme_location' => 'primary',
					'container_class' => 'collapse navbar-collapse',
					'container_id' => 'subheader-navbar',
					'menu_class' => 'navbar-nav mr-auto',
					'link_before' => '<span>',
					'link_after' => '</span>',
					'depth' => 1,
				) );
				?>

				<?php
				if ( is_active_sidebar( 'header-sidebar-search' ) ) :
				?>
				<div class="header-search">
					<?php dynamic_sidebar( 'header-sidebar-search' ); ?>
				</div>
				<?php
				endif;
				?>
			</nav>
			
			<?php
			if ( is_front_page() ) :
			?>
			<div id="promo-carousel" class="carousel slide promo-carousel" data-ride="carousel">
				<div class="carousel-inner rounded" role="listbox">
					<div class="carousel-item active">
					    <div class="row mx-0">
							<div class="col-md-8 order-md-last promo-image" style="background-image: url('<?php echo get_template_directory_uri() . '/assets/images/slide-01.jpg'; ?>')"></div>
							<div class="col-md-4 order-md-first d-flex flex-column justify-content-between py-4 pl-4 pr-5 promo-content">
								<div class="flex-grow-1 promo-content-about">Туристический сервис рассказал об особенностях отдыха российских мужчин</div>
								<div class="mt-4 promo-content-date"><i class="fa fa-clock-o" aria-hidden="true"></i><span class="ml-2 text-uppercase">21 Сентября, 2020</span></div>
								<a href="#" class="btn mt-3 px-3 mr-auto promo-content-button" role="button">новости</a>
							</div>
						</div>
					</div>
					<div class="carousel-item">
					    <div class="row mx-0">
							<div class="col-md-8 order-md-last promo-image" style="background-image: url('<?php echo get_template_directory_uri() . '/assets/images/slide-02.jpg'; ?>')"></div>
							<div class="col-md-4 order-md-first d-flex flex-column justify-content-between py-4 pl-4 pr-5 promo-content">
								<div class="flex-grow-1 promo-content-about">Впечатления девушки, путешествующей по&nbsp;Сирии автостопом</div>
								<div class="mt-4 promo-content-date"><i class="fa fa-clock-o" aria-hidden="true"></i><span class="ml-2 text-uppercase">3 августа, 2016</span></div>
								<a href="#" class="btn mt-3 px-3 mr-auto promo-content-button" role="button">статья</a>
							</div>
						</div>
					</div>
					<div class="carousel-item">
					    <div class="row mx-0">
							<div class="col-md-8 order-md-last promo-image" style="background-image: url('<?php echo get_template_directory_uri() . '/assets/images/slide-03.jpg'; ?>')"></div>
							<div class="col-md-4 order-md-first d-flex flex-column justify-content-between py-4 pl-4 pr-5 promo-content">
								<div class="flex-grow-1 promo-content-about">В Мьянме запретят забираться на&nbsp;древние памятники из-за некультурных туристов</div>
								<div class="mt-4 promo-content-date"><i class="fa fa-clock-o" aria-hidden="true"></i><span class="ml-2 text-uppercase">19 декабря, 2016</span></div>
								<a href="#" class="btn mt-3 px-3 mr-auto promo-content-button" role="button">спорт</a>
							</div>
						</div>
					</div>
				</div>
				<div class="btn-group btn-group-sm position-absolute promo-carousel-arrows" role="group" aria-label="Carousel arrows">
					<a class="btn" href="#promo-carousel" role="button" data-slide="prev">
						<i class="fa fa-caret-left" aria-hidden="true"></i>
						<span class="sr-only"><?php _e( 'Previous' ); ?></span>
					</a>
					<a class="btn" href="#promo-carousel" role="button" data-slide="next">
						<i class="fa fa-caret-right" aria-hidden="true"></i>
						<span class="sr-only"><?php _e( 'Next' ); ?></span>
					</a>
				</div>
			</div>
			<?php
			endif;
			?>
		</div>
	</div>
