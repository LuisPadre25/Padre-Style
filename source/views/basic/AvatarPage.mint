/* AvatarPage - Showcase for Avatar component using ComponentShowcase */

component AvatarPage {
  /* State for component controls */
  state selectedSize : String = "md"
  state selectedShape : String = "circle"
  state showBorder : Bool = false
  state showRing : Bool = false
  state showBadge : Bool = false
  state showStatus : Bool = true
  state status : String = "online"
  state animated : Bool = true
  state animation : String = "scaleIn"
  state contentType : String = "initials"

  /* Event handlers */
  fun handleSizeChange (size : String) : Promise(Void) {
    next { selectedSize: size }
  }

  fun handleShapeChange (shape : String) : Promise(Void) {
    next { selectedShape: shape }
  }

  fun toggleBorder : Promise(Void) {
    next { showBorder: !showBorder }
  }

  fun toggleRing : Promise(Void) {
    next { showRing: !showRing }
  }

  fun toggleBadge : Promise(Void) {
    next { showBadge: !showBadge }
  }

  fun toggleAnimated : Promise(Void) {
    next { animated: !animated }
  }

  fun handleAnimationChange (anim : String) : Promise(Void) {
    next { animation: anim }
  }

  fun handleContentTypeChange (type : String) : Promise(Void) {
    next { contentType: type }
  }

  fun toggleStatus : Promise(Void) {
    next { showStatus: !showStatus }
  }

  fun handleStatusChange (newStatus : String) : Promise(Void) {
    next { status: newStatus }
  }

  /* Get preview content */
  fun getPreviewContent : Html {
    <div::previewWrapper>
      if contentType == "initials" {
        <Avatar
          text="JD"
          size={selectedSize}
          shape={selectedShape}
          border={showBorder}
          ring={showRing}
          badge={
            if showBadge {
              "99"
            } else {
              ""
            }
          }
          showStatus={showStatus}
          status={status}
          animated={animated}
          animation={animation}
          bgColor="#1989fa"/>
      }

      if contentType == "image" {
        <Avatar
          src="https://i.pravatar.cc/150?img=1"
          alt="User Avatar"
          size={selectedSize}
          shape={selectedShape}
          border={showBorder}
          ring={showRing}
          badge={
            if showBadge {
              "5"
            } else {
              ""
            }
          }
          showStatus={showStatus}
          status={status}
          animated={animated}
          animation={animation}/>
      }

      if contentType == "icon" {
        <Avatar
          icon="👤"
          size={selectedSize}
          shape={selectedShape}
          border={showBorder}
          ring={showRing}
          badge={
            if showBadge {
              "3"
            } else {
              ""
            }
          }
          showStatus={showStatus}
          status={status}
          animated={animated}
          animation={animation}
          bgColor="#52c41a"/>
      }

      if contentType == "placeholder" {
        <Avatar
          size={selectedSize}
          shape={selectedShape}
          border={showBorder}
          ring={showRing}
          showStatus={showStatus}
          status={status}
          animated={animated}
          animation={animation}
          bgColor="#94a3b8"/>
      }

      if contentType == "shapes" {
        <>
          <Avatar
            text="C"
            size={selectedSize}
            shape="circle"
            showStatus={showStatus}
            status={status}
            badge={
              if showBadge {
                "3"
              } else {
                ""
              }
            }
            bgColor="#1989fa"/>

          <Avatar
            text="S"
            size={selectedSize}
            shape="square"
            showStatus={showStatus}
            status={status}
            badge={
              if showBadge {
                "7"
              } else {
                ""
              }
            }
            bgColor="#52c41a"/>

          <Avatar
            text="R"
            size={selectedSize}
            shape="rounded"
            showStatus={showStatus}
            status={status}
            badge={
              if showBadge {
                "12"
              } else {
                ""
              }
            }
            bgColor="#f59e0b"/>
        </>
      }
    </div>
  }

  /* Get controls content */
  fun getControlsContent : Html {
    <div>
      <h3::controlsTitle>"Avatar Controls"</h3>

      <div::controlGroup>
        <div::controlLabel>"Size"</div>
        <div::buttonGroup>
          <button::button(selectedSize == "xs") onClick={(e : Html.Event) { handleSizeChange("xs") }}>
            "XS"
          </button>
          <button::button(selectedSize == "sm") onClick={(e : Html.Event) { handleSizeChange("sm") }}>
            "SM"
          </button>
          <button::button(selectedSize == "md") onClick={(e : Html.Event) { handleSizeChange("md") }}>
            "MD"
          </button>
          <button::button(selectedSize == "lg") onClick={(e : Html.Event) { handleSizeChange("lg") }}>
            "LG"
          </button>
          <button::button(selectedSize == "xl") onClick={(e : Html.Event) { handleSizeChange("xl") }}>
            "XL"
          </button>
          <button::button(selectedSize == "xxl") onClick={(e : Html.Event) { handleSizeChange("xxl") }}>
            "XXL"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Shape"</div>
        <div::buttonGroup>
          <button::button(selectedShape == "circle") onClick={(e : Html.Event) { handleShapeChange("circle") }}>
            "Circle"
          </button>
          <button::button(selectedShape == "square") onClick={(e : Html.Event) { handleShapeChange("square") }}>
            "Square"
          </button>
          <button::button(selectedShape == "rounded") onClick={(e : Html.Event) { handleShapeChange("rounded") }}>
            "Rounded"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Content Type"</div>
        <div::buttonGroup>
          <button::button(contentType == "initials") onClick={(e : Html.Event) { handleContentTypeChange("initials") }}>
            "Initials"
          </button>
          <button::button(contentType == "image") onClick={(e : Html.Event) { handleContentTypeChange("image") }}>
            "Image"
          </button>
          <button::button(contentType == "icon") onClick={(e : Html.Event) { handleContentTypeChange("icon") }}>
            "Icon"
          </button>
          <button::button(contentType == "placeholder") onClick={(e : Html.Event) { handleContentTypeChange("placeholder") }}>
            "Placeholder"
          </button>
          <button::button(contentType == "shapes") onClick={(e : Html.Event) { handleContentTypeChange("shapes") }}>
            "All Shapes"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Status Indicator"</div>
        <div::buttonGroup>
          <button::button(status == "online") onClick={(e : Html.Event) { handleStatusChange("online") }}>
            "🟢 Online"
          </button>
          <button::button(status == "offline") onClick={(e : Html.Event) { handleStatusChange("offline") }}>
            "⚪ Offline"
          </button>
          <button::button(status == "away") onClick={(e : Html.Event) { handleStatusChange("away") }}>
            "🟡 Away"
          </button>
          <button::button(status == "busy") onClick={(e : Html.Event) { handleStatusChange("busy") }}>
            "🔴 Busy"
          </button>
          <button::button(status == "dnd") onClick={(e : Html.Event) { handleStatusChange("dnd") }}>
            "🟣 DND"
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
          <button::button(animation == "slideInLeft") onClick={(e : Html.Event) { handleAnimationChange("slideInLeft") }}>
            "Slide"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Options"</div>
        <div::buttonGroup>
          <button::toggleButton(showBorder) onClick={(e : Html.Event) { toggleBorder() }}>
            "Border"
          </button>
          <button::toggleButton(showRing) onClick={(e : Html.Event) { toggleRing() }}>
            "Ring"
          </button>
          <button::toggleButton(showBadge) onClick={(e : Html.Event) { toggleBadge() }}>
            "Badge"
          </button>
          <button::toggleButton(showStatus) onClick={(e : Html.Event) { toggleStatus() }}>
            "Status"
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
        title: "Basic Usage",
        description: "Simple avatar with initials and default settings",
        snippet: {
          code: "<Avatar\n" +
                "  text=\"John Doe\"\n" +
                "  size=\"md\"\n" +
                "  shape=\"circle\"\n" +
                "  bgColor=\"#1989fa\"/>",
          language: "mint"
        },
        previewContent: <Avatar
          text="John Doe"
          size="lg"
          shape="circle"
          bgColor="#1989fa"/>,
        showReplay: false
      },
      {
        title: "With Image",
        description: "Avatar displaying user profile image",
        snippet: {
          code: "<Avatar\n" +
                "  src=\"https://i.pravatar.cc/150?img=1\"\n" +
                "  alt=\"User Avatar\"\n" +
                "  size=\"lg\"\n" +
                "  shape=\"circle\"/>",
          language: "mint"
        },
        previewContent: <Avatar
          src="https://i.pravatar.cc/150?img=1"
          alt="User Avatar"
          size="lg"
          shape="circle"/>,
        showReplay: false
      },
      {
        title: "With Badge",
        description: "Avatar with notification badge",
        snippet: {
          code: "<Avatar\n" +
                "  text=\"JD\"\n" +
                "  size=\"lg\"\n" +
                "  badge=\"99+\"\n" +
                "  badgePosition=\"topRight\"\n" +
                "  bgColor=\"#1989fa\"/>",
          language: "mint"
        },
        previewContent: <Avatar
          text="JD"
          size="lg"
          badge="99+"
          badgePosition="topRight"
          bgColor="#1989fa"/>,
        showReplay: false
      },
      {
        title: "With Status Indicator",
        description: "Avatar with status indicator using StatusDot component (online, offline, away, busy, dnd)",
        snippet: {
          code: "<Avatar\n" +
                "  src=\"https://i.pravatar.cc/150?img=2\"\n" +
                "  size=\"lg\"\n" +
                "  showStatus={true}\n" +
                "  status=\"online\"/>\n\n" +
                "<Avatar\n" +
                "  text=\"OF\"\n" +
                "  size=\"lg\"\n" +
                "  showStatus={true}\n" +
                "  status=\"offline\"/>\n\n" +
                "<Avatar\n" +
                "  text=\"AW\"\n" +
                "  size=\"lg\"\n" +
                "  showStatus={true}\n" +
                "  status=\"away\"/>\n\n" +
                "<Avatar\n" +
                "  text=\"BS\"\n" +
                "  size=\"lg\"\n" +
                "  showStatus={true}\n" +
                "  status=\"busy\"/>\n\n" +
                "<Avatar\n" +
                "  text=\"DN\"\n" +
                "  size=\"lg\"\n" +
                "  showStatus={true}\n" +
                "  status=\"dnd\"/>",
          language: "mint"
        },
        previewContent: <div style="display: flex; gap: 24px; flex-wrap: wrap;">
          <Avatar
            src="https://i.pravatar.cc/150?img=2"
            size="lg"
            showStatus={true}
            status="online"/>
          <Avatar
            text="OF"
            size="lg"
            showStatus={true}
            status="offline"
            bgColor="#8c8c8c"/>
          <Avatar
            text="AW"
            size="lg"
            showStatus={true}
            status="away"
            bgColor="#faad14"/>
          <Avatar
            text="BS"
            size="lg"
            showStatus={true}
            status="busy"
            bgColor="#f5222d"/>
          <Avatar
            text="DN"
            size="lg"
            showStatus={true}
            status="dnd"
            bgColor="#722ed1"/>
        </div>,
        showReplay: false
      },
      {
        title: "All Shapes Demo",
        description: "Avatar component supports circle, square, and rounded shapes",
        snippet: {
          code: "<Avatar text=\"C\" shape=\"circle\" size=\"lg\" bgColor=\"#1989fa\"/>\n" +
                "<Avatar text=\"S\" shape=\"square\" size=\"lg\" bgColor=\"#52c41a\"/>\n" +
                "<Avatar text=\"R\" shape=\"rounded\" size=\"lg\" bgColor=\"#f59e0b\"/>",
          language: "mint"
        },
        previewContent: <div style="display: flex; gap: 24px;">
          <Avatar text="C" shape="circle" size="lg" bgColor="#1989fa"/>
          <Avatar text="S" shape="square" size="lg" bgColor="#52c41a"/>
          <Avatar text="R" shape="rounded" size="lg" bgColor="#f59e0b"/>
        </div>,
        showReplay: false
      },
      {
        title: "Shapes with Status & Badge",
        description: "All shapes work with status indicators and notification badges",
        snippet: {
          code: "<Avatar\n" +
                "  text=\"JD\"\n" +
                "  shape=\"circle\"\n" +
                "  size=\"xl\"\n" +
                "  showStatus={true}\n" +
                "  status=\"online\"\n" +
                "  badge=\"5\"\n" +
                "  badgeVariant=\"error\"\n" +
                "  bgColor=\"#1989fa\"/>\n\n" +
                "<Avatar\n" +
                "  icon=\"🎮\"\n" +
                "  shape=\"square\"\n" +
                "  size=\"xl\"\n" +
                "  showStatus={true}\n" +
                "  status=\"busy\"\n" +
                "  badge=\"99\"\n" +
                "  badgeVariant=\"warning\"\n" +
                "  bgColor=\"#722ed1\"/>\n\n" +
                "<Avatar\n" +
                "  src=\"https://i.pravatar.cc/150?img=3\"\n" +
                "  shape=\"rounded\"\n" +
                "  size=\"xl\"\n" +
                "  showStatus={true}\n" +
                "  status=\"away\"\n" +
                "  badge=\"12\"\n" +
                "  badgeVariant=\"success\"/>",
          language: "mint"
        },
        previewContent: <div style="display: flex; gap: 24px;">
          <Avatar
            text="JD"
            shape="circle"
            size="xl"
            showStatus={true}
            status="online"
            badge="5"
            badgeVariant="error"
            bgColor="#1989fa"/>
          <Avatar
            icon="🎮"
            shape="square"
            size="xl"
            showStatus={true}
            status="busy"
            badge="99"
            badgeVariant="warning"
            bgColor="#722ed1"/>
          <Avatar
            src="https://i.pravatar.cc/150?img=3"
            shape="rounded"
            size="xl"
            showStatus={true}
            status="away"
            badge="12"
            badgeVariant="success"/>
        </div>,
        showReplay: false
      },
      {
        title: "With Border and Ring",
        description: "Avatar with border and ring effect",
        snippet: {
          code: "<Avatar\n" +
                "  text=\"AB\"\n" +
                "  size=\"xl\"\n" +
                "  border={true}\n" +
                "  borderColor=\"#fff\"\n" +
                "  borderWidth=\"3px\"\n" +
                "  ring={true}\n" +
                "  ringColor=\"#1989fa\"\n" +
                "  ringWidth=\"3px\"\n" +
                "  bgColor=\"#722ed1\"/>",
          language: "mint"
        },
        previewContent: <Avatar
          text="AB"
          size="xl"
          border={true}
          borderColor="#fff"
          borderWidth="3px"
          ring={true}
          ringColor="#1989fa"
          ringWidth="3px"
          bgColor="#722ed1"/>,
        showReplay: false
      },
      {
        title: "With Animation",
        description: "Avatar with entrance animation",
        snippet: {
          code: "<Avatar\n" +
                "  icon=\"👤\"\n" +
                "  size=\"lg\"\n" +
                "  animated={true}\n" +
                "  animation=\"scaleIn\"\n" +
                "  animationDuration={0.6}\n" +
                "  animationEasing=\"ease-out\"\n" +
                "  bgColor=\"#52c41a\"/>",
          language: "mint"
        },
        previewContent: <Avatar
          icon="👤"
          size="lg"
          animated={true}
          animation="scaleIn"
          animationDuration={0.6}
          animationEasing="ease-out"
          bgColor="#52c41a"/>,
        showReplay: false
      },
      {
        title: "Custom Size",
        description: "Avatar with custom size value",
        snippet: {
          code: "<Avatar\n" +
                "  text=\"XL\"\n" +
                "  customSize=\"120px\"\n" +
                "  shape=\"rounded\"\n" +
                "  bgColor=\"#faad14\"/>",
          language: "mint"
        },
        previewContent: <Avatar
          text="XL"
          customSize="120px"
          shape="rounded"
          bgColor="#faad14"/>,
        showReplay: false
      },
      {
        title: "Avatar Group",
        description: "Multiple avatars in a row",
        snippet: {
          code: "<div style=\"display: flex; gap: 12px;\">\n" +
                "  <Avatar text=\"AB\" size=\"md\" bgColor=\"#1989fa\"/>\n" +
                "  <Avatar text=\"CD\" size=\"md\" bgColor=\"#52c41a\"/>\n" +
                "  <Avatar text=\"EF\" size=\"md\" bgColor=\"#faad14\"/>\n" +
                "  <Avatar text=\"GH\" size=\"md\" bgColor=\"#f5222d\"/>\n" +
                "</div>",
          language: "mint"
        },
        previewContent: <div style="display: flex; gap: 12px;">
          <Avatar text="AB" size="md" bgColor="#1989fa"/>
          <Avatar text="CD" size="md" bgColor="#52c41a"/>
          <Avatar text="EF" size="md" bgColor="#faad14"/>
          <Avatar text="GH" size="md" bgColor="#f5222d"/>
        </div>,
        showReplay: false
      }
    ]
  }

  /* Get API properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "src",
        description: "Image URL for the avatar",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "alt",
        description: "Alt text for the image",
        type: "String",
        defaultValue: "\"avatar\""
      },
      {
        name: "text",
        description: "Text to display (will generate initials)",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "icon",
        description: "Icon to display (emoji or character)",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "size",
        description: "Predefined size: xs (24px), sm (32px), md (40px), lg (48px), xl (64px), xxl (80px), xxxl (96px)",
        type: "String",
        defaultValue: "\"md\""
      },
      {
        name: "customSize",
        description: "Custom size value (overrides size prop)",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "shape",
        description: "Avatar shape: circle, square, rounded",
        type: "String",
        defaultValue: "\"circle\""
      },
      {
        name: "color",
        description: "Deprecated. Use bgColor instead",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "bgColor",
        description: "Background color for the avatar",
        type: "String",
        defaultValue: "\"#1989fa\""
      },
      {
        name: "textColor",
        description: "Color for text/initials/icon",
        type: "String",
        defaultValue: "\"#fff\""
      },
      {
        name: "border",
        description: "Show border around avatar",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "borderColor",
        description: "Border color",
        type: "String",
        defaultValue: "\"#fff\""
      },
      {
        name: "borderWidth",
        description: "Border width",
        type: "String",
        defaultValue: "\"2px\""
      },
      {
        name: "ring",
        description: "Show ring effect around avatar",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "ringColor",
        description: "Ring color",
        type: "String",
        defaultValue: "\"#1989fa\""
      },
      {
        name: "ringWidth",
        description: "Ring width",
        type: "String",
        defaultValue: "\"2px\""
      },
      {
        name: "badge",
        description: "Notification count (numeric string like \"5\" or \"99\")",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "badgePosition",
        description: "Badge position: topRight, topLeft, bottomRight, bottomLeft",
        type: "String",
        defaultValue: "\"topRight\""
      },
      {
        name: "badgeVariant",
        description: "Badge color variant: default, success, processing, error, warning, info",
        type: "String",
        defaultValue: "\"error\""
      },
      {
        name: "showStatus",
        description: "Show status indicator (uses StatusDot component)",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "status",
        description: "Status type: online | offline | away | busy | dnd (uses StatusDot)",
        type: "String",
        defaultValue: "\"online\""
      },
      {
        name: "fit",
        description: "Image object-fit: cover, contain, fill, none, scale-down",
        type: "String",
        defaultValue: "\"cover\""
      },
      {
        name: "lazy",
        description: "Enable lazy loading for image",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "draggable",
        description: "Allow image to be dragged",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "animated",
        description: "Enable entrance animation",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "animation",
        description: "Animation type (see EnterExit component for available animations)",
        type: "String",
        defaultValue: "\"scaleIn\""
      },
      {
        name: "animationDuration",
        description: "Animation duration in seconds",
        type: "Number",
        defaultValue: "0.4"
      },
      {
        name: "animationEasing",
        description: "Animation easing function",
        type: "String",
        defaultValue: "\"ease-out\""
      },
      {
        name: "animationDelay",
        description: "Animation delay in seconds",
        type: "Number",
        defaultValue: "0"
      }
    ]
  }

  /* Get API events */
  fun getApiEvents : Array(ApiProperty) {
    [
      {
        name: "onClick",
        description: "Triggered when avatar is clicked",
        type: "Function(AvatarClickEvent, Promise(Void))",
        defaultValue: "AvatarClickEvent: { alt: String, src: String }"
      },
      {
        name: "onError",
        description: "Triggered when image fails to load",
        type: "Function(AvatarErrorEvent, Promise(Void))",
        defaultValue: "AvatarErrorEvent: { src: String, error: String }"
      }
    ]
  }

  /* Get additional API documentation */
  fun getAdditionalApiDocs : Html {
    <div>
      <div::docCard>
        <h3::docTitle>"Size Reference"</h3>
        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Size"</th>
              <th::tableHeader>"Dimensions"</th>
              <th::tableHeader>"Font Size"</th>
              <th::tableHeader>"Best For"</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td::tableCell><code::codeInline>"xs"</code></td>
              <td::tableCell>"24px × 24px"</td>
              <td::tableCell>"10px"</td>
              <td::tableCell>"Inline text, lists"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"sm"</code></td>
              <td::tableCell>"32px × 32px"</td>
              <td::tableCell>"13px"</td>
              <td::tableCell>"Comments, mentions"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"md"</code></td>
              <td::tableCell>"40px × 40px"</td>
              <td::tableCell>"16px"</td>
              <td::tableCell>"Default, navigation ⭐"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"lg"</code></td>
              <td::tableCell>"48px × 48px"</td>
              <td::tableCell>"19px"</td>
              <td::tableCell>"User profiles"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"xl"</code></td>
              <td::tableCell>"64px × 64px"</td>
              <td::tableCell>"26px"</td>
              <td::tableCell>"Profile headers"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"xxl"</code></td>
              <td::tableCell>"80px × 80px"</td>
              <td::tableCell>"32px"</td>
              <td::tableCell>"Hero sections"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"xxxl"</code></td>
              <td::tableCell>"96px × 96px"</td>
              <td::tableCell>"38px"</td>
              <td::tableCell>"Landing pages"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <h3::docTitle>"Content Priority"</h3>
        <p::docText>
          "The Avatar component displays content in the following priority order:"
        </p>
        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Priority"</th>
              <th::tableHeader>"Content Type"</th>
              <th::tableHeader>"Property"</th>
              <th::tableHeader>"Description"</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td::tableCell>"1"</td>
              <td::tableCell>"Image"</td>
              <td::tableCell><code::codeInline>"src"</code></td>
              <td::tableCell>"If src is provided and valid, image will be displayed"</td>
            </tr>
            <tr>
              <td::tableCell>"2"</td>
              <td::tableCell>"Icon"</td>
              <td::tableCell><code::codeInline>"icon"</code></td>
              <td::tableCell>"If no image, icon will be displayed (emoji or character)"</td>
            </tr>
            <tr>
              <td::tableCell>"3"</td>
              <td::tableCell>"Initials"</td>
              <td::tableCell><code::codeInline>"text"</code></td>
              <td::tableCell>"If no image or icon, initials from text will be shown"</td>
            </tr>
            <tr>
              <td::tableCell>"4"</td>
              <td::tableCell>"Fallback"</td>
              <td::tableCell><code::codeInline>"-"</code></td>
              <td::tableCell>"Empty avatar with background color"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <h3::docTitle>"Status Indicator States"</h3>
        <p::docText>
          "The Avatar component supports semantic status indicators with predefined colors:"
        </p>
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
              <td::tableCell>"🟢 #10b981 (Green)"</td>
              <td::tableCell>"User is active and available"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"offline"</code></td>
              <td::tableCell>"⚫ #6b7280 (Gray)"</td>
              <td::tableCell>"User is disconnected or invisible"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"away"</code></td>
              <td::tableCell>"🟡 #f59e0b (Yellow)"</td>
              <td::tableCell>"User is idle or temporarily away"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"busy"</code></td>
              <td::tableCell>"🔴 #ef4444 (Red)"</td>
              <td::tableCell>"User is busy or in a meeting"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <h3::docTitle>"Avatar Group Component"</h3>
        <p::docText>
          "Display multiple avatars with overlap effect using the AvatarGroup component:"
        </p>
        <pre::codeExample>
"<AvatarGroup\n" +
"  avatars={[\n" +
"    \"https://i.pravatar.cc/150?img=1\",\n" +
"    \"https://i.pravatar.cc/150?img=2\",\n" +
"    \"https://i.pravatar.cc/150?img=3\",\n" +
"    \"https://i.pravatar.cc/150?img=4\",\n" +
"    \"https://i.pravatar.cc/150?img=5\",\n" +
"    \"https://i.pravatar.cc/150?img=6\"\n" +
"  ]}\n" +
"  size=\"md\"\n" +
"  max={5}\n" +
"  spacing=\"normal\"\n" +
"  shape=\"circle\"\n" +
"  bordered={true}/>"
        </pre>
        <p::docText>
          "Props: " <code::codeInline>"avatars"</code> " (Array), " <code::codeInline>"size"</code> ", " <code::codeInline>"max"</code> " (number to show), " <code::codeInline>"spacing"</code> " (tight/normal/loose), " <code::codeInline>"shape"</code> ", " <code::codeInline>"bordered"</code>
        </p>
      </div>

      <div::docCard>
        <h3::docTitle>"Mobile Responsiveness"</h3>
        <p::docText>
          "The Avatar component is mobile-first and includes:"
        </p>
        <ul::featureList>
          <li::featureItem>"✓ Minimum 44px touch target on mobile devices (iOS/Android)"</li>
          <li::featureItem>"✓ Responsive badge scaling for better visibility on small screens"</li>
          <li::featureItem>"✓ Enhanced hover effects on desktop (scale + shadow)"</li>
          <li::featureItem>"✓ Optimized animations with proper easing curves"</li>
          <li::featureItem>"✓ Support for high-DPI displays (Retina, etc.)"</li>
        </ul>
      </div>

      <div::docCard>
        <h3::docTitle>"Best Practices"</h3>
        <ul::featureList>
          <li::featureItem>"💡 Use " <code::codeInline>"md"</code> " size (40px) for most UI elements"</li>
          <li::featureItem>"💡 Always provide meaningful " <code::codeInline>"alt"</code> " text for images"</li>
          <li::featureItem>"💡 Use " <code::codeInline>"showStatus"</code> " with " <code::codeInline>"status"</code> " prop for user presence (online/offline/away/busy)"</li>
          <li::featureItem>"💡 Use " <code::codeInline>"badge"</code> " for notification counts (keep text short: 2-3 chars or '99+')"</li>
          <li::featureItem>"💡 All 3 shapes (circle, square, rounded) work perfectly with status and badges"</li>
          <li::featureItem>"💡 Enable " <code::codeInline>"lazy"</code> " loading for images in long lists"</li>
          <li::featureItem>"💡 Use " <code::codeInline>"ring"</code> " effect to highlight active/selected users"</li>
          <li::featureItem>"💡 Use consistent shapes across your app (circle for users, square for brands)"</li>
          <li::featureItem>"💡 Badge and status indicators scale automatically with avatar size"</li>
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

  /* Additional documentation styles */
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
      title="Avatar"
      description="Mobile-first avatar component with support for images, initials, icons, badges, and smooth entrance animations. Perfect for user profiles, comments, and navigation."
      badge="Component"
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="The Avatar component displays user profile images, initials, or icons. It supports multiple sizes, shapes, and optional features like badges, status dots, borders, and rings. Use the controls below to customize the avatar appearance in real-time."
      codeExamples={getCodeExamples()}
      apiProperties={getApiProperties()}
      events={getApiEvents()}
      additionalDocs={getAdditionalApiDocs()}
      enabledTabs={["preview", "usage", "api"]}/>
  }
}
