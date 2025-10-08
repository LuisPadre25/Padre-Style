/* TabsPage - Tabs Component Showcase */

component TabsPage {
  connect NavigationStore exposing { setPage }
  connect ViewModeStore exposing { viewMode }

  fun componentDidMount : Promise(Void) {
    setPage("tabs")
  }

  /* State */
  state activeBasic : String = "tab1"
  state activeVertical : String = "home"
  state activeHorizontal : String = "home"
  state activeTextOnly : String = "home"
  state showBorder : Bool = true
  state showIcons : Bool = false
  state iconLayout : String = "horizontal"

  /* Event Handlers */
  fun handleBasicChange (event : TabChangeEvent) : Promise(Void) {
    next { activeBasic: event.name }
  }

  fun handleVerticalChange (event : TabChangeEvent) : Promise(Void) {
    next { activeVertical: event.name }
  }

  fun handleHorizontalChange (event : TabChangeEvent) : Promise(Void) {
    next { activeHorizontal: event.name }
  }

  fun handleTextOnlyChange (event : TabChangeEvent) : Promise(Void) {
    next { activeTextOnly: event.name }
  }

  fun handleBorderToggle (event : Html.Event) : Promise(Void) {
    next { showBorder: !showBorder }
  }

  fun handleIconsToggle (event : Html.Event) : Promise(Void) {
    next { showIcons: !showIcons }
  }

  fun handleIconLayoutChange (event : Html.Event) : Promise(Void) {
    next { iconLayout: Dom.getValue(event.target) }
  }

  /* Tab Data */
  fun getTabs : Array(TabItem) {
    [
      {
        name: "tab1",
        title: "Home",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: if showIcons { "🏠" } else { "" },
        content: "",
        badgeVariant: "",
        badgeSize: "",
        badgeColor: "",
        dotStatus: "",
        dotSize: "",
        dotAnimation: ""
      },
      {
        name: "tab2",
        title: "Profile",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: if showIcons { "👤" } else { "" },
        content: "",
        badgeVariant: "",
        badgeSize: "",
        badgeColor: "",
        dotStatus: "",
        dotSize: "",
        dotAnimation: ""
      },
      {
        name: "tab3",
        title: "Messages",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: if showIcons { "💬" } else { "" },
        content: "",
        badgeVariant: "",
        badgeSize: "",
        badgeColor: "",
        dotStatus: "",
        dotSize: "",
        dotAnimation: ""
      },
      {
        name: "tab4",
        title: "Settings",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: if showIcons { "⚙️" } else { "" },
        content: "",
        badgeVariant: "",
        badgeSize: "",
        badgeColor: "",
        dotStatus: "",
        dotSize: "",
        dotAnimation: ""
      }
    ]
  }

  fun getTabContent : Html {
    case activeBasic {
      "tab1" => <div style="text-align: center; padding: 40px; font-size: 16px; color: #646566;">
        "🏠 Home Content"
      </div>
      "tab2" => <div style="text-align: center; padding: 40px; font-size: 16px; color: #646566;">
        "👤 Profile Content"
      </div>
      "tab3" => <div style="text-align: center; padding: 40px; font-size: 16px; color: #646566;">
        "💬 Messages Content"
      </div>
      => <div style="text-align: center; padding: 40px; font-size: 16px; color: #646566;">
        "⚙️ Settings Content"
      </div>
    }
  }

  /* Styles */
  style controlGroup {
    margin-bottom: 20px;
  }

  style label {
    display: block;
    font-size: 14px;
    font-weight: 600;
    color: var(--heading-color);
    margin-bottom: 8px;
  }

  style select {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    font-size: 14px;
    background: var(--card-bg);
    color: var(--text-color);
    transition: all 0.2s ease;

    &:focus {
      outline: none;
      border-color: var(--primary-color);
      box-shadow: 0 0 0 2px rgba(25, 137, 250, 0.1);
    }
  }

  style checkboxGroup {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 12px;
  }

  style checkbox {
    width: 18px;
    height: 18px;
    cursor: pointer;
  }

  style checkboxLabel {
    font-size: 14px;
    color: var(--text-color);
    cursor: pointer;
  }

  style tabsContainer {
    background: var(--card-bg);
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 8px var(--shadow-color);
  }

  fun render : Html {
    <ComponentShowcase
      title="Tabs"
      description="Professional mobile-first navigation component with swipe gestures, sticky positioning, and auto-scroll"
      badge="Navigation"
      previewContent={
        <div style="width: 100%;">
          <div::tabsContainer>
            <Tabs
              tabs={getTabs()}
              active={activeBasic}
              type="line"
              border={showBorder}
              iconLayout={iconLayout}
              ellipsis={true}
              onChange={handleBasicChange}/>
            {getTabContent()}
          </div>
        </div>
      }
      controlsContent={
        <div>
          <Heading level="4" margin="0 0 16px">"Tabs Configuration"</Heading>

          <div::controlGroup>
            <label::label>"Icon Layout"</label>
            <select::select value={iconLayout} onChange={handleIconLayoutChange}>
              <option value="horizontal">"Horizontal (Left)"</option>
              <option value="vertical">"Vertical (Top)"</option>
            </select>
          </div>

          <div::controlGroup>
            <label::label>"Options"</label>

            <div::checkboxGroup>
              <input::checkbox
                type="checkbox"
                checked={showBorder}
                onChange={handleBorderToggle}/>
              <label::checkboxLabel>"Show Border"</label>
            </div>

            <div::checkboxGroup>
              <input::checkbox
                type="checkbox"
                checked={showIcons}
                onChange={handleIconsToggle}/>
              <label::checkboxLabel>"Show Icons"</label>
            </div>
          </div>

          <div::controlGroup>
            <label::label>"Active Tab"</label>
            <div style="padding: 8px 12px; background: var(--border-color); border-radius: 6px; font-size: 14px; color: var(--text-color); font-weight: 500;">
              {activeBasic}
            </div>
          </div>
        </div>
      }
      usageText="Tabs is a mobile-first navigation component with line-style tabs, supporting icons, badges, swipe gestures, sticky positioning, and responsive ellipsis truncation."
      codeExamples={
        [
          {
            title: "Vertical Icons Layout",
            description: "Icons above text - perfect for mobile bottom navigation",
            snippet: {
              code:
                "<Tabs\n" +
                "  tabs={[\n" +
                "    { name: \"home\", title: \"Home\", icon: \"🏠\", ... },\n" +
                "    { name: \"search\", title: \"Search\", icon: \"🔍\", ... },\n" +
                "    { name: \"profile\", title: \"Profile\", icon: \"👤\", ... }\n" +
                "  ]}\n" +
                "  active=\"home\"\n" +
                "  type=\"line\"\n" +
                "  iconLayout=\"vertical\"\n" +
                "  border={true}\n" +
                "  onChange={handleChange}/>",
              language: "mint"
            },
            previewContent:
              <Tabs
                tabs={[
                  {
                    name: "home",
                    title: "Home",
                    disabled: false,
                    dot: false,
                    badge: "",
                    titleStyle: "",
                    icon: "🏠",
                    content: "",
                    badgeVariant: "",
                    badgeSize: "",
                    badgeColor: "",
                    dotStatus: "",
                    dotSize: "",
                    dotAnimation: ""
                  },
                  {
                    name: "search",
                    title: "Search",
                    disabled: false,
                    dot: false,
                    badge: "",
                    titleStyle: "",
                    icon: "🔍",
                    content: "",
                    badgeVariant: "",
                    badgeSize: "",
                    badgeColor: "",
                    dotStatus: "",
                    dotSize: "",
                    dotAnimation: ""
                  },
                  {
                    name: "profile",
                    title: "Profile",
                    disabled: false,
                    dot: false,
                    badge: "",
                    titleStyle: "",
                    icon: "👤",
                    content: "",
                    badgeVariant: "",
                    badgeSize: "",
                    badgeColor: "",
                    dotStatus: "",
                    dotSize: "",
                    dotAnimation: ""
                  }
                ]}
                active={activeVertical}
                type="line"
                border={true}
                iconLayout="vertical"
                onChange={handleVerticalChange}/>,
            showReplay: true
          },
          {
            title: "Horizontal Icons Layout",
            description: "Icons to the left of text - traditional tab style",
            snippet: {
              code:
                "<Tabs\n" +
                "  tabs={[\n" +
                "    { name: \"home\", title: \"Home\", icon: \"🏠\", ... },\n" +
                "    { name: \"profile\", title: \"Profile\", icon: \"👤\", ... },\n" +
                "    { name: \"messages\", title: \"Messages\", icon: \"💬\", ... },\n" +
                "    { name: \"settings\", title: \"Settings\", icon: \"⚙️\", ... }\n" +
                "  ]}\n" +
                "  active=\"home\"\n" +
                "  type=\"line\"\n" +
                "  iconLayout=\"horizontal\"\n" +
                "  border={true}\n" +
                "  onChange={handleChange}/>",
              language: "mint"
            },
            previewContent:
              <Tabs
                tabs={[
                  {
                    name: "home",
                    title: "Home",
                    disabled: false,
                    dot: false,
                    badge: "",
                    titleStyle: "",
                    icon: "🏠",
                    content: "",
                    badgeVariant: "",
                    badgeSize: "",
                    badgeColor: "",
                    dotStatus: "",
                    dotSize: "",
                    dotAnimation: ""
                  },
                  {
                    name: "profile",
                    title: "Profile",
                    disabled: false,
                    dot: false,
                    badge: "",
                    titleStyle: "",
                    icon: "👤",
                    content: "",
                    badgeVariant: "",
                    badgeSize: "",
                    badgeColor: "",
                    dotStatus: "",
                    dotSize: "",
                    dotAnimation: ""
                  },
                  {
                    name: "messages",
                    title: "Messages",
                    disabled: false,
                    dot: false,
                    badge: "",
                    titleStyle: "",
                    icon: "💬",
                    content: "",
                    badgeVariant: "",
                    badgeSize: "",
                    badgeColor: "",
                    dotStatus: "",
                    dotSize: "",
                    dotAnimation: ""
                  },
                  {
                    name: "settings",
                    title: "Settings",
                    disabled: false,
                    dot: false,
                    badge: "",
                    titleStyle: "",
                    icon: "⚙️",
                    content: "",
                    badgeVariant: "",
                    badgeSize: "",
                    badgeColor: "",
                    dotStatus: "",
                    dotSize: "",
                    dotAnimation: ""
                  }
                ]}
                active={activeHorizontal}
                type="line"
                border={true}
                iconLayout="horizontal"
                onChange={handleHorizontalChange}/>,
            showReplay: true
          },
          {
            title: "Text Only Tabs",
            description: "Simple tabs without icons - clean and minimal",
            snippet: {
              code:
                "<Tabs\n" +
                "  tabs={[\n" +
                "    { name: \"home\", title: \"Home\", ... },\n" +
                "    { name: \"profile\", title: \"Profile\", ... },\n" +
                "    { name: \"messages\", title: \"Messages\", ... },\n" +
                "    { name: \"settings\", title: \"Settings\", ... }\n" +
                "  ]}\n" +
                "  active=\"home\"\n" +
                "  type=\"line\"\n" +
                "  border={true}\n" +
                "  onChange={handleChange}/>",
              language: "mint"
            },
            previewContent:
              <Tabs
                tabs={[
                  {
                    name: "home",
                    title: "Home",
                    disabled: false,
                    dot: false,
                    badge: "",
                    titleStyle: "",
                    icon: "",
                    content: "",
                    badgeVariant: "",
                    badgeSize: "",
                    badgeColor: "",
                    dotStatus: "",
                    dotSize: "",
                    dotAnimation: ""
                  },
                  {
                    name: "profile",
                    title: "Profile",
                    disabled: false,
                    dot: false,
                    badge: "",
                    titleStyle: "",
                    icon: "",
                    content: "",
                    badgeVariant: "",
                    badgeSize: "",
                    badgeColor: "",
                    dotStatus: "",
                    dotSize: "",
                    dotAnimation: ""
                  },
                  {
                    name: "messages",
                    title: "Messages",
                    disabled: false,
                    dot: false,
                    badge: "",
                    titleStyle: "",
                    icon: "",
                    content: "",
                    badgeVariant: "",
                    badgeSize: "",
                    badgeColor: "",
                    dotStatus: "",
                    dotSize: "",
                    dotAnimation: ""
                  },
                  {
                    name: "settings",
                    title: "Settings",
                    disabled: false,
                    dot: false,
                    badge: "",
                    titleStyle: "",
                    icon: "",
                    content: "",
                    badgeVariant: "",
                    badgeSize: "",
                    badgeColor: "",
                    dotStatus: "",
                    dotSize: "",
                    dotAnimation: ""
                  }
                ]}
                active={activeTextOnly}
                type="line"
                border={true}
                onChange={handleTextOnlyChange}/>,
            showReplay: true
          }
        ]
      }
      apiProperties={
        [
          {
            name: "tabs",
            description: "Array of tab items to display",
            type: "Array(TabItem)",
            defaultValue: "[]"
          },
          {
            name: "active",
            description: "Name of the currently active tab",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "type",
            description: "Tab style: currently only 'line' is supported (bottom line indicator)",
            type: "String",
            defaultValue: "\"line\""
          },
          {
            name: "iconLayout",
            description: "Icon position: 'horizontal' (left of text) or 'vertical' (above text)",
            type: "String",
            defaultValue: "\"horizontal\""
          },
          {
            name: "color",
            description: "Primary color (uses theme if not set)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "background",
            description: "Background color (uses theme if not set)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "titleActiveColor",
            description: "Active tab text color",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "titleInactiveColor",
            description: "Inactive tab text color",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "border",
            description: "Show bottom border",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "shrink",
            description: "Shrink tabs to content width",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "ellipsis",
            description: "Truncate long tab titles",
            type: "Bool",
            defaultValue: "true"
          },
          {
            name: "lineWidth",
            description: "Width of active line indicator",
            type: "String",
            defaultValue: "\"40px\""
          },
          {
            name: "lineHeight",
            description: "Height of active line indicator",
            type: "String",
            defaultValue: "\"3px\""
          },
          {
            name: "duration",
            description: "Animation duration in ms",
            type: "Number",
            defaultValue: "300"
          },
          {
            name: "sticky",
            description: "Enable sticky positioning",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "stickyOffsetTop",
            description: "Top offset when sticky",
            type: "Number",
            defaultValue: "0"
          },
          {
            name: "swipeable",
            description: "Enable swipe gestures",
            type: "Bool",
            defaultValue: "true"
          }
        ]
      }
      events={
        [
          {
            name: "onChange",
            description: "Fired when tab changes",
            type: "TabChangeEvent",
            defaultValue: "{ name, title, index }"
          },
          {
            name: "onClick",
            description: "Fired when tab is clicked",
            type: "TabClickEvent",
            defaultValue: "{ name, title, index, disabled }"
          },
          {
            name: "onDisabled",
            description: "Fired when disabled tab is clicked",
            type: "TabClickEvent",
            defaultValue: "{ name, title, index, disabled }"
          },
          {
            name: "onSwipe",
            description: "Fired on swipe gesture",
            type: "String",
            defaultValue: "direction: 'left' | 'right'"
          }
        ]
      }/>
  }
}
