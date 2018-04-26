<?php
/**
 * Test Theme functions and definitions
 *
 * @package WordPress
 * @subpackage Test_Theme
 * @since 0.1
 */


//**** use constants to unify values for function parameters
define( 'TEST_THEME_NAME', 'test' );
define( 'TEST_THEME_VERSION', WP_DEBUG ? time() : wp_get_theme()->get( 'Version' ) );


//**** settings
add_action( 'after_setup_theme', 'test_setup_theme' );
function test_setup_theme() {
	//load_theme_textdomain( TEST_THEME_NAME, get_template_directory() . '/languages' );

	add_theme_support( 'custom-logo' );
	add_theme_support( 'html5', array( 'search-form' ) );
	add_theme_support( 'post-thumbnails' );
	add_theme_support( 'title-tag' );
	
	register_nav_menus( array(
		'primary' => 'Primary Menu'
	) );
}


//**** scripts & styles
add_action( 'wp_enqueue_scripts', 'test_enqueue_styles' );
function test_enqueue_styles() {
	if ( ! is_admin() ) {
		wp_scripts()->add_data( 'jquery',         'group', 1 );
		wp_scripts()->add_data( 'jquery-core',    'group', 1 );
		wp_scripts()->add_data( 'jquery-migrate', 'group', 1 );

		wp_enqueue_script( 'popper', 'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js', 
			array( 'jquery' ), false, true );
		wp_enqueue_script( 'bootstrap', 'https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js', 
			array( 'jquery', 'popper' ), false, true );
		wp_enqueue_script( TEST_THEME_NAME, get_template_directory_uri() . '/assets/js/scripts.js', 
			array( 'jquery', 'popper', 'bootstrap' ), TEST_THEME_VERSION, true );

		wp_enqueue_style( 'bootstrap', 'https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css' );
		wp_enqueue_style( 'font-roboto', 'https://fonts.googleapis.com/css?family=Roboto:300,400&amp;subset=cyrillic' );
		wp_enqueue_style( 'font-awesome', 'https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css' );
		wp_enqueue_style( TEST_THEME_NAME, get_template_directory_uri() . '/style.css', 
			array( 'bootstrap', 'font-roboto' ), TEST_THEME_VERSION );
	}
}


//**** logo
if ( ! function_exists( 'test_the_custom_logo' ) ) {
	function test_the_custom_logo( $prefix = 'header' ) {
		$custom_logo_url = '';
		if ( has_custom_logo() ) {
			$custom_logo = wp_get_attachment_image_src( get_theme_mod( 'custom_logo' ), 'full' );
			if ( isset( $image[0] ) ) {
				$custom_logo_url = $image[0];
			}
		}
		if ( empty ( $custom_logo_url ) ) {
			$tail = ( 'header' === $prefix ? 'color' : 'mono' ); 
			$custom_logo_url = get_template_directory_uri() . "/assets/images/logotype-$tail.png";
		}
		echo "<div class='$prefix-logo'><a class='$prefix-logo-link' href='" . home_url() . 
			"'><img class='$prefix-logo-image' alt='" . get_bloginfo( 'description' ) . 
			"' src='$custom_logo_url'></a></div>" . PHP_EOL;
	}
}


//**** menu
add_filter( 'wp_nav_menu', 'test_add_class_to_nav_link', 10, 2 );
function test_add_class_to_nav_link( $nav_menu, $args ) {
   return ( 'primary' === $args->theme_location ? preg_replace( '/<a /', '<a class="nav-link" ', $nav_menu ) : $nav_menu );
}


