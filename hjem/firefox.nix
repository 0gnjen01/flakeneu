{...}: {
  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings = {
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # I still don't care about cookies
        "idcac-pub@guus.ninja" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
          installation_mode = "force_installed";
        };
        # ProtonPass
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
  hjem.users.ignis = {
    xdg.config.files."/home/ignis/.mozilla/default/chrome/userChrome.css".text = ''
      /*---+---+---+---+---+---+---+
       | C | O | L | O | U | R | S |
       +---+---+---+---+---+---+---*/

      @media (prefers-color-scheme: dark) {
        :root {
          /* These colours are (mainly) used by the
           Container Tabs Plugin */
          --uc-identity-colour-blue: #7ed6df;
          --uc-identity-colour-turquoise: #55e6c1;
          --uc-identity-colour-green: #b8e994;
          --uc-identity-colour-yellow: #f7d794;
          --uc-identity-colour-orange: #f19066;
          --uc-identity-colour-red: #fc5c65;
          --uc-identity-colour-pink: #f78fb3;
          --uc-identity-colour-purple: #786fa6;

          /*  Cascades main Colour Scheme */
          --uc-base-colour: #1e2021;
          --uc-highlight-colour: #191b1c;
          --uc-inverted-colour: #fafafc;
          --uc-muted-colour: #aaaaac;
          --uc-accent-colour: var(--uc-identity-colour-purple);
        }
      }

      @media (prefers-color-scheme: light) {
        :root {
          /* These colours are (mainly) used by the
           Container Tabs Plugin */
          --uc-identity-colour-blue: #1d65f5;
          --uc-identity-colour-turquoise: #209fb5;
          --uc-identity-colour-green: #40a02b;
          --uc-identity-colour-yellow: #e49320;
          --uc-identity-colour-orange: #fe640b;
          --uc-identity-colour-red: #fc5c65;
          --uc-identity-colour-pink: #ec83d0;
          --uc-identity-colour-purple: #822fee;

          /*  Cascades main Colour Scheme */
          --uc-base-colour: #fafafc;
          --uc-highlight-colour: #dadadc;
          --uc-inverted-colour: #1e2021;
          --uc-muted-colour: #191b1c;
          --uc-accent-colour: var(--uc-identity-colour-purple);
        }
      }

      /* Down here I'm just reassigning variables based on the colours set above.
         Feel free to play around with these but there is no editing necessary below this line. c:
         */

      :root {
        --lwt-frame: var(--uc-base-colour) !important;
        --lwt-accent-color: var(--lwt-frame) !important;
        --lwt-text-color: var(--uc-inverted-colour) !important;

        --toolbar-field-color: var(--uc-inverted-colour) !important;

        --toolbar-field-focus-color: var(--uc-inverted-colour) !important;
        --toolbar-field-focus-background-color: var(--uc-highlight-colour) !important;
        --toolbar-field-focus-border-color: transparent !important;

        --toolbar-field-background-color: var(--lwt-frame) !important;
        --lwt-toolbar-field-highlight: var(--uc-inverted-colour) !important;
        --lwt-toolbar-field-highlight-text: var(--uc-highlight-colour) !important;
        --urlbar-popup-url-color: var(--uc-accent-colour) !important;

        --lwt-tab-text: var(--lwt-text-colour) !important;

        --lwt-selected-tab-background-color: var(--uc-highlight-colour) !important;

        --toolbar-bgcolor: var(--lwt-frame) !important;
        --toolbar-color: var(--lwt-text-color) !important;
        --toolbarseparator-color: var(--uc-accent-colour) !important;
        --toolbarbutton-hover-background: var(--uc-highlight-colour) !important;
        --toolbarbutton-active-background: var(
          --toolbarbutton-hover-background
        ) !important;

        --lwt-sidebar-background-color: var(--lwt-frame) !important;
        --sidebar-background-color: var(--lwt-sidebar-background-color) !important;

        --urlbar-box-bgcolor: var(--uc-highlight-colour) !important;
        --urlbar-box-text-color: var(--uc-muted-colour) !important;
        --urlbar-box-hover-bgcolor: var(--uc-highlight-colour) !important;
        --urlbar-box-hover-text-color: var(--uc-inverted-colour) !important;
        --urlbar-box-focus-bgcolor: var(--uc-highlight-colour) !important;
      }

      .identity-color-blue {
        --identity-tab-color: var(--uc-identity-colour-blue) !important;
        --identity-icon-color: var(--uc-identity-colour-blue) !important;
      }
      .identity-color-turquoise {
        --identity-tab-color: var(--uc-identity-colour-turquoise) !important;
        --identity-icon-color: var(--uc-identity-colour-turquoise) !important;
      }
      .identity-color-green {
        --identity-tab-color: var(--uc-identity-colour-green) !important;
        --identity-icon-color: var(--uc-identity-colour-green) !important;
      }
      .identity-color-yellow {
        --identity-tab-color: var(--uc-identity-colour-yellow) !important;
        --identity-icon-color: var(--uc-identity-colour-yellow) !important;
      }
      .identity-color-orange {
        --identity-tab-color: var(--uc-identity-colour-orange) !important;
        --identity-icon-color: var(--uc-identity-colour-orange) !important;
      }
      .identity-color-red {
        --identity-tab-color: var(--uc-identity-colour-red) !important;
        --identity-icon-color: var(--uc-identity-colour-red) !important;
      }
      .identity-color-pink {
        --identity-tab-color: var(--uc-identity-colour-pink) !important;
        --identity-icon-color: var(--uc-identity-colour-pink) !important;
      }
      .identity-color-purple {
        --identity-tab-color: var(--uc-identity-colour-purple) !important;
        --identity-icon-color: var(--uc-identity-colour-purple) !important;
      }
      /*---+---+---+---+---+---+
       | G | L | O | B | A | L |
       +---+---+---+---+---+---*/

      :root {
        /*  Global Border Radius
         *  applied to ALL UI elements
         */
        --uc-border-radius: 8px;

        /*  The distance the Statuspanel floats
         *  away from the window border
         *  0 places directly in the corner
         */
        --uc-status-panel-spacing: 12px;
      }

      /* remove window control buttons */
      .titlebar-buttonbox-container {
        display: none !important;
      }

      #pageActionButton {
        display: none !important;
      }

      #PanelUI-menu-button {
        padding: 0px !important;
      }
      #PanelUI-menu-button .toolbarbutton-icon {
        width: 1px !important;
      }
      #PanelUI-menu-button .toolbarbutton-badge-stack {
        padding: 0px !important;
      }

      /*---+---+---+---+---+---+---+
       | T | O | O | L | B | A | R |
       +---+---+---+---+---+---+---*/

      /*  Position of the Personal Toolbar
       *  possible values:
       *  0 – toolbar on top
       *  4 – toolbar on bottom
       */
      :root {
        --uc-toolbar-position: 4;
      }

      /*  Darken the Personal Toolbar by X amount
       *  where X = 1 means pure black
       *  and X = 0 means no darkening at all
       */
      @media (prefers-color-scheme: dark) {
        :root {
          --uc-darken-toolbar: 0.2;
        }
      }
      @media (prefers-color-scheme: light) {
        :root {
          --uc-darken-toolbar: 0;
        }
      }

      /*---+---+---+---+---+---+---+
       | U | R | L | — | B | A | R |
       +---+---+---+---+---+---+---*/

      :root {
        /*  Width of the URL Bar for the Oneline layout
         *  If enabled the max-width is applied on focus
         *  otherwise the URL Bar will always be it's min-width
         */
        --uc-urlbar-min-width: 35vw;
        --uc-urlbar-max-width: 35vw;

        /*  Position of the URL Bar
         *  possible values:
         *  1 – tabs on the right
         *  3 – tabs on the left
         */
        --uc-urlbar-position: 1;

        /*  Firefox can be a little wonky with the vertical
         *  URL Bar placement. Change this variable to adapt
         *  to this when necessary.
         */
        --uc-urlbar-top-spacing: 1px;
      }

      /* Disable the Navigation Buttons */
      #back-button,
      #forward-button {
        display: none !important;
      }

      /* Disables the Tracking Protection Shield */
      /* #tracking-protection-icon-container { display: none !important; } */

      /* Encryption and Permissions icons */
      /* Only hides permission items */
      #identity-permission-box {
        display: none !important;
      }
      /* Hides extension page box */
      #identity-box.extensionPage {
        display: none !important;
      }
      /* Hides encryption AND permission items */
      /* #identity-box { display: none !important } */

      /* Hide everything BUT the zoom indicator within the URL Bar */
      /* #page-action-buttons > :not(#urlbar-zoom-button) { display: none !important; } */

      /* Hide the »Go«-arrow in the URL Bar */
      #urlbar-go-button {
        display: none !important;
      }

      /* Hides the Extensions Menu Icon */
      /* #unified-extensions-button { display: none !important; } */

      /*---+---+---+---+---+---+---+
       | T | A | B | — | B | A | R |
       +---+---+---+---+---+---+---*/

      :root {
        /*  Allow tabs to have dynamic widths based on
         *  the Tab Bars maximum width
         */
        --uc-active-tab-width: clamp(100px, 30vw, 300px);
        --uc-inactive-tab-width: clamp(100px, 20vw, 200px);

        /*  Enable this to always show the Tab Close button
         *  possible values:
         *  show: -moz-inline-block
         *  hide: none
         */
        --show-tab-close-button: none;

        /*  Enable this to only show the Tab Close button on tab hover
         *  possible values:
         *  show: -moz-inline-block
         *  hide: none
         */
        --show-tab-close-button-hover: none;

        /*  Hide the all Tabs button from the Tab Bar
         *  possible values:
         *  show: -moz-box
         *  hide: none
         */
        --uc-show-all-tabs-button: none;

        /*  Left and Right "dip" of the container indicator
         *  0px equals tab width
         *  higher values make the indicator smaller
         */
        --container-tabs-indicator-margin: 10px;

        /*  Amount of Glow to add to the container indicator
         *  Setting it to 0 disables the Glow
         */
        --uc-identity-glow: 0 1px 10px 1px;
      }

      /* Hide the secondary Tab Label
       * e.g. playing indicator (the text, not the icon) */
      .tab-secondary-label {
        display: none !important;
      }
      #statuspanel #statuspanel-label {
        margin: 0 0 var(--uc-status-panel-spacing) var(--uc-status-panel-spacing) !important;
      }
      :root {
        --toolbarbutton-border-radius: var(--uc-border-radius) !important;
        --tab-border-radius: var(--uc-border-radius) !important;
        --arrowpanel-border-radius: var(--uc-border-radius) !important;
      }

      #toolbar-menubar {
        &[autohide="true"] {
          &[inactive]:not([customizing]) {
            width: 0px;
          }
        }
      }

      #main-window,
      #toolbar-menubar,
      #TabsToolbar,
      #navigator-toolbox,
      #sidebar-box,
      #nav-bar {
        box-shadow: none !important;
      }

      #main-window,
      #toolbar-menubar,
      #TabsToolbar,
      #PersonalToolbar,
      #navigator-toolbox,
      #sidebar-box,
      #nav-bar {
        border: none !important;
      }

      /* remove "padding" left and right from tabs */
      .titlebar-spacer {
        display: none !important;
      }

      /* fix Shield Icon padding */
      #urlbar-input-container[pageproxystate="valid"]
        > #tracking-protection-icon-container
        > #tracking-protection-icon-box
        > #tracking-protection-icon {
        padding-bottom: 1px;
      }

      #TabsToolbar {
        order: 2;
      }
      #nav-bar {
        order: 3;
      }

      #PersonalToolbar {
        padding: 6px !important;
        box-shadow: inset 0 0 50vh rgba(0, 0, 0, var(--uc-darken-toolbar)) !important;
        order: var(--uc-toolbar-position);
        width: 100%;
      }

      #statuspanel #statuspanel-label {
        border: none !important;
        border-radius: var(--uc-border-radius) !important;
      }
      #navigator-toolbox:not(:-moz-lwtheme) {
        background: var(--toolbar-field-background-color) !important;
      }

      #nav-bar {
        padding-block-start: 0px !important;

        border: none !important;
        box-shadow: none !important;
        background: transparent !important;
      }

      #urlbar,
      #urlbar * {
        outline: none !important;
        box-shadow: none !important;
      }

      #urlbar-background {
        border: transparent !important;
      }

      #urlbar[focused="true"] > #urlbar-background,
      #urlbar:not([open]) > #urlbar-background {
        background: var(--toolbar-field-background-color) !important;
      }

      #urlbar[open] > #urlbar-background {
        background: var(--toolbar-field-background-color) !important;
      }

      .urlbarView-row:hover > .urlbarView-row-inner,
      .urlbarView-row[selected] > .urlbarView-row-inner {
        background: var(--toolbar-field-focus-background-color) !important;
      }

      .urlbar-icon,
      #urlbar-go-button {
        margin: auto;
      }
      .urlbar-page-action {
        padding: 0 inherit !important;
      }
      @media (min-width: 1000px) {
        #nav-bar {
          margin: calc((var(--urlbar-min-height) * -1) - 12px)
            calc(100vw - var(--uc-urlbar-min-width)) 0 0 !important;
        }
        #titlebar {
          margin-inline-start: var(--uc-urlbar-min-width) !important;
        }

        #navigator-toolbox:focus-within #nav-bar {
          margin: calc((var(--urlbar-min-height) * -1) - 12px)
            calc(100vw - var(--uc-urlbar-max-width)) 0 0 !important;
        }
        #navigator-toolbox:focus-within #titlebar {
          margin-inline-start: var(--uc-urlbar-max-width) !important;
        }
      }
      @media (min-width: 1000px) {
        #navigator-toolbox {
          display: flex;
          flex-wrap: wrap;
          flex-direction: row;
        }

        #nav-bar {
          order: var(--uc-urlbar-position);
          width: var(--uc-urlbar-min-width);
          &.browser-titlebar {
            width: 100%;
          }
        }

        #nav-bar #urlbar-container {
          min-width: 0px !important;
          width: auto !important;
        }

        #TabsToolbar {
          width: calc(100vw - var(--uc-urlbar-min-width) - 1px);
        }

        #navigator-toolbox:focus-within #nav-bar {
          width: var(--uc-urlbar-max-width);
          &.browser-titlebar {
            width: 100%;
          }
        }
        #navigator-toolbox:focus-within #titlebar {
          width: calc(100vw - var(--uc-urlbar-max-width) - 1px);
        }
      }
      /* remove gap after pinned tabs */
      #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
        > #tabbrowser-arrowscrollbox
        > .tabbrowser-tab:nth-child(1 of :not([pinned], [hidden])) {
        margin-inline-start: 0 !important;
      }

      /* hides the list-all-tabs button*/
      #alltabs-button {
        display: var(--uc-show-all-tabs-button) !important;
      }

      /* remove tab shadow */
      .tabbrowser-tab > .tab-stack > .tab-background {
        box-shadow: none !important;
      }

      /* multi tab selection */
      #tabbrowser-tabs:not([noshadowfortests])
        .tabbrowser-tab:is([multiselected])
        > .tab-stack
        > .tab-background:-moz-lwtheme {
        outline-color: var(--toolbarseparator-color) !important;
      }

      /* tab close button options */
      .tabbrowser-tab:not([pinned]) .tab-close-button {
        display: var(--show-tab-close-button) !important;
      }
      .tabbrowser-tab:not([pinned]):hover .tab-close-button {
        display: var(--show-tab-close-button-hover) !important;
      }

      /* adaptive tab width */
      .tabbrowser-tab[selected][fadein]:not([pinned]):not(tab-group[collapsed] .tabbrowser-tab) {
        max-width: var(--uc-active-tab-width) !important;
      }
      .tabbrowser-tab[fadein]:not([selected]):not([pinned]):not(tab-group[collapsed] .tabbrowser-tab) {
        max-width: var(--uc-inactive-tab-width) !important;
      }

      /* container tabs indicator */
      #TabsToolbar .tab-context-line {
          margin: 2px var(--container-tabs-indicator-margin) 0
              var(--container-tabs-indicator-margin) !important;
          height: 1px !important;
      }
      .tab-context-line {
          box-shadow: var(--uc-identity-glow) var(--identity-tab-color) !important;
      }

      /* show favicon when media is playing but tab is hovered */
      .tab-icon-image:not([pinned]) {
        opacity: 1 !important;
      }

      /* makes the speaker icon to always appear if the tab is playing (not only on hover) */
      .tab-icon-overlay:not([crashed]),
      .tab-icon-overlay[pinned][crashed][selected] {
        top: 5px !important;
        z-index: 1 !important;

        padding: 1.5px !important;
        inset-inline-end: -8px !important;
        width: 16px !important;
        height: 16px !important;

        border-radius: 10px !important;
      }

      /* style and position speaker icon */
      .tab-icon-overlay:not([sharing], [crashed]):is(
          [soundplaying],
          [muted],
          [activemedia-blocked]
        ) {
        stroke: transparent !important;
        background: transparent !important;
        opacity: 1 !important;
        fill-opacity: 0.8 !important;

        color: currentColor !important;

        stroke: var(--toolbar-bgcolor) !important;
        background-color: var(--toolbar-bgcolor) !important;
      }

      /* change the colours of the speaker icon on active tab to match tab colours */
      .tabbrowser-tab[selected]
        .tab-icon-overlay:not([sharing], [crashed]):is(
          [soundplaying],
          [muted],
          [activemedia-blocked]
        ) {
        stroke: var(--toolbar-bgcolor) !important;
        background-color: var(--toolbar-bgcolor) !important;
      }

      .tab-icon-overlay:not([pinned], [sharing], [crashed]):is(
          [soundplaying],
          [muted],
          [activemedia-blocked]
        ) {
        margin-inline-end: 9.5px !important;
      }

      .tabbrowser-tab:not([image])
        .tab-icon-overlay:not([pinned], [sharing], [crashed]) {
        top: 0 !important;

        padding: 0 !important;
        margin-inline-end: 5.5px !important;
        inset-inline-end: 0 !important;
      }

      .tab-icon-overlay:not([crashed])[soundplaying]:hover,
      .tab-icon-overlay:not([crashed])[muted]:hover,
      .tab-icon-overlay:not([crashed])[activemedia-blocked]:hover {
        color: currentColor !important;
        stroke: var(--toolbar-color) !important;
        background-color: var(--toolbar-color) !important;
        fill-opacity: 0.95 !important;
      }

      .tabbrowser-tab[selected] .tab-icon-overlay:not([crashed])[soundplaying]:hover,
      .tabbrowser-tab[selected] .tab-icon-overlay:not([crashed])[muted]:hover,
      .tabbrowser-tab[selected]
        .tab-icon-overlay:not([crashed])[activemedia-blocked]:hover {
        color: currentColor !important;
        stroke: var(--toolbar-color) !important;
        background-color: var(--toolbar-color) !important;
        fill-opacity: 0.95 !important;
      }

      /* speaker icon colour fix */
      #TabsToolbar .tab-icon-overlay:not([crashed])[soundplaying],
      #TabsToolbar .tab-icon-overlay:not([crashed])[muted],
      #TabsToolbar .tab-icon-overlay:not([crashed])[activemedia-blocked] {
        color: var(--toolbar-color) !important;
      }

      /* speaker icon colour fix on hover */
      #TabsToolbar .tab-icon-overlay:not([crashed])[soundplaying]:hover,
      #TabsToolbar .tab-icon-overlay:not([crashed])[muted]:hover,
      #TabsToolbar .tab-icon-overlay:not([crashed])[activemedia-blocked]:hover {
        color: var(--toolbar-bgcolor) !important;
      }

      /* selected tab colour fix */
      .tabbrowser-tab[selected] .tab-background {
        background-color: var(--uc-highlight-colour) !important;
        outline: none !important;
      }
      .tab-background {
        margin: 0px !important;
        border-radius: 0px !important;
      }

      /* tab group labels */
      .tab-group-label-container > .tab-group-label {
        outline: none !important;
        border-radius: var(--uc-border-radius) !important;
        width: 100%;
        /* disable tab group label changing colour when collapsed */
        color: light-dark(var(--tab-group-color-pale), var(--tab-group-label-text-dark)) !important;
        background-color: light-dark(var(--tab-group-color), var(--tab-group-color-invert)) !important;
      }

      /* hide vertical tabs new tab button, there is also one for overflow */
      #vertical-tabs-newtab-button, #tabs-newtab-button {
        display: none !important;
      }

      /* hide vertical tabs action buttons */
      /*
      this removes the ability to toggle the "expand sidebar on hover" option that is not available in preferences

      .tools-and-extensions.actions-list, #sidebar-tools-and-extensions-splitter, #tabbrowser-tabs[orient="vertical"]::after {
        display: none !important;
      }
      */
    '';
    xdg.config.files."/home/ignis/.mozilla/firefox/default/user.js".text = ''
      //
      /* You may copy+paste this file and use it as it is.
       *
       * If you make changes to your about:config while the program is running, the
       * changes will be overwritten by the user.js when the application restarts.
       *
       * To make lasting changes to preferences, you will have to edit the user.js.
       */

      /****************************************************************************
       * Betterfox                                                                *
       * "Ad meliora"                                                             *
       * version: 146                                                             *
       * url: https://github.com/yokoffing/Betterfox                              *
      ****************************************************************************/

      /****************************************************************************
       * SECTION: FASTFOX                                                         *
      ****************************************************************************/
      /** GENERAL ***/
      user_pref("gfx.content.skia-font-cache-size", 32);

      /** GFX ***/
      user_pref("gfx.webrender.layer-compositor", true);
      user_pref("gfx.canvas.accelerated.cache-items", 32768);
      user_pref("gfx.canvas.accelerated.cache-size", 4096);
      user_pref("webgl.max-size", 16384);

      /** DISK CACHE ***/
      user_pref("browser.cache.disk.enable", false);

      /** MEMORY CACHE ***/
      user_pref("browser.cache.memory.capacity", 131072);
      user_pref("browser.cache.memory.max_entry_size", 20480);
      user_pref("browser.sessionhistory.max_total_viewers", 4);
      user_pref("browser.sessionstore.max_tabs_undo", 10);

      /** MEDIA CACHE ***/
      user_pref("media.memory_cache_max_size", 262144);
      user_pref("media.memory_caches_combined_limit_kb", 1048576);
      user_pref("media.cache_readahead_limit", 600);
      user_pref("media.cache_resume_threshold", 300);

      /** IMAGE CACHE ***/
      user_pref("image.cache.size", 10485760);
      user_pref("image.mem.decode_bytes_at_a_time", 65536);

      /** NETWORK ***/
      user_pref("network.http.max-connections", 1800);
      user_pref("network.http.max-persistent-connections-per-server", 10);
      user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);
      user_pref("network.http.request.max-start-delay", 5);
      user_pref("network.http.pacing.requests.enabled", false);
      user_pref("network.dnsCacheEntries", 10000);
      user_pref("network.dnsCacheExpiration", 3600);
      user_pref("network.ssl_tokens_cache_capacity", 10240);

      /** SPECULATIVE LOADING ***/
      user_pref("network.http.speculative-parallel-limit", 0);
      user_pref("network.dns.disablePrefetch", true);
      user_pref("network.dns.disablePrefetchFromHTTPS", true);
      user_pref("browser.urlbar.speculativeConnect.enabled", false);
      user_pref("browser.places.speculativeConnect.enabled", false);
      user_pref("network.prefetch-next", false);

      /****************************************************************************
       * SECTION: SECUREFOX                                                       *
      ****************************************************************************/
      /** TRACKING PROTECTION ***/
      user_pref("browser.contentblocking.category", "strict");
      user_pref("browser.download.start_downloads_in_tmp_dir", true);
      user_pref("browser.uitour.enabled", false);
      user_pref("privacy.globalprivacycontrol.enabled", true);

      /** OCSP & CERTS / HPKP ***/
      user_pref("security.OCSP.enabled", 0);
      user_pref("privacy.antitracking.isolateContentScriptResources", true);
      user_pref("security.csp.reporting.enabled", false);

      /** SSL / TLS ***/
      user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
      user_pref("browser.xul.error_pages.expert_bad_cert", true);
      user_pref("security.tls.enable_0rtt_data", false);

      /** DISK AVOIDANCE ***/
      user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
      user_pref("browser.sessionstore.interval", 60000);

      /** SHUTDOWN & SANITIZING ***/
      user_pref("privacy.history.custom", true);
      user_pref("browser.privatebrowsing.resetPBM.enabled", true);

      /** SEARCH / URL BAR ***/
      user_pref("browser.urlbar.trimHttps", true);
      user_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true);
      user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
      user_pref("browser.search.suggest.enabled", false);
      user_pref("browser.urlbar.quicksuggest.enabled", false);
      user_pref("browser.urlbar.groupLabels.enabled", false);
      user_pref("browser.formfill.enable", false);
      user_pref("network.IDN_show_punycode", true);

      /** HTTPS-ONLY MODE ***/
      user_pref("dom.security.https_only_mode", true);
      user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);

      /** PASSWORDS ***/
      user_pref("signon.formlessCapture.enabled", false);
      user_pref("signon.privateBrowsingCapture.enabled", false);
      user_pref("network.auth.subresource-http-auth-allow", 1);
      user_pref("editor.truncate_user_pastes", false);

      /** EXTENSIONS ***/
      user_pref("extensions.enabledScopes", 5);

      /** HEADERS / REFERERS ***/
      user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

      /** CONTAINERS ***/
      user_pref("privacy.userContext.ui.enabled", true);

      /** VARIOUS ***/
      user_pref("pdfjs.enableScripting", false);

      /** SAFE BROWSING ***/
      user_pref("browser.safebrowsing.downloads.remote.enabled", false);

      /** MOZILLA ***/
      user_pref("permissions.default.desktop-notification", 2);
      user_pref("permissions.default.geo", 2);
      user_pref("geo.provider.network.url", "https://beacondb.net/v1/geolocate");
      user_pref("browser.search.update", false);
      user_pref("permissions.manager.defaultsUrl", "");
      user_pref("extensions.getAddons.cache.enabled", false);

      /** TELEMETRY ***/
      user_pref("datareporting.policy.dataSubmissionEnabled", false);
      user_pref("datareporting.healthreport.uploadEnabled", false);
      user_pref("toolkit.telemetry.unified", false);
      user_pref("toolkit.telemetry.enabled", false);
      user_pref("toolkit.telemetry.server", "data:,");
      user_pref("toolkit.telemetry.archive.enabled", false);
      user_pref("toolkit.telemetry.newProfilePing.enabled", false);
      user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
      user_pref("toolkit.telemetry.updatePing.enabled", false);
      user_pref("toolkit.telemetry.bhrPing.enabled", false);
      user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
      user_pref("toolkit.telemetry.coverage.opt-out", true);
      user_pref("toolkit.coverage.opt-out", true);
      user_pref("toolkit.coverage.endpoint.base", "");
      user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
      user_pref("browser.newtabpage.activity-stream.telemetry", false);
      user_pref("datareporting.usage.uploadEnabled", false);

      /** EXPERIMENTS ***/
      user_pref("app.shield.optoutstudies.enabled", false);
      user_pref("app.normandy.enabled", false);
      user_pref("app.normandy.api_url", "");

      /** CRASH REPORTS ***/
      user_pref("breakpad.reportURL", "");
      user_pref("browser.tabs.crashReporting.sendReport", false);

      /****************************************************************************
       * SECTION: PESKYFOX                                                        *
      ****************************************************************************/
      /** MOZILLA UI ***/
      user_pref("extensions.getAddons.showPane", false);
      user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
      user_pref("browser.discovery.enabled", false);
      user_pref("browser.shell.checkDefaultBrowser", false);
      user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
      user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
      user_pref("browser.preferences.moreFromMozilla", false);
      user_pref("browser.aboutConfig.showWarning", false);
      user_pref("browser.startup.homepage_override.mstone", "ignore");
      user_pref("browser.aboutwelcome.enabled", false);
      user_pref("browser.profiles.enabled", true);

      /** THEME ADJUSTMENTS ***/
      user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
      user_pref("browser.compactmode.show", true);
      user_pref("browser.privateWindowSeparation.enabled", false); // WINDOWS

      /** AI ***/
      user_pref("browser.ml.enable", false);
      user_pref("browser.ml.chat.enabled", false);
      user_pref("browser.ml.chat.menu", false);
      user_pref("browser.tabs.groups.smart.enabled", false);
      user_pref("browser.ml.linkPreview.enabled", false);

      /** FULLSCREEN NOTICE ***/
      user_pref("full-screen-api.transition-duration.enter", "0 0");
      user_pref("full-screen-api.transition-duration.leave", "0 0");
      user_pref("full-screen-api.warning.timeout", 0);

      /** URL BAR ***/
      user_pref("browser.urlbar.trending.featureGate", false);

      /** NEW TAB PAGE ***/
      user_pref("browser.newtabpage.activity-stream.default.sites", "");
      user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
      user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
      user_pref("browser.newtabpage.activity-stream.showSponsored", false);
      user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false);

      /** DOWNLOADS ***/
      user_pref("browser.download.manager.addToRecentDocs", false);

      /** PDF ***/
      user_pref("browser.download.open_pdf_attachments_inline", true);

      /** TAB BEHAVIOR ***/
      user_pref("browser.bookmarks.openInTabClosesMenu", false);
      user_pref("browser.menu.showViewImageInfo", true);
      user_pref("findbar.highlightAll", true);
      user_pref("layout.word_select.eat_space_to_next_word", false);

      /****************************************************************************
       * START: MY OVERRIDES                                                      *
      ****************************************************************************/
      // visit https://github.com/yokoffing/Betterfox/wiki/Common-Overrides
      // visit https://github.com/yokoffing/Betterfox/wiki/Optional-Hardening
      // Enter your personal overrides below this line:



      /****************************************************************************
       * SECTION: SMOOTHFOX                                                       *
      ****************************************************************************/
      // visit https://github.com/yokoffing/Betterfox/blob/main/Smoothfox.js
      // Enter your scrolling overrides below this line:



      /****************************************************************************
       * END: BETTERFOX                                                           *
      ****************************************************************************/
    '';
  };
}
