/* ChipPage - Showcase for Chip component */

component ChipPage {
  connect NavigationStore exposing { setPage }

  /* State for component controls */
  state variant : String = "default"
  state size : String = "md"
  state closable : Bool = false
  state disabled : Bool = false
  state clickable : Bool = false
  state withIcon : Bool = false
  state withAvatar : Bool = false
  state animated : Bool = true
  state animation : String = "scaleIn"

  fun componentDidMount : Promise(Void) {
    setPage("chip")
  }

  /* Event handlers */
  fun handleVariantChange (newVariant : String) : Promise(Void) {
    next { variant: newVariant }
  }

  fun handleSizeChange (newSize : String) : Promise(Void) {
    next { size: newSize }
  }

  fun toggleClosable : Promise(Void) {
    next { closable: !closable }
  }

  fun toggleDisabled : Promise(Void) {
    next { disabled: !disabled }
  }

  fun toggleClickable : Promise(Void) {
    next { clickable: !clickable }
  }

  fun toggleIcon : Promise(Void) {
    next { withIcon: !withIcon }
  }

  fun toggleAvatar : Promise(Void) {
    next { withAvatar: !withAvatar }
  }

  fun toggleAnimated : Promise(Void) {
    next { animated: !animated }
  }

  fun handleAnimationChange (newAnimation : String) : Promise(Void) {
    next { animation: newAnimation }
  }

  fun handleChipClick (event : ChipClickEvent) : Promise(Void) {
    `console.log('Chip clicked:', #{event.label})`
  }

  fun handleChipClose (event : ChipCloseEvent) : Promise(Void) {
    `console.log('Chip closed:', #{event.label})`
  }

  /* Get preview content */
  fun getPreviewContent : Html {
    <div::previewWrapper>
      <Chip
        label="Example Chip"
        variant={variant}
        size={size}
        closable={closable}
        disabled={disabled}
        clickable={clickable}
        icon={
          if withIcon {
            "⭐"
          } else {
            ""
          }
        }
        avatar={
          if withAvatar {
            "https://i.pravatar.cc/150?img=1"
          } else {
            ""
          }
        }
        animated={animated}
        animation={animation}
        onClick={handleChipClick}
        onClose={handleChipClose}/>
    </div>
  }

  /* Get controls content */
  fun getControlsContent : Html {
    <div>
      <Heading level="4" margin="0 0 16px">"Chip Controls"</Heading>

      <div::controlGroup>
        <div::controlLabel>"Variant"</div>
        <div::buttonGroup>
          <button::button(variant == "default") onClick={(e : Html.Event) { handleVariantChange("default") }}>
            "Default"
          </button>
          <button::button(variant == "primary") onClick={(e : Html.Event) { handleVariantChange("primary") }}>
            "Primary"
          </button>
          <button::button(variant == "success") onClick={(e : Html.Event) { handleVariantChange("success") }}>
            "Success"
          </button>
          <button::button(variant == "warning") onClick={(e : Html.Event) { handleVariantChange("warning") }}>
            "Warning"
          </button>
          <button::button(variant == "error") onClick={(e : Html.Event) { handleVariantChange("error") }}>
            "Error"
          </button>
          <button::button(variant == "info") onClick={(e : Html.Event) { handleVariantChange("info") }}>
            "Info"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Size"</div>
        <div::buttonGroup>
          <button::button(size == "sm") onClick={(e : Html.Event) { handleSizeChange("sm") }}>
            "Small"
          </button>
          <button::button(size == "md") onClick={(e : Html.Event) { handleSizeChange("md") }}>
            "Medium"
          </button>
          <button::button(size == "lg") onClick={(e : Html.Event) { handleSizeChange("lg") }}>
            "Large"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Animation"</div>
        <div::buttonGroup>
          <button::button(animation == "scaleIn") onClick={(e : Html.Event) { handleAnimationChange("scaleIn") }}>
            "Scale"
          </button>
          <button::button(animation == "fadeIn") onClick={(e : Html.Event) { handleAnimationChange("fadeIn") }}>
            "Fade"
          </button>
          <button::button(animation == "slideInUp") onClick={(e : Html.Event) { handleAnimationChange("slideInUp") }}>
            "Slide Up"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Options"</div>
        <div::buttonGroup>
          <button::toggleButton(closable) onClick={(e : Html.Event) { toggleClosable() }}>
            "Closable"
          </button>
          <button::toggleButton(disabled) onClick={(e : Html.Event) { toggleDisabled() }}>
            "Disabled"
          </button>
          <button::toggleButton(clickable) onClick={(e : Html.Event) { toggleClickable() }}>
            "Clickable"
          </button>
          <button::toggleButton(withIcon) onClick={(e : Html.Event) { toggleIcon() }}>
            "With Icon"
          </button>
          <button::toggleButton(withAvatar) onClick={(e : Html.Event) { toggleAvatar() }}>
            "With Avatar"
          </button>
          <button::toggleButton(animated) onClick={(e : Html.Event) { toggleAnimated() }}>
            "Animated"
          </button>
        </div>
      </div>
    </div>
  }

  /* Get code examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Chip",
        description: "Simple chip with label",
        snippet: {
          code: "<Chip label=\"Basic Chip\"/>",
          language: "mint"
        },
        previewContent: <Chip label="Basic Chip"/>,
        showReplay: false
      },
      {
        title: "Colored Variants",
        description: "Chips with different semantic colors",
        snippet: {
          code: "<Chip label=\"Primary\" variant=\"primary\"/>\n" +
                "<Chip label=\"Success\" variant=\"success\"/>\n" +
                "<Chip label=\"Warning\" variant=\"warning\"/>\n" +
                "<Chip label=\"Error\" variant=\"error\"/>",
          language: "mint"
        },
        previewContent: <div style="display: flex; gap: 8px; flex-wrap: wrap;">
          <Chip label="Primary" variant="primary"/>
          <Chip label="Success" variant="success"/>
          <Chip label="Warning" variant="warning"/>
          <Chip label="Error" variant="error"/>
        </div>,
        showReplay: false
      },
      {
        title: "With Icons",
        description: "Chips with emoji or icon prefixes",
        snippet: {
          code: "<Chip label=\"Star\" icon=\"⭐\" variant=\"primary\"/>\n" +
                "<Chip label=\"Heart\" icon=\"❤️\" variant=\"error\"/>\n" +
                "<Chip label=\"Check\" icon=\"✓\" variant=\"success\"/>",
          language: "mint"
        },
        previewContent: <div style="display: flex; gap: 8px; flex-wrap: wrap;">
          <Chip label="Star" icon="⭐" variant="primary"/>
          <Chip label="Heart" icon="❤️" variant="error"/>
          <Chip label="Check" icon="✓" variant="success"/>
        </div>,
        showReplay: false
      },
      {
        title: "With Avatar",
        description: "Chips with user avatars",
        snippet: {
          code: "<Chip\n" +
                "  label=\"John Doe\"\n" +
                "  avatar=\"https://i.pravatar.cc/150?img=1\"\n" +
                "  variant=\"primary\"/>",
          language: "mint"
        },
        previewContent: <Chip
          label="John Doe"
          avatar="https://i.pravatar.cc/150?img=1"
          variant="primary"/>,
        showReplay: false
      },
      {
        title: "Closable Chips",
        description: "Chips with close button",
        snippet: {
          code: "<Chip\n" +
                "  label=\"Removable\"\n" +
                "  variant=\"primary\"\n" +
                "  closable={true}\n" +
                "  onClose={handleClose}/>",
          language: "mint"
        },
        previewContent: <div style="display: flex; gap: 8px; flex-wrap: wrap;">
          <Chip label="Tag 1" variant="primary" closable={true}/>
          <Chip label="Tag 2" variant="success" closable={true}/>
          <Chip label="Tag 3" variant="warning" closable={true}/>
        </div>,
        showReplay: false
      },
      {
        title: "Sizes",
        description: "Chips in different sizes",
        snippet: {
          code: "<Chip label=\"Small\" size=\"sm\" variant=\"primary\"/>\n" +
                "<Chip label=\"Medium\" size=\"md\" variant=\"primary\"/>\n" +
                "<Chip label=\"Large\" size=\"lg\" variant=\"primary\"/>",
          language: "mint"
        },
        previewContent: <div style="display: flex; gap: 8px; align-items: center; flex-wrap: wrap;">
          <Chip label="Small" size="sm" variant="primary"/>
          <Chip label="Medium" size="md" variant="primary"/>
          <Chip label="Large" size="lg" variant="primary"/>
        </div>,
        showReplay: false
      },
      {
        title: "Clickable Chips",
        description: "Interactive chips with click handlers",
        snippet: {
          code: "<Chip\n" +
                "  label=\"Click me\"\n" +
                "  variant=\"primary\"\n" +
                "  clickable={true}\n" +
                "  onClick={handleClick}/>",
          language: "mint"
        },
        previewContent: <Chip
          label="Click me"
          variant="primary"
          clickable={true}/>,
        showReplay: false
      },
      {
        title: "Disabled State",
        description: "Non-interactive disabled chips",
        snippet: {
          code: "<Chip label=\"Disabled\" variant=\"primary\" disabled={true}/>",
          language: "mint"
        },
        previewContent: <div style="display: flex; gap: 8px; flex-wrap: wrap;">
          <Chip label="Disabled" variant="primary" disabled={true}/>
          <Chip label="Disabled" variant="success" disabled={true} closable={true}/>
        </div>,
        showReplay: false
      }
    ]
  }

  /* Get API properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "label",
        description: "Text content displayed in the chip",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "variant",
        description: "Color variant: default | primary | success | warning | error | info",
        type: "String",
        defaultValue: "\"default\""
      },
      {
        name: "size",
        description: "Size of the chip: sm | md | lg",
        type: "String",
        defaultValue: "\"md\""
      },
      {
        name: "closable",
        description: "Show close button",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "disabled",
        description: "Disable interactions",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "icon",
        description: "Icon or emoji to display before label",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "avatar",
        description: "Avatar image URL to display before label",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "clickable",
        description: "Enable click interactions and hover effects",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "color",
        description: "Custom background color (overrides variant)",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "textColor",
        description: "Custom text color",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "borderColor",
        description: "Custom border color",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "animated",
        description: "Enable entrance animation",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "animation",
        description: "Animation type (see EnterExit component)",
        type: "String",
        defaultValue: "\"scaleIn\""
      },
      {
        name: "animationDuration",
        description: "Animation duration in seconds",
        type: "Number",
        defaultValue: "0.3"
      }
    ]
  }

  /* Get API events */
  fun getApiEvents : Array(ApiProperty) {
    [
      {
        name: "onClick",
        description: "Triggered when chip is clicked (requires clickable={true})",
        type: "Function(ChipClickEvent, Promise(Void))",
        defaultValue: "ChipClickEvent: { label: String, variant: String }"
      },
      {
        name: "onClose",
        description: "Triggered when close button is clicked",
        type: "Function(ChipCloseEvent, Promise(Void))",
        defaultValue: "ChipCloseEvent: { label: String, variant: String }"
      }
    ]
  }

  /* Custom styles */
  style previewWrapper {
    display: flex;
    flex-wrap: wrap;
    gap: 16px;
    align-items: center;
    justify-content: center;
    padding: 20px;
  }


  style controlGroup {
    margin-bottom: 20px;
  }

  style controlLabel {
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: #323233;
    margin-bottom: 8px;
  }

  style buttonGroup {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
  }

  style button (active : Bool) {
    padding: 8px 16px;
    border-radius: 6px;
    border: 2px solid #1989fa;
    font-size: 13px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
    background: transparent;

    if active {
      background: #1989fa;
      color: #fff;
    } else {
      background: #fff;
      color: #1989fa;
    }

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(25, 137, 250, 0.3);
    }
  }

  style toggleButton (active : Bool) {
    padding: 8px 16px;
    border-radius: 6px;
    font-size: 13px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
    background: transparent;

    if active {
      border: 2px solid #52c41a;
      background: #52c41a;
      color: #fff;
    } else {
      border: 2px solid #d9d9d9;
      background: #fff;
      color: #666;
    }

    &:hover {
      transform: translateY(-2px);
    }
  }

  /* Render */
  fun render : Html {
    <ComponentShowcase
      title="Chip"
      description="Compact elements that represent tags, categories, or user selections. Perfect for filters, labels, and interactive tags."
      badge="Component"
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="Chips are compact elements that represent an input, attribute, or action. They allow users to enter information, make selections, filter content, or trigger actions."
      codeExamples={getCodeExamples()}
      apiProperties={getApiProperties()}
      events={getApiEvents()}
      enabledTabs={["preview", "usage", "api"]}/>
  }
}
