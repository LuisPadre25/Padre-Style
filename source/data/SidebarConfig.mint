module SidebarConfig {
  fun getCategories : Array(SidebarCategory) {
    [
      {
        id: "essentials",
        title: "Essentials",
        icon: "📚",
        items: [
          { id: "introduction", label: "Introduction", route: "/introduction", subtitle: "", badge: "" },
          { id: "quickstart", label: "Quickstart", route: "/quickstart", subtitle: "", badge: "" },
          { id: "themes", label: "Themes", route: "/themes", subtitle: "", badge: "NEW" },
          { id: "advanced", label: "Advanced Usage", route: "/advanced", subtitle: "", badge: "" },
          { id: "faq", label: "FAQ", route: "/faq", subtitle: "", badge: "" },
          { id: "changelog", label: "Changelog", route: "/changelog", subtitle: "", badge: "" },
          { id: "contribution", label: "Contribution Guide", route: "/contribution", subtitle: "", badge: "" }
        ]
      },
      {
        id: "basic",
        title: "Basic Components",
        icon: "🧩",
        items: [
          { id: "avatar", label: "Avatar", route: "/avatar", subtitle: "", badge: "" },
          { id: "button", label: "Button", route: "/button", subtitle: "", badge: "" },
          { id: "cell", label: "Cell", route: "/cell", subtitle: "", badge: "" },
          { id: "icon", label: "Icon", route: "/icon", subtitle: "", badge: "" },
          { id: "image", label: "Image", route: "/image", subtitle: "", badge: "" },
          { id: "layout", label: "Layout", route: "/layout", subtitle: "", badge: "" },
          { id: "popup", label: "Popup", route: "/popup", subtitle: "", badge: "" },
          { id: "space", label: "Space", route: "/space", subtitle: "", badge: "" },
          { id: "toast", label: "Toast", route: "/toast", subtitle: "", badge: "" }
        ]
      },
      {
        id: "form",
        title: "Form Components",
        icon: "📝",
        items: [
          { id: "calendar", label: "Calendar", route: "/calendar", subtitle: "", badge: "" },
          { id: "cascader", label: "Cascader", route: "/cascader", subtitle: "", badge: "" },
          { id: "checkbox", label: "Checkbox", route: "/checkbox", subtitle: "", badge: "" },
          { id: "datepicker", label: "DatePicker", route: "/datepicker", subtitle: "", badge: "" },
          { id: "field", label: "Field", route: "/field", subtitle: "Input", badge: "" },
          { id: "form", label: "Form", route: "/form", subtitle: "", badge: "" },
          { id: "number-keyboard", label: "NumberKeyboard", route: "/number-keyboard", subtitle: "", badge: "" },
          { id: "password-input", label: "PasswordInput", route: "/password-input", subtitle: "", badge: "" },
          { id: "picker", label: "Picker", route: "/picker", subtitle: "", badge: "" },
          { id: "radio", label: "Radio", route: "/radio", subtitle: "", badge: "" },
          { id: "rate", label: "Rate", route: "/rate", subtitle: "", badge: "" },
          { id: "search", label: "Search", route: "/search", subtitle: "", badge: "" },
          { id: "slider", label: "Slider", route: "/slider", subtitle: "", badge: "" },
          { id: "stepper", label: "Stepper", route: "/stepper", subtitle: "", badge: "" },
          { id: "switch", label: "Switch", route: "/switch", subtitle: "", badge: "" },
          { id: "timepicker", label: "TimePicker", route: "/timepicker", subtitle: "", badge: "" },
          { id: "uploader", label: "Uploader", route: "/uploader", subtitle: "", badge: "" }
        ]
      },
      {
        id: "action",
        title: "Action Components",
        icon: "⚡",
        items: [
          { id: "action-sheet", label: "ActionSheet", route: "/action-sheet", subtitle: "", badge: "" },
          { id: "dialog", label: "Dialog", route: "/dialog", subtitle: "", badge: "" },
          { id: "dropdown-menu", label: "DropdownMenu", route: "/dropdown-menu", subtitle: "", badge: "" },
          { id: "loading", label: "Loading", route: "/loading", subtitle: "", badge: "" },
          { id: "notify", label: "Notify", route: "/notify", subtitle: "", badge: "" },
          { id: "overlay", label: "Overlay", route: "/overlay", subtitle: "", badge: "" },
          { id: "pull-refresh", label: "PullRefresh", route: "/pull-refresh", subtitle: "", badge: "" },
          { id: "share-sheet", label: "ShareSheet", route: "/share-sheet", subtitle: "", badge: "" },
          { id: "swipe-cell", label: "SwipeCell", route: "/swipe-cell", subtitle: "", badge: "" }
        ]
      },
      {
        id: "display",
        title: "Display Components",
        icon: "🎨",
        items: [
          { id: "badge", label: "Badge", route: "/badge", subtitle: "", badge: "" },
          { id: "status-dot", label: "StatusDot", route: "/status-dot", subtitle: "Presence", badge: "New" },
          { id: "circle", label: "Circle", route: "/circle", subtitle: "Progress", badge: "" },
          { id: "collapse", label: "Collapse", route: "/collapse", subtitle: "", badge: "" },
          { id: "countdown", label: "CountDown", route: "/countdown", subtitle: "", badge: "" },
          { id: "divider", label: "Divider", route: "/divider", subtitle: "", badge: "" },
          { id: "empty", label: "Empty", route: "/empty", subtitle: "", badge: "" },
          { id: "image-preview", label: "ImagePreview", route: "/image-preview", subtitle: "", badge: "" },
          { id: "lazyload", label: "Lazyload", route: "/lazyload", subtitle: "", badge: "" },
          { id: "list", label: "List", route: "/list", subtitle: "", badge: "" },
          { id: "notice-bar", label: "NoticeBar", route: "/notice-bar", subtitle: "", badge: "" },
          { id: "popover", label: "Popover", route: "/popover", subtitle: "", badge: "" },
          { id: "progress", label: "Progress", route: "/progress", subtitle: "", badge: "" },
          { id: "skeleton", label: "Skeleton", route: "/skeleton", subtitle: "", badge: "" },
          { id: "steps", label: "Steps", route: "/steps", subtitle: "", badge: "" },
          { id: "sticky", label: "Sticky", route: "/sticky", subtitle: "", badge: "" },
          { id: "swipe", label: "Swipe", route: "/swipe", subtitle: "", badge: "" },
          { id: "tag", label: "Tag", route: "/tag", subtitle: "", badge: "" },
          { id: "text-ellipsis", label: "TextEllipsis", route: "/text-ellipsis", subtitle: "", badge: "" },
          { id: "video-player", label: "VideoPlayer", route: "/video-player", subtitle: "", badge: "" },
          { id: "watermark", label: "Watermark", route: "/watermark", subtitle: "", badge: "NEW" },
          { id: "matrix", label: "Matrix", route: "/matrix", subtitle: "Grid Layout", badge: "NEW" }
        ]
      },
      {
        id: "navigation",
        title: "Navigation Components",
        icon: "🧭",
        items: [
          { id: "action-bar", label: "ActionBar", route: "/action-bar", subtitle: "", badge: "" },
          { id: "back-top", label: "BackTop", route: "/back-top", subtitle: "", badge: "" },
          { id: "grid", label: "Grid", route: "/grid", subtitle: "", badge: "" },
          { id: "index-bar", label: "IndexBar", route: "/index-bar", subtitle: "", badge: "" },
          { id: "navbar", label: "NavBar", route: "/navbar", subtitle: "", badge: "" },
          { id: "pagination", label: "Pagination", route: "/pagination", subtitle: "", badge: "" },
          { id: "sidebar", label: "Sidebar", route: "/sidebar", subtitle: "", badge: "" },
          { id: "tabs", label: "Tabs", route: "/tabs", subtitle: "", badge: "NEW" },
          { id: "tabbar", label: "Tabbar", route: "/tabbar", subtitle: "", badge: "" },
          { id: "tree-select", label: "TreeSelect", route: "/tree-select", subtitle: "", badge: "" }
        ]
      },
      {
        id: "business",
        title: "Business Components",
        icon: "💼",
        items: [
          { id: "address-edit", label: "AddressEdit", route: "/address-edit", subtitle: "", badge: "" },
          { id: "address-list", label: "AddressList", route: "/address-list", subtitle: "", badge: "" },
          { id: "area", label: "Area", route: "/area", subtitle: "", badge: "" },
          { id: "card", label: "Card", route: "/card", subtitle: "", badge: "" },
          { id: "contact-card", label: "ContactCard", route: "/contact-card", subtitle: "", badge: "" },
          { id: "coupon", label: "Coupon", route: "/coupon", subtitle: "List", badge: "" },
          { id: "submit-bar", label: "SubmitBar", route: "/submit-bar", subtitle: "", badge: "" }
        ]
      },
      {
        id: "tools",
        title: "Tools",
        icon: "🛠️",
        items: [
          { id: "codes", label: "QR & Barcodes", route: "/codes", subtitle: "", badge: "NEW" }
        ]
      },
      {
        id: "animations",
        title: "Wū Animations",
        icon: "✨",
        items: [
          { id: "enter-exit", label: "Enter/Exit", route: "/animations/enter-exit", subtitle: "Fade, Slide, Scale", badge: "NEW" },
          { id: "gestures", label: "Gestures", route: "/animations/gestures", subtitle: "Hover, Tap, Drag", badge: "" },
          { id: "scroll", label: "Scroll", route: "/animations/scroll", subtitle: "Reveal on scroll", badge: "" },
          { id: "keyframes", label: "Keyframes", route: "/animations/keyframes", subtitle: "Sequences", badge: "" },
          { id: "transforms", label: "Transforms", route: "/animations/transforms", subtitle: "Rotate, Scale", badge: "" },
          { id: "spring", label: "Spring", route: "/animations/spring", subtitle: "Physics-based", badge: "" },
          { id: "orchestration", label: "Orchestration", route: "/animations/orchestration", subtitle: "Stagger, Delays", badge: "" }
        ]
      }
    ]
  }
}
