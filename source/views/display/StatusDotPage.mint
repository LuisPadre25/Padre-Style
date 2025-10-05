/* StatusDotPage - Showcase for StatusDot component */

component StatusDotPage {
  connect NavigationStore exposing { setPage }

  /* State for component controls */
  state status : String = "online"
  state size : String = "default"
  state animation : String = "none"
  state showText : Bool = false
  state bordered : Bool = false

  fun componentDidMount : Promise(Void) {
    setPage("status-dot")
  }

  /* Event handlers */
  fun handleStatusChange (newStatus : String) : Promise(Void) {
    next { status: newStatus }
  }

  fun handleSizeChange (newSize : String) : Promise(Void) {
    next { size: newSize }
  }

  fun handleAnimationChange (newAnimation : String) : Promise(Void) {
    next { animation: newAnimation }
  }

  fun toggleText : Promise(Void) {
    next { showText: !showText }
  }

  fun toggleBordered : Promise(Void) {
    next { bordered: !bordered }
  }

  /* Get preview content */
  fun getPreviewContent : Html {
    <div::previewWrapper>
      <StatusDot
        status={status}
        size={size}
        animation={animation}
        showText={showText}
        text={String.capitalize(status)}
        bordered={bordered}/>
    </div>
  }

  /* Get controls content */
  fun getControlsContent : Html {
    <div>
      <h3::controlsTitle>"StatusDot Controls"</h3>

      <div::controlGroup>
        <div::controlLabel>"Status"</div>
        <div::buttonGroup>
          <button::button(status == "online") onClick={(e : Html.Event) { handleStatusChange("online") }}>
            "Online"
          </button>
          <button::button(status == "offline") onClick={(e : Html.Event) { handleStatusChange("offline") }}>
            "Offline"
          </button>
          <button::button(status == "away") onClick={(e : Html.Event) { handleStatusChange("away") }}>
            "Away"
          </button>
          <button::button(status == "busy") onClick={(e : Html.Event) { handleStatusChange("busy") }}>
            "Busy"
          </button>
          <button::button(status == "dnd") onClick={(e : Html.Event) { handleStatusChange("dnd") }}>
            "DND"
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
        <div::controlLabel>"Animation"</div>
        <div::buttonGroup>
          <button::button(animation == "none") onClick={(e : Html.Event) { handleAnimationChange("none") }}>
            "None"
          </button>
          <button::button(animation == "pulse") onClick={(e : Html.Event) { handleAnimationChange("pulse") }}>
            "Pulse"
          </button>
          <button::button(animation == "ping") onClick={(e : Html.Event) { handleAnimationChange("ping") }}>
            "Ping"
          </button>
          <button::button(animation == "bounce") onClick={(e : Html.Event) { handleAnimationChange("bounce") }}>
            "Bounce"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Options"</div>
        <div::buttonGroup>
          <button::toggleButton(showText) onClick={(e : Html.Event) { toggleText() }}>
            "Show Text"
          </button>
          <button::toggleButton(bordered) onClick={(e : Html.Event) { toggleBordered() }}>
            "Bordered"
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
        description: "Simple status indicator dot",
        snippet: {
          code: "<StatusDot status=\"online\"/>",
          language: "mint"
        },
        previewContent:
          <StatusDot status="online"/>,
        showReplay: false
      },
      {
        title: "Status Types",
        description: "Different status colors and meanings",
        snippet: {
          code: "<StatusDot status=\"online\"/>\n<StatusDot status=\"offline\"/>\n<StatusDot status=\"away\"/>\n<StatusDot status=\"busy\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 16px; align-items: center;">
            <StatusDot status="online"/>
            <StatusDot status="offline"/>
            <StatusDot status="away"/>
            <StatusDot status="busy"/>
            <StatusDot status="dnd"/>
          </div>,
        showReplay: false
      },
      {
        title: "With Text Labels",
        description: "Show status text next to dot",
        snippet: {
          code: "<StatusDot status=\"online\" showText={true} text=\"Online\"/>\n<StatusDot status=\"away\" showText={true} text=\"Away\"/>\n<StatusDot status=\"busy\" showText={true} text=\"Busy\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; flex-direction: column; gap: 12px;">
            <StatusDot status="online" showText={true} text="Online"/>
            <StatusDot status="away" showText={true} text="Away"/>
            <StatusDot status="busy" showText={true} text="Busy"/>
            <StatusDot status="offline" showText={true} text="Offline"/>
          </div>,
        showReplay: false
      },
      {
        title: "Sizes",
        description: "Small, default, and large sizes",
        snippet: {
          code: "<StatusDot status=\"online\" size=\"small\"/>\n<StatusDot status=\"online\" size=\"default\"/>\n<StatusDot status=\"online\" size=\"large\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 16px; align-items: center;">
            <StatusDot status="online" size="small"/>
            <StatusDot status="online" size="default"/>
            <StatusDot status="online" size="large"/>
          </div>,
        showReplay: false
      },
      {
        title: "Pulse Animation",
        description: "Subtle pulse effect",
        snippet: {
          code: "<StatusDot status=\"online\" animation=\"pulse\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 16px;">
            <StatusDot status="online" animation="pulse" size="large"/>
            <StatusDot status="busy" animation="pulse" size="large"/>
            <StatusDot status="processing" animation="pulse" size="large"/>
          </div>,
        showReplay: false
      },
      {
        title: "Ping Animation",
        description: "Radar ping effect",
        snippet: {
          code: "<StatusDot status=\"online\" animation=\"ping\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 24px;">
            <StatusDot status="online" animation="ping" size="large"/>
            <StatusDot status="processing" animation="ping" size="large"/>
            <StatusDot status="warning" animation="ping" size="large"/>
          </div>,
        showReplay: false
      },
      {
        title: "Bounce Animation",
        description: "Bouncing dot effect",
        snippet: {
          code: "<StatusDot status=\"online\" animation=\"bounce\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 16px;">
            <StatusDot status="online" animation="bounce" size="large"/>
            <StatusDot status="busy" animation="bounce" size="large"/>
          </div>,
        showReplay: false
      },
      {
        title: "Bordered",
        description: "Add white border for contrast",
        snippet: {
          code: "<StatusDot status=\"online\" bordered={true}\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 16px; padding: 20px; background: #f0f0f0; border-radius: 8px;">
            <StatusDot status="online" bordered={true} size="large"/>
            <StatusDot status="away" bordered={true} size="large"/>
            <StatusDot status="busy" bordered={true} size="large"/>
          </div>,
        showReplay: false
      },
      {
        title: "Custom Colors",
        description: "Use custom hex colors",
        snippet: {
          code: "<StatusDot color=\"#722ed1\"/>\n<StatusDot color=\"#13c2c2\"/>\n<StatusDot color=\"#eb2f96\"/>",
          language: "mint"
        },
        previewContent:
          <div style="display: flex; gap: 16px; align-items: center;">
            <StatusDot color="#722ed1" size="large"/>
            <StatusDot color="#13c2c2" size="large"/>
            <StatusDot color="#eb2f96" size="large"/>
          </div>,
        showReplay: false
      }
    ]
  }

  /* Get API properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "status",
        type: "String",
        defaultValue: "\"default\"",
        description: "Status type: online | offline | away | busy | dnd | processing | success | error | warning | default"
      },
      {
        name: "size",
        type: "String",
        defaultValue: "\"default\"",
        description: "Dot size: small | default | large"
      },
      {
        name: "pulse",
        type: "Bool",
        defaultValue: "false",
        description: "Enable pulse animation (deprecated, use animation prop)"
      },
      {
        name: "animation",
        type: "String",
        defaultValue: "\"none\"",
        description: "Animation type: none | pulse | ping | bounce"
      },
      {
        name: "text",
        type: "String",
        defaultValue: "\"\"",
        description: "Label text to show next to dot"
      },
      {
        name: "showText",
        type: "Bool",
        defaultValue: "false",
        description: "Show text label"
      },
      {
        name: "color",
        type: "String",
        defaultValue: "\"\"",
        description: "Custom color (hex)"
      },
      {
        name: "bordered",
        type: "Bool",
        defaultValue: "false",
        description: "Add white border for contrast"
      },
      {
        name: "borderColor",
        type: "String",
        defaultValue: "\"#fff\"",
        description: "Border color"
      }
    ]
  }

  /* Get additional API documentation */
  fun getAdditionalApiDocs : Html {
    <div>
      <div::docCard>
        <h3::docTitle>"Status Colors"</h3>
        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Status"</th>
              <th::tableHeader>"Color"</th>
              <th::tableHeader>"Usage"</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td::tableCell><code::codeInline>"online"</code></td>
              <td::tableCell>"#52c41a"</td>
              <td::tableCell>"User is online/available"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"offline"</code></td>
              <td::tableCell>"#d9d9d9"</td>
              <td::tableCell>"User is offline"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"away"</code></td>
              <td::tableCell>"#faad14"</td>
              <td::tableCell>"User is away"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"busy"</code></td>
              <td::tableCell>"#ff4d4f"</td>
              <td::tableCell>"User is busy/in meeting"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"dnd"</code></td>
              <td::tableCell>"#722ed1"</td>
              <td::tableCell>"Do not disturb"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"processing"</code></td>
              <td::tableCell>"#1890ff"</td>
              <td::tableCell>"Processing/in progress"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"success"</code></td>
              <td::tableCell>"#52c41a"</td>
              <td::tableCell>"Success state"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"error"</code></td>
              <td::tableCell>"#ff4d4f"</td>
              <td::tableCell>"Error state"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"warning"</code></td>
              <td::tableCell>"#faad14"</td>
              <td::tableCell>"Warning state"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <h3::docTitle>"Sizes (Mobile-First)"</h3>
        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Size"</th>
              <th::tableHeader>"Mobile"</th>
              <th::tableHeader>"Desktop"</th>
              <th::tableHeader>"Use Case"</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td::tableCell><code::codeInline>"small"</code></td>
              <td::tableCell>"6px"</td>
              <td::tableCell>"8px"</td>
              <td::tableCell>"Compact lists"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"default"</code></td>
              <td::tableCell>"8px"</td>
              <td::tableCell>"10px"</td>
              <td::tableCell>"Standard ⭐"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"large"</code></td>
              <td::tableCell>"10px"</td>
              <td::tableCell>"12px"</td>
              <td::tableCell>"Prominent display"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <h3::docTitle>"Animations"</h3>
        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Animation"</th>
              <th::tableHeader>"Effect"</th>
              <th::tableHeader>"Best For"</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td::tableCell><code::codeInline>"none"</code></td>
              <td::tableCell>"Static"</td>
              <td::tableCell>"Default state"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"pulse"</code></td>
              <td::tableCell>"Fade in/out"</td>
              <td::tableCell>"Subtle attention"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"ping"</code></td>
              <td::tableCell>"Radar ring"</td>
              <td::tableCell>"Active status"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"bounce"</code></td>
              <td::tableCell>"Vertical bounce"</td>
              <td::tableCell>"High attention"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <h3::docTitle>"Best Practices"</h3>
        <ul::featureList>
          <li::featureItem>"💡 Use " <code::codeInline>"online"</code> "/" <code::codeInline>"offline"</code> " for user presence"</li>
          <li::featureItem>"💡 Use " <code::codeInline>"animation=\"pulse\""</code> " for active/online users"</li>
          <li::featureItem>"💡 Add " <code::codeInline>"bordered={true}"</code> " when dot is on colored backgrounds"</li>
          <li::featureItem>"💡 Use " <code::codeInline>"showText={true}"</code> " for accessibility"</li>
          <li::featureItem>"💡 Keep animations subtle - avoid overuse"</li>
          <li::featureItem>"💡 Mobile-first: sizes scale up on desktop automatically"</li>
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

  /* Render */
  fun render : Html {
    <ComponentShowcase
      title="StatusDot"
      description="Professional status indicator component for user presence, system states, and notifications. Mobile-first and fully responsive with smooth animations."
      badge="Component"
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="Muestra estados de presencia (online/offline), estados del sistema (success/error), y notificaciones. Los tamaños escalan automáticamente en mobile/desktop."
      codeExamples={getCodeExamples()}
      apiProperties={getApiProperties()}
      additionalDocs={getAdditionalApiDocs()}
      enabledTabs={["preview", "usage", "api"]}/>
  }
}