//**** sidebars
add_action( 'widgets_init', 'test_widgets_init' );
function test_widgets_init() {
	test_register_sidebar( 'header', 'contacts', __( 'Header Contacts',      TEST_THEME_NAME ) );
	test_register_sidebar( 'header', 'search',   __( 'Header Search',        TEST_THEME_NAME ) );
	test_register_sidebar( 'aside',  'about',    __( 'Aside About',          TEST_THEME_NAME ) );
	test_register_sidebar( 'aside',  'bottom',   __( 'Aside Bottom',         TEST_THEME_NAME ) );
	test_register_sidebar( 'main',   'aside',    __( 'Main Sidebar',         TEST_THEME_NAME ) );
	test_register_sidebar( 'footer', 'center',   __( 'Footer Center Column', TEST_THEME_NAME ) );
	test_register_sidebar( 'footer', 'right',    __( 'Footer Right Column',  TEST_THEME_NAME ) );
}
function test_register_sidebar( $prefix, $postfix, $name, $description = '' ) {
	register_sidebar( array(
		'name' => $name,
		'description' => $description,
		'id' => "$prefix-sidebar-$postfix",
		'before_widget' => '<div id="%1$s" class="widget ' . $prefix . '-widget-' . $postfix . ' %2$s">',  // $s prevents changing quotes
		'after_widget' => '</div>',
	) );
}
function test_have_aside_sidebars() {
	return ! is_search() && ! is_archive() && 
		( is_active_sidebar( 'aside-sidebar-about' ) || is_active_sidebar( 'aside-sidebar-bottom' ) );
}


//**** sidebars. enable shortcodes in widgets
add_filter( 'widget_text', 'do_shortcode' );


//**** shortcode. hello world
add_shortcode( 'test_hello', 'test_shortcode_hello' );
function test_shortcode_hello( $atts, $content ) {
	$style = '';
	$atts = shortcode_atts( array(
		'color' => '',
	), $atts );
	$color   = trim( $atts['color'] );
	$content = trim( $content );
    if ( ! empty( $color ) ) {
		if ( false !== mb_strpos( $color, 'time' ) ) {
			$ms_in_a_day = 24 * 60 * 60;
			$degree = floor( 360 * ( time() % $ms_in_a_day ) / $ms_in_a_day ); 
			$color = "hsl($degree, 50%, 50%)";
		}
		$style = " style='color: $color;'";
	}
	if ( empty( $content ) ) {
		$content = 'World';
	}
	return "<div class='test-shortcode' $style>Hello $content!</div>";
}


//**** shortcode. news
add_shortcode( 'test_news', 'test_shortcode_news' );
function test_shortcode_news( $atts, $content ) {
	global $post;
	$html = '';
	$atts = array_map( 'trim', shortcode_atts( array(
		'ids'    => '',
		'number' => 3,
		'title'  => 'Новости',
	), $atts ) );
	$ids = $atts['ids'];
	$html .= '<h2>' . $atts['title'] . '</h2>' . PHP_EOL;

	ob_start();
	
	$posts = get_posts( array(
		'numberposts' => $atts['number'],
		'orderby'     => ( empty( $ids ) ? 'date' : 'post__in' ),
		'order'       => 'ASC',
		'include'     => $ids,
		'post_type'   => 'news',
	) );

    foreach ( $posts as $post ) : setup_postdata( $post );
	?>
		<div class="media news">
			<img class="mr-4 news-image" src="<?php the_post_thumbnail_url(); ?>" alt="">
			<div class="media-body">
				<h5 class="mt-0 news-title"><?php the_title(); ?></h5>
				<div class="news-excerpt"><?php the_excerpt(); ?></div>
			</div>
		</div>
	<?php
	endforeach;
	wp_reset_postdata();

	$html .= ob_get_clean();
	return $html;
}


//**** shortcode. phone
add_shortcode( 'test_phone', 'test_shortcode_phone' );
function test_shortcode_phone( $atts, $content ) {
	$result = '';
	$atts = shortcode_atts( array(
		'class' => '',
	), $atts );
	$class   = trim( $atts['class'] );
	$content = trim( $content );
	if ( ! empty( $content ) ) {
		$result = '<a href="tel:' . preg_replace( '/[^0-9+]/', '', $content ) . '">' . $content . '</a>';
		if ( ! empty( $class ) ) {
			$result = "<div class='$class'>$result</div>";
		}
	}
	return $result;
}
