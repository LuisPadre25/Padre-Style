/* BadgePage - Showcase for Badge component using ComponentShowcase */

component BadgePage {
  connect NavigationStore exposing { setPage }

  /* State for component controls */
  state count : Number = 5
  state max : Number = 99
  state showZero : Bool = false
  state variant : String = "error"
  state position : String = "topRight"
  state size : String = "default"

  fun componentDidMount : Promise(Void) {
    setPage("badge")
  }

  /* Event handlers */
  fun handleCountChange (newCount : String) : Promise(Void) {
    case Number.fromString(newCount) {
      Just(num) => next { count: num }
      Nothing => Promise.resolve(void)
    }
  }

  fun handleVariantChange (newVariant : String) : Promise(Void) {
    next { variant: newVariant }
  }

  fun handlePositionChange (newPosition : String) : Promise(Void) {
    next { position: newPosition }
  }

  fun handleSizeChange (newSize : String) : Promise(Void) {
    next { size: newSize }
  }

  fun toggleShowZero : Promise(Void) {
    next { showZero: !showZero }
  }

  /* Get preview content */
  fun getPreviewContent : Html {
    <div::previewWrapper>
      <Badge count={count} max={max} variant={variant} position={position} size={size} showZero={showZero}>
        <div::demoButton>"Messages"</div>
      </Badge>
    </div>
  }

  /* Get controls content */
  fun getControlsContent : Html {
    <div>
      <h3::controlsTitle>"Badge Controls"</h3>

      <div::controlGroup>
        <div::controlLabel>"Count Value"</div>
        <div::buttonGroup>
          <button::button(count == 0) onClick={(e : Html.Event) { handleCountChange("0") }}>
            "0"
          </button>
          <button::button(count == 5) onClick={(e : Html.Event) { handleCountChange("5") }}>
            "5"
          </button>
          <button::button(count == 12) onClick={(e : Html.Event) { handleCountChange("12") }}>
            "12"
          </button>
          <button::button(count == 99) onClick={(e : Html.Event) { handleCountChange("99") }}>
            "99"
          </button>
          <button::button(count == 100) onClick={(e : Html.Event) { handleCountChange("100") }}>
            "100"
          </button>
          <button::button(count == 999) onClick={(e : Html.Event) { handleCountChange("999") }}>
            "999"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Variant"</div>
        <div::buttonGroup>
          <button::button(variant == "default") onClick={(e : Html.Event) { handleVariantChange("default") }}>
            "Default"
          </button>
          <button::button(variant == "success") onClick={(e : Html.Event) { handleVariantChange("success") }}>
            "Success"
          </button>
          <button::button(variant == "processing") onClick={(e : Html.Event) { handleVariantChange("processing") }}>
            "Processing"
          </button>
          <button::button(variant == "error") onClick={(e : Html.Event) { handleVariantChange("error") }}>
            "Error"
          </button>
          <button::button(variant == "warning") onClick={(e : Html.Event) { handleVariantChange("warning") }}>
            "Warning"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Size"</div>
        <div::buttonGroup>
          <button::button(size == "small") onClick={(e : Html.Event) { handleSizeChange("small") }}>
            "Small"
          </button>
          <button::button(size == "default") onClick={(e : Html.Event) { handleSizeChange("default") }}>
            "Default"
          </button>
          <button::button(size == "large") onClick={(e : Html.Event) { handleSizeChange("large") }}>
            "Large"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Position"</div>
        <div::buttonGroup>
          <button::button(position == "topRight") onClick={(e : Html.Event) { handlePositionChange("topRight") }}>
            "Top Right"
          </button>
          <button::button(position == "topLeft") onClick={(e : Html.Event) { handlePositionChange("topLeft") }}>
            "Top Left"
          </button>
          <button::button(position == "bottomRight") onClick={(e : Html.Event) { handlePositionChange("bottomRight") }}>
            "Bottom Right"
          </button>
          <button::button(position == "bottomLeft") onClick={(e : Html.Event) { handlePositionChange("bottomLeft") }}>
            "Bottom Left"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Options"</div>
        <div::buttonGroup>
          <button::toggleButton(showZero) onClick={(e : Html.Event) { toggleShowZero() }}>
            "Show Zero"
          </button>
        </div>
      </div>
    </div>
  }

  /* Get code examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Usage",
        description: "Simple notification badge with count",
        snippet: {
          code: "<Badge count={5}>\n  <button>Messages</button>\n</Badge>",
          language: "mint"
        },
        previewContent:
          <Badge count={5}>
            <div::demoButton>"Messages"</div>
          </Badge>,
        showReplay: false
      },
      {
        title: "Variants",
        description: "Different color variants for various states",
        snippet: {
          code: "<Badge count={5} variant=\"success\"/>\n<Badge count={5} variant=\"error\"/>\n<Badge count={5} variant=\"warning\"/>\n<Badge count={5} variant=\"processing\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 16px; flex-wrap: wrap;">
            <Badge count={5} variant="success">
              <div::demoButton>"Success"</div>
            </Badge>
            <Badge count={5} variant="error">
              <div::demoButton>"Error"</div>
            </Badge>
            <Badge count={5} variant="warning">
              <div::demoButton>"Warning"</div>
            </Badge>
            <Badge count={5} variant="processing">
              <div::demoButton>"Processing"</div>
            </Badge>
          </div>,
        showReplay: false
      },
      {
        title: "Overflow Count",
        description: "Max count display (99+, 999+)",
        snippet: {
          code: "<Badge count={100} max={99}>\n  <button>99+</button>\n</Badge>\n\n<Badge count={1000} max={999}>\n  <button>999+</button>\n</Badge>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 24px;">
            <Badge count={100} max={99} variant="error">
              <div::demoButton>"Messages"</div>
            </Badge>
            <Badge count={1000} max={999} variant="error">
              <div::demoButton>"Inbox"</div>
            </Badge>
          </div>,
        showReplay: false
      },
      {
        title: "Dot Badge",
        description: "Simple dot indicator for status",
        snippet: {
          code: "<Badge dot={true} variant=\"success\">\n  <Avatar/>\n</Badge>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 24px;">
            <Badge dot={true} variant="success">
              <div::demoAvatar style="background: #52c41a;">"JD"</div>
            </Badge>
            <Badge dot={true} variant="error">
              <div::demoAvatar style="background: #ff4d4f;">"AB"</div>
            </Badge>
            <Badge dot={true} variant="warning">
              <div::demoAvatar style="background: #faad14;">"MC"</div>
            </Badge>
          </div>,
        showReplay: false
      },
      {
        title: "Standalone Tags",
        description: "Status labels without children",
        snippet: {
          code: "<Badge standalone={true} text=\"New\" variant=\"success\"/>\n<Badge standalone={true} text=\"Beta\" variant=\"processing\"/>\n<Badge standalone={true} text=\"Hot\" variant=\"error\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 12px; flex-wrap: wrap;">
            <Badge standalone={true} text="New" variant="success"/>
            <Badge standalone={true} text="Beta" variant="processing"/>
            <Badge standalone={true} text="Hot" variant="error"/>
            <Badge standalone={true} text="Sale" variant="warning"/>
          </div>,
        showReplay: false
      },
      {
        title: "Sizes",
        description: "Small, default, and large sizes",
        snippet: {
          code: "<Badge count={5} size=\"small\"/>\n<Badge count={10} size=\"default\"/>\n<Badge count={99} size=\"large\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 24px; align-items: center;">
            <Badge count={5} size="small" variant="error">
              <div::demoButton>"Small"</div>
            </Badge>
            <Badge count={10} size="default" variant="error">
              <div::demoButton>"Default"</div>
            </Badge>
            <Badge count={99} size="large" variant="error">
              <div::demoButton>"Large"</div>
            </Badge>
          </div>,
        showReplay: false
      },
      {
        title: "Positions",
        description: "Badge positioning options",
        snippet: {
          code: "<Badge count={5} position=\"topRight\"/>\n<Badge count={5} position=\"topLeft\"/>\n<Badge count={5} position=\"bottomRight\"/>\n<Badge count={5} position=\"bottomLeft\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 24px; flex-wrap: wrap;">
            <Badge count={5} position="topRight" variant="error">
              <div::demoBox>"TR"</div>
            </Badge>
            <Badge count={5} position="topLeft" variant="success">
              <div::demoBox>"TL"</div>
            </Badge>
            <Badge count={5} position="bottomRight" variant="warning">
              <div::demoBox>"BR"</div>
            </Badge>
            <Badge count={5} position="bottomLeft" variant="processing">
              <div::demoBox>"BL"</div>
            </Badge>
          </div>,
        showReplay: false
      },
      {
        title: "With Icons",
        description: "Badges on emoji icons",
        snippet: {
          code: "<Badge count={12} variant=\"error\">\n  <div style=\"font-size: 32px;\">🔔</div>\n</Badge>\n\n<Badge count={5} variant=\"success\">\n  <div style=\"font-size: 32px;\">💬</div>\n</Badge>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 32px;">
            <Badge count={12} variant="error">
              <div style="font-size: 32px; cursor: pointer;">"🔔"</div>
            </Badge>
            <Badge count={5} variant="success">
              <div style="font-size: 32px; cursor: pointer;">"💬"</div>
            </Badge>
            <Badge dot={true} variant="warning">
              <div style="font-size: 32px; cursor: pointer;">"👤"</div>
            </Badge>
            <Badge count={99} variant="processing" size="large">
              <div style="font-size: 32px; cursor: pointer;">"📧"</div>
            </Badge>
          </div>,
        showReplay: false
      },
      {
        title: "Custom Colors",
        description: "Use custom hex colors",
        snippet: {
          code: "<Badge count={5} color=\"#722ed1\"/>\n<Badge count={3} color=\"#13c2c2\"/>\n<Badge count={8} color=\"#eb2f96\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 24px;">
            <Badge count={5} color="#722ed1">
              <div::demoButton>"Purple"</div>
            </Badge>
            <Badge count={3} color="#13c2c2">
              <div::demoButton>"Cyan"</div>
            </Badge>
            <Badge count={8} color="#eb2f96">
              <div::demoButton>"Magenta"</div>
            </Badge>
          </div>,
        showReplay: false
      }
    ]
  }

  /* Get API properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "count",
        type: "Number",
        defaultValue: "0",
        description: "Number displayed in badge"
      },
      {
        name: "max",
        type: "Number",
        defaultValue: "99",
        description: "Max count before showing '+' (e.g., 99+)"
      },
      {
        name: "dot",
        type: "Bool",
        defaultValue: "false",
        description: "Show as small dot instead of count"
      },
      {
        name: "showZero",
        type: "Bool",
        defaultValue: "false",
        description: "Display badge when count is 0"
      },
      {
        name: "standalone",
        type: "Bool",
        defaultValue: "false",
        description: "Render as status tag without children"
      },
      {
        name: "text",
        type: "String",
        defaultValue: "\"\"",
        description: "Text for standalone badge"
      },
      {
        name: "variant",
        type: "String",
        defaultValue: "\"default\"",
        description: "Color preset: default | success | processing | error | warning | info"
      },
      {
        name: "color",
        type: "String",
        defaultValue: "\"\"",
        description: "Custom background color (hex)"
      },
      {
        name: "textColor",
        type: "String",
        defaultValue: "\"#fff\"",
        description: "Text color"
      },
      {
        name: "size",
        type: "String",
        defaultValue: "\"default\"",
        description: "Badge size: small | default | large"
      },
      {
        name: "position",
        type: "String",
        defaultValue: "\"topRight\"",
        description: "Corner position: topRight | topLeft | bottomRight | bottomLeft"
      },
      {
        name: "offset",
        type: "Array(Number)",
        defaultValue: "[]",
        description: "Position adjustment [x, y] in pixels"
      },
      {
        name: "children",
        type: "Array(Html)",
        defaultValue: "[]",
        description: "Element to badge"
      }
    ]
  }

  /* Get additional API documentation */
  fun getAdditionalApiDocs : Html {
    <div>
      <div::docCard>
        <h3::docTitle>"Variants"</h3>
        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Value"</th>
              <th::tableHeader>"Color"</th>
              <th::tableHeader>"Usage"</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td::tableCell><code::codeInline>"default"</code></td>
              <td::tableCell>"#ff4d4f"</td>
              <td::tableCell>"Default/error notifications"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"success"</code></td>
              <td::tableCell>"#52c41a"</td>
              <td::tableCell>"Completed actions"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"processing"</code></td>
              <td::tableCell>"#1890ff"</td>
              <td::tableCell>"In-progress states"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"error"</code></td>
              <td::tableCell>"#ff4d4f"</td>
              <td::tableCell>"Critical alerts"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"warning"</code></td>
              <td::tableCell>"#faad14"</td>
              <td::tableCell>"Needs attention"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"info"</code></td>
              <td::tableCell>"#1890ff"</td>
              <td::tableCell>"Informational"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <h3::docTitle>"Sizes"</h3>
        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Size"</th>
              <th::tableHeader>"Height"</th>
              <th::tableHeader>"Use Case"</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td::tableCell><code::codeInline>"small"</code></td>
              <td::tableCell>"18px"</td>
              <td::tableCell>"Compact layouts"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"default"</code></td>
              <td::tableCell>"20px"</td>
              <td::tableCell>"Standard ⭐"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"large"</code></td>
              <td::tableCell>"24px"</td>
              <td::tableCell>"Prominent displays"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <h3::docTitle>"Badge Types"</h3>
        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Type"</th>
              <th::tableHeader>"Property"</th>
              <th::tableHeader>"Example"</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td::tableCell>"Count"</td>
              <td::tableCell><code::codeInline>"count={5}"</code></td>
              <td::tableCell>"Notification counts"</td>
            </tr>
            <tr>
              <td::tableCell>"Dot"</td>
              <td::tableCell><code::codeInline>"dot={true}"</code></td>
              <td::tableCell>"Status indicator"</td>
            </tr>
            <tr>
              <td::tableCell>"Standalone"</td>
              <td::tableCell><code::codeInline>"standalone={true}"</code></td>
              <td::tableCell>"Status tags/labels"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <h3::docTitle>"Best Practices"</h3>
        <ul::featureList>
          <li::featureItem>"💡 Use " <code::codeInline>"max={99}"</code> " to show '99+' for large counts"</li>
          <li::featureItem>"💡 Keep text short (1-3 chars) for readability"</li>
          <li::featureItem>"💡 Use " <code::codeInline>"dot"</code> " for presence indicators (online/offline)"</li>
          <li::featureItem>"💡 Use " <code::codeInline>"standalone"</code> " for tags like 'New', 'Beta', 'Hot'"</li>
          <li::featureItem>"💡 Badge hides when " <code::codeInline>"count=0"</code> " (use " <code::codeInline>"showZero={true}"</code> " to override)"</li>
          <li::featureItem>"💡 Stick to " <code::codeInline>"topRight"</code> " for consistency"</li>
        </ul>
      </div>
    </div>
  }

  /* Custom styles */
  style previewWrapper {
    display: flex;
    flex-wrap: wrap;
    gap: 32px;
    align-items: center;
    justify-content: center;
    min-height: 120px;
  }

  style demoButton {
    padding: 10px 24px;
    background: #1890ff;
    color: white;
    border-radius: 6px;
    border: none;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    user-select: none;
  }

  style demoAvatar {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 16px;
  }

  style demoBox {
    width: 60px;
    height: 60px;
    background: #f0f0f0;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    color: #666;
  }

  style controlsTitle {
    font-size: 15px;
    font-weight: 600;
    margin: 0 0 16px;
    color: #323233;
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
    border: 2px solid #1890ff;
    font-size: 13px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
    background: transparent;

    if active {
      background: #1890ff;
      color: #fff;
    } else {
      background: #fff;
      color: #1890ff;
    }

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(24, 144, 255, 0.3);
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

  /* Documentation styles */
  style docCard {
    background: #fff;
    border-radius: 16px;
    padding: 32px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
    margin-bottom: 24px;
  }

  style docTitle {
    font-size: 20px;
    font-weight: 600;
    color: #323233;
    margin: 0 0 16px;
  }

  style docText {
    font-size: 15px;
    line-height: 1.6;
    color: #646566;
    margin: 0 0 16px;
  }

  style apiTable {
    width: 100%;
    border-collapse: collapse;
    margin: 16px 0;
  }

  style tableHeader {
    background: #f7f8fa;
    text-align: left;
    padding: 12px;
    font-weight: 600;
    color: #323233;
    border-bottom: 2px solid #ebedf0;
  }

  style tableCell {
    padding: 12px;
    border-bottom: 1px solid #ebedf0;
    color: #646566;
  }

  style codeInline {
    background: #f7f8fa;
    padding: 2px 8px;
    border-radius: 4px;
    font-family: 'Courier New', monospace;
    font-size: 13px;
    color: #d63200;
  }

  style featureList {
    margin: 16px 0;
    padding-left: 0;
    list-style: none;
  }

  style featureItem {
    padding: 8px 0;
    color: #646566;
    font-size: 14px;
    line-height: 1.6;
  }

  style codeExample {
    background: #f7f8fa;
    padding: 16px;
    border-radius: 8px;
    font-family: 'Courier New', monospace;
    font-size: 13px;
    color: #323233;
    overflow-x: auto;
    margin: 16px 0;
    white-space: pre;
  }

  /* Render */
  fun render : Html {
    <ComponentShowcase
      title="Badge"
      description="Professional badge component for notifications, status indicators, and labels. Supports count badges, dot indicators, and standalone status tags. Based on Ant Design and Material UI standards."
      badge="Component"
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="Muestra notificaciones numéricas, indicadores de estado, o etiquetas. Usa los controles para ajustar el count, variant, size y position. Todos los tipos están en los ejemplos de código abajo."
      codeExamples={getCodeExamples()}
      apiProperties={getApiProperties()}
      additionalDocs={getAdditionalApiDocs()}
      enabledTabs={["preview", "usage", "api"]}/>
  }
}
