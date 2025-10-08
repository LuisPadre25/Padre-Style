/* CircleProgressPage - Showcase for CircleProgress component */
component CircleProgressPage {
  connect NavigationStore exposing { setPage }

  /* State for component controls */
  state percentage : Number = 75

  state size : String = "default"
  state variant : String = "primary"
  state showValue : Bool = true
  state format : String = "percentage"
  state animated : Bool = true
  state glow : Bool = false
  state gradient : Bool = false
  state status : String = ""

  fun componentDidMount : Promise(Void) {
    setPage("circle-progress")
  }

  /* Event handlers */
  fun handlePercentageChange (value : String) : Promise(Void) {
    case Number.fromString(value) {
      Just(num) => next { percentage: num }
      Nothing => Promise.resolve(void)
    }
  }

  fun handleSizeChange (newSize : String) : Promise(Void) {
    next { size: newSize }
  }

  fun handleVariantChange (newVariant : String) : Promise(Void) {
    next { variant: newVariant }
  }

  fun handleFormatChange (newFormat : String) : Promise(Void) {
    next { format: newFormat }
  }

  fun handleStatusChange (newStatus : String) : Promise(Void) {
    next { status: newStatus }
  }

  fun toggleValue : Promise(Void) {
    next { showValue: !showValue }
  }

  fun toggleAnimated : Promise(Void) {
    next { animated: !animated }
  }

  fun toggleGlow : Promise(Void) {
    next { glow: !glow }
  }

  fun toggleGradient : Promise(Void) {
    next { gradient: !gradient }
  }

  /* Get preview content */
  fun getPreviewContent : Html {
    <div::previewWrapper>
      <CircleProgress
        percentage={percentage}
        size={size}
        variant={variant}
        showValue={showValue}
        format={format}
        animated={animated}
        glow={glow}
        gradient={gradient}
        status={status}
        label="Progress"
      />
    </div>
  }

  /* Get controls content */
  fun getControlsContent : Html {
    <div>
      <Heading level="4" margin="0 0 16px">"CircleProgress Controls"</Heading>

      <div::controlGroup>
        <div::controlLabel>"Percentage"</div>

        <div::buttonGroup>
          <button::button(percentage == 0)
            onClick={(e : Html.Event) { handlePercentageChange("0") }}
          >"0%"</button>

          <button::button(percentage == 25)
            onClick={(e : Html.Event) { handlePercentageChange("25") }}
          >"25%"</button>

          <button::button(percentage == 50)
            onClick={(e : Html.Event) { handlePercentageChange("50") }}
          >"50%"</button>

          <button::button(percentage == 75)
            onClick={(e : Html.Event) { handlePercentageChange("75") }}
          >"75%"</button>

          <button::button(percentage == 100)
            onClick={(e : Html.Event) { handlePercentageChange("100") }}
          >"100%"</button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Size"</div>

        <div::buttonGroup>
          <button::button(size == "small")
            onClick={(e : Html.Event) { handleSizeChange("small") }}
          >"Small"</button>

          <button::button(size == "default")
            onClick={(e : Html.Event) { handleSizeChange("default") }}
          >"Default"</button>

          <button::button(size == "large")
            onClick={(e : Html.Event) { handleSizeChange("large") }}
          >"Large"</button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Variant"</div>

        <div::buttonGroup>
          <button::button(variant == "primary")
            onClick={(e : Html.Event) { handleVariantChange("primary") }}
          >"Primary"</button>

          <button::button(variant == "success")
            onClick={(e : Html.Event) { handleVariantChange("success") }}
          >"Success"</button>

          <button::button(variant == "warning")
            onClick={(e : Html.Event) { handleVariantChange("warning") }}
          >"Warning"</button>

          <button::button(variant == "error")
            onClick={(e : Html.Event) { handleVariantChange("error") }}
          >"Error"</button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Format"</div>

        <div::buttonGroup>
          <button::button(format == "percentage")
            onClick={(e : Html.Event) { handleFormatChange("percentage") }}
          >"Percentage"</button>

          <button::button(format == "fraction")
            onClick={(e : Html.Event) { handleFormatChange("fraction") }}
          >"Fraction"</button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Status"</div>

        <div::buttonGroup>
          <button::button(status == "")
            onClick={(e : Html.Event) { handleStatusChange("") }}
          >"None"</button>

          <button::button(status == "success")
            onClick={(e : Html.Event) { handleStatusChange("success") }}
          >"Success"</button>

          <button::button(status == "error")
            onClick={(e : Html.Event) { handleStatusChange("error") }}
          >"Error"</button>

          <button::button(status == "warning")
            onClick={(e : Html.Event) { handleStatusChange("warning") }}
          >"Warning"</button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Options"</div>

        <div::buttonGroup>
          <button::toggleButton(showValue)
            onClick={(e : Html.Event) { toggleValue() }}
          >"Show Value"</button>

          <button::toggleButton(animated)
            onClick={(e : Html.Event) { toggleAnimated() }}
          >"Animated"</button>

          <button::toggleButton(glow)
            onClick={(e : Html.Event) { toggleGlow() }}
          >"Glow"</button>

          <button::toggleButton(gradient)
            onClick={(e : Html.Event) { toggleGradient() }}
          >"Gradient"</button>
        </div>
      </div>
    </div>
  }

  /* Get code examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Usage",
        description: "Simple circular progress indicator",
        snippet: { code: "<CircleProgress percentage={75}/>", language: "mint" },
        previewContent: <CircleProgress percentage={75}/>,
        showReplay: false
      },
      {
        title: "Variants",
        description: "Different color variants",
        snippet:
          {
            code:
              "<CircleProgress percentage={75} variant=\"primary\"/>\n<CircleProgress percentage={75} variant=\"success\"/>\n<CircleProgress percentage={75} variant=\"warning\"/>\n<CircleProgress percentage={75} variant=\"error\"/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 24px; flex-wrap: wrap;">
            <CircleProgress percentage={75} variant="primary"/>
            <CircleProgress percentage={75} variant="success"/>
            <CircleProgress percentage={75} variant="warning"/>
            <CircleProgress percentage={75} variant="error"/>
          </div>,
        showReplay: false
      },
      {
        title: "Sizes",
        description: "Small, default, and large sizes (responsive)",
        snippet:
          {
            code:
              "<CircleProgress percentage={75} size=\"small\"/>\n<CircleProgress percentage={75} size=\"default\"/>\n<CircleProgress percentage={75} size=\"large\"/>",
            language: "mint"
          },
        previewContent:
          <div
            style="display: flex; gap: 32px; align-items: center; flex-wrap: wrap;"
          >
            <CircleProgress percentage={75} size="small"/>
            <CircleProgress percentage={75} size="default"/>
            <CircleProgress percentage={75} size="large"/>
          </div>,
        showReplay: false
      },
      {
        title: "With Labels",
        description: "Add descriptive labels below circle",
        snippet:
          {
            code:
              "<CircleProgress percentage={45} label=\"Upload\"/>\n<CircleProgress percentage={80} label=\"Download\" variant=\"success\"/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 32px; flex-wrap: wrap;">
            <CircleProgress percentage={45} label="Upload"/>
            <CircleProgress percentage={80} label="Download" variant="success"/>
            <CircleProgress percentage={100} label="Complete" variant="success"/>
          </div>,
        showReplay: false
      },
      {
        title: "Format Options",
        description: "Display as percentage or fraction",
        snippet:
          {
            code:
              "<CircleProgress percentage={75} format=\"percentage\"/>\n<CircleProgress percentage={75} format=\"fraction\"/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 32px; flex-wrap: wrap;">
            <CircleProgress
              percentage={75}
              format="percentage"
              label="Percentage"
            />

            <CircleProgress percentage={75} format="fraction" label="Fraction"/>
          </div>,
        showReplay: false
      },
      {
        title: "Status States",
        description: "Success, error, and warning states with icons",
        snippet:
          {
            code:
              "<CircleProgress percentage={100} status=\"success\"/>\n<CircleProgress percentage={45} status=\"error\"/>\n<CircleProgress percentage={60} status=\"warning\"/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 32px; flex-wrap: wrap;">
            <CircleProgress percentage={100} status="success" label="Success"/>
            <CircleProgress percentage={45} status="error" label="Error"/>
            <CircleProgress percentage={60} status="warning" label="Warning"/>
          </div>,
        showReplay: false
      },
      {
        title: "Gradient Effect",
        description: "Smooth gradient fill",
        snippet:
          {
            code: "<CircleProgress percentage={75} gradient={true}/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 32px; flex-wrap: wrap;">
            <CircleProgress percentage={75} gradient={true} variant="primary"/>
            <CircleProgress percentage={85} gradient={true} variant="success"/>
            <CircleProgress percentage={60} gradient={true} variant="warning"/>
          </div>,
        showReplay: false
      },
      {
        title: "Glow Effect",
        description: "Add glow shadow for emphasis",
        snippet:
          {
            code: "<CircleProgress percentage={75} glow={true}/>",
            language: "mint"
          },
        previewContent:
          <div
            style="display: flex; gap: 32px; flex-wrap: wrap; padding: 20px; background: #f0f0f0; border-radius: 8px;"
          >
            <CircleProgress percentage={75} glow={true} variant="primary"/>
            <CircleProgress percentage={90} glow={true} variant="success"/>
            <CircleProgress percentage={50} glow={true} variant="error"/>
          </div>,
        showReplay: false
      },
      {
        title: "Custom Colors",
        description: "Override with custom hex colors",
        snippet:
          {
            code:
              "<CircleProgress percentage={75} color=\"#722ed1\"/>\n<CircleProgress percentage={60} color=\"#13c2c2\"/>\n<CircleProgress percentage={85} color=\"#eb2f96\"/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 32px; flex-wrap: wrap;">
            <CircleProgress percentage={75} color="#722ed1"/>
            <CircleProgress percentage={60} color="#13c2c2"/>
            <CircleProgress percentage={85} color="#eb2f96"/>
          </div>,
        showReplay: false
      },
      {
        title: "Without Value",
        description: "Hide percentage text",
        snippet:
          {
            code: "<CircleProgress percentage={75} showValue={false}/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; gap: 32px; flex-wrap: wrap;">
            <CircleProgress percentage={30} showValue={false} variant="primary"/>
            <CircleProgress percentage={60} showValue={false} variant="success"/>
            <CircleProgress percentage={90} showValue={false} variant="warning"/>
          </div>,
        showReplay: false
      }
    ]
  }

  /* Get API properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "percentage",
        type: "Number",
        defaultValue: "0",
        description: "Progress value (0-100)"
      },
      {
        name: "size",
        type: "String",
        defaultValue: "\"default\"",
        description: "Circle size: small | default | large"
      },
      {
        name: "customSize",
        type: "Number",
        defaultValue: "0",
        description: "Custom diameter in pixels"
      },
      {
        name: "strokeWidth",
        type: "Number",
        defaultValue: "0",
        description: "Stroke thickness (auto if 0)"
      },
      {
        name: "showValue",
        type: "Bool",
        defaultValue: "true",
        description: "Show percentage text"
      },
      {
        name: "format",
        type: "String",
        defaultValue: "\"percentage\"",
        description: "Text format: percentage | fraction | custom"
      },
      {
        name: "text",
        type: "String",
        defaultValue: "\"\"",
        description: "Custom text (when format=custom)"
      },
      {
        name: "label",
        type: "String",
        defaultValue: "\"\"",
        description: "Label text below circle"
      },
      {
        name: "variant",
        type: "String",
        defaultValue: "\"primary\"",
        description: "Color preset: primary | success | warning | error | info"
      },
      {
        name: "color",
        type: "String",
        defaultValue: "\"\"",
        description: "Custom stroke color (hex)"
      },
      {
        name: "trailColor",
        type: "String",
        defaultValue: "\"\"",
        description: "Background track color"
      },
      {
        name: "strokeLinecap",
        type: "String",
        defaultValue: "\"round\"",
        description: "Line cap: round | square | butt"
      },
      {
        name: "animated",
        type: "Bool",
        defaultValue: "true",
        description: "Smooth animation"
      },
      {
        name: "duration",
        type: "Number",
        defaultValue: "0.8",
        description: "Animation duration (seconds)"
      },
      {
        name: "glow",
        type: "Bool",
        defaultValue: "false",
        description: "Add glow shadow effect"
      },
      {
        name: "gradient",
        type: "Bool",
        defaultValue: "false",
        description: "Use gradient fill"
      },
      {
        name: "status",
        type: "String",
        defaultValue: "\"\"",
        description: "Status state: success | error | warning (shows icon)"
      }
    ]
  }

  /* Get additional API documentation */
  fun getAdditionalApiDocs : Html {
    <div>
      <div::docCard>
        <Heading level="3" margin="0 0 16px">"Sizes (Mobile-First)"</Heading>

        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Size"</th>
              <th::tableHeader>"Mobile"</th>
              <th::tableHeader>"Desktop"</th>
              <th::tableHeader>"Stroke"</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td::tableCell><code::codeInline>"small"</code></td>
              <td::tableCell>"80px"</td>
              <td::tableCell>"100px"</td>
              <td::tableCell>"6px"</td>
            </tr>

            <tr>
              <td::tableCell><code::codeInline>"default"</code></td>
              <td::tableCell>"120px"</td>
              <td::tableCell>"140px"</td>
              <td::tableCell>"8px ⭐"</td>
            </tr>

            <tr>
              <td::tableCell><code::codeInline>"large"</code></td>
              <td::tableCell>"160px"</td>
              <td::tableCell>"180px"</td>
              <td::tableCell>"10px"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <Heading level="3" margin="0 0 16px">"Variants"</Heading>

        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Variant"</th>
              <th::tableHeader>"Color"</th>
              <th::tableHeader>"Usage"</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td::tableCell><code::codeInline>"primary"</code></td>
              <td::tableCell>"#1890ff"</td>
              <td::tableCell>"Default/general progress"</td>
            </tr>

            <tr>
              <td::tableCell><code::codeInline>"success"</code></td>
              <td::tableCell>"#52c41a"</td>
              <td::tableCell>"Completed/success states"</td>
            </tr>

            <tr>
              <td::tableCell><code::codeInline>"warning"</code></td>
              <td::tableCell>"#faad14"</td>
              <td::tableCell>"Warning/attention needed"</td>
            </tr>

            <tr>
              <td::tableCell><code::codeInline>"error"</code></td>
              <td::tableCell>"#ff4d4f"</td>
              <td::tableCell>"Error/failed states"</td>
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
        <Heading level="3" margin="0 0 16px">"Status States"</Heading>

        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Status"</th>
              <th::tableHeader>"Icon"</th>
              <th::tableHeader>"When to Use"</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td::tableCell><code::codeInline>"success"</code></td>
              <td::tableCell>"✓"</td>
              <td::tableCell>"100% complete, task finished"</td>
            </tr>

            <tr>
              <td::tableCell><code::codeInline>"error"</code></td>
              <td::tableCell>"✕"</td>
              <td::tableCell>"Failed operation, error state"</td>
            </tr>

            <tr>
              <td::tableCell><code::codeInline>"warning"</code></td>
              <td::tableCell>"!"</td>
              <td::tableCell>"Partial success, needs attention"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <Heading level="3" margin="0 0 16px">"Best Practices"</Heading>

        <ul::featureList>
          <li::featureItem>
            "💡 Use "
            <code::codeInline>"status=\"success\""</code>
            " when progress reaches 100%"
          </li>

          <li::featureItem>
            "💡 Add "
            <code::codeInline>"label"</code>
            " for clarity (e.g., \"Upload\", \"Processing\")"
          </li>

          <li::featureItem>
            "💡 Use "
            <code::codeInline>"gradient={true}"</code>
            " for visual appeal"
          </li>

          <li::featureItem>
            "💡 Keep animations smooth with default duration (0.8s)"
          </li>

          <li::featureItem>
            "💡 Mobile-first: sizes scale automatically on desktop"
          </li>

          <li::featureItem>
            "💡 Use "
            <code::codeInline>"glow={true}"</code>
            " sparingly for important progress"
          </li>

          <li::featureItem>
            "💡 Format as fraction for file operations (45/100 MB)"
          </li>
        </ul>
      </div>

      <div::docCard>
        <Heading level="3" margin="0 0 16px">"Common Patterns"</Heading>

        <Text size="base" margin="0 0 16px">
          <strong>"File Upload Progress:"</strong>
        </Text>

        <pre::codeExample>
          "<CircleProgress\n" + "  percentage={uploadProgress}\n" + "  variant=\"primary\"\n" + "  label=\"Uploading...\"\n" + "  animated={true}\n" + "  status={\n" + "    if uploadProgress == 100 {\n" + "      \"success\"\n" + "    } else {\n" + "      \"\"\n" + "    }\n" + "  }/>"
        </pre>

        <Text size="base" margin="0 0 16px"><strong>"Task Completion:"</strong></Text>

        <pre::codeExample>
          "<CircleProgress\n" + "  percentage={completedTasks / totalTasks * 100}\n" + "  format=\"fraction\"\n" + "  variant=\"success\"\n" + "  label=\"Tasks Complete\"/>"
        </pre>

        <Text size="base" margin="0 0 16px"><strong>"Storage Usage:"</strong></Text>

        <pre::codeExample>
          "<CircleProgress\n" + "  percentage={usedSpace / totalSpace * 100}\n" + "  variant={\n" + "    if percentage > 90 {\n" + "      \"error\"\n" + "    } else if percentage > 75 {\n" + "      \"warning\"\n" + "    } else {\n" + "      \"success\"\n" + "    }\n" + "  }\n" + "  label=\"Storage\"/>"
        </pre>
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
    min-height: 160px;
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
      title="CircleProgress"
      description="Professional circular progress indicator for uploads, downloads, task completion, and loading states. Mobile-first with smooth animations and multiple variants."
      badge="Component"
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="Muestra progreso circular para operaciones largas. Tamaños responsive, animaciones suaves, y estados visuales. Los tamaños escalan automáticamente en mobile/desktop."
      codeExamples={getCodeExamples()}
      apiProperties={getApiProperties()}
      additionalDocs={getAdditionalApiDocs()}
      enabledTabs={["preview", "usage", "api"]}
    />
  }
}
