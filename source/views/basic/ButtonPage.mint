/* ButtonPage - Comprehensive Button Component Showcase */
component ButtonPage {
  /* State */
  state selectedVariant : String = "primary"

  state selectedSize : String = "medium"
  state selectedShape : String = "rounded"
  state selectedElevation : String = "none"
  state isPlain : Bool = false
  state isBlock : Bool = false
  state isLoading : Bool = false
  state hasRipple : Bool = true
  state hasHaptic : Bool = false

  /* Event handlers */
  fun handleVariantChange (event : Html.Event) : Promise(Void) {
    next { selectedVariant: `#{event}.target.value` }
  }

  fun handleSizeChange (event : Html.Event) : Promise(Void) {
    next { selectedSize: `#{event}.target.value` }
  }

  fun handleShapeChange (event : Html.Event) : Promise(Void) {
    next { selectedShape: `#{event}.target.value` }
  }

  fun handleElevationChange (event : Html.Event) : Promise(Void) {
    next { selectedElevation: `#{event}.target.value` }
  }

  fun togglePlain (event : Html.Event) : Promise(Void) {
    next { isPlain: !isPlain }
  }

  fun toggleBlock (event : Html.Event) : Promise(Void) {
    next { isBlock: !isBlock }
  }

  fun toggleLoading (event : Html.Event) : Promise(Void) {
    next { isLoading: !isLoading }
  }

  fun toggleRipple (event : Html.Event) : Promise(Void) {
    next { hasRipple: !hasRipple }
  }

  fun toggleHaptic (event : Html.Event) : Promise(Void) {
    next { hasHaptic: !hasHaptic }
  }

  fun handleButtonClick (event : Html.Event) : Promise(Void) {
    Debug.log("Button clicked!")
    Promise.never()
  }

  /* Styles */
  style selectBox {
    width: 100%;
    padding: 8px 12px;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    font-size: 14px;
    background: var(--card-bg);
    color: var(--text-color);
  }

  style checkboxLabel {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
  }

  style checkbox {
    width: 16px;
    height: 16px;
    cursor: pointer;
  }

  /* Render */
  fun render : Html {
    <ComponentShowcase
      title="Button"
      description="Advanced button component superior to Vant UI with ripple effects, multiple elevations, shapes, icons, badges, loading states, and haptic feedback support."
      badge="Basic"
      enabledTabs={["preview", "usage", "api"]}
      previewContent={
        <Flex direction="column" gap="20px" align="stretch">
          <Button
            variant={selectedVariant}
            size={selectedSize}
            shape={selectedShape}
            elevation={selectedElevation}
            plain={isPlain}
            block={isBlock}
            loading={isLoading}
            ripple={hasRipple}
            haptic={hasHaptic}
            onClick={handleButtonClick}
          >
            "Click Me"
          </Button>
        </Flex>
      }
      controlsContent={
        <Flex direction="column" gap="20px">
          /* Variant selector */
          <div>
            <Heading level="4" margin="0 0 12px">"Variant"</Heading>

            <select::selectBox onChange={handleVariantChange} value={selectedVariant}>
              <option value="default">"Default"</option>
              <option value="primary">"Primary"</option>
              <option value="success">"Success"</option>
              <option value="warning">"Warning"</option>
              <option value="danger">"Danger"</option>
              <option value="info">"Info"</option>
            </select>
          </div>

          /* Size selector */
          <div>
            <Heading level="4" margin="0 0 12px">"Size"</Heading>

            <select::selectBox onChange={handleSizeChange} value={selectedSize}>
              <option value="mini">"Mini"</option>
              <option value="small">"Small"</option>
              <option value="medium">"Medium"</option>
              <option value="large">"Large"</option>
            </select>
          </div>

          /* Shape selector */
          <div>
            <Heading level="4" margin="0 0 12px">"Shape"</Heading>

            <select::selectBox onChange={handleShapeChange} value={selectedShape}>
              <option value="square">"Square"</option>
              <option value="rounded">"Rounded"</option>
              <option value="pill">"Pill"</option>
              <option value="circle">"Circle"</option>
            </select>
          </div>

          /* Elevation selector */
          <div>
            <Heading level="4" margin="0 0 12px">"Elevation"</Heading>

            <select::selectBox onChange={handleElevationChange} value={selectedElevation}>
              <option value="none">"None"</option>
              <option value="raised">"Raised"</option>
              <option value="lifted">"Lifted"</option>
              <option value="floating">"Floating"</option>
            </select>
          </div>

          /* Plain toggle */
          <div>
            <label::checkboxLabel>
              <input::checkbox type="checkbox" checked={isPlain} onChange={togglePlain}/>

              <Text>"Plain (Outline)"</Text>
            </label>
          </div>

          /* Block toggle */
          <div>
            <label::checkboxLabel>
              <input::checkbox type="checkbox" checked={isBlock} onChange={toggleBlock}/>

              <Text>"Block (Full Width)"</Text>
            </label>
          </div>

          /* Loading toggle */
          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={isLoading}
                onChange={toggleLoading}/>

              <Text>"Loading"</Text>
            </label>
          </div>

          /* Ripple toggle */
          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={hasRipple}
                onChange={toggleRipple}/>

              <Text>"Ripple Effect"</Text>
            </label>
          </div>

          /* Haptic toggle */
          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={hasHaptic}
                onChange={toggleHaptic}/>

              <Text>"Haptic Feedback"</Text>
            </label>
          </div>
        </Flex>
      }
      usageText="Button component with advanced features including ripple effects, elevations, multiple shapes, icons, badges, and loading states."
      codeExamples={
        [
          {
            title: "Basic Buttons",
            description: "Different button variants",
            snippet:
              {
                code:
                  "<Button variant=\"primary\">Primary</Button>\n<Button variant=\"success\">Success</Button>\n<Button variant=\"warning\">Warning</Button>\n<Button variant=\"danger\">Danger</Button>",
                language: "mint"
              },
            previewContent:
              <Flex gap="12px" wrap={true}>
                <Button variant="primary">"Primary"</Button>
                <Button variant="success">"Success"</Button>
                <Button variant="warning">"Warning"</Button>
                <Button variant="danger">"Danger"</Button>
                <Button variant="info">"Info"</Button>
              </Flex>,
            showReplay: false
          },
          {
            title: "Button Sizes",
            description: "From mini to large",
            snippet:
              {
                code:
                  "<Button size=\"mini\">Mini</Button>\n<Button size=\"small\">Small</Button>\n<Button size=\"medium\">Medium</Button>\n<Button size=\"large\">Large</Button>",
                language: "mint"
              },
            previewContent:
              <Flex gap="12px" align="center" wrap={true}>
                <Button size="mini" variant="primary">"Mini"</Button>
                <Button size="small" variant="primary">"Small"</Button>
                <Button size="medium" variant="primary">"Medium"</Button>
                <Button size="large" variant="primary">"Large"</Button>
              </Flex>,
            showReplay: false
          },
          {
            title: "Button Shapes",
            description: "Square, rounded, pill, and circle",
            snippet:
              {
                code:
                  "<Button shape=\"square\">Square</Button>\n<Button shape=\"rounded\">Rounded</Button>\n<Button shape=\"pill\">Pill</Button>\n<Button shape=\"circle\" icon=\"star\" iconPosition=\"only\"/>",
                language: "mint"
              },
            previewContent:
              <Flex gap="12px" align="center" wrap={true}>
                <Button shape="square" variant="primary">"Square"</Button>
                <Button shape="rounded" variant="primary">"Rounded"</Button>
                <Button shape="pill" variant="primary">"Pill"</Button>
                <Button
                  shape="circle"
                  variant="primary"
                  icon="star"
                  iconPosition="only"
                />
              </Flex>,
            showReplay: false
          },
          {
            title: "Plain Buttons (Outline)",
            description: "Transparent background with colored border",
            snippet:
              {
                code:
                  "<Button variant=\"primary\" plain={true}>Primary</Button>\n<Button variant=\"success\" plain={true}>Success</Button>\n<Button variant=\"danger\" plain={true}>Danger</Button>",
                language: "mint"
              },
            previewContent:
              <Flex gap="12px" wrap={true}>
                <Button variant="primary" plain={true}>"Primary"</Button>
                <Button variant="success" plain={true}>"Success"</Button>
                <Button variant="danger" plain={true}>"Danger"</Button>
              </Flex>,
            showReplay: false
          },
          {
            title: "Elevation Variants",
            description: "Add depth with shadows",
            snippet:
              {
                code:
                  "<Button elevation=\"none\">None</Button>\n<Button elevation=\"raised\">Raised</Button>\n<Button elevation=\"lifted\">Lifted</Button>\n<Button elevation=\"floating\">Floating</Button>",
                language: "mint"
              },
            previewContent:
              <Flex gap="12px" wrap={true}>
                <Button variant="primary" elevation="none">"None"</Button>
                <Button variant="primary" elevation="raised">"Raised"</Button>
                <Button variant="primary" elevation="lifted">"Lifted"</Button>
                <Button variant="primary" elevation="floating">"Floating"</Button>
              </Flex>,
            showReplay: false
          },
          {
            title: "Loading State",
            description: "Show loading spinner",
            snippet:
              {
                code:
                  "<Button variant=\"primary\" loading={true} loadingText=\"Loading...\"/>",
                language: "mint"
              },
            previewContent:
              <Flex gap="12px" wrap={true}>
                <Button variant="primary" loading={true} loadingText="Loading..."/>
                <Button variant="success" loading={true}>"Processing"</Button>
              </Flex>,
            showReplay: false
          },
          {
            title: "Block Button",
            description: "Full width button",
            snippet:
              {
                code:
                  "<Button variant=\"primary\" block={true}>Full Width Button</Button>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Button variant="primary" block={true}>"Full Width Button"</Button>
              </div>,
            showReplay: false
          },
          {
            title: "With Icons",
            description: "Add icons to buttons",
            snippet:
              {
                code:
                  "<Button icon=\"star\" iconPosition=\"left\">Left Icon</Button>\n<Button icon=\"star\" iconPosition=\"right\">Right Icon</Button>\n<Button icon=\"star\" iconPosition=\"only\"/>",
                language: "mint"
              },
            previewContent:
              <Flex gap="12px" wrap={true}>
                <Button variant="primary" icon="star" iconPosition="left">
                  "Left Icon"
                </Button>

                <Button variant="success" icon="check" iconPosition="right">
                  "Right Icon"
                </Button>

                <Button variant="danger" icon="heart" iconPosition="only"/>
              </Flex>,
            showReplay: false
          },
          {
            title: "With Badge",
            description: "Add notification badges",
            snippet:
              {
                code:
                  "<Button variant=\"primary\" badge=\"5\">Messages</Button>\n<Button variant=\"success\" badge=\"99+\">Notifications</Button>\n<Button variant=\"danger\" badgeDot={true}>Alerts</Button>",
                language: "mint"
              },
            previewContent:
              <Flex gap="12px" wrap={true}>
                <Button variant="primary" badge="5">"Messages"</Button>
                <Button variant="success" badge="150" badgeMax={99}>
                  "Notifications"
                </Button>

                <Button variant="danger" badgeDot={true}>"Alerts"</Button>
              </Flex>,
            showReplay: false
          },
          {
            title: "Custom Colors",
            description: "Use custom colors or gradients",
            snippet:
              {
                code:
                  "<Button color=\"#7232dd\">Custom Color</Button>\n<Button gradient=\"#ff6034, #ee0a24\">Gradient</Button>",
                language: "mint"
              },
            previewContent:
              <Flex gap="12px" wrap={true}>
                <Button color="#7232dd">"Custom Purple"</Button>
                <Button gradient="#ff6034, #ee0a24">"Red Gradient"</Button>
                <Button gradient="#667eea, #764ba2">"Purple Gradient"</Button>
              </Flex>,
            showReplay: false
          }
        ]
      }
      apiProperties={
        [
          {
            name: "variant",
            description: "Button style variant",
            type: "String",
            defaultValue: "\"default\""
          },
          {
            name: "size",
            description: "Button size (mini, small, medium, large)",
            type: "String",
            defaultValue: "\"medium\""
          },
          {
            name: "shape",
            description: "Button shape (square, rounded, pill, circle)",
            type: "String",
            defaultValue: "\"rounded\""
          },
          {
            name: "elevation",
            description: "Shadow depth (none, raised, lifted, floating)",
            type: "String",
            defaultValue: "\"none\""
          },
          {
            name: "block",
            description: "Full width button",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "plain",
            description: "Outline style with transparent background",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "disabled",
            description: "Disable button interactions",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "loading",
            description: "Show loading spinner",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "ripple",
            description: "Enable Material Design ripple effect",
            type: "Bool",
            defaultValue: "true"
          },
          {
            name: "haptic",
            description: "Enable haptic feedback on mobile",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "color",
            description: "Custom background color",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "gradient",
            description: "Gradient colors (e.g., '#ff6034, #ee0a24')",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "gradientDirection",
            description: "Gradient direction (e.g., 'to right', 'to bottom')",
            type: "String",
            defaultValue: "\"to right\""
          },
          {
            name: "icon",
            description: "Icon name to display",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "iconPosition",
            description: "Icon position (left, right, top, bottom, only)",
            type: "String",
            defaultValue: "\"left\""
          },
          {
            name: "iconSize",
            description: "Icon size in pixels",
            type: "String",
            defaultValue: "\"16px\""
          },
          {
            name: "loadingText",
            description: "Text to show when loading",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "loadingPosition",
            description: "Loading spinner position",
            type: "String",
            defaultValue: "\"left\""
          },
          {
            name: "badge",
            description: "Badge content to display",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "badgeDot",
            description: "Show badge as dot only",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "badgeMax",
            description: "Maximum number for badge (shows + after)",
            type: "Number",
            defaultValue: "99"
          },
          {
            name: "onClick",
            description: "Click event handler",
            type: "Function(Html.Event, Promise(Void))",
            defaultValue: "Promise.never"
          }
        ]
      }
    />
  }
}
