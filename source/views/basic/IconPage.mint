/*
IconPage - Comprehensive showcase for Icon component
 * Mobile-first responsive design with ComponentShowcase
*/
component IconPage {
  /* Connect to IconRegistry */
  connect IconRegistry exposing {
    register,
    initializeDefaults,
    getAll,
    getByCategory
  }

  /* State for component controls */
  state selectedSize : String = "md"

  state selectedVariant : String = "default"
  state selectedWeight : String = "regular"
  state iconType : String = "svg"
  state showBadge : Bool = false
  state animated : Bool = false
  state spin : Bool = false
  state pulse : Bool = false
  state clickable : Bool = false
  state rotate : Number = 0
  state flip : String = ""
  state bgColor : String = ""
  state initialized : Bool = false

  /* Initialize registry with default icons on mount */
  fun componentDidMount : Promise(Void) {
    if !initialized {
      initializeDefaults()

      /* Register custom user icons */
      register("logo",
        "<circle cx='12' cy='12' r='10'/><path d='M8 14s1.5 2 4 2 4-2 4-2'/><line x1='9' y1='9' x2='9.01' y2='9'/><line x1='15' y1='9' x2='15.01' y2='9'/>",
          "custom")

      register("rocket",
        "<path d='M4.5 16.5c-1.5 1.25-2 5-2 5s3.75-.5 5-2c.71-.84.7-2.13-.09-2.91a2.18 2.18 0 0 0-2.91-.09z'/><path d='M12 15l-3-3a22 22 0 0 1 2-3.95A12.88 12.88 0 0 1 22 2c0 2.72-.78 7.5-6 11a22.35 22.35 0 0 1-4 2z'/><path d='M9 12H4s.55-3.03 2-4c1.62-1.08 5 0 5 0'/><path d='M12 15v5s3.03-.55 4-2c1.08-1.62 0-5 0-5'/>",
          "custom")

      register("code",
        "<polyline points='16 18 22 12 16 6'/><polyline points='8 6 2 12 8 18'/>",
          "custom")

      register("coffee",
        "<path d='M18 8h1a4 4 0 0 1 0 8h-1'/><path d='M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z'/><line x1='6' y1='1' x2='6' y2='4'/><line x1='10' y1='1' x2='10' y2='4'/><line x1='14' y1='1' x2='14' y2='4'/>",
          "custom")

      next { initialized: true }
    } else {
      Promise.never()
    }
  }

  /* Event handlers */
  fun handleSizeChange (size : String) : Promise(Void) {
    next { selectedSize: size }
  }

  fun handleVariantChange (variant : String) : Promise(Void) {
    next { selectedVariant: variant }
  }

  fun handleWeightChange (weight : String) : Promise(Void) {
    next { selectedWeight: weight }
  }

  fun handleIconTypeChange (type : String) : Promise(Void) {
    next { iconType: type }
  }

  fun toggleBadge : Promise(Void) {
    next { showBadge: !showBadge }
  }

  fun toggleAnimated : Promise(Void) {
    next { animated: !animated }
  }

  fun toggleSpin : Promise(Void) {
    next { spin: !spin }
  }

  fun togglePulse : Promise(Void) {
    next { pulse: !pulse }
  }

  fun toggleClickable : Promise(Void) {
    next { clickable: !clickable }
  }

  fun handleRotateChange (newRotate : Number) : Promise(Void) {
    next { rotate: newRotate }
  }

  fun handleFlipChange (newFlip : String) : Promise(Void) {
    next { flip: newFlip }
  }

  fun handleBgColorChange (color : String) : Promise(Void) {
    next { bgColor: color }
  }

  /* Icon click handler */
  fun handleIconClick (event : IconClickEvent) : Promise(Void) {
    `alert('Icon clicked: ' + #{event.name})`
    Promise.never()
  }

  /* Styles */
  style container {
    padding: 24px;
    max-width: 1400px;
    margin: 0 auto;

    @media (max-width: 640px) {
      padding: 16px;
    }
  }

  style section {
    margin-bottom: 48px;

    @media (max-width: 640px) {
      margin-bottom: 32px;
    }
  }

  style sectionTitle {
    font-size: 24px;
    font-weight: 700;
    color: #1f2937;
    margin-bottom: 16px;

    @media (max-width: 640px) {
      font-size: 20px;
      margin-bottom: 12px;
    }
  }

  style sectionDescription {
    font-size: 14px;
    color: #6b7280;
    margin-bottom: 24px;
    line-height: 1.6;

    @media (max-width: 640px) {
      font-size: 13px;
      margin-bottom: 16px;
    }
  }

  style grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 24px;

    @media (max-width: 640px) {
      grid-template-columns: 1fr;
      gap: 16px;
    }
  }

  style card {
    background: white;
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    padding: 24px;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 12px;
    transition: all 0.2s ease;

    &:hover {
      border-color: #1989fa;
      box-shadow: 0 4px 12px rgba(25, 137, 250, 0.1);
    }

    @media (max-width: 640px) {
      padding: 20px;
      gap: 10px;
    }
  }

  style cardTitle {
    font-size: 14px;
    font-weight: 600;
    color: #374151;
    text-align: center;

    @media (max-width: 640px) {
      font-size: 13px;
    }
  }

  style cardDescription {
    font-size: 12px;
    color: #9ca3af;
    text-align: center;

    @media (max-width: 640px) {
      font-size: 11px;
    }
  }

  style controlsGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 16px;
    margin-bottom: 24px;

    @media (max-width: 640px) {
      grid-template-columns: 1fr;
      gap: 12px;
    }
  }

  style controlGroup {
    display: flex;
    flex-direction: column;
    gap: 8px;
  }

  style controlLabel {
    font-size: 13px;
    font-weight: 600;
    color: #374151;

    @media (max-width: 640px) {
      font-size: 12px;
    }
  }

  style buttonGroup {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
  }

  style button (active : Bool) {
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 13px;
    font-weight: 500;
    border: 1px solid #e5e7eb;
    background: white;
    color: #374151;
    cursor: pointer;
    transition: all 0.2s ease;
    min-height: 44px;

    if active {
      background: #1989fa;
      color: white;
      border-color: #1989fa;
    }

    &:hover {
      border-color: #1989fa;
    }

    @media (max-width: 640px) {
      padding: 10px 14px;
      font-size: 12px;
    }
  }

  style checkboxLabel {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
    user-select: none;
    font-size: 13px;
    color: #374151;
    min-height: 44px;

    @media (max-width: 640px) {
      font-size: 12px;
    }
  }

  style checkbox {
    width: 20px;
    height: 20px;
    cursor: pointer;

    @media (max-width: 640px) {
      width: 24px;
      height: 24px;
    }
  }

  style showcase {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 16px;
    padding: 48px;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 200px;

    @media (max-width: 640px) {
      padding: 32px 16px;
      min-height: 160px;
      border-radius: 12px;
    }
  }

  style iconRow {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 32px;
    flex-wrap: wrap;

    @media (max-width: 640px) {
      gap: 24px;
    }
  }

  /* Render Controls */
  fun renderControls : Html {
    <div>
      <div::controlsGrid>
        <div::controlGroup>
          <span::controlLabel>"Size"</span>

          <div::buttonGroup>
            <button::button(selectedSize == "xs")
              onClick={
                (e : Html.Event) : Promise(Void) { handleSizeChange("xs") }
              }
            >"XS"</button>

            <button::button(selectedSize == "sm")
              onClick={
                (e : Html.Event) : Promise(Void) { handleSizeChange("sm") }
              }
            >"SM"</button>

            <button::button(selectedSize == "md")
              onClick={
                (e : Html.Event) : Promise(Void) { handleSizeChange("md") }
              }
            >"MD"</button>

            <button::button(selectedSize == "lg")
              onClick={
                (e : Html.Event) : Promise(Void) { handleSizeChange("lg") }
              }
            >"LG"</button>

            <button::button(selectedSize == "xl")
              onClick={
                (e : Html.Event) : Promise(Void) { handleSizeChange("xl") }
              }
            >"XL"</button>
          </div>
        </div>

        <div::controlGroup>
          <span::controlLabel>"Variant"</span>

          <div::buttonGroup>
            <button::button(selectedVariant == "default")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("default")
                }
              }
            >"Default"</button>

            <button::button(selectedVariant == "primary")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("primary")
                }
              }
            >"Primary"</button>

            <button::button(selectedVariant == "success")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("success")
                }
              }
            >"Success"</button>

            <button::button(selectedVariant == "error")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("error")
                }
              }
            >"Error"</button>
          </div>
        </div>

        <div::controlGroup>
          <span::controlLabel>"Options"</span>

          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={clickable}
                onChange={
                  (e : Html.Event) : Promise(Void) { toggleClickable() }
                }
              />

              "Clickable"
            </label>

            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={showBadge}
                onChange={(e : Html.Event) : Promise(Void) { toggleBadge() }}
              />

              "Badge"
            </label>

            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={spin}
                onChange={(e : Html.Event) : Promise(Void) { toggleSpin() }}
              />

              "Spin"
            </label>
          </div>
        </div>
      </div>
    </div>
  }

  /* Get preview content for ComponentShowcase */
  fun getPreviewContent : Html {
    <div::iconRow>
      <Icon
        name="heart"
        size={selectedSize}
        variant={selectedVariant}
        clickable={clickable}
        badge={
          if showBadge {
            "5"
          } else {
            ""
          }
        }
        spin={spin}
        onClick={handleIconClick}
        ariaLabel="Heart icon"
      />

      <Icon
        name="star"
        size={selectedSize}
        variant={selectedVariant}
        clickable={clickable}
        badge={
          if showBadge {
            "3"
          } else {
            ""
          }
        }
        spin={spin}
        onClick={handleIconClick}
        ariaLabel="Star icon"
      />

      <Icon
        name="check"
        size={selectedSize}
        variant={selectedVariant}
        clickable={clickable}
        spin={spin}
        onClick={handleIconClick}
        ariaLabel="Check icon"
      />

      <Icon
        name="search"
        size={selectedSize}
        variant={selectedVariant}
        clickable={clickable}
        spin={spin}
        onClick={handleIconClick}
        ariaLabel="Search icon"
      />

      <Icon
        name="settings"
        size={selectedSize}
        variant={selectedVariant}
        clickable={clickable}
        spin={spin}
        onClick={handleIconClick}
        ariaLabel="Settings icon"
      />

      <Icon
        name="mail"
        size={selectedSize}
        variant={selectedVariant}
        clickable={clickable}
        spin={spin}
        onClick={handleIconClick}
        ariaLabel="Mail icon"
      />
    </div>
  }

  /* Get controls content for ComponentShowcase */
  fun getControlsContent : Html {
    renderControls()
  }

  /* Get code examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Icon",
        description: "Simple icon with default settings",
        snippet:
          {
            code:
              "/* Basic Icon Usage */\n" + "<Icon\n" + "  name=\"heart\"\n" + "  size=\"md\"\n" + "  variant=\"default\"\n" + "/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 16px; align-items: center;">
            <Icon name="heart" size="md" variant="default"/>
          </div>,
        showReplay: false
      },
      {
        title: "Icon with Badge",
        description: "Icon displaying a notification badge",
        snippet:
          {
            code:
              "/* Icon with Badge */\n" + "<Icon\n" + "  name=\"mail\"\n" + "  size=\"lg\"\n" + "  variant=\"primary\"\n" + "  badge=\"5\"\n" + "/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 16px; align-items: center;">
            <Icon name="mail" size="lg" variant="primary" badge="5"/>
          </div>,
        showReplay: false
      },
      {
        title: "Animated Icon",
        description: "Icon with spin animation",
        snippet:
          {
            code:
              "/* Spinning Icon */\n" + "<Icon\n" + "  name=\"loader\"\n" + "  size=\"xl\"\n" + "  variant=\"primary\"\n" + "  spin={true}\n" + "/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 16px; align-items: center;">
            <Icon name="loader" size="xl" variant="primary" spin={true}/>
          </div>,
        showReplay: false
      },
      {
        title: "Clickable Icon",
        description: "Interactive icon with onClick handler",
        snippet:
          {
            code:
              "/* Clickable Icon */\n" + "<Icon\n" + "  name=\"search\"\n" + "  size=\"lg\"\n" + "  variant=\"success\"\n" + "  clickable={true}\n" + "  onClick={handleIconClick}\n" + "/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 16px; align-items: center;">
            <Icon name="search" size="lg" variant="success" clickable={true}/>
          </div>,
        showReplay: false
      },
      {
        title: "Icon Sizes",
        description: "All available icon sizes",
        snippet:
          {
            code:
              "/* Different Icon Sizes */\n" + "<Icon name=\"star\" size=\"xs\" variant=\"warning\"/>\n" + "<Icon name=\"star\" size=\"sm\" variant=\"warning\"/>\n" + "<Icon name=\"star\" size=\"md\" variant=\"warning\"/>\n" + "<Icon name=\"star\" size=\"lg\" variant=\"warning\"/>\n" + "<Icon name=\"star\" size=\"xl\" variant=\"warning\"/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 16px; align-items: center;">
            <Icon name="star" size="xs" variant="warning"/>
            <Icon name="star" size="sm" variant="warning"/>
            <Icon name="star" size="md" variant="warning"/>
            <Icon name="star" size="lg" variant="warning"/>
            <Icon name="star" size="xl" variant="warning"/>
          </div>,
        showReplay: false
      },
      {
        title: "Icon Variants",
        description: "All available color variants",
        snippet:
          {
            code:
              "/* Icon Color Variants */\n" + "<Icon name=\"heart\" variant=\"default\"/>\n" + "<Icon name=\"heart\" variant=\"primary\"/>\n" + "<Icon name=\"heart\" variant=\"success\"/>\n" + "<Icon name=\"heart\" variant=\"warning\"/>\n" + "<Icon name=\"heart\" variant=\"danger\"/>\n" + "<Icon name=\"heart\" variant=\"error\"/>",
            language: "mint"
          },
        previewContent:
          <div
            style="display: flex; gap: 16px; align-items: center; flex-wrap: wrap;"
          >
            <Icon name="heart" size="lg" variant="default"/>
            <Icon name="heart" size="lg" variant="primary"/>
            <Icon name="heart" size="lg" variant="success"/>
            <Icon name="heart" size="lg" variant="warning"/>
            <Icon name="heart" size="lg" variant="danger"/>
            <Icon name="heart" size="lg" variant="error"/>
          </div>,
        showReplay: false
      },
      {
        title: "Using Icons from Registry",
        description: "Access 200+ built-in icons by name",
        snippet:
          {
            code:
              "/* Browse all available icons in the Icons tab */\n" + "/* Use any icon by its name */\n\n" + "<Icon name=\"home\" size=\"lg\"/>\n" + "<Icon name=\"user\" size=\"lg\"/>\n" + "<Icon name=\"settings\" size=\"lg\"/>\n" + "<Icon name=\"bell\" size=\"lg\"/>\n" + "<Icon name=\"calendar\" size=\"lg\"/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 16px; align-items: center;">
            <Icon name="home" size="lg" variant="primary"/>
            <Icon name="user" size="lg" variant="success"/>
            <Icon name="settings" size="lg" variant="secondary"/>
            <Icon name="bell" size="lg" variant="warning"/>
            <Icon name="calendar" size="lg" variant="info"/>
          </div>,
        showReplay: false
      },
      {
        title: "Register Custom Icons",
        description: "Add your own custom icons to the registry",
        snippet:
          {
            code:
              "/* Register custom icons in your component */\n" + "connect IconRegistry exposing { register }\n\n" + "fun componentDidMount : Promise(Void) {\n" + "  register(\n" + "    \"my-custom-icon\",\n" + "    \"<path d='M12 2L2 7l10 5 10-5-10-5z'/>\",\n" + "    \"custom\"\n" + "  )\n" + "  Promise.never()\n" + "}\n\n" + "/* Use your custom icon */\n" + "<Icon name=\"my-custom-icon\" size=\"lg\" variant=\"primary\"/>",
            language: "mint"
          },
        previewContent:
          <div
            style="padding: 24px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 12px; color: white; text-align: center;"
          >
            <div style="font-size: 14px; font-weight: 600; margin-bottom: 8px;">
              "Custom Icon Registration"
            </div>

            <div style="font-size: 13px; opacity: 0.9;">
              "Register your own SVG icons and use them throughout your app!"
            </div>
          </div>,
        showReplay: false
      }
    ]
  }

  /* Get API properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "name",
        description:
          "Icon name from IconRegistry. Browse 200+ available icons in the Icons tab. Use this OR svg prop (not both).",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "svg",
        description:
          "Custom SVG path data for one-off icons. Use this OR name prop (not both). Example: \"<path d='M12 2l10 5-10 5'/>\"",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "size",
        description:
          "Icon size preset. Options: xs (12px), sm (16px), md (20px), lg (24px), xl (32px). Mobile-optimized with minimum 44x44px touch targets.",
        type: "String",
        defaultValue: "\"md\""
      },
      {
        name: "variant",
        description:
          "Theme-aware color variant. Options: default (gray), primary (brand), success (green), warning (orange), danger (red), error (red), info (blue), secondary (purple).",
        type: "String",
        defaultValue: "\"default\""
      },
      {
        name: "weight",
        description:
          "Stroke weight for line-based icons. Options: light (1.5px), regular (2px), bold (2.5px). Affects visual prominence.",
        type: "String",
        defaultValue: "\"regular\""
      },
      {
        name: "clickable",
        description:
          "Makes icon interactive with hover effects and changes cursor to pointer. Adds scale animation on hover, focus states, and accessibility features. Essential for button-like icons.",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "badge",
        description:
          "Badge content displayed in top-right corner. Perfect for notifications, counts, or status indicators. Shows as small red circle with text.",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "spin",
        description:
          "Enables continuous 360° rotation animation. Ideal for loaders, refresh buttons, or processing indicators. 2s duration.",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "pulse",
        description:
          "Enables subtle scale pulsing animation. Great for attention-grabbing elements like notifications or live indicators. 1.5s duration.",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "rotate",
        description:
          "Static rotation angle in degrees. Use for directional icons like arrows. Values: 0-360. Example: rotate={90} for right-facing arrow.",
        type: "Number",
        defaultValue: "0"
      },
      {
        name: "flip",
        description:
          "Flip/mirror the icon. Options: horizontal, vertical, both. Useful for directional icons or creating variations without new assets.",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "bgColor",
        description:
          "Custom background color behind the icon. Creates filled circle background. Use hex codes (#FF5733) or CSS color names (blue).",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "ariaLabel",
        description:
          "Accessibility label for screen readers. Required for clickable icons. Describes the icon's purpose. Example: \"Search products\".",
        type: "String",
        defaultValue: "\"\""
      }
    ]
  }

  /* Get API events */
  fun getApiEvents : Array(ApiProperty) {
    [
      {
        name: "onClick",
        description:
          "Event handler triggered when icon is clicked. Works best with clickable={true} for proper hover/focus states. Receives IconClickEvent with icon name and metadata. Example: onClick={(e) => Debug.log(\"Clicked: \" + e.name)}",
        type: "IconClickEvent => Promise(Void)",
        defaultValue: "-"
      }
    ]
  }

  /* Get icon gallery as additional docs */
  fun getIconGallery : Html {
    <div>
      /* Essential & Popular Icons - Most Commonly Used */
      <div::section>
        <h2::sectionTitle>"Essential & Popular Icons"</h2>

        <p::sectionDescription>
          "Most commonly used icons for any project - Perfect for getting started!"
        </p>

        <div::grid>
          <div::card>
            <Icon name="zap" size="xl" variant="warning"/>
            <span::cardTitle>"zap"</span>
          </div>

          <div::card>
            <Icon name="crown" size="xl" variant="warning"/>
            <span::cardTitle>"crown"</span>
          </div>

          <div::card>
            <Icon name="trophy" size="xl" variant="success"/>
            <span::cardTitle>"trophy"</span>
          </div>

          <div::card>
            <Icon name="flame" size="xl" variant="danger"/>
            <span::cardTitle>"flame"</span>
          </div>

          <div::card>
            <Icon name="sparkles" size="xl" variant="primary"/>
            <span::cardTitle>"sparkles"</span>
          </div>

          <div::card>
            <Icon name="thumbs-up-alt" size="xl" variant="success"/>
            <span::cardTitle>"thumbs-up"</span>
          </div>

          <div::card>
            <Icon name="thumbs-down" size="xl" variant="danger"/>
            <span::cardTitle>"thumbs-down"</span>
          </div>

          <div::card>
            <Icon name="heart" size="xl" variant="danger"/>
            <span::cardTitle>"heart"</span>
          </div>

          <div::card>
            <Icon name="star" size="xl" variant="warning"/>
            <span::cardTitle>"star"</span>
          </div>

          <div::card>
            <Icon name="bookmark" size="xl" variant="primary"/>
            <span::cardTitle>"bookmark"</span>
          </div>

          <div::card>
            <Icon name="share" size="xl" variant="info"/>
            <span::cardTitle>"share"</span>
          </div>

          <div::card>
            <Icon name="download" size="xl" variant="success"/>
            <span::cardTitle>"download"</span>
          </div>

          <div::card>
            <Icon name="upload" size="xl" variant="info"/>
            <span::cardTitle>"upload"</span>
          </div>

          <div::card>
            <Icon name="trash" size="xl" variant="danger"/>
            <span::cardTitle>"trash"</span>
          </div>

          <div::card>
            <Icon name="copy" size="xl" variant="secondary"/>
            <span::cardTitle>"copy"</span>
          </div>

          <div::card>
            <Icon name="eye" size="xl" variant="primary"/>
            <span::cardTitle>"eye"</span>
          </div>

          <div::card>
            <Icon name="eye-off" size="xl" variant="secondary"/>
            <span::cardTitle>"eye-off"</span>
          </div>

          <div::card>
            <Icon name="lock-icon" size="xl" variant="danger"/>
            <span::cardTitle>"lock"</span>
          </div>

          <div::card>
            <Icon name="unlock-icon" size="xl" variant="success"/>
            <span::cardTitle>"unlock"</span>
          </div>

          <div::card>
            <Icon name="key" size="xl" variant="warning"/>
            <span::cardTitle>"key"</span>
          </div>

          <div::card>
            <Icon name="mail-icon" size="xl" variant="primary"/>
            <span::cardTitle>"mail"</span>
          </div>

          <div::card>
            <Icon name="message" size="xl" variant="info"/>
            <span::cardTitle>"message"</span>
          </div>

          <div::card>
            <Icon name="phone" size="xl" variant="success"/>
            <span::cardTitle>"phone"</span>
          </div>

          <div::card>
            <Icon name="video-icon" size="xl" variant="primary"/>
            <span::cardTitle>"video"</span>
          </div>

          <div::card>
            <Icon name="camera-icon" size="xl" variant="secondary"/>
            <span::cardTitle>"camera"</span>
          </div>

          <div::card>
            <Icon name="image-icon" size="xl" variant="info"/>
            <span::cardTitle>"image"</span>
          </div>

          <div::card>
            <Icon name="file-icon" size="xl" variant="secondary"/>
            <span::cardTitle>"file"</span>
          </div>

          <div::card>
            <Icon name="folder-icon" size="xl" variant="warning"/>
            <span::cardTitle>"folder"</span>
          </div>

          <div::card>
            <Icon name="calendar-icon" size="xl" variant="primary"/>
            <span::cardTitle>"calendar"</span>
          </div>

          <div::card>
            <Icon name="clock-icon" size="xl" variant="info"/>
            <span::cardTitle>"clock"</span>
          </div>

          <div::card>
            <Icon name="map-pin" size="xl" variant="danger"/>
            <span::cardTitle>"map-pin"</span>
          </div>

          <div::card>
            <Icon name="flag" size="xl" variant="danger"/>
            <span::cardTitle>"flag"</span>
          </div>

          <div::card>
            <Icon name="send" size="xl" variant="primary"/>
            <span::cardTitle>"send"</span>
          </div>

          <div::card>
            <Icon name="qr-code" size="xl" variant="secondary"/>
            <span::cardTitle>"qr-code"</span>
          </div>

          <div::card>
            <Icon name="podcast" size="xl" variant="primary"/>
            <span::cardTitle>"podcast"</span>
          </div>

          <div::card>
            <Icon name="headphones" size="xl" variant="info"/>
            <span::cardTitle>"headphones"</span>
          </div>

          <div::card>
            <Icon name="palette" size="xl" variant="danger"/>
            <span::cardTitle>"palette"</span>
          </div>

          <div::card>
            <Icon name="shield-icon" size="xl" variant="primary"/>
            <span::cardTitle>"shield"</span>
          </div>

          <div::card>
            <Icon name="users-icon" size="xl" variant="info"/>
            <span::cardTitle>"users"</span>
          </div>

          <div::card>
            <Icon name="inbox" size="xl" variant="secondary"/>
            <span::cardTitle>"inbox"</span>
          </div>

          <div::card>
            <Icon name="layers" size="xl" variant="primary"/>
            <span::cardTitle>"layers"</span>
          </div>

          <div::card>
            <Icon name="printer" size="xl" variant="secondary"/>
            <span::cardTitle>"printer"</span>
          </div>

          <div::card>
            <Icon name="alert-icon" size="xl" variant="danger"/>
            <span::cardTitle>"alert"</span>
          </div>

          <div::card>
            <Icon name="info-icon" size="xl" variant="info"/>
            <span::cardTitle>"info"</span>
          </div>

          <div::card>
            <Icon name="help" size="xl" variant="primary"/>
            <span::cardTitle>"help"</span>
          </div>
        </div>
      </div>

      /* Action Icons */
      <div::section>
        <h2::sectionTitle>"Action Icons"</h2>
        <p::sectionDescription>"Icons for user actions and commands"</p>

        <div::grid>
          <div::card>
            <Icon name="check" size="xl" variant="success"/>
            <span::cardTitle>"check"</span>
          </div>

          <div::card>
            <Icon name="search" size="xl" variant="primary"/>
            <span::cardTitle>"search"</span>
          </div>

          <div::card>
            <Icon name="upload" size="xl" variant="info"/>
            <span::cardTitle>"upload"</span>
          </div>

          <div::card>
            <Icon name="download" size="xl" variant="info"/>
            <span::cardTitle>"download"</span>
          </div>

          <div::card>
            <Icon name="trash" size="xl" variant="danger"/>
            <span::cardTitle>"trash"</span>
          </div>

          <div::card>
            <Icon name="edit" size="xl" variant="warning"/>
            <span::cardTitle>"edit"</span>
          </div>

          <div::card>
            <Icon name="close" size="xl" variant="danger"/>
            <span::cardTitle>"close"</span>
          </div>

          <div::card>
            <Icon name="plus" size="xl" variant="success"/>
            <span::cardTitle>"plus"</span>
          </div>

          <div::card>
            <Icon name="minus" size="xl" variant="warning"/>
            <span::cardTitle>"minus"</span>
          </div>

          <div::card>
            <Icon name="eye" size="xl" variant="primary"/>
            <span::cardTitle>"eye"</span>
          </div>

          <div::card>
            <Icon name="eye-off" size="xl" variant="secondary"/>
            <span::cardTitle>"eye-off"</span>
          </div>

          <div::card>
            <Icon name="link" size="xl" variant="info"/>
            <span::cardTitle>"link"</span>
          </div>

          <div::card>
            <Icon name="copy" size="xl" variant="primary"/>
            <span::cardTitle>"copy"</span>
          </div>

          <div::card>
            <Icon name="clipboard" size="xl" variant="primary"/>
            <span::cardTitle>"clipboard"</span>
          </div>

          <div::card>
            <Icon name="save" size="xl" variant="success"/>
            <span::cardTitle>"save"</span>
          </div>

          <div::card>
            <Icon name="refresh" size="xl" variant="info"/>
            <span::cardTitle>"refresh"</span>
          </div>

          <div::card>
            <Icon name="filter" size="xl" variant="primary"/>
            <span::cardTitle>"filter"</span>
          </div>

          <div::card>
            <Icon name="zoom-in" size="xl" variant="primary"/>
            <span::cardTitle>"zoom-in"</span>
          </div>

          <div::card>
            <Icon name="zoom-out" size="xl" variant="primary"/>
            <span::cardTitle>"zoom-out"</span>
          </div>

          <div::card>
            <Icon name="maximize" size="xl" variant="info"/>
            <span::cardTitle>"maximize"</span>
          </div>

          <div::card>
            <Icon name="minimize" size="xl" variant="info"/>
            <span::cardTitle>"minimize"</span>
          </div>

          <div::card>
            <Icon name="external-link" size="xl" variant="primary"/>
            <span::cardTitle>"external-link"</span>
          </div>
        </div>
      </div>

      /* Navigation Icons */
      <div::section>
        <h2::sectionTitle>"Navigation Icons"</h2>
        <p::sectionDescription>"Directional and navigation icons"</p>

        <div::grid>
          <div::card>
            <Icon name="home" size="xl" variant="primary"/>
            <span::cardTitle>"home"</span>
          </div>

          <div::card>
            <Icon name="menu" size="xl" variant="primary"/>
            <span::cardTitle>"menu"</span>
          </div>

          <div::card>
            <Icon name="arrow-right" size="xl" variant="info"/>
            <span::cardTitle>"arrow-right"</span>
          </div>

          <div::card>
            <Icon name="arrow-left" size="xl" variant="info"/>
            <span::cardTitle>"arrow-left"</span>
          </div>

          <div::card>
            <Icon name="arrow-up" size="xl" variant="info"/>
            <span::cardTitle>"arrow-up"</span>
          </div>

          <div::card>
            <Icon name="arrow-down" size="xl" variant="info"/>
            <span::cardTitle>"arrow-down"</span>
          </div>

          <div::card>
            <Icon name="chevron-right" size="xl" variant="primary"/>
            <span::cardTitle>"chevron-right"</span>
          </div>

          <div::card>
            <Icon name="chevron-left" size="xl" variant="primary"/>
            <span::cardTitle>"chevron-left"</span>
          </div>

          <div::card>
            <Icon name="chevron-up" size="xl" variant="primary"/>
            <span::cardTitle>"chevron-up"</span>
          </div>

          <div::card>
            <Icon name="chevron-down" size="xl" variant="primary"/>
            <span::cardTitle>"chevron-down"</span>
          </div>

          <div::card>
            <Icon name="map-pin" size="xl" variant="danger"/>
            <span::cardTitle>"map-pin"</span>
          </div>

          <div::card>
            <Icon name="compass" size="xl" variant="info"/>
            <span::cardTitle>"compass"</span>
          </div>
        </div>
      </div>

      /* Social Icons */
      <div::section>
        <h2::sectionTitle>"Social Icons"</h2>
        <p::sectionDescription>"Social interaction and engagement icons"</p>

        <div::grid>
          <div::card>
            <Icon name="heart" size="xl" variant="danger"/>
            <span::cardTitle>"heart"</span>
          </div>

          <div::card>
            <Icon name="star" size="xl" variant="warning"/>
            <span::cardTitle>"star"</span>
          </div>

          <div::card>
            <Icon name="share" size="xl" variant="info"/>
            <span::cardTitle>"share"</span>
          </div>

          <div::card>
            <Icon name="thumbs-up" size="xl" variant="success"/>
            <span::cardTitle>"thumbs-up"</span>
          </div>

          <div::card>
            <Icon name="thumbs-down" size="xl" variant="danger"/>
            <span::cardTitle>"thumbs-down"</span>
          </div>

          <div::card>
            <Icon name="message-circle" size="xl" variant="primary"/>
            <span::cardTitle>"message-circle"</span>
          </div>

          <div::card>
            <Icon name="message-square" size="xl" variant="primary"/>
            <span::cardTitle>"message-square"</span>
          </div>

          <div::card>
            <Icon name="bookmark" size="xl" variant="warning"/>
            <span::cardTitle>"bookmark"</span>
          </div>

          <div::card>
            <Icon name="tag" size="xl" variant="info"/>
            <span::cardTitle>"tag"</span>
          </div>

          <div::card>
            <Icon name="gift" size="xl" variant="danger"/>
            <span::cardTitle>"gift"</span>
          </div>
        </div>
      </div>

      /* Media Icons */
      <div::section>
        <h2::sectionTitle>"Media Icons"</h2>
        <p::sectionDescription>"Media control and playback icons"</p>

        <div::grid>
          <div::card>
            <Icon name="play" size="xl" variant="success"/>
            <span::cardTitle>"play"</span>
          </div>

          <div::card>
            <Icon name="pause" size="xl" variant="warning"/>
            <span::cardTitle>"pause"</span>
          </div>

          <div::card>
            <Icon name="volume" size="xl" variant="primary"/>
            <span::cardTitle>"volume"</span>
          </div>

          <div::card>
            <Icon name="mic" size="xl" variant="danger"/>
            <span::cardTitle>"mic"</span>
          </div>

          <div::card>
            <Icon name="camera" size="xl" variant="info"/>
            <span::cardTitle>"camera"</span>
          </div>

          <div::card>
            <Icon name="video" size="xl" variant="primary"/>
            <span::cardTitle>"video"</span>
          </div>

          <div::card>
            <Icon name="image" size="xl" variant="success"/>
            <span::cardTitle>"image"</span>
          </div>

          <div::card>
            <Icon name="music" size="xl" variant="warning"/>
            <span::cardTitle>"music"</span>
          </div>
        </div>
      </div>

      /* File Icons */
      <div::section>
        <h2::sectionTitle>"File Icons"</h2>
        <p::sectionDescription>"File and folder management icons"</p>

        <div::grid>
          <div::card>
            <Icon name="file" size="xl" variant="secondary"/>
            <span::cardTitle>"file"</span>
          </div>

          <div::card>
            <Icon name="file-text" size="xl" variant="primary"/>
            <span::cardTitle>"file-text"</span>
          </div>

          <div::card>
            <Icon name="folder" size="xl" variant="warning"/>
            <span::cardTitle>"folder"</span>
          </div>

          <div::card>
            <Icon name="folder-open" size="xl" variant="info"/>
            <span::cardTitle>"folder-open"</span>
          </div>

          <div::card>
            <Icon name="archive" size="xl" variant="secondary"/>
            <span::cardTitle>"archive"</span>
          </div>
        </div>
      </div>

      /* Device Icons */
      <div::section>
        <h2::sectionTitle>"Device Icons"</h2>
        <p::sectionDescription>"Hardware and device icons"</p>

        <div::grid>
          <div::card>
            <Icon name="smartphone" size="xl" variant="primary"/>
            <span::cardTitle>"smartphone"</span>
          </div>

          <div::card>
            <Icon name="laptop" size="xl" variant="info"/>
            <span::cardTitle>"laptop"</span>
          </div>

          <div::card>
            <Icon name="monitor" size="xl" variant="secondary"/>
            <span::cardTitle>"monitor"</span>
          </div>

          <div::card>
            <Icon name="wifi" size="xl" variant="success"/>
            <span::cardTitle>"wifi"</span>
          </div>

          <div::card>
            <Icon name="tablet" size="xl" variant="info"/>
            <span::cardTitle>"tablet"</span>
          </div>

          <div::card>
            <Icon name="desktop" size="xl" variant="secondary"/>
            <span::cardTitle>"desktop"</span>
          </div>

          <div::card>
            <Icon name="tv" size="xl" variant="primary"/>
            <span::cardTitle>"tv"</span>
          </div>

          <div::card>
            <Icon name="watch" size="xl" variant="info"/>
            <span::cardTitle>"watch"</span>
          </div>

          <div::card>
            <Icon name="printer-device" size="xl" variant="secondary"/>
            <span::cardTitle>"printer"</span>
          </div>

          <div::card>
            <Icon name="speaker-device" size="xl" variant="primary"/>
            <span::cardTitle>"speaker"</span>
          </div>

          <div::card>
            <Icon name="headphones-device" size="xl" variant="info"/>
            <span::cardTitle>"headphones"</span>
          </div>

          <div::card>
            <Icon name="headset" size="xl" variant="success"/>
            <span::cardTitle>"headset"</span>
          </div>

          <div::card>
            <Icon name="keyboard" size="xl" variant="secondary"/>
            <span::cardTitle>"keyboard"</span>
          </div>

          <div::card>
            <Icon name="mouse" size="xl" variant="primary"/>
            <span::cardTitle>"mouse"</span>
          </div>

          <div::card>
            <Icon name="gamepad" size="xl" variant="danger"/>
            <span::cardTitle>"gamepad"</span>
          </div>

          <div::card>
            <Icon name="webcam" size="xl" variant="info"/>
            <span::cardTitle>"webcam"</span>
          </div>

          <div::card>
            <Icon name="projector" size="xl" variant="warning"/>
            <span::cardTitle>"projector"</span>
          </div>

          <div::card>
            <Icon name="pc-case" size="xl" variant="secondary"/>
            <span::cardTitle>"pc-case"</span>
          </div>

          <div::card>
            <Icon name="hard-drive" size="xl" variant="primary"/>
            <span::cardTitle>"hard-drive"</span>
          </div>

          <div::card>
            <Icon name="monitor-speaker" size="xl" variant="info"/>
            <span::cardTitle>"monitor-speaker"</span>
          </div>

          <div::card>
            <Icon name="scan-kiosk" size="xl" variant="success"/>
            <span::cardTitle>"kiosk/scan"</span>
          </div>

          <div::card>
            <Icon name="touchpad" size="xl" variant="secondary"/>
            <span::cardTitle>"touchpad"</span>
          </div>

          <div::card>
            <Icon name="battery-device" size="xl" variant="warning"/>
            <span::cardTitle>"battery"</span>
          </div>

          <div::card>
            <Icon name="battery-charging-device" size="xl" variant="success"/>
            <span::cardTitle>"battery-charging"</span>
          </div>

          <div::card>
            <Icon name="wifi-off-device" size="xl" variant="danger"/>
            <span::cardTitle>"wifi-off"</span>
          </div>

          <div::card>
            <Icon name="bluetooth-device" size="xl" variant="primary"/>
            <span::cardTitle>"bluetooth"</span>
          </div>

          <div::card>
            <Icon name="cpu" size="xl" variant="secondary"/>
            <span::cardTitle>"cpu"</span>
          </div>
        </div>
      </div>

      /* System & Notification Icons */
      <div::section>
        <h2::sectionTitle>"System & Notification Icons"</h2>
        <p::sectionDescription>"System status and notifications"</p>

        <div::grid>
          <div::card>
            <Icon name="settings" size="xl" variant="secondary"/>
            <span::cardTitle>"settings"</span>
          </div>

          <div::card>
            <Icon name="loader" size="xl" variant="primary"/>
            <span::cardTitle>"loader"</span>
          </div>

          <div::card>
            <Icon name="bell" size="xl" variant="warning"/>
            <span::cardTitle>"bell"</span>
          </div>

          <div::card>
            <Icon name="info" size="xl" variant="info"/>
            <span::cardTitle>"info"</span>
          </div>

          <div::card>
            <Icon name="alert" size="xl" variant="danger"/>
            <span::cardTitle>"alert"</span>
          </div>

          <div::card>
            <Icon name="mail" size="xl" variant="primary"/>
            <span::cardTitle>"mail"</span>
          </div>
        </div>
      </div>

      /* Other Icons */
      <div::section>
        <h2::sectionTitle>"Other Icons"</h2>
        <p::sectionDescription>"Miscellaneous useful icons"</p>

        <div::grid>
          <div::card>
            <Icon name="user" size="xl" variant="primary"/>
            <span::cardTitle>"user"</span>
          </div>

          <div::card>
            <Icon name="calendar" size="xl" variant="info"/>
            <span::cardTitle>"calendar"</span>
          </div>

          <div::card>
            <Icon name="lock" size="xl" variant="danger"/>
            <span::cardTitle>"lock"</span>
          </div>

          <div::card>
            <Icon name="unlock" size="xl" variant="success"/>
            <span::cardTitle>"unlock"</span>
          </div>

          <div::card>
            <Icon name="shopping-cart" size="xl" variant="warning"/>
            <span::cardTitle>"shopping-cart"</span>
          </div>

          <div::card>
            <Icon name="credit-card" size="xl" variant="primary"/>
            <span::cardTitle>"credit-card"</span>
          </div>

          <div::card>
            <Icon name="trending-up" size="xl" variant="success"/>
            <span::cardTitle>"trending-up"</span>
          </div>

          <div::card>
            <Icon name="trending-down" size="xl" variant="danger"/>
            <span::cardTitle>"trending-down"</span>
          </div>

          <div::card>
            <Icon name="clock" size="xl" variant="secondary"/>
            <span::cardTitle>"clock"</span>
          </div>

          <div::card>
            <Icon name="sun" size="xl" variant="warning"/>
            <span::cardTitle>"sun"</span>
          </div>

          <div::card>
            <Icon name="moon" size="xl" variant="primary"/>
            <span::cardTitle>"moon"</span>
          </div>

          <div::card>
            <Icon name="cloud" size="xl" variant="info"/>
            <span::cardTitle>"cloud"</span>
          </div>

          <div::card>
            <Icon name="globe" size="xl" variant="primary"/>
            <span::cardTitle>"globe"</span>
          </div>
        </div>
      </div>

      /* Banking & Finance Icons */
      <div::section>
        <h2::sectionTitle>"Banking & Finance Icons"</h2>
        <p::sectionDescription>"Financial services and banking operations"</p>

        <div::grid>
          <div::card>
            <Icon name="deposits" size="xl" variant="success"/>
            <span::cardTitle>"deposits"</span>
          </div>

          <div::card>
            <Icon name="withdraw" size="xl" variant="danger"/>
            <span::cardTitle>"withdraw"</span>
          </div>

          <div::card>
            <Icon name="transfer" size="xl" variant="info"/>
            <span::cardTitle>"transfer"</span>
          </div>

          <div::card>
            <Icon name="payment" size="xl" variant="primary"/>
            <span::cardTitle>"payment"</span>
          </div>

          <div::card>
            <Icon name="e-card" size="xl" variant="primary"/>
            <span::cardTitle>"e-card"</span>
          </div>

          <div::card>
            <Icon name="wallet" size="xl" variant="warning"/>
            <span::cardTitle>"wallet"</span>
          </div>

          <div::card>
            <Icon name="income" size="xl" variant="success"/>
            <span::cardTitle>"income"</span>
          </div>

          <div::card>
            <Icon name="expenses" size="xl" variant="danger"/>
            <span::cardTitle>"expenses"</span>
          </div>

          <div::card>
            <Icon name="savings" size="xl" variant="info"/>
            <span::cardTitle>"savings"</span>
          </div>

          <div::card>
            <Icon name="investment" size="xl" variant="success"/>
            <span::cardTitle>"investment"</span>
          </div>

          <div::card>
            <Icon name="loan" size="xl" variant="warning"/>
            <span::cardTitle>"loan"</span>
          </div>

          <div::card>
            <Icon name="exchange" size="xl" variant="info"/>
            <span::cardTitle>"exchange"</span>
          </div>

          <div::card>
            <Icon name="receipt" size="xl" variant="secondary"/>
            <span::cardTitle>"receipt"</span>
          </div>

          <div::card>
            <Icon name="refund" size="xl" variant="warning"/>
            <span::cardTitle>"refund"</span>
          </div>

          <div::card>
            <Icon name="tax" size="xl" variant="danger"/>
            <span::cardTitle>"tax"</span>
          </div>

          <div::card>
            <Icon name="discount" size="xl" variant="success"/>
            <span::cardTitle>"discount"</span>
          </div>
        </div>
      </div>

      /* Service & Delivery Icons */
      <div::section>
        <h2::sectionTitle>"Service & Delivery Icons"</h2>
        <p::sectionDescription>"Service and delivery operations"</p>

        <div::grid>
          <div::card>
            <Icon name="delivery" size="xl" variant="primary"/>
            <span::cardTitle>"delivery"</span>
          </div>

          <div::card>
            <Icon name="domestic-service" size="xl" variant="info"/>
            <span::cardTitle>"domestic-service"</span>
          </div>

        </div>
      </div>

      /* Document Actions */
      <div::section>
        <h2::sectionTitle>"Document Actions"</h2>
        <p::sectionDescription>"Document management operations"</p>

        <div::grid>
          <div::card>
            <Icon name="edit-document" size="xl" variant="primary"/>
            <span::cardTitle>"edit-document"</span>
          </div>

          <div::card>
            <Icon name="delete" size="xl" variant="danger"/>
            <span::cardTitle>"delete"</span>
          </div>
        </div>
      </div>

      /* Business Icons */
      <div::section>
        <h2::sectionTitle>"Business Icons"</h2>
        <p::sectionDescription>"Professional and office icons"</p>

        <div::grid>
          <div::card>
            <Icon name="briefcase" size="xl" variant="primary"/>
            <span::cardTitle>"briefcase"</span>
          </div>

          <div::card>
            <Icon name="building" size="xl" variant="secondary"/>
            <span::cardTitle>"building"</span>
          </div>

          <div::card>
            <Icon name="clipboard-list" size="xl" variant="info"/>
            <span::cardTitle>"clipboard-list"</span>
          </div>

          <div::card>
            <Icon name="presentation" size="xl" variant="primary"/>
            <span::cardTitle>"presentation"</span>
          </div>

          <div::card>
            <Icon name="award-star" size="xl" variant="warning"/>
            <span::cardTitle>"award-star"</span>
          </div>

          <div::card>
            <Icon name="megaphone" size="xl" variant="info"/>
            <span::cardTitle>"megaphone"</span>
          </div>

          <div::card>
            <Icon name="package" size="xl" variant="primary"/>
            <span::cardTitle>"package"</span>
          </div>

          <div::card>
            <Icon name="users" size="xl" variant="primary"/>
            <span::cardTitle>"users"</span>
          </div>

          <div::card>
            <Icon name="id-card" size="xl" variant="info"/>
            <span::cardTitle>"id-card"</span>
          </div>
        </div>
      </div>

      /* Education Icons */
      <div::section>
        <h2::sectionTitle>"Education Icons"</h2>
        <p::sectionDescription>"Learning and academic icons"</p>

        <div::grid>
          <div::card>
            <Icon name="book" size="xl" variant="primary"/>
            <span::cardTitle>"book"</span>
          </div>

          <div::card>
            <Icon name="book-open" size="xl" variant="info"/>
            <span::cardTitle>"book-open"</span>
          </div>

          <div::card>
            <Icon name="graduation" size="xl" variant="success"/>
            <span::cardTitle>"graduation"</span>
          </div>

          <div::card>
            <Icon name="pen" size="xl" variant="primary"/>
            <span::cardTitle>"pen"</span>
          </div>

          <div::card>
            <Icon name="pencil" size="xl" variant="warning"/>
            <span::cardTitle>"pencil"</span>
          </div>

          <div::card>
            <Icon name="notebook" size="xl" variant="secondary"/>
            <span::cardTitle>"notebook"</span>
          </div>

          <div::card>
            <Icon name="backpack" size="xl" variant="info"/>
            <span::cardTitle>"backpack"</span>
          </div>

          <div::card>
            <Icon name="certificate" size="xl" variant="success"/>
            <span::cardTitle>"certificate"</span>
          </div>

          <div::card>
            <Icon name="library" size="xl" variant="primary"/>
            <span::cardTitle>"library"</span>
          </div>
        </div>
      </div>

      /* Health & Medical Icons */
      <div::section>
        <h2::sectionTitle>"Health & Medical Icons"</h2>
        <p::sectionDescription>"Healthcare and wellness icons"</p>

        <div::grid>
          <div::card>
            <Icon name="heart-pulse" size="xl" variant="danger"/>
            <span::cardTitle>"heart-pulse"</span>
          </div>

          <div::card>
            <Icon name="stethoscope" size="xl" variant="info"/>
            <span::cardTitle>"stethoscope"</span>
          </div>

          <div::card>
            <Icon name="hospital" size="xl" variant="danger"/>
            <span::cardTitle>"hospital"</span>
          </div>

          <div::card>
            <Icon name="ambulance" size="xl" variant="danger"/>
            <span::cardTitle>"ambulance"</span>
          </div>

          <div::card>
            <Icon name="thermometer" size="xl" variant="danger"/>
            <span::cardTitle>"thermometer"</span>
          </div>

          <div::card>
            <Icon name="accessibility" size="xl" variant="info"/>
            <span::cardTitle>"accessibility"</span>
          </div>

          <div::card>
            <Icon name="activity" size="xl" variant="success"/>
            <span::cardTitle>"activity"</span>
          </div>

          <div::card>
            <Icon name="shield-plus" size="xl" variant="success"/>
            <span::cardTitle>"shield-plus"</span>
          </div>

          <div::card>
            <Icon name="first-aid" size="xl" variant="danger"/>
            <span::cardTitle>"first-aid"</span>
          </div>
        </div>
      </div>

      /* Transportation Icons */
      <div::section>
        <h2::sectionTitle>"Transportation Icons"</h2>
        <p::sectionDescription>"Travel and transportation icons"</p>

        <div::grid>
          <div::card>
            <Icon name="bus" size="xl" variant="warning"/>
            <span::cardTitle>"bus"</span>
          </div>

          <div::card>
            <Icon name="train" size="xl" variant="info"/>
            <span::cardTitle>"train"</span>
          </div>

          <div::card>
            <Icon name="plane" size="xl" variant="primary"/>
            <span::cardTitle>"plane"</span>
          </div>

          <div::card>
            <Icon name="ship" size="xl" variant="info"/>
            <span::cardTitle>"ship"</span>
          </div>

          <div::card>
            <Icon name="bicycle" size="xl" variant="success"/>
            <span::cardTitle>"bicycle"</span>
          </div>

          <div::card>
            <Icon name="rocket" size="xl" variant="danger"/>
            <span::cardTitle>"rocket"</span>
          </div>

          <div::card>
            <Icon name="truck" size="xl" variant="secondary"/>
            <span::cardTitle>"truck"</span>
          </div>

          <div::card>
            <Icon name="anchor" size="xl" variant="primary"/>
            <span::cardTitle>"anchor"</span>
          </div>

          <div::card>
            <Icon name="map" size="xl" variant="info"/>
            <span::cardTitle>"map"</span>
          </div>

          <div::card>
            <Icon name="car" size="xl" variant="primary"/>
            <span::cardTitle>"car"</span>
          </div>

          <div::card>
            <Icon name="taxi" size="xl" variant="warning"/>
            <span::cardTitle>"taxi"</span>
          </div>

          <div::card>
            <Icon name="ambulance-transport" size="xl" variant="danger"/>
            <span::cardTitle>"ambulance"</span>
          </div>

          <div::card>
            <Icon name="sailboat" size="xl" variant="primary"/>
            <span::cardTitle>"sailboat"</span>
          </div>

          <div::card>
            <Icon name="plane-takeoff" size="xl" variant="success"/>
            <span::cardTitle>"plane-takeoff"</span>
          </div>

          <div::card>
            <Icon name="plane-landing" size="xl" variant="info"/>
            <span::cardTitle>"plane-landing"</span>
          </div>
        </div>
      </div>

      /* Food & Beverage Icons */
      <div::section>
        <h2::sectionTitle>"Food & Beverage Icons"</h2>
        <p::sectionDescription>"Food, drink and dining icons"</p>

        <div::grid>
          <div::card>
            <Icon name="coffee" size="xl" variant="primary"/>
            <span::cardTitle>"coffee"</span>
          </div>

          <div::card>
            <Icon name="wine" size="xl" variant="danger"/>
            <span::cardTitle>"wine"</span>
          </div>

          <div::card>
            <Icon name="chef-hat" size="xl" variant="secondary"/>
            <span::cardTitle>"chef-hat"</span>
          </div>

          <div::card>
            <Icon name="apple" size="xl" variant="danger"/>
            <span::cardTitle>"apple"</span>
          </div>

          <div::card>
            <Icon name="cake" size="xl" variant="primary"/>
            <span::cardTitle>"cake"</span>
          </div>

          <div::card>
            <Icon name="cookie" size="xl" variant="warning"/>
            <span::cardTitle>"cookie"</span>
          </div>

          <div::card>
            <Icon name="pizza" size="xl" variant="danger"/>
            <span::cardTitle>"pizza"</span>
          </div>

          <div::card>
            <Icon name="beer" size="xl" variant="warning"/>
            <span::cardTitle>"beer"</span>
          </div>

          <div::card>
            <Icon name="milk" size="xl" variant="info"/>
            <span::cardTitle>"milk"</span>
          </div>
        </div>
      </div>

      /* UI & Interface Icons */
      <div::section>
        <h2::sectionTitle>"UI & Interface Icons"</h2>
        <p::sectionDescription>"User interface and layout controls"</p>

        <div::grid>
          <div::card>
            <Icon name="dashboard" size="xl" variant="primary"/>
            <span::cardTitle>"dashboard"</span>
          </div>

          <div::card>
            <Icon name="grid" size="xl" variant="secondary"/>
            <span::cardTitle>"grid"</span>
          </div>

          <div::card>
            <Icon name="list" size="xl" variant="info"/>
            <span::cardTitle>"list"</span>
          </div>

          <div::card>
            <Icon name="layout" size="xl" variant="primary"/>
            <span::cardTitle>"layout"</span>
          </div>

          <div::card>
            <Icon name="sidebar" size="xl" variant="secondary"/>
            <span::cardTitle>"sidebar"</span>
          </div>

          <div::card>
            <Icon name="columns" size="xl" variant="info"/>
            <span::cardTitle>"columns"</span>
          </div>

          <div::card>
            <Icon name="rows" size="xl" variant="primary"/>
            <span::cardTitle>"rows"</span>
          </div>

          <div::card>
            <Icon name="maximize-2" size="xl" variant="success"/>
            <span::cardTitle>"maximize-2"</span>
          </div>

          <div::card>
            <Icon name="minimize-2" size="xl" variant="warning"/>
            <span::cardTitle>"minimize-2"</span>
          </div>

          <div::card>
            <Icon name="move" size="xl" variant="info"/>
            <span::cardTitle>"move"</span>
          </div>

          <div::card>
            <Icon name="drag" size="xl" variant="secondary"/>
            <span::cardTitle>"drag"</span>
          </div>

          <div::card>
            <Icon name="more-vertical" size="xl" variant="primary"/>
            <span::cardTitle>"more-vertical"</span>
          </div>

          <div::card>
            <Icon name="more-horizontal" size="xl" variant="primary"/>
            <span::cardTitle>"more-horizontal"</span>
          </div>

          <div::card>
            <Icon name="sliders" size="xl" variant="info"/>
            <span::cardTitle>"sliders"</span>
          </div>

          <div::card>
            <Icon name="toggle-left" size="xl" variant="secondary"/>
            <span::cardTitle>"toggle-left"</span>
          </div>

          <div::card>
            <Icon name="toggle-right" size="xl" variant="success"/>
            <span::cardTitle>"toggle-right"</span>
          </div>

          <div::card>
            <Icon name="battery" size="xl" variant="warning"/>
            <span::cardTitle>"battery"</span>
          </div>

          <div::card>
            <Icon name="battery-charging" size="xl" variant="success"/>
            <span::cardTitle>"battery-charging"</span>
          </div>

          <div::card>
            <Icon name="battery-full" size="xl" variant="success"/>
            <span::cardTitle>"battery-full"</span>
          </div>

          <div::card>
            <Icon name="battery-half" size="xl" variant="warning"/>
            <span::cardTitle>"battery-half"</span>
          </div>

          <div::card>
            <Icon name="battery-low" size="xl" variant="danger"/>
            <span::cardTitle>"battery-low"</span>
          </div>

          <div::card>
            <Icon name="power" size="xl" variant="success"/>
            <span::cardTitle>"power"</span>
          </div>

          <div::card>
            <Icon name="power-off" size="xl" variant="danger"/>
            <span::cardTitle>"power-off"</span>
          </div>

          <div::card>
            <Icon name="brightness" size="xl" variant="warning"/>
            <span::cardTitle>"brightness"</span>
          </div>

          <div::card>
            <Icon name="brightness-up" size="xl" variant="success"/>
            <span::cardTitle>"brightness-up"</span>
          </div>

          <div::card>
            <Icon name="brightness-down" size="xl" variant="secondary"/>
            <span::cardTitle>"brightness-down"</span>
          </div>

          <div::card>
            <Icon name="volume-off" size="xl" variant="danger"/>
            <span::cardTitle>"volume-off"</span>
          </div>

          <div::card>
            <Icon name="volume-low" size="xl" variant="warning"/>
            <span::cardTitle>"volume-low"</span>
          </div>

          <div::card>
            <Icon name="volume-high" size="xl" variant="success"/>
            <span::cardTitle>"volume-high"</span>
          </div>

          <div::card>
            <Icon name="vibrate" size="xl" variant="info"/>
            <span::cardTitle>"vibrate"</span>
          </div>

          <div::card>
            <Icon name="notification" size="xl" variant="primary"/>
            <span::cardTitle>"notification"</span>
          </div>

          <div::card>
            <Icon name="notification-off" size="xl" variant="secondary"/>
            <span::cardTitle>"notification-off"</span>
          </div>

          <div::card>
            <Icon name="wifi-off" size="xl" variant="danger"/>
            <span::cardTitle>"wifi-off"</span>
          </div>

          <div::card>
            <Icon name="signal" size="xl" variant="success"/>
            <span::cardTitle>"signal"</span>
          </div>
        </div>
      </div>

      /* Weather & Climate Icons */
      <div::section>
        <h2::sectionTitle>"Weather & Climate Icons"</h2>
        <p::sectionDescription>"Weather conditions and climate icons"</p>

        <div::grid>
          <div::card>
            <Icon name="cloud-rain" size="xl" variant="info"/>
            <span::cardTitle>"cloud-rain"</span>
          </div>

          <div::card>
            <Icon name="cloud-snow" size="xl" variant="primary"/>
            <span::cardTitle>"cloud-snow"</span>
          </div>

          <div::card>
            <Icon name="cloud-lightning" size="xl" variant="warning"/>
            <span::cardTitle>"cloud-lightning"</span>
          </div>

          <div::card>
            <Icon name="cloud-drizzle" size="xl" variant="info"/>
            <span::cardTitle>"cloud-drizzle"</span>
          </div>

          <div::card>
            <Icon name="wind" size="xl" variant="secondary"/>
            <span::cardTitle>"wind"</span>
          </div>

          <div::card>
            <Icon name="sunrise" size="xl" variant="warning"/>
            <span::cardTitle>"sunrise"</span>
          </div>

          <div::card>
            <Icon name="sunset" size="xl" variant="danger"/>
            <span::cardTitle>"sunset"</span>
          </div>

          <div::card>
            <Icon name="umbrella" size="xl" variant="primary"/>
            <span::cardTitle>"umbrella"</span>
          </div>

          <div::card>
            <Icon name="droplet" size="xl" variant="info"/>
            <span::cardTitle>"droplet"</span>
          </div>

          <div::card>
            <Icon name="snowflake" size="xl" variant="primary"/>
            <span::cardTitle>"snowflake"</span>
          </div>

          <div::card>
            <Icon name="rainbow" size="xl" variant="success"/>
            <span::cardTitle>"rainbow"</span>
          </div>
        </div>
      </div>

      /* Shape & Geometry Icons */
      <div::section>
        <h2::sectionTitle>"Shape & Geometry Icons"</h2>
        <p::sectionDescription>"Geometric shapes and design elements"</p>

        <div::grid>
          <div::card>
            <Icon name="circle" size="xl" variant="primary"/>
            <span::cardTitle>"circle"</span>
          </div>

          <div::card>
            <Icon name="square" size="xl" variant="secondary"/>
            <span::cardTitle>"square"</span>
          </div>

          <div::card>
            <Icon name="triangle" size="xl" variant="warning"/>
            <span::cardTitle>"triangle"</span>
          </div>

          <div::card>
            <Icon name="hexagon" size="xl" variant="info"/>
            <span::cardTitle>"hexagon"</span>
          </div>

          <div::card>
            <Icon name="octagon" size="xl" variant="danger"/>
            <span::cardTitle>"octagon"</span>
          </div>

          <div::card>
            <Icon name="pentagon" size="xl" variant="success"/>
            <span::cardTitle>"pentagon"</span>
          </div>

          <div::card>
            <Icon name="star-outline" size="xl" variant="warning"/>
            <span::cardTitle>"star-outline"</span>
          </div>

          <div::card>
            <Icon name="heart-outline" size="xl" variant="danger"/>
            <span::cardTitle>"heart-outline"</span>
          </div>

          <div::card>
            <Icon name="disc" size="xl" variant="secondary"/>
            <span::cardTitle>"disc"</span>
          </div>

          <div::card>
            <Icon name="box" size="xl" variant="info"/>
            <span::cardTitle>"box"</span>
          </div>

          <div::card>
            <Icon name="aperture" size="xl" variant="primary"/>
            <span::cardTitle>"aperture"</span>
          </div>
        </div>
      </div>

      /* Arrow & Direction Icons */
      <div::section>
        <h2::sectionTitle>"Arrow & Direction Icons"</h2>
        <p::sectionDescription>"Directional arrows and navigation pointers"</p>

        <div::grid>
          <div::card>
            <Icon name="arrow-up-circle" size="xl" variant="primary"/>
            <span::cardTitle>"arrow-up-circle"</span>
          </div>

          <div::card>
            <Icon name="arrow-down-circle" size="xl" variant="primary"/>
            <span::cardTitle>"arrow-down-circle"</span>
          </div>

          <div::card>
            <Icon name="arrow-left-circle" size="xl" variant="primary"/>
            <span::cardTitle>"arrow-left-circle"</span>
          </div>

          <div::card>
            <Icon name="arrow-right-circle" size="xl" variant="primary"/>
            <span::cardTitle>"arrow-right-circle"</span>
          </div>

          <div::card>
            <Icon name="arrow-up-square" size="xl" variant="secondary"/>
            <span::cardTitle>"arrow-up-square"</span>
          </div>

          <div::card>
            <Icon name="arrow-down-square" size="xl" variant="secondary"/>
            <span::cardTitle>"arrow-down-square"</span>
          </div>

          <div::card>
            <Icon name="arrow-left-square" size="xl" variant="secondary"/>
            <span::cardTitle>"arrow-left-square"</span>
          </div>

          <div::card>
            <Icon name="arrow-right-square" size="xl" variant="secondary"/>
            <span::cardTitle>"arrow-right-square"</span>
          </div>

          <div::card>
            <Icon name="corner-down-left" size="xl" variant="info"/>
            <span::cardTitle>"corner-down-left"</span>
          </div>

          <div::card>
            <Icon name="corner-down-right" size="xl" variant="info"/>
            <span::cardTitle>"corner-down-right"</span>
          </div>

          <div::card>
            <Icon name="corner-up-left" size="xl" variant="info"/>
            <span::cardTitle>"corner-up-left"</span>
          </div>

          <div::card>
            <Icon name="corner-up-right" size="xl" variant="info"/>
            <span::cardTitle>"corner-up-right"</span>
          </div>

          <div::card>
            <Icon name="corner-left-down" size="xl" variant="warning"/>
            <span::cardTitle>"corner-left-down"</span>
          </div>

          <div::card>
            <Icon name="corner-left-up" size="xl" variant="warning"/>
            <span::cardTitle>"corner-left-up"</span>
          </div>

          <div::card>
            <Icon name="corner-right-down" size="xl" variant="warning"/>
            <span::cardTitle>"corner-right-down"</span>
          </div>

          <div::card>
            <Icon name="corner-right-up" size="xl" variant="warning"/>
            <span::cardTitle>"corner-right-up"</span>
          </div>
        </div>
      </div>

      /* Security & Privacy Icons */
      <div::section>
        <h2::sectionTitle>"Security & Privacy Icons"</h2>
        <p::sectionDescription>"Security, privacy and protection icons"</p>

        <div::grid>
          <div::card>
            <Icon name="shield" size="xl" variant="success"/>
            <span::cardTitle>"shield"</span>
          </div>

          <div::card>
            <Icon name="shield-check" size="xl" variant="success"/>
            <span::cardTitle>"shield-check"</span>
          </div>

          <div::card>
            <Icon name="shield-alert" size="xl" variant="warning"/>
            <span::cardTitle>"shield-alert"</span>
          </div>

          <div::card>
            <Icon name="shield-off" size="xl" variant="danger"/>
            <span::cardTitle>"shield-off"</span>
          </div>

          <div::card>
            <Icon name="key" size="xl" variant="primary"/>
            <span::cardTitle>"key"</span>
          </div>

          <div::card>
            <Icon name="key-round" size="xl" variant="primary"/>
            <span::cardTitle>"key-round"</span>
          </div>

          <div::card>
            <Icon name="fingerprint" size="xl" variant="info"/>
            <span::cardTitle>"fingerprint"</span>
          </div>

          <div::card>
            <Icon name="scan" size="xl" variant="secondary"/>
            <span::cardTitle>"scan"</span>
          </div>

          <div::card>
            <Icon name="scan-face" size="xl" variant="primary"/>
            <span::cardTitle>"scan-face"</span>
          </div>

          <div::card>
            <Icon name="eye-scan" size="xl" variant="info"/>
            <span::cardTitle>"eye-scan"</span>
          </div>

          <div::card>
            <Icon name="shield-question" size="xl" variant="secondary"/>
            <span::cardTitle>"shield-question"</span>
          </div>

          <div::card>
            <Icon name="shield-close" size="xl" variant="danger"/>
            <span::cardTitle>"shield-close"</span>
          </div>
        </div>
      </div>

      /* Media Control Icons */
      <div::section>
        <h2::sectionTitle>"Media Control Icons"</h2>
        <p::sectionDescription>"Playback and media control icons"</p>

        <div::grid>
          <div::card>
            <Icon name="skip-back" size="xl" variant="primary"/>
            <span::cardTitle>"skip-back"</span>
          </div>

          <div::card>
            <Icon name="skip-forward" size="xl" variant="primary"/>
            <span::cardTitle>"skip-forward"</span>
          </div>

          <div::card>
            <Icon name="fast-forward" size="xl" variant="info"/>
            <span::cardTitle>"fast-forward"</span>
          </div>

          <div::card>
            <Icon name="rewind" size="xl" variant="info"/>
            <span::cardTitle>"rewind"</span>
          </div>

          <div::card>
            <Icon name="stop-circle" size="xl" variant="danger"/>
            <span::cardTitle>"stop-circle"</span>
          </div>

          <div::card>
            <Icon name="play-circle" size="xl" variant="success"/>
            <span::cardTitle>"play-circle"</span>
          </div>

          <div::card>
            <Icon name="pause-circle" size="xl" variant="warning"/>
            <span::cardTitle>"pause-circle"</span>
          </div>

          <div::card>
            <Icon name="rotate-cw" size="xl" variant="primary"/>
            <span::cardTitle>"rotate-cw"</span>
          </div>

          <div::card>
            <Icon name="rotate-ccw" size="xl" variant="primary"/>
            <span::cardTitle>"rotate-ccw"</span>
          </div>

          <div::card>
            <Icon name="repeat" size="xl" variant="secondary"/>
            <span::cardTitle>"repeat"</span>
          </div>

          <div::card>
            <Icon name="repeat-one" size="xl" variant="secondary"/>
            <span::cardTitle>"repeat-one"</span>
          </div>

          <div::card>
            <Icon name="shuffle" size="xl" variant="info"/>
            <span::cardTitle>"shuffle"</span>
          </div>

          <div::card>
            <Icon name="volume-x" size="xl" variant="danger"/>
            <span::cardTitle>"volume-x"</span>
          </div>

          <div::card>
            <Icon name="volume-1" size="xl" variant="primary"/>
            <span::cardTitle>"volume-1"</span>
          </div>

          <div::card>
            <Icon name="volume-2" size="xl" variant="success"/>
            <span::cardTitle>"volume-2"</span>
          </div>

          <div::card>
            <Icon name="mic-off" size="xl" variant="danger"/>
            <span::cardTitle>"mic-off"</span>
          </div>
        </div>
      </div>

      /* Code & Development Icons */
      <div::section>
        <h2::sectionTitle>"Code & Development Icons"</h2>
        <p::sectionDescription>"Programming and development icons"</p>

        <div::grid>
          <div::card>
            <Icon name="code-2" size="xl" variant="primary"/>
            <span::cardTitle>"code-2"</span>
          </div>

          <div::card>
            <Icon name="terminal" size="xl" variant="secondary"/>
            <span::cardTitle>"terminal"</span>
          </div>

          <div::card>
            <Icon name="command" size="xl" variant="info"/>
            <span::cardTitle>"command"</span>
          </div>

          <div::card>
            <Icon name="brackets" size="xl" variant="primary"/>
            <span::cardTitle>"brackets"</span>
          </div>

          <div::card>
            <Icon name="curly-braces" size="xl" variant="secondary"/>
            <span::cardTitle>"curly-braces"</span>
          </div>

          <div::card>
            <Icon name="git-branch" size="xl" variant="warning"/>
            <span::cardTitle>"git-branch"</span>
          </div>

          <div::card>
            <Icon name="git-commit" size="xl" variant="info"/>
            <span::cardTitle>"git-commit"</span>
          </div>

          <div::card>
            <Icon name="git-merge" size="xl" variant="success"/>
            <span::cardTitle>"git-merge"</span>
          </div>

          <div::card>
            <Icon name="git-pull" size="xl" variant="primary"/>
            <span::cardTitle>"git-pull"</span>
          </div>

          <div::card>
            <Icon name="bug" size="xl" variant="danger"/>
            <span::cardTitle>"bug"</span>
          </div>

          <div::card>
            <Icon name="database" size="xl" variant="info"/>
            <span::cardTitle>"database"</span>
          </div>

          <div::card>
            <Icon name="server" size="xl" variant="secondary"/>
            <span::cardTitle>"server"</span>
          </div>

          <div::card>
            <Icon name="workflow" size="xl" variant="primary"/>
            <span::cardTitle>"workflow"</span>
          </div>

          <div::card>
            <Icon name="cpu" size="xl" variant="warning"/>
            <span::cardTitle>"cpu"</span>
          </div>

          <div::card>
            <Icon name="hash" size="xl" variant="secondary"/>
            <span::cardTitle>"hash"</span>
          </div>

          <div::card>
            <Icon name="variable" size="xl" variant="info"/>
            <span::cardTitle>"variable"</span>
          </div>
        </div>
      </div>

      /* Network & Connectivity Icons */
      <div::section>
        <h2::sectionTitle>"Network & Connectivity Icons"</h2>
        <p::sectionDescription>"Network and connectivity icons"</p>

        <div::grid>
          <div::card>
            <Icon name="wifi" size="xl" variant="primary"/>
            <span::cardTitle>"wifi"</span>
          </div>

          <div::card>
            <Icon name="bluetooth" size="xl" variant="info"/>
            <span::cardTitle>"bluetooth"</span>
          </div>

          <div::card>
            <Icon name="cast" size="xl" variant="secondary"/>
            <span::cardTitle>"cast"</span>
          </div>

          <div::card>
            <Icon name="antenna" size="xl" variant="warning"/>
            <span::cardTitle>"antenna"</span>
          </div>

          <div::card>
            <Icon name="signal-high" size="xl" variant="success"/>
            <span::cardTitle>"signal-high"</span>
          </div>

          <div::card>
            <Icon name="signal-medium" size="xl" variant="warning"/>
            <span::cardTitle>"signal-medium"</span>
          </div>

          <div::card>
            <Icon name="signal-low" size="xl" variant="danger"/>
            <span::cardTitle>"signal-low"</span>
          </div>

          <div::card>
            <Icon name="signal-zero" size="xl" variant="secondary"/>
            <span::cardTitle>"signal-zero"</span>
          </div>

          <div::card>
            <Icon name="router" size="xl" variant="primary"/>
            <span::cardTitle>"router"</span>
          </div>

          <div::card>
            <Icon name="satellite" size="xl" variant="info"/>
            <span::cardTitle>"satellite"</span>
          </div>

          <div::card>
            <Icon name="rss" size="xl" variant="warning"/>
            <span::cardTitle>"rss"</span>
          </div>

          <div::card>
            <Icon name="broadcast" size="xl" variant="primary"/>
            <span::cardTitle>"broadcast"</span>
          </div>

          <div::card>
            <Icon name="ethernet" size="xl" variant="secondary"/>
            <span::cardTitle>"ethernet"</span>
          </div>

          <div::card>
            <Icon name="nfc" size="xl" variant="info"/>
            <span::cardTitle>"nfc"</span>
          </div>

          <div::card>
            <Icon name="usb" size="xl" variant="primary"/>
            <span::cardTitle>"usb"</span>
          </div>

          <div::card>
            <Icon name="cloud-sync" size="xl" variant="info"/>
            <span::cardTitle>"cloud-sync"</span>
          </div>

          <div::card>
            <Icon name="wifi-high" size="xl" variant="success"/>
            <span::cardTitle>"wifi-high"</span>
          </div>

          <div::card>
            <Icon name="wifi-low" size="xl" variant="warning"/>
            <span::cardTitle>"wifi-low"</span>
          </div>

          <div::card>
            <Icon name="wifi-zero" size="xl" variant="danger"/>
            <span::cardTitle>"wifi-zero"</span>
          </div>

          <div::card>
            <Icon name="cable" size="xl" variant="secondary"/>
            <span::cardTitle>"cable"</span>
          </div>

          <div::card>
            <Icon name="database" size="xl" variant="primary"/>
            <span::cardTitle>"database"</span>
          </div>

          <div::card>
            <Icon name="network" size="xl" variant="info"/>
            <span::cardTitle>"network"</span>
          </div>

          <div::card>
            <Icon name="orbit" size="xl" variant="primary"/>
            <span::cardTitle>"orbit"</span>
          </div>

          <div::card>
            <Icon name="plug" size="xl" variant="secondary"/>
            <span::cardTitle>"plug"</span>
          </div>

          <div::card>
            <Icon name="plug-zap" size="xl" variant="warning"/>
            <span::cardTitle>"plug-zap"</span>
          </div>
        </div>
      </div>

      /* Nature & Outdoor Icons */
      <div::section>
        <h2::sectionTitle>"Nature & Outdoor Icons"</h2>
        <p::sectionDescription>"Nature, plants and outdoor elements"</p>

        <div::grid>
          <div::card>
            <Icon name="tree" size="xl" variant="success"/>
            <span::cardTitle>"tree"</span>
          </div>

          <div::card>
            <Icon name="leaf" size="xl" variant="success"/>
            <span::cardTitle>"leaf"</span>
          </div>

          <div::card>
            <Icon name="sprout" size="xl" variant="success"/>
            <span::cardTitle>"sprout"</span>
          </div>

          <div::card>
            <Icon name="feather" size="xl" variant="info"/>
            <span::cardTitle>"feather"</span>
          </div>

          <div::card>
            <Icon name="mountain" size="xl" variant="secondary"/>
            <span::cardTitle>"mountain"</span>
          </div>

          <div::card>
            <Icon name="waves" size="xl" variant="info"/>
            <span::cardTitle>"waves"</span>
          </div>

          <div::card>
            <Icon name="bug-nature" size="xl" variant="secondary"/>
            <span::cardTitle>"bug-nature"</span>
          </div>

          <div::card>
            <Icon name="flower" size="xl" variant="danger"/>
            <span::cardTitle>"flower"</span>
          </div>

          <div::card>
            <Icon name="flower-2" size="xl" variant="primary"/>
            <span::cardTitle>"flower-2"</span>
          </div>

          <div::card>
            <Icon name="sun-icon" size="xl" variant="warning"/>
            <span::cardTitle>"sun-icon"</span>
          </div>

          <div::card>
            <Icon name="moon-icon" size="xl" variant="info"/>
            <span::cardTitle>"moon-icon"</span>
          </div>

          <div::card>
            <Icon name="fish" size="xl" variant="primary"/>
            <span::cardTitle>"fish"</span>
          </div>

          <div::card>
            <Icon name="squirrel" size="xl" variant="warning"/>
            <span::cardTitle>"squirrel"</span>
          </div>

          <div::card>
            <Icon name="bird" size="xl" variant="info"/>
            <span::cardTitle>"bird"</span>
          </div>
        </div>
      </div>

      /* Shopping & E-commerce Icons */
      <div::section>
        <h2::sectionTitle>"Shopping & E-commerce Icons"</h2>
        <p::sectionDescription>"Shopping, retail and commerce icons"</p>

        <div::grid>
          <div::card>
            <Icon name="shopping-bag" size="xl" variant="primary"/>
            <span::cardTitle>"shopping-bag"</span>
          </div>

          <div::card>
            <Icon name="gift-box" size="xl" variant="danger"/>
            <span::cardTitle>"gift-box"</span>
          </div>

          <div::card>
            <Icon name="tag-price" size="xl" variant="warning"/>
            <span::cardTitle>"tag-price"</span>
          </div>

          <div::card>
            <Icon name="percent" size="xl" variant="success"/>
            <span::cardTitle>"percent"</span>
          </div>

          <div::card>
            <Icon name="shopping-basket" size="xl" variant="info"/>
            <span::cardTitle>"shopping-basket"</span>
          </div>

          <div::card>
            <Icon name="store" size="xl" variant="primary"/>
            <span::cardTitle>"store"</span>
          </div>

          <div::card>
            <Icon name="shirt" size="xl" variant="secondary"/>
            <span::cardTitle>"shirt"</span>
          </div>

          <div::card>
            <Icon name="gem" size="xl" variant="success"/>
            <span::cardTitle>"gem"</span>
          </div>
        </div>
      </div>

      /* Science & Education Icons */
      <div::section>
        <h2::sectionTitle>"Science & Education Icons"</h2>

        <div::grid>
          <div::card>
            <Icon name="flask" size="xl" variant="primary"/>
            <span::cardTitle>"flask"</span>
          </div>

          <div::card>
            <Icon name="microscope" size="xl" variant="info"/>
            <span::cardTitle>"microscope"</span>
          </div>

          <div::card>
            <Icon name="dna" size="xl" variant="success"/>
            <span::cardTitle>"dna"</span>
          </div>

          <div::card>
            <Icon name="syringe" size="xl" variant="secondary"/>
            <span::cardTitle>"syringe"</span>
          </div>

          <div::card>
            <Icon name="school" size="xl" variant="primary"/>
            <span::cardTitle>"school"</span>
          </div>

          <div::card>
            <Icon name="landmark" size="xl" variant="warning"/>
            <span::cardTitle>"landmark"</span>
          </div>

          <div::card>
            <Icon name="calculator" size="xl" variant="info"/>
            <span::cardTitle>"calculator"</span>
          </div>

          <div::card>
            <Icon name="ruler" size="xl" variant="secondary"/>
            <span::cardTitle>"ruler"</span>
          </div>

          <div::card>
            <Icon name="paintbrush" size="xl" variant="danger"/>
            <span::cardTitle>"paintbrush"</span>
          </div>
        </div>
      </div>

      /* Finance & Banking Icons */
      <div::section>
        <h2::sectionTitle>"Finance & Banking Icons"</h2>

        <p::sectionDescription>
          "Financial services, banking, money management, and business icons"
        </p>

        <div::grid>
          <div::card>
            <Icon name="coins" size="xl" variant="warning"/>
            <span::cardTitle>"coins"</span>
          </div>

          <div::card>
            <Icon name="banknote" size="xl" variant="success"/>
            <span::cardTitle>"banknote"</span>
          </div>

          <div::card>
            <Icon name="piggy-bank" size="xl" variant="primary"/>
            <span::cardTitle>"piggy-bank"</span>
          </div>

          <div::card>
            <Icon name="vault" size="xl" variant="secondary"/>
            <span::cardTitle>"vault"</span>
          </div>

          <div::card>
            <Icon name="dollar-sign" size="xl" variant="success"/>
            <span::cardTitle>"dollar-sign"</span>
          </div>

          <div::card>
            <Icon name="hand-coins" size="xl" variant="info"/>
            <span::cardTitle>"hand-coins"</span>
          </div>

          <div::card>
            <Icon name="scale" size="xl" variant="warning"/>
            <span::cardTitle>"scale"</span>
          </div>

          <div::card>
            <Icon name="chart-line" size="xl" variant="primary"/>
            <span::cardTitle>"chart-line"</span>
          </div>

          <div::card>
            <Icon name="chart-bar" size="xl" variant="info"/>
            <span::cardTitle>"chart-bar"</span>
          </div>

          <div::card>
            <Icon name="trending-up-alt" size="xl" variant="success"/>
            <span::cardTitle>"trending-up-alt"</span>
          </div>

          <div::card>
            <Icon name="trending-down-alt" size="xl" variant="danger"/>
            <span::cardTitle>"trending-down-alt"</span>
          </div>

          <div::card>
            <Icon name="credit-card" size="xl" variant="primary"/>
            <span::cardTitle>"credit-card"</span>
          </div>

          <div::card>
            <Icon name="wallet" size="xl" variant="warning"/>
            <span::cardTitle>"wallet"</span>
          </div>

          <div::card>
            <Icon name="receipt" size="xl" variant="secondary"/>
            <span::cardTitle>"receipt"</span>
          </div>

          <div::card>
            <Icon name="bank" size="xl" variant="info"/>
            <span::cardTitle>"bank"</span>
          </div>

          <div::card>
            <Icon name="bitcoin" size="xl" variant="warning"/>
            <span::cardTitle>"bitcoin"</span>
          </div>

          <div::card>
            <Icon name="transfer" size="xl" variant="info"/>
            <span::cardTitle>"transfer"</span>
          </div>

          <div::card>
            <Icon name="calculator" size="xl" variant="primary"/>
            <span::cardTitle>"calculator"</span>
          </div>

          <div::card>
            <Icon name="briefcase" size="xl" variant="secondary"/>
            <span::cardTitle>"briefcase"</span>
          </div>

          <div::card>
            <Icon name="percent-finance" size="xl" variant="success"/>
            <span::cardTitle>"percent"</span>
          </div>

          <div::card>
            <Icon name="ticket" size="xl" variant="primary"/>
            <span::cardTitle>"ticket"</span>
          </div>

          <div::card>
            <Icon name="badge-dollar" size="xl" variant="success"/>
            <span::cardTitle>"badge-dollar"</span>
          </div>

          <div::card>
            <Icon name="pie-chart" size="xl" variant="info"/>
            <span::cardTitle>"pie-chart"</span>
          </div>

          <div::card>
            <Icon name="candlestick-chart" size="xl" variant="warning"/>
            <span::cardTitle>"candlestick"</span>
          </div>

          <div::card>
            <Icon name="wallet-minimal" size="xl" variant="primary"/>
            <span::cardTitle>"wallet-minimal"</span>
          </div>

          <div::card>
            <Icon name="receipt-text" size="xl" variant="secondary"/>
            <span::cardTitle>"receipt-text"</span>
          </div>

          <div::card>
            <Icon name="building" size="xl" variant="info"/>
            <span::cardTitle>"building"</span>
          </div>

          <div::card>
            <Icon name="invoice" size="xl" variant="primary"/>
            <span::cardTitle>"invoice"</span>
          </div>
        </div>
      </div>
    </div>
  }

  /* Get preview header with icon count */
  fun getPreviewHeader : Html {
    <div
      style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 20px 24px; border-radius: 12px; margin-bottom: 24px; color: white;"
    >
      <h3 style="margin: 0 0 8px; font-size: 18px; font-weight: 600;">
        "🎨 Icon Library Preview"
      </h3>

      <p style="margin: 0; font-size: 14px; opacity: 0.95; line-height: 1.6;">
        "These are just 6 sample icons. Scroll down to see our complete library with 200+ icons organized by categories!"
      </p>
    </div>
  }

  /* Main render with ComponentShowcase */
  fun render : Html {
    <div>
      <ComponentShowcase
        title="Icon Component"
        description="Mobile-first responsive icon component with SVG support, animations, badges, and extensive icon library. Touch-friendly with minimum 44x44px targets."
        badge="Component"
        previewContent={getPreviewContent()}
        controlsContent={getControlsContent()}
        usageText="The Icon component provides a comprehensive icon system with 200+ built-in SVG icons organized by category. Features include customizable sizes, theme-aware color variants, animations (spin, pulse), badges, rotation, flipping, and click handlers. All icons are mobile-optimized with minimum 44x44px touch targets and support accessibility features. Browse available icons in the Icons tab, or register your own custom icons using IconRegistry."
        codeExamples={getCodeExamples()}
        apiProperties={getApiProperties()}
        events={getApiEvents()}
        iconsContent={getIconGallery()}
        enabledTabs={["preview", "icons", "usage", "api"]}
      />
    </div>
  }
}
