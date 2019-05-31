$(document).ready(function () {
    (function (win, doc, $) {
        var themeSettings = win.themeSettings;
        var layoutHelpers = win.layoutHelpers;
        var attachMaterialRipple = win.attachMaterialRipple;
        var detachMaterialRipple = win.detachMaterialRipple;

        var firstLoad = true;
        var sidenav = null;

            if (layoutHelpers) {
                // Update layout
                layoutHelpers.update();

                // Auto update layout
                layoutHelpers.setAutoUpdate(true);

                // Hide sidenav on small screens after page load
                if (layoutHelpers.isSmallScreen()) {
                    layoutHelpers.setCollapsed(true, true);
                }
            }

            // Attach material ripple
            if (!firstLoad && attachMaterialRipple && doc.documentElement.classList.contains('material-style')) {
                attachMaterialRipple();
            }

            // Initialize sidenav
            $('#layout-sidenav').each(function () {
                sidenav = new win.SideNav(this, {
                    orientation: $(this).hasClass('sidenav-horizontal') ? 'horizontal' : 'vertical'
                });
            });

            // Initialize sidenav togglers
            $('body').on('click', '.layout-sidenav-toggle', function (e) {
                console.log('fu33ck2');
                e.preventDefault();
                layoutHelpers.toggleCollapsed();
            });

            // Swap dropdown menus in RTL mode
            if ($('html').attr('dir') === 'rtl') {
                $('#layout-navbar .dropdown-menu').toggleClass('dropdown-menu-right');
            }

        doc.addEventListener('turbolinks:visit', function () {
            firstLoad = false;

            // Clean up layoutHelpers
            if (layoutHelpers) {
                layoutHelpers.destroy();
            }

            // Clean up material ripple
            if (detachMaterialRipple) {
                detachMaterialRipple();
            }

            // Destroy sidenav
            if (sidenav) {
                sidenav.destroy();
            }

            // Remove sidenav toggler listeners
            $('body').off('click', '.layout-sidenav-toggle');
        });
    })(window, document, jQuery);
});